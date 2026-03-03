package com.example.db.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	        
	    	profileImgSrc = "/upload/profile/" + profile.getMem_img();
	    }

	    model.addAttribute("user", user);
	    model.addAttribute("profile", profile);
	    model.addAttribute("profileImgSrc", profileImgSrc);

	    return "profile/myProfile";
	}


	// myProfile.jsp - 내 프로필 수정하기
	@PostMapping("/profile/updateProfile.do")
	public String updateProfile(
	    MemberProfileVo profileVo,
	    @RequestParam(required = false) MultipartFile mem_photo,
	    HttpSession session
	) throws Exception {

	    MemberVo user = (MemberVo) session.getAttribute("user");
	    profileVo.setMem_idx(user.getMem_idx());

	    if (mem_photo != null && !mem_photo.isEmpty()) {
	        String uploadPath = "C:/upload/profile/";
	        File dir = new File(uploadPath);
	        if (!dir.exists()) dir.mkdirs();

	        String fileName = System.currentTimeMillis() + "_" + mem_photo.getOriginalFilename();
	        mem_photo.transferTo(new File(uploadPath + fileName));

	        profileVo.setMem_img(fileName); // ⭐ String으로 직접 세팅
	    }

	    MemberProfileVo exist =
	        memberDao.selectProfileByMemIdx(user.getMem_idx());

	    if (exist == null) {
	        memberDao.insertProfile(profileVo);
	    } else {
	        memberDao.updateProfile(profileVo);
	    }

	    return "redirect:/profile/myProfile.do";
	}
	
//	@PostMapping("/profile/updateProfile.do")
//	public String updateProfile(
//	    MemberProfileVo profileVo,
//	    @RequestParam(required = false) MultipartFile mem_img,
//	    HttpSession session
//	) throws Exception {
//
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    profileVo.setMem_idx(user.getMem_idx());
//
//	    // ⭐⭐⭐ 여기! 이게 그 if문 자리야 ⭐⭐⭐
//	    if (mem_img != null && !mem_img.isEmpty()) {
//
//	        String uploadPath = "C:/upload/profile/";
//	        File dir = new File(uploadPath);
//	        if (!dir.exists()) dir.mkdirs();
//
//	        String fileName = System.currentTimeMillis() + "_" + mem_img.getOriginalFilename();
//	        File saveFile = new File(uploadPath + fileName);
//
//	        mem_img.transferTo(saveFile);
//
//	        // DB에 들어갈 파일명 세팅
//	        profileVo.setMem_img(fileName);
//	    }
//
//	    // 기존 프로필 존재 여부 확인
//	    MemberProfileVo existing =
//	        memberDao.selectProfileByMemIdx(user.getMem_idx());
//
//	    if (existing == null) {
//	        memberDao.insertProfile(profileVo);
//	    } else {
//	        memberDao.updateProfile(profileVo);
//	    }
//
//	    return "redirect:/profile/myProfile.do";
//	}
	
//	@PostMapping("/profile/updateProfile.do")
//	public String updateProfile(
//	    MemberProfileVo profileVo,
//	    @RequestParam(required = false) MultipartFile mem_img,
//	    HttpSession session
//	) {
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    profileVo.setMem_idx(user.getMem_idx());
//
//	    // ⭐ 기존 프로필 존재 여부 확인
//	    MemberProfileVo existing =
//	        memberDao.selectProfileByMemIdx(user.getMem_idx());
//
//	    if (existing == null) {
//	        // 👉 없으면 INSERT
//	        memberDao.insertProfile(profileVo);
//	    } else {
//	        // 👉 있으면 UPDATE
//	        memberDao.updateProfile(profileVo);
//	    }
//
//	    session.setAttribute("user",
//	        memberDao.selectOneFromId(user.getMem_id())
//	    );
//
//	    return "redirect:/profile/myProfile.do";
//	}
	
//	@PostMapping("/profile/updateProfile.do")
//	public String updateProfile(
//	    MemberProfileVo profileVo,
//	    HttpSession session
//	) {
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    profileVo.setMem_idx(user.getMem_idx());
//
//	    memberDao.updateProfile(profileVo);
//
//	    // 세션 갱신
//	    session.setAttribute("user",
//	        memberDao.selectOneFromId(user.getMem_id())
//	    );
//
//	    return "redirect:/profile/myProfile.do";
//	}
	
	
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
