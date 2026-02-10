package com.example.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.db.dao.MemberDao;
import com.example.db.vo.MemberProfileVo;
import com.example.db.vo.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class MemberProfileController {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
    HttpServletRequest request;
    
    @Autowired
    HttpSession session;
	
	// myInfo.jsp - 회원정보 창 띄우기
	@RequestMapping("/profile/myInfo.do")
	public String myInfo() {
		
		return "profile/myInfo";
	}
	
	
	// myProfile.jsp - 내 프로필 창 띄우기
	@RequestMapping("/profile/myProfile.do")
	public String myProfile(HttpSession session,
	                        Model model,
	                        HttpServletRequest request) {

	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/login.do";
	    }

	    // 프로필 정보 조회 (DAO 메서드 이름은 너 프로젝트에 맞게 변경)
	    MemberProfileVo profile = memberDao.selectProfileByMemIdx(user.getMem_idx());

	    String contextPath = request.getContextPath();
	    // 프사 없을 때 기본 이미지 (static/img/noprofile.jpg)
	    String defaultImg = contextPath + "/img/noprofile.jpg";

	    String profileImgSrc;
	    if (profile == null || profile.getMem_img() == null || profile.getMem_img().isEmpty()) {
	        profileImgSrc = defaultImg;
	    } else {
	        
	        profileImgSrc = profile.getMem_img();
	    }

	    model.addAttribute("user", user);
	    model.addAttribute("profile", profile);
	    model.addAttribute("profileImgSrc", profileImgSrc);

	    return "profile/myProfile";
	}



	
	
//	// myUpdate.jsp - 회원 정보 수정 창 띄우기
//	@RequestMapping("/update/myUpdate.do")
//	public String myUpdate() {
//		
//		return "update/myUpdate";
//	}
	
	
	// 수정 ------------------------------------------------------------------------------------------
	
	
//	// 멤버컨트롤러와 중복?
//	@RequestMapping("/update/myUpdate.do")
//	public String myUpdate(MemberVo vo, Model model) {
//		
//	       model.addAttribute("vo",vo);
//		
//	    return "update/myUpdate"; 
//	}
	
	
	// 탈퇴 관련 ------------------------------------------------------------------------------------------
	
	
	// myProfile.jsp - 회원 탈퇴 기능 구현
	@PostMapping("/myDelete.do")
	public String myDelete(HttpSession session) {
	    session.invalidate();   // 전체 세션 제거
	    return "redirect:/main.do";     // 메인 홈(재웅님)
	}
	
	
	
	
	
	
	
	
}

