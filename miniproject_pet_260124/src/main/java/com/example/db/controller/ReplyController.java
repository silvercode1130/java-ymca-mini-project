package com.example.db.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.db.dao.BoardDao;
import com.example.db.dao.ReplyDao;
import com.example.db.vo.BoardVo;
import com.example.db.vo.MemberVo;
import com.example.db.vo.replyVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/reply/")
@Controller
public class ReplyController {

	@Autowired
	BoardDao boardDao;

	@Autowired
	ReplyDao replyDao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	// 답글쓰기 폼 띄우기
	@RequestMapping("reply_form.do")
	public String reply_form() {

		return "board/board_reply_form";
	}

	@PostMapping("reply.do")
	public String reply(replyVo vo, @RequestParam(name = "b_idx") int board_idx, RedirectAttributes ra) {

		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {
			ra.addAttribute("reason", "session_timeout");
			return "redirect:../member/login_form.do";
		}

		// 내용 변환 및 데이터 세팅
		vo.setReply_content(vo.getReply_content().replaceAll("\n", "<br>"));
		vo.setBoard_idx(board_idx);
		vo.setMem_idx(user.getMem_idx());

		// 만약 이것이 '댓글'이라면 보통 updateStep은 필요 없습니다.
		// 만약 '계층형 답글'이라면 BoardVo의 필드들을 vo에 복사하는 과정이 필요합니다.
		int res = replyDao.insert(vo);

		ra.addAttribute("b_idx", board_idx); // 깔끔하게 파라미터 전달
		return "redirect:/board/view.do";
	}

	@PostMapping("update.do")
	public String updateReply(replyVo vo, int b_idx, RedirectAttributes ra) {
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null)
			return "redirect:../member/login_form.do";

		// 실제로는 replyDao에서 해당 댓글을 가져와 작성자 본인인지 확인하는 로직 권장
		int res = replyDao.update(vo);

		ra.addAttribute("b_idx", b_idx);
		return "redirect:/board/view.do";
	}

	// 3. 댓글 삭제
	@PostMapping("delete.do")
	@ResponseBody
	public Map<String, Object> delete(int r_idx) {
		Map<String, Object> map = new HashMap<>();

		// 1. 로그인 체크
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {
			map.put("result", false);
			map.put("message", "로그인이 필요합니다.");
			return map;
		}
		
		// 2. 데이터 존재 확인 (DB에 해당 댓글이 있는지)
	    replyVo vo = replyDao.selectOneFromIdx(r_idx);
	    if (vo == null) {
	        map.put("result", false);
	        map.put("message", "이미 삭제되었거나 존재하지 않는 댓글입니다.");
	        return map;
	    }

	 // 3. 본인 확인 로직 (작성자와 로그인한 유저가 같은지)
	    if (vo.getMem_idx() != user.getMem_idx()) {
	        map.put("result", false);
	        map.put("message", "본인이 작성한 댓글만 삭제할 수 있습니다.");
	        return map;
	    }
		

		// 4. 삭제 실행
		int res = replyDao.delete(r_idx);
		map.put("result", res == 1);

		return map;
	}
}
