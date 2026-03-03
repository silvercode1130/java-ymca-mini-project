package com.example.db.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.ssl.SslProperties.Bundles.Watch.File;
//import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.db.dao.MemberDao;
import com.example.db.vo.GradeVo;
import com.example.db.vo.MemberAddrVo;
import com.example.db.vo.MemberProfileVo;
import com.example.db.vo.MemberVo;
import com.example.db.vo.RoleVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
   
	@Autowired
    MemberDao memberDao;
    
    @Autowired
    HttpServletRequest request;
    
    @Autowired
    HttpSession session;
   
   
   // 회원가입 관련 ------------------------------------------------------------------------------------------
   
   @RequestMapping("/member/signUpForm.do")
   public String signUpForm(MemberVo vo) {
	   
	   return "/member/member_join_form";
   }
   
   // signUp.jsp - 회원가입 폼 띄우기 
   // signUp.jsp - 회원가입 처리 시키기
   // signUp.jsp -> myUpdate.jsp 로 데이터 이동(?)
   @PostMapping("/member/signUp.do")
   public String signUpData(MemberVo vo, HttpServletRequest request, HttpSession session) {
	   
	// 여기서 vo.getMem_id()를 찍어봐서 null이 나오는지 확인해보는 게 좋아.
	    System.out.println("가입 시도 ID: " + vo.getMem_id());
	    
	    if(vo.getMem_id() == null || vo.getMem_id().isEmpty()) {
	        return "redirect:/member/signUp.do?error=id_null";
	    }
	    
	    // ip 구하기
 		String mem_ip = request.getRemoteAddr();
 		vo.setMem_ip(mem_ip);
	    
	    memberDao.insertMember(vo);
	    
	    return "redirect:/main";
   }


   // 동의 관련 ------------------------------------------------------------------------------------------

   
   // signUp.jsp -> 동의 버튼 클릭 시
   // 1. agreeService.jsp
   @RequestMapping("/agree/agreeService.do")
   public String agreeService() {
      
       return "agree/agreeService";
   }

   
   
   // 2. agreePrivacy.jsp
   @RequestMapping("/agree/agreePrivacy.do")
   public String agreePrivacy() {
      
       return "agree/agreePrivacy";
   }
   
   
   
   // 3. agreeMarckting.jsp
   @RequestMapping("/agree/agreeMarketing.do")
   public String agreeMarketing() {
      
       return "agree/agreeMarketing";
   }
   
   
   // 로그인 관련 ------------------------------------------------------------------------------------------
   

   @RequestMapping("/member/loginForm.do")
   public String loginForm(HttpSession session) {

       System.out.println("🔑 LOGIN FORM session id = " + session.getId());
       System.out.println("🔑 LOGIN FORM user = " + session.getAttribute("user"));

       return "member/member_login_form";
   }
   
   
    // signUp.jsp ->  -> myUpdate.jsp
   @RequestMapping("/member/login.do")
   public String login(@RequestParam String mem_id,
                       @RequestParam String mem_pwd,
                       @RequestParam(required = false) String redirect,
                       RedirectAttributes ra) {

       MemberVo user = memberDao.selectOneFromId(mem_id);

       // 아이디 없음 or 비번 틀림
       if (user == null || !user.getMem_pwd().equals(mem_pwd)) {
           ra.addAttribute("reason", "fail");
           if (redirect != null && !redirect.isBlank()) {
               ra.addAttribute("redirect", redirect);
           }
           return "redirect:/member/loginForm.do";
       }

       // 프로필
       MemberProfileVo profile = memberDao.selectProfileByMemIdx(user.getMem_idx());
       if (profile != null) {
           profile.setMem_img(profile.getMem_img());
       }

       // 세션 저장
       session.setAttribute("profile", profile);
       session.setAttribute("user", user);

       // ★ redirect가 있으면 그쪽으로 보내기
       if (redirect != null && !redirect.isBlank()) {
           return "redirect:" + redirect;
       }

       // 없으면 메인
       return "redirect:/main";
   }

   
 
	// 이메일 로그인 처리
   @RequestMapping("/member/emailLoginProc.do")
   public String emailLoginProc(String mem_id, String mem_pwd, HttpSession session) {
	   
       MemberVo user = memberDao.selectOneFromId(mem_id);
       if(user == null || !user.getMem_pwd().equals(mem_pwd)) {
           return "redirect:emailLogin.do?reason=fail";
       }
       
       // 1) MemberProfileVo 가져오기
       MemberProfileVo profile = memberDao.selectProfileByMemIdx(user.getMem_idx());
       
       // 2) MemberVo에 mem_img setter가 있어야 함
       if(profile != null) {
           profile.setMem_img(profile.getMem_img());  
       }
       
       // 3) 세션에 저장
       session.setAttribute("user", user);
       session.setAttribute("profile", profile);

       return "redirect:/main";
   }
   



   
   
   // 비밀번호 관련 ------------------------------------------------------------------------------------------
   
   
   // pwdFind - 비밀번호 찾기 폼 띄우기
   @RequestMapping("/member/pwdFind.do")
   public String pwdFind() {
      
      return "member/pwdFind";
   }
   
   
   // 아이디 관련 ------------------------------------------------------------------------------------------
   
   
   // 중복 ID 체크
   @RequestMapping("/member/check_id.do")
   @ResponseBody
   public Map<String, Boolean> check_id(String mem_id) {

       MemberVo vo = memberDao.selectOneFromId(mem_id);

       Map<String, Boolean> map = new HashMap<>();
       
       // vo가 null → 아이디 없음 → 사용 가능(true)
       // vo가 있으면 → 이미 가입된 아이디 → 사용 불가(false)
       map.put("result", vo == null);

       return map;
   }
   
   
   // 비밀번호 관련 ------------------------------------------------------------------------------------------
   
   
	/*
	 * @RequestMapping("/member/check_id.do")
	 * 
	 * @ResponseBody public Map<String, Boolean> checkId(String mem_id) {
	 * 
	 * MemberVo vo = memberDao.selectOneFromId(mem_id); Map<String, Boolean> map =
	 * new HashMap<>(); // 아이디가 존재하면 false, 없으면 true (기존 중복 체크와 반대로 사용)
	 * 
	 * map.put("result", vo == null); return map; }
	 */

   
   // 수정 관련 ------------------------------------------------------------------------------------------
   
   
	// 회원 정보 수정 폼
	@GetMapping("/update/myUpdate_form.do")
	public String myUpdate(HttpSession session, Model model, String mem_id) {
	
	    MemberVo user = null;
	
	    // 세션에 user가 있으면 사용
	    if (session.getAttribute("user") != null) {
	        user = (MemberVo) session.getAttribute("user");
	    }
	    
	    // 회원가입 직후 redirect로 들어온 경우
	    else if (mem_id != null) {
	        user = memberDao.selectOneFromId(mem_id);
	        session.setAttribute("user", user);
	    }
	
	    // 여기서 user가 "확정"됨
	    System.out.println("------------------------------------------------------------");
	    System.out.println(user);
	    System.out.println("------------------------------------------------------------");
	
	    // model에 실어주기 (한 번만!)
	    model.addAttribute("user", user);
	
	    if (user != null) {
	        model.addAttribute("member_addr", user.getAddr());
	    }
	
	    // 기타 공통 데이터
	    RoleVo role = memberDao.selectDefaultRole();
	    GradeVo grade = memberDao.selectDefaultGrade();
	
	    model.addAttribute("role", role);
	    model.addAttribute("grade", grade);
	
	    // 주소 null인지 아닌지 테스트 중
	    System.out.println(user.getAddr());
	    
	    return "update/myUpdate";
	}
	
   
    // 수정 기능 구현
	@PostMapping("/update/myUpdate.do")
	public String myUpdateSubmit(
	        MemberVo vo,
	        @RequestParam(required = false) String new_pwd,
	        HttpSession session
	) {
	    // 🔴 세션에서 user 꺼내기
	    MemberVo sessionUser = (MemberVo) session.getAttribute("user");

	    // 🔥 세션이 없으면 → mem_id로 다시 조회해서 세션 복구
	    if (sessionUser == null) {
	        sessionUser = memberDao.selectOneFromId(vo.getMem_id());
	        session.setAttribute("user", sessionUser);
	    }

	    // ===== 필수 값 보정 =====
	    vo.setMem_id(sessionUser.getMem_id());
	    vo.setMem_role_idx(sessionUser.getMem_role_idx());
	    vo.setMem_grade_idx(sessionUser.getMem_grade_idx());
	    vo.setMem_ip(sessionUser.getMem_ip());

	    // ===== 비밀번호 처리 =====
	    if (new_pwd != null && !new_pwd.isEmpty()) {
	        vo.setMem_pwd(new_pwd);
	    } else {
	        vo.setMem_pwd(sessionUser.getMem_pwd());
	    }

	    // ===== UPDATE =====
	    memberDao.update(vo);

	    // ===== 최신 정보 다시 세션 저장 =====
	    MemberVo updated = memberDao.selectOneFromId(vo.getMem_id());
	    session.setAttribute("user", updated);

	    return "redirect:/update/myUpdate_form.do";
	}
	
