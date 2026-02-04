package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.db.dao.BoardDao;
import com.example.db.vo.BoardVo;
import com.example.db.vo.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	BoardDao boardDao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

// ====  게시글 조회 ====
	// 사이트 전체글 조회
	@RequestMapping("list.do")
	public String list(Model model) {

		List<BoardVo> list = boardDao.selectList();

		// 이전 게시물보기에서 설정한 show값을 세션에서 삭제
		//session.removeAttribute("show");
		// request binding
		model.addAttribute("list", list);

		return "board/board_list";
	}
	
	// 공지사항 조회
	@GetMapping("/notice/list.do")
	public String noticeList(Model model) {
		List<BoardVo> list = boardDao.selectListByTypeCode("NOTICE");
		model.addAttribute("list",list);
		
		return "board/notice_list";
	}
	
    // 이벤트 조회
    @GetMapping("/event/list.do")
    public String eventList(Model model) {
    	
    	List<BoardVo> list = boardDao.selectListByTypeCode("EVENT");
    	model.addAttribute("list", list);
        
        return "board/event_list";
    }

    // 연구소 내 태그별 조회 (tag 로 DOG/CAT/NONE 필터)
    @GetMapping("/lab/list.do")
    public String labList(@RequestParam(defaultValue = "ALL") String tag,
                          Model model) {
		
    	// tag 값에 따라 조회 내용이 바뀜
        List<BoardVo> list = boardDao.selectListByTypeCodeAndTag("LAB", tag);
        model.addAttribute("list", list);
        model.addAttribute("tag", tag);
        
        return "board/lab_list";
    }

    // 자유게시판 내 태그별 조회 (tag 필터)
    @GetMapping("/free/list.do")
    public String freeList(@RequestParam(defaultValue = "ALL") String tag,
                           Model model) {
    	
        List<BoardVo> list = boardDao.selectListByTypeCodeAndTag("FREE", tag);
        model.addAttribute("list", list);
        model.addAttribute("tag", tag);
        
        return "board/free_list";
    }

    // QnA 태그별 조회 (tag 필터)
    @GetMapping("/qna/list.do")
    public String qnaList(@RequestParam(defaultValue = "ALL") String tag,
                          Model model) {
    	
        List<BoardVo> list = boardDao.selectListByTypeCodeAndTag("QNA", tag);
        model.addAttribute("list", list);
        model.addAttribute("tag", tag);
        
        return "board/qna_list";
    }

	// 게시글 상세보기
		// /board/view.do?b_idx=5
		@RequestMapping("view.do")
		public String view(int b_idx, Model model) {

			BoardVo vo = boardDao.selectOne(b_idx);
			
			// 현재 게시물을 봤냐?
			if( session.getAttribute("show") == null) {
				
			// 조회수 증가
				int res = boardDao.updateReadhit(b_idx);
				
			// 봤다는 정보를 세션에 넣는다 
				session.setAttribute("show", true);
			}
			
			// model통해서 전달 : request binding
			model.addAttribute("vo",vo);
			
			return "board/board_view";
			
		}
		
