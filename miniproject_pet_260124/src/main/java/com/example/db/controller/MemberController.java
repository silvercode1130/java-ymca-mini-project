package com.example.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.db.dao.MemberDao;
import com.example.db.vo.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    
    @Autowired
    MemberDao memberDao;
    
    @Autowired
    HttpServletRequest request;
    
    @Autowired
    HttpSession session;
    
    // ===== 로그인 폼 =====
    @GetMapping("/login_form.do")
    public String loginForm() {
        return "member/member_login_form";
    }
    
    // ===== 로그인 처리 =====
    @PostMapping("/login.do")
    public String login(String mem_id, String mem_pwd, RedirectAttributes ra) {
        
        // 1. ID/PWD로 회원 조회
        MemberVo user = memberDao.selectOneLogin(mem_id);
        
        // 2. 로그인 체크
        if (user == null || !mem_pwd.equals(user.getMem_pwd())) {
            ra.addFlashAttribute("loginError", "ID 또는 비밀번호를 확인하세요.");
            return "redirect:login_form.do";
        }
        
        // 3. 세션에 사용자 정보 저장
        session.setAttribute("user", user);
        ra.addFlashAttribute("loginSuccess", "환영합니다, " + user.getMem_name() + "님!");
        
        return "redirect:/main";  // 메인으로
    }
    
    // ===== 회원가입 폼 =====
    @GetMapping("/join_form.do")
    public String joinForm() {
        return "member/member_join_form";
    }
    
    // ===== 회원가입 처리 ===== (간단 버전)
    @PostMapping("/join.do")
    public String join(MemberVo vo, RedirectAttributes ra) {
        
        // 비번 암호화 생략 (실무에선 필수!)
        // vo.setMem_pwd(passwordEncoder.encode(vo.getMem_pwd()));
        
        int res = memberDao.insert(vo);
        
        if (res > 0) {
            ra.addFlashAttribute("joinSuccess", "회원가입 성공! 로그인을 해주세요.");
            return "redirect:login_form.do";
        } else {
            ra.addFlashAttribute("joinError", "회원가입 실패. 다시 시도해주세요.");
            return "redirect:join_form.do";
        }
    }
    
    // ===== 로그아웃 =====
    @GetMapping("/logout.do")
    public String logout(RedirectAttributes ra) {
        
        // 세션 초기화
        session.invalidate();
        ra.addFlashAttribute("logoutSuccess", "안전하게 로그아웃 되었습니다.");
        
        return "redirect:/main";
    }
    
    // ===== 마이페이지 (보너스) =====
    @GetMapping("/mypage.do")
    public String mypage() {
        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            return "redirect:login_form.do";
        }
        return "member/member_mypage";
    }
}