//	@PostMapping("/update/myUpdate.do")
//	public String myUpdateSubmit(
//	        MemberVo vo,
//	        @RequestParam(required = false) String new_pwd
//	) {
//	    MemberVo sessionUser = (MemberVo) session.getAttribute("user");
//
//	    // 필수 값 보정
//	    vo.setMem_id(sessionUser.getMem_id());
//	    vo.setMem_role_idx(sessionUser.getMem_role_idx());
//	    vo.setMem_grade_idx(sessionUser.getMem_grade_idx());
//	    vo.setMem_ip(sessionUser.getMem_ip());
//
//	    // 비밀번호 처리
//	    if (new_pwd != null && !new_pwd.isEmpty()) {
//	        vo.setMem_pwd(new_pwd);
//	    } else {
//	        vo.setMem_pwd(sessionUser.getMem_pwd());
//	    }
//
//	    memberDao.update(vo);
//
//	    MemberVo updated = memberDao.selectOneFromId(vo.getMem_id());
//	    session.setAttribute("user", updated);
//
//	    return "redirect:/update/myUpdate_form.do";
//	}
	
//   @PostMapping("/update/myUpdate.do")
//   public String myUpdateSubmit(MemberVo vo) {
//	   
//	   // 얘 없어서 업데이트가 안됨ㅠㅠ
//	   vo.setMem_ip(request.getRemoteAddr());
//	   memberDao.update(vo);
//
//       // ✅ 프로필 이미지 업데이트 (값 있을 때만)
////       MemberProfileVo profileVo = new MemberProfileVo();
////       profileVo.setMem_idx(vo.getMem_idx());
////
////       if (profileVo.getMem_img() != null && !profileVo.getMem_img().isEmpty()) {
////           memberDao.updateProfile(profileVo);
////       }
//
//       // ✅ 주소 업데이트 (값 있을 때만)
//       MemberAddrVo addrVo = new MemberAddrVo();
//       addrVo.setMem_idx(vo.getMem_idx());
//
//       if (addrVo.getMem_addr() != null && !addrVo.getMem_addr().isEmpty()) {
//           memberDao.updateAddr(addrVo);
//       }
//
//       MemberVo updated = memberDao.selectOneFromId(vo.getMem_id());
//       session.setAttribute("user", updated);
//
//       return "redirect:/update/myUpdate_form.do";
//   }
   