// 	// 새글쓰기 폼 띄우기
		@GetMapping("insert_form.do")
		public String insert_form(String type, Model model) {
		   // type: NOTICE / EVENT / LAB / QNA / FREE 
			model.addAttribute("type",type);
			return "board/board_insert_form"; // 작성하신 JSP 파일명
		}
	
	// 새글쓰기
	// f.method = "POST"
	// /board/insert.do?b_subject=제목&b_content=내용
	@PostMapping("insert.do")
	public String insert(BoardVo vo, RedirectAttributes ra) {
		// ...(로그인 체크, IP 설정 등 기존 코드) ... 
		
		// login 상태유무 체크
		MemberVo user = (MemberVo) session.getAttribute("user");

		// 로그아웃상태면
		if (user == null) {

			ra.addAttribute("reason", "session_timeout");
			// response.sendRedirect("../member/login_form.do?reason=session_timeout")
			return "redirect:../member/login_form.do";
		}
		
		// IP
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		//3) 아이피 밴 체크
		if("172.30.1.98".equals("board_ip")){
			ra.addAttribute("reason","ban_ip");
			return "redirect:list.do";
		}

		// 내용 : \n -> <br>변경
		if(vo.getB_content() != null) {
			vo.setB_content(vo.getB_content().replace("/n","<br>"));
		}


		// 회원정보 넣기
		vo.setMem_idx(user.getMem_idx());

	 
		// 6) board_type_code → board_type_idx 조회 (이미 만든 메서드 사용)
	//	int typeIdx = boardDao.selectTypeIdxByCode(code);
	 
	    
	    // 3.변환된 숫자 IDX를 VO에 세팅합니다.
	 //   vo.setBoard_type_idx(typeIdx);

		// DB insert
		int res = boardDao.insert(vo);
		
		return "redirect:list.do";

	}// end:insert()

	
	// 답글쓰기
	// f.method = "POST"
	// /board/reply.do?b_idx=23&b_subject=제목&b_content=내용
	@PostMapping("reply.do")
	public String reply(BoardVo vo, RedirectAttributes ra) {
		
		// login 상태유무 체크
		MemberVo user = (MemberVo) session.getAttribute("user"); 
		
		// 로그아웃상태면
	if( user == null) {
		
		 ra.addAttribute("reason", "session_timeout");
		 // response.sendRedirect("../member/login_form.do?reason=session_timeout");
		 return "redirect:../member/login_form.do";
	}
	
	// 내용 : /n -> <br>변경
	String b_content = vo.getB_content().replaceAll("/n", "<br>");
	vo.setB_content(b_content);
	
	// IP
	String b_ip = request.getRemoteAddr();
	vo.setB_ip(b_ip);
	
	// 회원정보 넣기
	vo.setMem_idx(user.getMem_idx());
	vo.setMem_name(user.getMem_name());
	
	// 기준글 정보를 구한다
	BoardVo baseVo = boardDao.selectOne(vo.getB_idx());
	
	//기준글보다 b_step이 큰 게시물의 b_step을 1씩 증가 시켜야 한다
	int res = boardDao.updateStep(baseVo);
	
	// b_ref b_step b_depth 계산 vo에 넣는다
	vo.setB_ref(baseVo.getB_ref());
	vo.setB_step(baseVo.getB_step()+1);
	vo.setB_depth(baseVo.getB_depth()+1);
	
	// DB reply
	res = boardDao.reply(vo);
	
	return "redirect:list.do";
	}
	
// 3.수정 폼으로 이동 (기존 데이터 조회 과정 필요)
	@RequestMapping("modify.do")
	public String modify(int b_idx, Model model ) {
		BoardVo vo = (BoardVo) boardDao.selectbyMemIdx(b_idx);
		// 수정을 위해 <br>을 다시 \n으로 변환 (textarea에 보여주기 위함)
		if (vo.getB_content() != null) {
			vo.setB_content(vo.getB_content().replaceAll("<br>", "\n"));
		}
		model.addAttribute("vo", vo);

		return "board/board_modify_form";
	}
	
	@PostMapping("update.do")
	public String update(BoardVo vo, RedirectAttributes ra) {
	    int res = boardDao.update(vo); // DB 수정 실행
	    
	    if(res > 0) {
	        // 리다이렉트 시 잠깐 보여줄 메시지 전달
	        ra.addFlashAttribute("result", "update_success");
	    }
	    
	    // 수정 후에는 목록으로 "리다이렉트" 하므로 RedirectAttributes가 필요함
	    return "redirect:list.do"; 
	}



//	====게시글 삭제(soft delete) ====
	@PostMapping("delete.do")
	public String delete(int board_idx, RedirectAttributes ra) {

		MemberVo user = (MemberVo) session.getAttribute("user");
		if( user == null) {
			ra.addAttribute("reason", "session_timeout");
			return "redirect:../member/login_form.do";
		}
		
		BoardVo vo = boardDao.selectOne(board_idx); // 글 정보 가져오기
		if(vo == null || vo.getMem_idx() != (user.getMem_idx())) {
			
			ra.addAttribute("reason", "no_permission");
			return "redirect:list.do";
		}
		
		int res = boardDao.softDelete(board_idx);
		

		return "redirect:list.do";
	}
}
