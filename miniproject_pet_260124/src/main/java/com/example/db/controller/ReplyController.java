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

    

    @PostMapping("insert.do")
    public String addReply(replyVo vo, @RequestParam(name="b_idx") int board_idx, RedirectAttributes ra) {
        // 1. 세션 확인 (로그인 여부)
        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            ra.addAttribute("reason", "session_timeout");
            return "redirect:../member/login_form.do";
        }
        
        // 2. 데이터 보정
        vo.setBoard_idx(board_idx);
        vo.setMem_idx(user.getMem_idx());
        // 만약 vo에 r_content(댓글내용)가 이미 파라미터로 들어왔다면 준비 끝!

        // 3. DAO 호출 (복잡한 step 계산 없이 바로 insert)
        replyDao.insert(vo); 
        
        // 4. 리다이렉트 (상세페이지로 이동)
        return "redirect:/board/view.do?b_idx=" + board_idx;
    }
    
    // 2. 댓글 수정
    @PostMapping("update.do")
    public String updateReply(replyVo vo, int b_idx) {
        // r_idx는 댓글 번호, b_idx는 돌아갈 게시글 번호
       
    	int res = replyDao.update(vo);
    	return "redirect:/board/view.do?b_idx=" + b_idx;
    }

    // 3. 댓글 삭제
    @PostMapping("delete.do")
    @ResponseBody
    public Map<String, Boolean> delete(int r_idx) {
        // Dao의 delete 메서드 호출
    	int res = replyDao.delete(r_idx);
        // JSONConverter에 의해서 map -> json을 변환되서 반환
        Map<String, Boolean> map = new HashMap<String, Boolean>();
    	map.put("result", (res==1)); //{"result" : true }
    	return map;
    }

 // 답글쓰기
 	// f.method = "POST"
 	// /board/reply.do?b_idx=23&b_subject=제목&b_content=내용&page=3
    // 4. 계층형 답글쓰기 (기존의 reply.do 로직)
    @PostMapping("reply.do")
    public String reply(BoardVo vo, int page, RedirectAttributes ra) {
       
    	//login 상태유무 체크
    	MemberVo user = (MemberVo) session.getAttribute("user");
        
    	//로그아웃상태면
    	if (user == null) {
    		
            ra.addAttribute("reason", "session_timeout");
            // response.sendRedirect("../member/login_form.do?reason=session_timeout");
            return "redirect:../member/login_form.do";
        }
    	
    	// 내용 : \n -> <br> 변경
    	String b_content = vo.getBoard_content().replaceAll("\n","<br>");
    	vo.setBoard_content(b_content);
    	
    	//IP
    	String board_ip = request.getRemoteAddr();
    	vo.setBoard_ip(board_ip);
    	
    	//회원정보 넣기
    	vo.setMem_idx(user.getMem_idx());
    	
    	ra.addAttribute("page", page);
        return "redirect:/board/list.do";
    }
}