//   @PostMapping("/update/myUpdate.do")
//   public String myUpdateSubmit(MemberVo vo) {
//
//       // 프로필 VO
//       MemberProfileVo profileVo = new MemberProfileVo();
//       profileVo.setMem_idx(vo.getMem_idx());
//       memberDao.updateProfile(profileVo);
//       
//       if (profileVo.getMem_img() != null && !profileVo.getMem_img().isEmpty()) {
//    	    memberDao.updateProfile(profileVo);
//    	}
//
//       // 주소 VO
//       MemberAddrVo addrVo = new MemberAddrVo();
//       addrVo.setMem_idx(vo.getMem_idx());
//       memberDao.updateAddr(addrVo);
//
//       MemberVo updated = memberDao.selectOneFromId(vo.getMem_id());
//       session.setAttribute("user", updated);
//
//       return "redirect:/profile/myInfo.do";
//   }
   
//   @PostMapping("/update/myUpdate.do")
//   public String myUpdateSubmit(MemberVo vo) {
//
//       memberDao.updateProfile(vo);
//       memberDao.updateAddr(vo);
//
//       MemberVo updated = memberDao.selectOneFromId(vo.getMem_id());
//       session.setAttribute("user", updated);
//
//       return "redirect:/profile/myInfo.do";
//   }
   
