package com.example.db.controller;

import java.io.File;    // 저장할 때 필요함
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;

import com.example.db.dao.MemberDao;
import com.example.db.vo.GradeVo;
import com.example.db.vo.MemberAddrVo;
import com.example.db.vo.MemberProfileVo;
import com.example.db.vo.MemberVo;
import com.example.db.vo.RoleVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
   
   @Autowired
   MemberDao memberDao;
   
   @Autowired
   HttpSession session;
   
   
   // 회원가입 관련 ------------------------------------------------------------------------------------------
   
   // 은정 - 이것만 추가 했따!
   @RequestMapping("/member/signUpForm.do")
   public String signUpForm(MemberVo vo) {
	   
	   return "/member/signUp";
   }
   
   // signUp.jsp - 회원가입 폼 띄우기 
   // signUp.jsp - 회원가입 처리 시키기
   // signUp.jsp -> myUpdate.jsp 로 데이터 이동(?)
   @PostMapping("/member/signUp.do")
   public String signUpData(MemberVo vo) {
	   
	// 여기서 vo.getMem_id()를 찍어봐서 null이 나오는지 확인해보는 게 좋아.
	    System.out.println("가입 시도 ID: " + vo.getMem_id());
		/*
		 * int result = memberDao.insertMember(vo);
		 * 
		 * if(result > 0) { return "redirect:/member/myUpdate.do?mem_id="; // #수정 - 회원가입
		 * 성공 시 메인 홈(재웅님)으로 이동 } else { return "redirect:/member/signUpForm.do?error=1";
		 * }
		 */
	    
	    if(vo.getMem_id() == null || vo.getMem_id().isEmpty()) {
	        return "redirect:/member/signUp.do?error=id_null";
	    }

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

       return "member/login";
   }
   
   
    // signUp.jsp ->  -> myUpdate.jsp
   @RequestMapping(value="/member/login.do") 
   // 1. 괄호 안에 HttpSession session 꼭 추가하기!
   public String login(String mem_id,String mem_pwd) { 
       
      
       // 2. 중요! 'int res'가 아니라 'MemberVo loginVO'로 받아야 해.
       // Dao에서 MemberVo를 돌려주기로 했으니까, 받을 때도 MemberVo 그릇에 담아야 하거든!
//       MemberVo user = memberDao.login(vo);
      MemberVo user = memberDao.selectOneFromId(mem_id);
      // System.out.println(user);
       if (user == null) {
          
          return "redirect:loginForm.do?reason=fail";
       }
       
       // 1) MemberProfileVo 가져오기
       MemberProfileVo profile = memberDao.selectByMemIdx(user.getMem_idx());
       
       // 2) MemberVo에 mem_img setter가 있어야 함
       if(profile != null) {
           profile.setMem_img(profile.getMem_img());  
       }
       
       // 3) 세션에 저장
       session.setAttribute("loginMember", user);
       session.setAttribute("profile", profile);
       
       // 3. 로그인이 성공했는지 확인 (데이터가 들어있으면 성공!)
       
           // 4. [이게 핵심!] 세션에 "vo"라는 이름으로 회원 정보를 통째로 저장해.
           // 그래야 나중에 ${vo.mem_id} 처럼 꺼내 쓸 수 있어.
           session.setAttribute("user", user); 
     
     
     return "redirect:/main";
   }
   
  
	// ##또뎡이가 추가   
	// 이메일 로그인 처리
   @RequestMapping("/member/emailLoginProc.do")
   public String emailLoginProc(String mem_id, String mem_pwd, HttpSession session) {
	   
       MemberVo user = memberDao.selectOneFromId(mem_id);
       if(user == null || !user.getMem_pwd().equals(mem_pwd)) {
           return "redirect:emailLogin.do?reason=fail";
       }
       
       // 1) MemberProfileVo 가져오기
       MemberProfileVo profile = memberDao.selectByMemIdx(user.getMem_idx());
       
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
   
   
   // 회원 정보 수정 처리
   @GetMapping("/update/myUpdate.do")
   public String myUpdate(HttpSession session, Model model, String mem_id) {

       MemberVo user = null;

       // 로그인해서 온 경우 → 세션에 user 존재
       if(session.getAttribute("user") != null){
           user = (MemberVo) session.getAttribute("user");
       }

       // 회원가입 후 리다이렉트로 온 경우 → param으로 mem_id
       else if(mem_id != null){
           user = memberDao.selectOneFromId(mem_id);
           session.setAttribute("user", user);
       }
        
       // 251번줄 에러
       RoleVo role = memberDao.selectRoleByIdx(user.getMem_role_idx());
       GradeVo grade = memberDao.selectGradeByIdx(user.getMem_grade_idx());

       //등록지 주소목록 읽어오기
       List<MemberAddrVo> addr_list = memberDao.selectAddrList(user.getMem_idx());
       
       
       model.addAttribute("role", role);
       model.addAttribute("grade", grade);		
       model.addAttribute("user", user);				
       model.addAttribute("addr_list", addr_list);				
       
       System.out.println("------------------------------------------------------------");
       System.out.println("user :   " + user);
       System.out.println("role :  " + role);		
       System.out.println("grade :  " + grade);		
       System.out.println("------------------------------------------------------------");
       
       return "update/myUpdate"; 
   }
   
   
    // 수정 기능
   @PostMapping("/update/myUpdate.do")
   public String myUpdateSubmit(MemberVo memberVo,
													 MemberProfileVo profileVo,
												     RoleVo roleVo,
												     GradeVo gradeVo,
												     HttpSession session
		   											) {
	   
	   // 회원 기본 정보
	   memberDao.updateMember(memberVo);

	
	   // 프로필
	   profileVo.setMem_idx(memberVo.getMem_idx());
	   memberDao.updateProfile(profileVo);
	   
	   // 유저 종류
	   roleVo.setRole_idx(roleVo.getRole_idx());
	   memberDao.updateRole(roleVo);
	   
	   // 유저 등급
	   gradeVo.setGrade_idx(gradeVo.getGrade_idx());
	   memberDao.updateGrade(gradeVo);

	   // 세션 갱신
	   MemberVo updated = memberDao.selectOneFromId(memberVo.getMem_id());
	   session.setAttribute("user", updated);
	   

   
       System.out.println("------------------------------------------------------------");

	   return "redirect:/profile/myInfo.do";
   }

//       // ✅ 프로필 이미지 업데이트 (값 있을 때만)
//       MemberProfileVo profileVo = new MemberProfileVo();
//       profileVo.setMem_idx(vo.getMem_idx());
//       profileVo.setMem_nickname(profile.getMem_nickname());   // profile cannot be resolved
//       profileVo.setMem_intro(profile.getMem_intro());
//
//       // memberDao.updateProfile(profileVo);
//
//       if (profileVo.getMem_img() != null && !profileVo.getMem_img().isEmpty()) {
//           memberDao.updateProfile(profileVo);
//       }
//
//       // ✅ 주소 업데이트 (값 있을 때만)
//       MemberAddrVo addrVo = new MemberAddrVo();
//       addrVo.setMem_idx(vo.getMem_idx());
//       addrVo.setMem_zipcode(vo.getMem_zipcode());		// The method getMem_zipcode() is undefined for the type MemberVo
//       addrVo.setMem_addr(vo.getMem_addr());
//       addrVo.setMem_addr_detail(vo.getMem_addr_detail());
//
//       // memberDao.updateAddr(addrVo);
//
//       if (addrVo.getMem_addr() != null && !addrVo.getMem_addr().isEmpty()) {
//           memberDao.updateAddr(addrVo);
//       }
//
//       MemberVo updated = memberDao.selectOneFromId(vo.getMem_id());
//       session.setAttribute("user", updated);
//
//       return "redirect:/profile/myInfo.do";
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
   @RequestMapping ("/member/logout")
   public String logout() {
	   
       session.invalidate();   // 전체 세션 제거
       
       return "redirect:/main";     // 메인 홈(재웅님)
   }
   
   
   // 로그아웃 관련 ------------------------------------------------------------------------------------------
   
   
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
   
   
//   // myUpdate.jsp - 프로필 table
//   @PostMapping("/member/updateProfileAjax.do")
//   @ResponseBody
//   public String updateProfileAjax(MemberVo vo, MemberProfileVo profile,
//           @RequestParam(required=false) MultipartFile mem_photo) {
//
//       if (mem_photo != null && !mem_photo.isEmpty()) {
//           String uploadPath = "C:/upload/profile/";
//           File folder = new File(uploadPath);
//           if (!folder.exists()) folder.mkdirs();
//
//           String fileName = System.currentTimeMillis() + "_" + mem_photo.getOriginalFilename();
//           try {
//               mem_photo.transferTo(new File(uploadPath, fileName));
//               profile.setMem_img(fileName);
//           } catch (Exception e) {
//               e.printStackTrace();
//           }
//       }
//
//       memberDao.updateProfile(vo);
//       return "ok";
//   }
//
//   
//   // myUpdate.jsp - 생년월일
//   @PostMapping("/member/updateBdayAjax.do")
//   @ResponseBody
//   public String updateBdayAjax(MemberVo vo) {
//       memberDao.update(vo);
//       return "ok";
//   }

   
   // myUpdate.jsp - 주소 관련 table
   @PostMapping("/member/updateAddrAjax.do")
   @ResponseBody
   public String updateAddrAjax(MemberAddrVo vo) {
       
	   memberDao.insertAddr(vo);
       
	   return "ok";
   }

   
   
   
   
      
}

