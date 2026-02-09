package com.example.db.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.db.dao.MemberDao;
import com.example.db.vo.MemberProfileVo;
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
	
	
	// 탈퇴 관련 ------------------------------------------------------------------------------------------
	
	
	// myProfile.jsp - 회원 탈퇴 기능 구현
	@PostMapping("/myDelete.do")
	public String myDelete(HttpSession session) {
	    session.invalidate();   // 전체 세션 제거
	    return "redirect:/main.do";     // 메인 홈(재웅님)
	}
	
	
	// 이미지 업로드 관련 ------------------------------------------------------------------------------------------
	
	
	@PostMapping("/member/updateProfileImgAjax.do")
	@ResponseBody
	public String updateProfileImgAjax(
	        @RequestParam("mem_img") MultipartFile mem_img,
	        HttpSession session) throws Exception {

	    // 1. 로그인 유저 가져오기
	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) return "fail";

	    int mem_idx = user.getMem_idx();

	    // 2. 저장 경로
	    String webPath = "/images/profile/";
	    String absPath = session.getServletContext().getRealPath(webPath);

	    File dir = new File(absPath);
	    if (!dir.exists()) dir.mkdirs();

	    // 3. 파일명 처리
	    String fileName = mem_img.getOriginalFilename();
	    String saveName = System.currentTimeMillis() + "_" + fileName;

	    File saveFile = new File(absPath, saveName);
	    mem_img.transferTo(saveFile);

	    // 4. DB 업데이트
	    MemberProfileVo profileVo = new MemberProfileVo();
	    profileVo.setMem_idx(mem_idx);
	    profileVo.setMem_img(saveName);

	    memberDao.updateProfile(profileVo);

	    // 5. 프론트로 파일명 반환
	    return saveName;
	}
	
	
	
	
	
	
	
}

