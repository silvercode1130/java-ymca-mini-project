package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.db.dao.PetDao;
import com.example.db.vo.MemberVo;
import com.example.db.vo.PetVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class PetController {
	
	@Autowired
	PetDao petDao;
	
	// petInsert.jsp - 창만 띄우기
	@RequestMapping("/insert/petInsert_form.do")
	public String petInsert_form() {
		
	    return "insert/petInsert";
	}
	
	// petInsert.jsp - 대표동물 등록 한마리만
	@RequestMapping("/insert/petInsert.do")
	public String petInsert(PetVo vo, HttpSession session) {

	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) user = (MemberVo) session.getAttribute("loginMember");
	    if (user == null) return "redirect:/member/loginForm.do";

	    vo.setMem_idx(user.getMem_idx());

	    // 대표동물로 등록하려는 경우
	    if ("Y".equals(vo.getIs_primary())) {

	        // 1. 기존 대표 전부 N
	        petDao.resetPrimaryByMemIdx(user.getMem_idx());

	        // 2. insert
	        petDao.insert(vo);

	        // 3. 방금 insert된 펫을 Y로 변경
	        petDao.setPrimaryByPetIdx(vo.getPet_idx());

	    } else {

	        vo.setIs_primary("N");
	        petDao.insert(vo);
	    }

	    return "redirect:/profile/petProfile_form.do";
	}
	
//	@RequestMapping("/insert/petInsert.do")
//	public String petInsert(PetVo vo, HttpSession session) {
//	    // 1. 로그인 유저 확인 
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    if (user == null) user = (MemberVo) session.getAttribute("loginMember");
//	    if (user == null) return "redirect:/member/loginForm.do";
//
//	    // 2. 외래키(mem_idx) 설정 
//	    vo.setMem_idx(user.getMem_idx());
//
////	    // ⭐ 핵심: 새 펫을 대표('Y')로 등록하려 한다면?
////	    if ("Y".equals(vo.getIs_primary())) {
////	        // 이 사용자의 기존 펫들을 전부 'N'으로 초기화
////	        petDao.resetPrimaryByMemIdx(user.getMem_idx()); 
////	    } else {
////	        // 체크 안 했으면 기본값 'N' 
////	        vo.setIs_primary("N");
////	    }
//	    
//	    if ("Y".equals(vo.getIs_primary())) {
//	        petDao.insert(vo);
//	        petDao.updatePrimaryPet(vo.getPet_idx());
//	    } else {
//	        petDao.insert(vo);
//	    }
//
//	    // 3. 이제 새 펫 등록 (is_primary가 'Y'인 상태로 들어감) 
//	    petDao.insert(vo);
//	    
//	    return "redirect:/profile/petProfile_form.do";
//	}
	
//	@RequestMapping("/insert/petInsert_form.do")
//	public String petInsert(PetVo vo, MemberVo user) {
//		
////		// petInsert.do 부분 (예시)
////		if ("Y".equals(vo.getIs_primary())) {
////		    // 새 펫을 대표로 등록할 거면 기존 애들 다 N으로!
////		    // 아직 새 펫의 idx가 없으니 user.getMem_idx()로 처리하는 메서드가 따로 있으면 더 편해.
////		    petDao.resetPrimaryByMemIdx(user.getMem_idx()); 
////		} xml 추가해야 해 잊지마라 박소정!!
////		
////		petDao.insert(vo);
//		
//		return "insert/petInsert";
//	}
	
	
	// petUpdate.jsp - 펫 정보 수정 창 띄우기
	@RequestMapping("/update/petUpdate_form.do")
	public String petUpdateForm(
	        int pet_idx,
	        HttpSession session,
	        Model model) {

	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/member/loginForm.do";
	    }

	    PetVo vo = petDao.selectOneByPetIdx(pet_idx);

	    if (vo == null || vo.getMem_idx() != user.getMem_idx()) {
	        return "redirect:/profile/petProfile_form.do";
	    }

	    model.addAttribute("vo", vo);
	    model.addAttribute("mode", "update");

//	    return "profile/petProfile";
	    return "update/petUpdate";
	}
	
