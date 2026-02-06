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
	
	// petInsert.jsp - 펫 정보 등록 창 띄우기
	@RequestMapping("/insert/petInsert_form.do")
	public String petInsert() {
		
		return "insert/petInsert";
	}
	
	
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

	    // 🔐 보안: 내 펫이 아니면 차단
	    if (vo == null || vo.getMem_idx() != user.getMem_idx()) {
	        return "redirect:/profile/petProfile_form.do";
	    }

	    model.addAttribute("vo", vo);
	    return "update/petUpdate";
	}
	
	
	// petUpdate.jsp - 수정 시키기
	@RequestMapping("/update/petUpdate.do")
	public String petUpdate(PetVo vo, HttpSession session) {

	    MemberVo user = (MemberVo) session.getAttribute("user");
	    if (user == null) {
	        user = (MemberVo) session.getAttribute("loginMember");
	    }
	    
	    if (user == null) {
	        return "redirect:/member/loginForm.do";
	    }

	    // 🔐 내 펫인지 다시 확인
	    PetVo dbVo = petDao.selectOneByPetIdx(vo.getPet_idx());
	    if (dbVo == null || dbVo.getMem_idx() != user.getMem_idx()) {
	        return "redirect:/profile/petProfile_form.do";
	    }

	    // 대표동물 보정
	    if (!"Y".equals(vo.getIs_primary()) && !"N".equals(vo.getIs_primary())) {
	        vo.setIs_primary("N");
	    }
	    
	 // 🔍 UPDATE 직전 값 확인
	    System.out.println("pet_idx = " + vo.getPet_idx());
	    System.out.println("pet_bday = " + vo.getPet_bday());
	    System.out.println("is_primary = " + vo.getIs_primary());

	    petDao.update(vo);

	    petDao.update(vo);
	    return "redirect:/profile/petProfile_form.do";
	}
	
	
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
    @RequestMapping("/profile/petInsert.do")		// 혹시 몰라서 PostMapping을 RequestMapping으로 공주가 바꿈
    public String petInsert(PetVo vo, HttpSession session) {

    	 System.out.println("🐾 petInsert 컨트롤러 들어옴");
    	 System.out.println("🔑 PET session id = " + session.getId());
    	 
    	 System.out.println("🐾 mem_idx = " + vo.getMem_idx());
    	 System.out.println("🐾 pet_species = " + vo.getPet_species());
    	
    	 System.out.println("🐶 pet_name = " + vo.getPet_name());
    	 System.out.println("🐶 species = " + vo.getPet_species());
    	 System.out.println("🐶 gender = " + vo.getPet_gender());
    	 
        // 1. 로그인 유저 가져오기
        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            return "redirect:/member/loginForm.do";
        }

        // 2. mem_idx 세팅
        vo.setMem_idx(user.getMem_idx());
        System.out.println("🐾 mem_idx = " + user.getMem_idx());
        
        System.out.println("🐶 pet_breed = " + vo.getPet_breed());
        
        // 임시 - is_primary 강제 보정
        if (!"Y".equals(vo.getIs_primary()) && !"N".equals(vo.getIs_primary())) {
            vo.setIs_primary("N");
        }

//        // 임시 -  pet_species 강제 보정
//        if (vo.getPet_species() == null || vo.getPet_species().isEmpty()) {
//            vo.setPet_species("DOG");   // 임시 기본값
//        }

        // 3. 대표동물 처리 (선택)
        if (vo.getIs_primary() == null) {
            vo.setIs_primary("n");
        }
        
        // 임시 추가 - 에러 원인 체크용
        if (vo.getPet_species() == null) {
            vo.setPet_species("DOG"); // 또는 CAT
        }

        // 4. insert
        int res = petDao.insert(vo);
        System.out.println("🐾 insert 결과 = " + res);

        // 5. 결과 처리
        if (res > 0) {
            return "redirect:/profile/petProfile_form.do";
        } else {
            return "redirect:/profile/petInsertForm.do";
        }
    }

    
    
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
