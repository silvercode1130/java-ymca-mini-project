package com.example.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    // 1. 단순 댓글 추가 (수의사 답변 등)
    @PostMapping("add.do")
    public String addReply(replyVo vo, int b_idx, RedirectAttributes ra) {
        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            ra.addAttribute("reason", "session_timeout");
            return "redirect:../member/login_form.do";
        }
        
        // 데이터 세팅
        vo.setMem_idx(user.getMem_idx());

        // DB 저장 로직 (ReplyDao에 맞게 수정 필요)
      //  replyDao.insert(b_idx, content, user.getMem_idx()); 
        
        return "redirect:/board/view.do?b_idx=" + b_idx;
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
    public String deleteReply(int r_idx, int b_idx) {
        // Dao의 delete 메서드 호출
    	int res = replyDao.delete(r_idx);
        
        return "redirect:/board/view.do?b_idx=" + b_idx;
    }

    // 4. 계층형 답글쓰기 (기존의 reply.do 로직)
    @PostMapping("reply.do")
    public String reply(BoardVo vo, int page, RedirectAttributes ra) {
        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            ra.addAttribute("reason", "session_timeout");
            return "redirect:../member/login_form.do";
        }

        // 내용 줄바꿈 & IP 설정
        vo.setB_content(vo.getB_content().replaceAll("\n", "<br>"));
        vo.setB_ip(request.getRemoteAddr());
        vo.setMem_idx(user.getMem_idx());
        vo.setMem_name(user.getMem_name());

        // 기준글(부모글) 정보 가져오기
        BoardVo baseVo = boardDao.selectOne(vo.getB_idx());
        
        // 계층형 로직: step 증가 및 ref/step/depth 계산
        boardDao.updateStep(baseVo);
        vo.setB_ref(baseVo.getB_ref());
        vo.setB_step(baseVo.getB_step() + 1);
        vo.setB_depth(baseVo.getB_depth() + 1);
        
        boardDao.reply(vo);
        
        ra.addAttribute("page", page);
        return "redirect:/board/list.do";
    }
}