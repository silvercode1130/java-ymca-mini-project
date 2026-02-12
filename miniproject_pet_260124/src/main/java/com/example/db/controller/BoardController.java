package com.example.db.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.db.dao.BoardDao;
import com.example.db.dao.BoardFileDao;
import com.example.db.service.BoardService;
import com.example.db.vo.BoardFileVo;
import com.example.db.vo.BoardVo;
import com.example.db.vo.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	BoardService boardService;
	
	
	// ===== 게시글 조회 =====
	// 사이트 전체글 조회 (그냥 두고 싶으면 유지)
	@RequestMapping("/board/list.do")
	public String list(Model model){
		List<BoardVo> list = boardDao.selectList();
		model.addAttribute("list", list);
		return "board/board_list";
	}
	
	// 공지사항 조회
	@GetMapping("/notice/list.do")
	public String noticeList(@RequestParam(defaultValue = "1") int page,
	                         Model model) {
		
		List<BoardVo> list = boardDao.selectListByTypeCode("NOTICE");
		
		model.addAttribute("list", list);
		model.addAttribute("b_type", "notice");
		model.addAttribute("page", page);
		
		return "home/notice_list";
	}

	// 이벤트 조회
	@GetMapping("/event/list.do")
	public String eventList(@RequestParam(defaultValue = "1") int page,
	                        Model model) {
		
		List<BoardVo> list = boardDao.selectListByTypeCode("EVENT");
		model.addAttribute("list", list);
		model.addAttribute("b_type", "event");
		model.addAttribute("page", page);
		
		return "home/event_list";
	}

	// 연구소 내 태그별 조회 (tag 로 DOG/CAT/NONE 필터)
	@GetMapping("/lab/list.do")
	public String labList(BoardVo vo,
						  @RequestParam(defaultValue = "ALL") String tag,
	                      @RequestParam(defaultValue = "1") int page,
	                      Model model) {
		
		List<BoardVo> list = boardDao.selectListByTypeCodeAndTag("LAB", tag);
		model.addAttribute("list", list);
		model.addAttribute("tag", tag);
		model.addAttribute("b_type", "lab");
		model.addAttribute("page", page);
		
		return "lab/lab_list";
	}

	// QnA 태그별 조회 (tag 필터)
	@GetMapping("/qna/list.do")
	public String qnaList(@RequestParam(defaultValue = "ALL") String tag,
	                      @RequestParam(defaultValue = "1") int page,
	                      Model model) {
		
		List<BoardVo> list = boardDao.selectListByTypeCodeAndTag("QNA", tag);
		model.addAttribute("list", list);
		model.addAttribute("tag", tag);
		model.addAttribute("b_type", "qna");
		model.addAttribute("page", page);
		
		return "community/community_list";
	}

	// 자유게시판 내 태그별 조회 (tag 필터)
	@GetMapping("/free/list.do")
	public String freeList(@RequestParam(defaultValue = "ALL") String tag,
	                       @RequestParam(defaultValue = "1") int page,
	                       Model model) {
		
		List<BoardVo> list = boardDao.selectListByTypeCodeAndTag("FREE", tag);
		model.addAttribute("list", list);
		model.addAttribute("tag", tag);
		model.addAttribute("b_type", "free");
		model.addAttribute("page", page);
		
		return "community/community_list";
	}
	
	// ===== 게시글 상세 =====
	@GetMapping("/{b_type}/view.do")
	public String view(@PathVariable String b_type,
	                   @RequestParam int board_idx,
	                   @RequestParam(defaultValue = "1") int page,
	                   @RequestParam(required = false, defaultValue = "ALL") String tag,
	                   Model model) {
		
		// b_type은 DB코드 대문자로 변환해서 사용
		String typeCode = b_type.toUpperCase();
		BoardVo vo = boardDao.selectOneByIdxAndTypeCode(board_idx, typeCode);
		
		// 조회수 증가 (게시글별로 세션키 분리)
		if (session.getAttribute("show_" + board_idx) == null) {
			boardDao.updateReadhit(board_idx);
			session.setAttribute("show_" + board_idx, true);
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("b_type", b_type); // 소문자 유지 (URL용)
		model.addAttribute("page", page);
		model.addAttribute("tag", tag);
		
		return "board/board_view";
	}
	
	// ===== 글쓰기 폼 =====
	@GetMapping("/{b_type}/insert_form.do")
	public String insertForm(@PathVariable String b_type,
	                         @RequestParam(required = false, defaultValue = "ALL") String tag,
	                         Model model) {
		
		model.addAttribute("b_type", b_type);
		model.addAttribute("tag", tag);
		
		return "community/board_insert_form";
	} 
	
	// ===== 글쓰기 =====
	@PostMapping("/{b_type}/insert.do")
	public String insert(@PathVariable String b_type,
	                     @RequestParam(required = false, defaultValue = "ALL") String tag,
	                     BoardVo vo,
	                     RedirectAttributes ra) {

		// 로그인 체크
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {
			ra.addAttribute("reason", "session_timeout");
			return "redirect:../member/login_form.do";
		}

		// ip 넣기
		String board_ip = request.getRemoteAddr();
		vo.setBoard_ip(board_ip);

		// 회원정보 넣기
		vo.setMem_idx(user.getMem_idx());

		// b_type 사용해 어느 게시판인지 조회
		String typeCode = b_type.toUpperCase();
		int board_type_idx = boardDao.selectTypeIdxByCode(typeCode);
		vo.setBoard_type_idx(board_type_idx);

		// DB insert + 썸네일 추출까지 서비스에 위임
		int res = boardService.insertBoardWithThumbnail(vo);
		
		ra.addAttribute("tag", tag);
		return "redirect:/" + b_type + "/list.do";
	}

	// ===== 수정 폼 =====
	@GetMapping("/{b_type}/modify_form.do")
	public String updateForm(@PathVariable String b_type,
	                         @RequestParam int board_idx,
	                         @RequestParam(defaultValue = "1") int page,
	                         @RequestParam(required = false, defaultValue = "ALL") String tag,
	                         Model model) {
		
		String typeCode = b_type.toUpperCase();
		BoardVo vo = boardDao.selectOneByIdxAndTypeCode(board_idx, typeCode);
		
		// 본인 글 체크
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (vo == null || (vo.getMem_idx() != user.getMem_idx() && user.getMem_role_idx() != 3)) {
			return "redirect:/" + b_type + "/list.do?page=" + page + "&tag=" + tag;
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("b_type", b_type);
		model.addAttribute("page", page);
		model.addAttribute("tag", tag);
		
		return "board/board_modify_form";
	}

	// ===== 수정 처리 =====
	@PostMapping("/{b_type}/modify.do")
	public String update(@PathVariable String b_type,
	                     @RequestParam int board_idx,
	                     @RequestParam(defaultValue = "1") int page,
	                     @RequestParam(required = false, defaultValue = "ALL") String tag,
	                     BoardVo formVo, // 폼에서 넘어온 데이터
	                     RedirectAttributes ra) {

	    // 로그인 체크
	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) {
	        ra.addAttribute("reason", "session_timeout");
	        ra.addAttribute("page", page);
	        ra.addAttribute("tag", tag);
	        return "redirect:../member/login_form.do";
	    }

	    // DB에서 원본 글 다시 조회
	    String typeCode = b_type.toUpperCase();
	    BoardVo originVo = boardDao.selectOneByIdxAndTypeCode(board_idx, typeCode);
	    if (originVo == null) {
	        ra.addAttribute("reason", "not_found");
	        ra.addAttribute("page", page);
	        ra.addAttribute("tag", tag);
	        return "redirect:/" + b_type + "/list.do";
	    }

	    // 권한 체크 (작성자 또는 관리자)
	    boolean isOwner = originVo.getMem_idx() == user.getMem_idx();
	    boolean isAdmin = user.getMem_role_idx() == 3;
	    if (!isOwner && !isAdmin) {
	        ra.addAttribute("reason", "no_permission");
	        ra.addAttribute("page", page);
	        ra.addAttribute("tag", tag);
	        return "redirect:/" + b_type + "/list.do";
	    }

	    // 여기까지 통과하면, 수정 가능
	    String board_ip = request.getRemoteAddr();

	    // 원본 VO에 수정값 덮어쓰기
	    originVo.setBoard_title(formVo.getBoard_title());
	    originVo.setBoard_content(formVo.getBoard_content());
	    originVo.setBoard_tag(formVo.getBoard_tag());
	    originVo.setBoard_ip(board_ip);

	    // 썸네일까지 다시 추출하고 싶으면 서비스로 넘김
	    int res = boardService.insertBoardWithThumbnail(originVo);
	    System.out.println(">>> update res = " + res);

	    ra.addAttribute("board_idx", board_idx);
	    ra.addAttribute("page", page);
	    ra.addAttribute("tag", tag);
	    return "redirect:/" + b_type + "/view.do?board_idx=" + board_idx + "&page=" + page + "&tag=" + tag;
	}


	// ===== 게시글 삭제(soft delete) =====	
	@PostMapping("/{b_type}/delete.do")
	public String delete(@PathVariable String b_type,
	                     @RequestParam int board_idx,
	                     @RequestParam(defaultValue = "1") int page,
	                     @RequestParam(required = false, defaultValue = "ALL") String tag,
	                     RedirectAttributes ra) {
		
		// 로그인 체크
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {
			ra.addAttribute("reason", "session_timeout");
			return "redirect:../member/login_form.do";
		}
		
		BoardVo vo = boardDao.selectOne(board_idx);
		if (vo == null || (vo.getMem_idx() != user.getMem_idx() && user.getMem_role_idx() != 3)) {
			ra.addAttribute("reason", "no_permission");
			ra.addAttribute("page", page);
			ra.addAttribute("tag", tag);
			return "redirect:/" + b_type + "/list.do";
		}
		
		boardDao.softDelete(board_idx);
		
		ra.addAttribute("page", page);
		ra.addAttribute("tag", tag);
		return "redirect:/" + b_type + "/list.do";
	}
}
