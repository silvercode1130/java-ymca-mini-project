package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.db.dao.CartDao;
import com.example.db.vo.CartItemVo;
import com.example.db.vo.MemberVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	private CartDao cartDao;
	
	@GetMapping("/cart")
    public String getCart(HttpSession session, Model model) {
		// 세션에서 로그인한 회원 정보 꺼내기
        MemberVo user = (MemberVo) session.getAttribute("user"); 
        
        if (user == null) {
            return "redirect:/loginForm"; 
        }

        // ★ 회원번호로 장바구니 리스트 한 번에 가져오기 (XML 수정한 거 호출)
        List<CartItemVo> list = cartDao.getCartList(user.getMem_idx());

        // JSP로 데이터 보내기
        model.addAttribute("cartList", list);

        // 화면 이동
        return "views/cart/cart.jsp";
    }
}
