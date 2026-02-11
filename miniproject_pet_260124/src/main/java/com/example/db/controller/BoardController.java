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
	BoardFileDao boardFileDao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
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
	                         @RequestParam(defaultValue = "1") int page,
	                         @RequestParam(required = false, defaultValue = "ALL") String tag,
	                         Model model) {
		
		model.addAttribute("b_type", b_type);
		model.addAttribute("page", page);
		model.addAttribute("tag", tag);
		
		return "community/board_insert_form";
	} 
	
	// ===== 글쓰기 =====
	@PostMapping("/{b_type}/insert.do")
	public String insert(@PathVariable String b_type,
	                     @RequestParam(defaultValue = "1") int page,
	                     @RequestParam(required = false, defaultValue = "ALL") String tag,
	                     BoardVo vo,
	                     @RequestParam(name = "thumbnail", required = false) MultipartFile thumbnail,
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

		// 4) 내용 줄바꿈 치환
		if (vo.getBoard_content() != null) {
			vo.setBoard_content(vo.getBoard_content().replace("\\n", "<br>"));
		}

		// 5) 회원정보 넣기
		vo.setMem_idx(user.getMem_idx());

		// 6) b_type 사용해 board_type_idx 조회
		String typeCode = b_type.toUpperCase();
		int board_type_idx = boardDao.selectTypeIdxByCode(typeCode);
		vo.setBoard_type_idx(board_type_idx);

		// 7) insert
		int res = boardDao.insert(vo);
		
		// 8) 썸네일 업로드 처리 (0개 또는 1개)
		if (thumbnail != null && !thumbnail.isEmpty()) {

		    // 저장 경로: 프로젝트 루트 기준 폴더
		    String projectPath = System.getProperty("user.dir");
		    String uploadPath = projectPath + "/src/main/resources/static/img/board_file/";

		    File uploadDir = new File(uploadPath);
		    if (!uploadDir.exists()) {
		        uploadDir.mkdirs();
		    }

		    // 파일 정보
		    String originalName = thumbnail.getOriginalFilename();
		    long size = thumbnail.getSize();
		    String contentType = thumbnail.getContentType();   // image/jpeg 등

		    // 확장자 분리
		    String ext = "";
		    int dotIdx = originalName.lastIndexOf(".");
		    if (dotIdx != -1) {
		        ext = originalName.substring(dotIdx);          // ".jpg" 같은 문자열
		    }

		    // 시퀀스로 file_idx 뽑기(서버에 저장될 이름용)
		    int fileIdx = boardFileDao.selectNextFileIdx();

		    // 저장용 이름: fileIdx + 확장자
		    String savedName = fileIdx + ext;                  // 예: "15.jpg"

		    // 실제 파일 저장
		    File dest = new File(uploadPath, savedName);
		    try {
		        thumbnail.transferTo(dest);                    // 디스크에 저장
		    } catch (Exception e) {
		        e.printStackTrace();
		        // 여기서 실패 처리 정책은 나중에 결정 (지금은 로그만)
		    }
		    
		    System.out.println(vo.getBoard_idx());
		    
		    // board_file 행 생성
		    BoardFileVo fileVo = new BoardFileVo();
		    fileVo.setFile_idx(fileIdx);                 	   // VO가 int라 캐스팅
		    fileVo.setBoard_idx(vo.getBoard_idx());            // boardDao.insert 후 PK 들어가 있어야 함
		    fileVo.setFile_original_name(originalName);
		    fileVo.setFile_saved_name(savedName);
		    fileVo.setFile_path("/img/board_file/" + savedName);
		    fileVo.setFile_size((int) size);
		    fileVo.setFile_type(contentType);
		    vo.setThumbnailPath(fileVo.getFile_path());

		    boardFileDao.insert(fileVo);
		}
		
		// 페이지/태그 복귀
		ra.addAttribute("page", page);
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
		if (user == null || vo.getMem_idx() != user.getMem_idx()) {
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
	                     BoardVo vo,
	                     RedirectAttributes ra) {
		
		// 로그인 체크
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {
			ra.addAttribute("reason", "session_timeout");
			ra.addAttribute("page", page);
			ra.addAttribute("tag", tag);
			return "redirect:../member/login_form.do";
		}
		
		// 권한 체크
		BoardVo originVo = boardDao.selectOne(board_idx);
		if (originVo.getMem_idx() != user.getMem_idx()) {
			ra.addAttribute("reason", "no_permission");
			ra.addAttribute("page", page);
			ra.addAttribute("tag", tag);
			return "redirect:/" + b_type + "/list.do";
		}
		
		// 수정 대상 세팅
		vo.setBoard_idx(board_idx);
		
		int res = boardDao.update(vo);
		
		ra.addAttribute("page", page);
		ra.addAttribute("tag", tag);
		return "redirect:/" + b_type + "/list.do";
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
		if (vo == null || vo.getMem_idx() != user.getMem_idx()) {
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