//	@RequestMapping("/update/petUpdate_form.do")
//	public String petUpdateForm(
//	        int pet_idx,
//	        HttpSession session,
//	        Model model) {
//		
//		System.out.println("넘어온 pet_idx = " + pet_idx);  // ⭐ 여기 추가
//
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    if (user == null) {
//	        return "redirect:/member/loginForm.do";
//	    }
//
//	    PetVo vo = petDao.selectOneByPetIdx(pet_idx);
//	    
//	    System.out.println("login mem_idx = " + user.getMem_idx());
//	    System.out.println("pet mem_idx = " + vo.getMem_idx());
//
//	    // 🔐 보안: 내 펫이 아니면 차단
//	    if (vo == null || vo.getMem_idx() != user.getMem_idx()) {
//	        return "redirect:/profile/petProfile_form.do";
//	    }
//
//	    model.addAttribute("updateVo", vo);
//	    model.addAttribute("mode", "update");
//	    return "profile/petProfile";   
//	}
	
	
	// petUpdate.jsp - 수정 시키기
	@RequestMapping("/update/petUpdate.do")
	public String petUpdate(PetVo vo, HttpSession session) {

	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) user = (MemberVo) session.getAttribute("loginMember");
	    if (user == null) return "redirect:/member/loginForm.do";

	    PetVo dbVo = petDao.selectOneByPetIdx(vo.getPet_idx());
	    if (dbVo == null || dbVo.getMem_idx() != user.getMem_idx()) {
	        return "redirect:/profile/petProfile_form.do";
	    }

	    // ⭐ 대표동물 선택했을 때
//	    if ("Y".equals(vo.getIs_primary())) {
//	        petDao.updatePrimaryPet(vo.getPet_idx());   // 🔥 이 줄이 핵심
//	    } else {
//	        petDao.update(vo); // 그냥 일반 업데이트
//	    }
	    
	    if ("Y".equals(vo.getIs_primary())) {

	        petDao.resetPrimaryByMemIdx(user.getMem_idx());
	        petDao.setPrimaryByPetIdx(vo.getPet_idx());

	    } else {

	        petDao.update(vo);
	    }

	    return "redirect:/profile/petProfile_form.do";
	}
	
//	@RequestMapping("/update/petUpdate.do")
//	public String petUpdate(PetVo vo, HttpSession session) {
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    if (user == null) user = (MemberVo) session.getAttribute("loginMember");
//	    if (user == null) return "redirect:/member/loginForm.do";
//
//	    // 🔐 보안: 수정하려는 펫이 진짜 내 펫인지 확인
//	    PetVo dbVo = petDao.selectOneByPetIdx(vo.getPet_idx());
//	    if (dbVo == null || dbVo.getMem_idx() != user.getMem_idx()) {
//	        return "redirect:/profile/petProfile_form.do";
//	    }
//
//	    // ⭐ 대표동물 한 마리 유지 핵심 로직
//	    if ("Y".equals(vo.getIs_primary())) {
//	        // 1. 이 유저의 모든 펫을 일단 'N'으로 초기화
//	        petDao.resetPrimaryByMemIdx(user.getMem_idx());
//	        // 2. 그 후 현재 펫 정보를 'Y'와 함께 업데이트
//	        petDao.update(vo);
//	    } else {
//	        // 대표 설정이 아니면 그냥 일반 정보 수정
//	        petDao.update(vo);
//	    }
//	    
//	    return "redirect:/profile/petProfile_form.do";
//	}
	
//	@RequestMapping("/update/petUpdate.do")
//	public String petUpdate(PetVo vo, HttpSession session) {
//
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    if (user == null) user = (MemberVo) session.getAttribute("loginMember");
//	    if (user == null) return "redirect:/member/loginForm.do";
//
//	    PetVo dbVo = petDao.selectOneByPetIdx(vo.getPet_idx());
//	    if (dbVo == null || dbVo.getMem_idx() != user.getMem_idx()) {
//	        return "redirect:/profile/petProfile_form.do";
//	    }
//
//	    if ("Y".equals(vo.getIs_primary())) {
//
//	        // 1. 기존 대표 N 처리
//	        petDao.resetPrimaryByPetIdx(vo.getPet_idx());
//
//	        // 2. 현재 펫 Y 처리 + 다른 필드 수정까지 한 번에
//	        petDao.update(vo);
//
//	    } else {
//
//	        // 대표 아니면 그냥 일반 수정
//	        petDao.update(vo);
//	    }
//	    
//	    return "redirect:/profile/petProfile_form.do";
//	}
	
//	@RequestMapping("/update/petUpdate.do")
//	public String petUpdate(PetVo vo, HttpSession session) {
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    if (user == null) user = (MemberVo) session.getAttribute("loginMember");
//	    if (user == null) return "redirect:/member/loginForm.do";
//
//	    PetVo dbVo = petDao.selectOneByPetIdx(vo.getPet_idx());
//	    if (dbVo == null || dbVo.getMem_idx() != user.getMem_idx()) {
//	        return "redirect:/profile/petProfile_form.do";
//	    }
//
//	    // ⭐ 대표동물 한 마리 유지 로직
//	    if ("Y".equals(vo.getIs_primary())) {
//	        petDao.updatePrimaryPet(vo.getPet_idx());
//	    } else {
//	        petDao.update(vo);
//	    }
//
//	    petDao.update(vo);
//	    return "redirect:/profile/petProfile_form.do";
//	}
	
