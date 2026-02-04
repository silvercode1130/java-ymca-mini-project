package com.example.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.db.dao.PetDao;

import jakarta.servlet.http.HttpSession;

@Controller
public class PetController {
	
	@Autowired
	PetDao petDao;
	
	// petInsert.jsp - 펫 정보 등록 창 띄우기
	@RequestMapping("/insert/petInsert.do")
	public String petInsert() {
		
		return "insert/petInsert";
	}
	
	
	// petUpdate.jsp - 펫 정보 수정 창 띄우기
	@RequestMapping("/update/petUpdate.do")
	public String petUpdate() {
		
		return "update/petUpdate";
	}
	
	
	// petProfile.jsp - 펫 프로필 창 띄우기
	@RequestMapping("/profile/petProfile.do")
	public String petProfile() {
		
		return "profile/petProfile";
	}

	
	// petProfile.jsp - 반려동물 삭제 기능 구현
	@PostMapping("/petDelete.do")
	public String petDelete(HttpSession session) {
	    session.invalidate();   // 전체 세션 제거
	    return "redirect:/";     // 메인 홈(재웅님)
	}
	
	
	
}
