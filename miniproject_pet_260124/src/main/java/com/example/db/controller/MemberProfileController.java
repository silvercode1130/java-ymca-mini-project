package com.example.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.db.dao.MemberDao;
import com.example.db.vo.MemberVo;

import jakarta.servlet.http.HttpSession;


@Controller
public class MemberProfileController {
	
	@Autowired
	MemberDao memberDao;
	
	// myInfo.jsp - 회원정보 창 띄우기
	@RequestMapping("/profile/myInfo.do")
	public String myInfo() {
		
		return "profile/myInfo";
	}
	
	
	// myProfile.jsp - 내 프로필 창 띄우기
	@RequestMapping("/profile/myProfile.do")
	public String myProfile() {
		
		return "profile/myProfile";
	}
	
	
//	// myUpdate.jsp - 회원 정보 수정 창 띄우기
//	@RequestMapping("/update/myUpdate.do")
//	public String myUpdate() {
//		
//		return "update/myUpdate";
//	}
	
	
	// 수정 ------------------------------------------------------------------------------------------
	
	
	// 
	@RequestMapping("/update/myUpdate.do")
	public String myUpdate(MemberVo vo, Model model) {
		
	       model.addAttribute("vo",vo);
		
	    return "update/myUpdate"; 
	}
	
	
	// 탈퇴 관련 ------------------------------------------------------------------------------------------
	
	
	// myProfile.jsp - 회원 탈퇴 기능 구현
	@PostMapping("/myDelete.do")
	public String myDelete(HttpSession session) {
	    session.invalidate();   // 전체 세션 제거
	    return "redirect:/";     // 메인 홈(재웅님)
	}
	
	
	
	
	
	
	
	
}