//	@RequestMapping("/update/petUpdate.do")
//	public String petUpdate(PetVo vo, HttpSession session) {
//
//	    MemberVo user = (MemberVo) session.getAttribute("user");
//	    if (user == null) {
//	        user = (MemberVo) session.getAttribute("loginMember");
//	    }
//	    
//	    if (user == null) {
//	        return "redirect:/member/loginForm.do";
//	    }
//
//	    // 🔐 내 펫인지 다시 확인
//	    PetVo dbVo = petDao.selectOneByPetIdx(vo.getPet_idx());
//	    if (dbVo == null || dbVo.getMem_idx() != user.getMem_idx()) {
//	        return "redirect:/profile/petProfile_form.do";
//	    }
//
//	    // 대표동물 보정
//	    if (!"Y".equals(vo.getIs_primary()) && !"N".equals(vo.getIs_primary())) {
//	        vo.setIs_primary("N");
//	    }
//	    
//	 // 🔍 UPDATE 직전 값 확인
//	    System.out.println("pet_idx = " + vo.getPet_idx());
//	    System.out.println("pet_bday = " + vo.getPet_bday());
//	    System.out.println("is_primary = " + vo.getIs_primary());
//
//	    petDao.update(vo);
//
//	    return "redirect:/profile/petProfile_form.do";
//	}
	
	
//	// petProfile.jsp - 펫 프로필 창 띄우기
//	@RequestMapping("/profile/petProfile_form.do")
//	public String petProfile() {
//		
//		return "profile/petProfile";
//	}

	
	// petProfile.jsp - 반려동물 삭제 기능 구현
	@PostMapping("/petDelete.do")
	public String petDelete(int pet_idx, HttpSession session) {
	    // 세션 체크
	    // 내 펫인지 체크
	    petDao.delete(pet_idx);		// 여기가 에러??
	    return "redirect:/profile/petProfile_form.do";
	}
	
//	@PostMapping("/petDelete_form.do")
//	public String petDelete(HttpSession session) {
//	    session.invalidate();   // 전체 세션 제거
//	    return "redirect:/";     // 메인 홈(재웅님)
//	}
	
	
	
	
	


	// petInsert.jsp - 반려동물  등록
//    @RequestMapping("/insert/petInsert.do")		// 혹시 몰라서 PostMapping을 RequestMapping
//    public String petInsert(PetVo vo, HttpSession session) {
//    	
//	System.out.println("--------------------------------------------------------------------------------");
//    	System.out.println("user = " + session.getAttribute("user"));
//    	System.out.println("loginMember = " + session.getAttribute("loginMember"));
//
//    	 System.out.println("🐾 petInsert 컨트롤러 들어옴");
//    	 System.out.println("🔑 PET session id = " + session.getId());
//    	 
//    	 System.out.println("🐾 mem_idx = " + vo.getMem_idx());
//    	 System.out.println("🐾 pet_species = " + vo.getPet_species());
//    	
//    	 System.out.println("🐶 pet_name = " + vo.getPet_name());
//    	 System.out.println("🐶 species = " + vo.getPet_species());
//    	 System.out.println("🐶 gender = " + vo.getPet_gender());
//	 System.out.println("--------------------------------------------------------------------------------");
//    	 
//        // 1. 로그인 유저 가져오기
//		 MemberVo user = (MemberVo) session.getAttribute("user");
//		 if (user == null) {
//		     user = (MemberVo) session.getAttribute("loginMember");
//		 }
//		 if (user == null) {
//		     return "redirect:/member/loginForm.do";
//		 }
//
//        // 2. mem_idx 세팅
//        vo.setMem_idx(user.getMem_idx());
//   	 System.out.println("--------------------------------------------------------------------------------");
//        System.out.println("🐾 mem_idx = " + user.getMem_idx());
//        
//        System.out.println("🐶 pet_breed = " + vo.getPet_breed());
//   	 System.out.println("--------------------------------------------------------------------------------");
//        
//        // 임시 - is_primary 강제 보정
//        if (!"Y".equals(vo.getIs_primary()) && !"N".equals(vo.getIs_primary())) {
//            vo.setIs_primary("N");
//        }
//
////        // 임시 -  pet_species 강제 보정
////        if (vo.getPet_species() == null || vo.getPet_species().isEmpty()) {
////            vo.setPet_species("DOG");   // 임시 기본값
////        }
//
//        // 3. 대표동물 처리 (선택)
//        if (vo.getIs_primary() == null) {
//            vo.setIs_primary("n");
//        }
//        
//        // 임시 추가 - 에러 원인 체크용
//        if (vo.getPet_species() == null) {
//            vo.setPet_species("DOG"); // 또는 CAT
//        }
//
//        // 4. insert
//        int res = petDao.insert(vo);
//        
//   	 System.out.println("--------------------------------------------------------------------------------");
//        System.out.println("🐾 insert 결과 = " + res);
//   	 System.out.println("--------------------------------------------------------------------------------");
//
//        // 5. 결과 처리
//        if (res > 0) {
//            return "redirect:/profile/petProfile_form.do";
//        } else {
//            return "redirect:/insert/petinsertForm.do";
//        }
//    }

    
    
    // petProfile.jsp - 펫 정보조회
    @RequestMapping("/profile/petProfile_form.do")
    public String petProfile(HttpSession session, Model model) {

        // 1. 로그인 유저 가져오기
        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            return "redirect:/member/loginForm.do";
        }

        // 2. 로그인한 회원의 반려동물 목록 조회
        List<PetVo> petList = petDao.selectByMemIdx(user.getMem_idx());

        // 3. JSP로 내려주기
        model.addAttribute("petList", petList);

        // 4. JSP 이동
        return "profile/petProfile";
    }
	
	
}
