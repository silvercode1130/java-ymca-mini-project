package com.example.db.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.db.dao.BoardDao;
import com.example.db.vo.BoardVo;
import com.example.db.vo.MemberVo;
import com.example.db.vo.replyVo;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller
@RequestMapping("/community/")
public class CommunityController {

	@Autowired
	BoardDao boardDao;
	
    @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest request;

    @Autowired
    ServletContext application; // 파일 업로드 경로 구할 때 필요

	// ==== 게시글 조회 ====
	// 사이트 전체글 조회
	@RequestMapping("list.do")
	public String list(Model model) {

		List<BoardVo> list = boardDao.selectList();

		// 이전 게시물보기에서 설정한 show값을 세션에서 삭제
		// session.removeAttribute("show");
		// request binding
		model.addAttribute("list", list);

		return "board/board_list";
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
		public String insert(BoardVo vo, RedirectAttributes ra) throws Exception {

		    // 1. 로그인 상태유무 체크
		    MemberVo user = (MemberVo) session.getAttribute("user");
		    if (user == null) {
		        ra.addAttribute("reason", "session_timeout");
		        return "redirect:../member/login_form.do";
		    }

		    // 2. IP 및 밴 체크
		     vo.setB_ip(request.getRemoteAddr());
		     vo.setMem_idx(user.getMem_idx());
		     
		    // 줄바꿈 처리 및 타입 인덱스 조회 로직 (기존 유지)
		    if(vo.getB_content() != null) {
		    	vo.setB_content(vo.getB_content().replace("/n", "<br>"));
		    }


		    // 3. 파일 업로드 처리 (추가된 부분)
		    MultipartFile photo = ((BoardVo) vo).getPhoto(); // BoardVo에 MultipartFile photo 필드 필요
		    String filename = "no_file";

		    if (photo != null && !photo.isEmpty()) {
		        // 물리적 경로 설정
		        String webPath = "/resources/upload/";
		        String savePath = session.getServletContext().getRealPath(webPath);
		        
		        // 파일명 중복 방지 (현재시간 + 원본이름)
		        filename = System.currentTimeMillis() + "_" + photo.getOriginalFilename();
		        
		        File saveFile = new File(savePath, filename);
		        if(!saveFile.exists()) saveFile.mkdirs();
		        
		        // 서버에 실제 파일 저장
		        photo.transferTo(saveFile);
		    }
		    // DB에 저장할 파일명 vo에 세팅
		    vo.setFilename(filename);

		    // 4. 내용 줄바꿈 처리
		    if(vo.getB_content() != null) {
		        // /n이 아니라 \n이 줄바꿈 기호입니다.
		        vo.setB_content(vo.getB_content().replace("\n", "<br>"));
		    }

		    // 5. 회원정보 및 게시판 타입 설정
		    vo.setMem_idx(user.getMem_idx());
		    
		    // board_type_code는 파라미터나 상황에 맞게 설정 (예: vo에서 가져오거나 직접 지정)
		    int board_type_code = vo.getBoard_type(); 
		    int board_type_idx = boardDao.selectTypeIdxByCode(board_type_code);
		    vo.setBoard_type_idx(board_type_idx);

		    // 6. DB insert
		    int res = boardDao.insert(vo);
		    
		    return "redirect:list.do";
		}
	
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
	public String modify(int b_idx, Model model) {
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

		if (res > 0) {
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
		if (user == null) {
			ra.addAttribute("reason", "session_timeout");
			return "redirect:../member/login_form.do";
		}

		BoardVo vo = boardDao.selectOne(board_idx); // 글 정보 가져오기
		if (vo == null || vo.getMem_idx() != (user.getMem_idx())) {

			ra.addAttribute("reason", "no_permission");
			return "redirect:list.do";
		}

		int res = boardDao.softDelete(board_idx);

		return "redirect:list.do";
	}
}