//   @PostMapping("/update/myUpdate.do") - 에러 x
//    
//	public String myUpdateSubmit(MemberVo vo/*
//											 * , Model model,
//											 * 
//											 * @RequestParam(value="mem_photo", required = false) MultipartFile file
//											 */
//                               ) {
//	   
////	   	// ⭐⭐⭐ 여기다 적어 ⭐⭐⭐
////	    System.out.println("=== myUpdateSubmit 진입 ===");
////	    System.out.println("file 객체 null 아님? " + (file != null));
////	    if (file != null) {
////	        System.out.println("file.isEmpty(): " + file.isEmpty());
////	        System.out.println("원본 파일명: " + file.getOriginalFilename());
////	        System.out.println("파일 사이즈: " + file.getSize());
////	    }
//
////       // 1) 파일이 저장될 경로 설정
////       String uploadPath = "C:/upload/profile/";
////       File folder = new File(uploadPath);
////       if (!folder.exists()) folder.mkdirs();
////       
////       MemberProfileVo profile  = memberDao.selectProfile(vo.getMem_id());
////
////       // 2) 파일이 있을 때만 처리
////       if (file != null && !file.isEmpty()) {
////           String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
////           File saveFile = new File(uploadPath, fileName);
////           try {
////               file.transferTo(saveFile);
////               profile.setMem_img(fileName);   // DB에는 파일명만 넣기
////           } catch (Exception e) {
////               e.printStackTrace();
////           }
////       }
//
//       // 3) DB 수정
////       memberDao.update(vo);
////       memberDao.updateProfile(vo);
////       memberDao.updateAddr(vo);
//
//       // 4) 세션 값 갱신
//       MemberVo updated = memberDao.selectOneFromId(vo.getMem_id());
//       session.setAttribute("user", updated);
//       
//
//       return "redirect:/profile/myInfo.do";
//   }
   
   
   	// 닉네임 체크 ------------------------------------------------------------------------------------------
   
   
   @GetMapping("/member/check_nickname.do")
   @ResponseBody
   public Map<String, Boolean> checkNickname(@RequestParam String mem_nickname) {
       Map<String, Boolean> map = new HashMap<>();

       int count = memberDao.checkNickname(mem_nickname);
       // count == 0 → 사용 가능
       map.put("result", count == 0);

       return map;
   }

   
   // 로그아웃 관련 ------------------------------------------------------------------------------------------
   
   
   // myInfo.jsp - 로그아웃 기능 구현
   @RequestMapping ("/member/logout.do")
   public String logout() {
	   
       session.invalidate();   // 전체 세션 제거
       
       return "redirect:/main";     // 메인 홈(재웅님)
   }
   
   
   // 탈퇴 관련 ------------------------------------------------------------------------------------------
   
   
   // 찾아야 함
   @PostMapping("/member/delete.do")
   public String memberDelete(HttpSession session) {

       MemberVo user = (MemberVo) session.getAttribute("user");
       if (user == null) {
           user = (MemberVo) session.getAttribute("loginMember");
       }

       if (user == null) {
           return "redirect:/member/loginForm.do";
       }

       memberDao.delete(user.getMem_idx());

       session.invalidate(); // 로그아웃 처리
       return "redirect:/main";
   }


   // aJax 관련 ------------------------------------------------------------------------------------------

   
   // 주소 저장 (없으면 insert / 있으면 update)
   @PostMapping("/member/updateAddrAjax.do")
   @ResponseBody
   public String updateAddrAjax(MemberAddrVo vo) {

       MemberAddrVo exist = memberDao.selectAddrByMemIdx(vo.getMem_idx());

       if (exist == null) {
           memberDao.insertAddr(vo);   // 최초 저장
       } else {
           memberDao.updateAddr(vo);   // 수정
       }

       return "ok";
   }
//   @PostMapping("/member/updateAddrAjax.do")
//   @ResponseBody
//   public String updateAddrAjax(MemberAddrVo vo) {
//
//       MemberAddrVo exist = memberDao.selectAddrByMemIdx(vo.getMem_idx());
//
//       if (exist == null) {
//           memberDao.insertAddr(vo);   	// 최초 저장(insert)
//       } else {
//           memberDao.updateAddr(vo);   // 수정(update)
//       }
//
//       return "ok";
//   }
   
   
//   // 주소가 없으면 insert / 있으면 update
//   @PostMapping("/member/updateAddrAjaxxx.do")
//   @ResponseBody
//   public String updateAddrAjaxxx(MemberAddrVo vo) {
//
//       MemberAddrVo exist = memberDao.selectAddrByMemIdx(vo.getMem_idx());
//
//       if (exist == null) {
//           memberDao.insertAddr(vo);
//       } else {
//           memberDao.updateAddr(vo);
//       }
//
//       return "ok";
//   }
//   
//   
//   // myUpdate.jsp - 주소 관련 table
//   @PostMapping("/member/updateAddrAjax.do")
//   @ResponseBody
//   public String updateAddrAjax(MemberAddrVo vo) {
//       memberDao.updateAddr(vo);
//       return "ok";
//   }

   
   
   
   
      
}
