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
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
//	===== 게시글 조회 =====
	// 사이트 전체글 조회
	@RequestMapping("/list.do")
	public String list(Model model){
		
		List<BoardVo> list = boardDao.selectList();
		model.addAttribute("list", list);
		
		return "board/board_list";
	}
	
	// 공지사항 조회
    @GetMapping("/notice/list.do")
    public String noticeList(Model model) {
    	
    	List<BoardVo> list = boardDao.selectListByTypeCode("NOTICE");
    	model.addAttribute("list", list);
		
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

	
//	===== 게시글 상세 =====
	@RequestMapping("/view.do")
	public String select_one(int board_idx, Model model) {
		
		BoardVo vo = boardDao.selectOne(board_idx);
		
		// 게시물 조회수 카운팅을 최초 1번으로 제한하는 법
		// 현재 게시물을 봤냐? 를 얻기
		// 싱글톤과 같은 구조. 객체가 없으면 만들기 -> 객체가 생긴 후엔 호출 안됨
		if(session.getAttribute("show")==null) {
			
			// 조회수 증가 mapper 호출
			int res = boardDao.updateReadhit(board_idx);
			
			// 봤다는 정보를 세션에 넣음
			session.setAttribute("show", true);
		}

		model.addAttribute("vo", vo);
		
		return "board/board_view";
	}
	
//	===== 글쓰기 폼 =====
	@GetMapping("insert_form.do")
	public String insertForm(String type, Model model) {
	    // type: NOTICE / EVENT / LAB / QNA / FREE
	    model.addAttribute("type", type);
	    return "board/board_insert_form";
	}
	
	
//	===== 글쓰기 =====
	// f.method = "POST"
	// board/insert.do?board_subject=제목&board_content=...
	@PostMapping("insert.do")
	public String insert(BoardVo vo,
	                     @RequestParam String board_type_code,
	                     RedirectAttributes ra) {

	    // 1) 로그인 체크
	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) {
	        ra.addAttribute("reason", "session_timeout");
	        return "redirect:../member/login_form.do";
	    }

	    // 2) ip 넣기
	    String board_ip = request.getRemoteAddr();
	    vo.setBoard_ip(board_ip);

	    // 3) 아이피 밴 체크
	    if ("172.30.1.98".equals(board_ip)) {
	        ra.addAttribute("reason", "ban_ip");
	        return "redirect:list.do";
	    }

	    // 4) 내용 줄바꿈 치환
	    if (vo.getBoard_content() != null) {
	        vo.setBoard_content(vo.getBoard_content().replace("\n", "<br>"));
	    }

	    // 5) 회원정보 (BoardVo에는 mem_id, mem_name 없음 → 이 두 줄 삭제)
	    vo.setMem_idx(user.getMem_idx());


	    // 6) board_type_code → board_type_idx 조회 (이미 만든 메서드 사용)
	    int board_type_idx = boardDao.selectTypeIdxByCode(board_type_code);
	    vo.setBoard_type_idx(board_type_idx);

	    // 7) insert
	    int res = boardDao.insert(vo);

	    return "redirect:list.do";
	}




	
//	===== 게시글 삭제(soft delete) =====	
	@PostMapping("delete.do")
	public String delete(int board_idx, RedirectAttributes ra) {

	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) {
	        ra.addAttribute("reason", "session_timeout");
	        return "redirect:../member/login_form.do";
	    }

	    BoardVo vo = boardDao.selectOne(board_idx); // 글 정보 가져오기
	    if (vo == null || vo.getMem_idx() != (user.getMem_idx())) {
	        // 본인 글 아니거나 권한없음
	        ra.addAttribute("reason", "no_permission");
	        return "redirect:list.do";
	    }

	    int res = boardDao.softDelete(board_idx);
	    return "redirect:list.do";
	}

}