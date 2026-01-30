package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.db.dao.CartDao;
import com.example.db.vo.CartItemVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	private CartDao cartDao;
	
	/*
	 * @RequestMapping("/cart/cart.do") public String cart(HttpSession session,
	 * Model model) {
	 * 
	 * @GetMapping("/cart") public String getCart(HttpSession session, Model model)
	 * {
	 * 
	 * // 1. 세션에서 로그인한 회원 정보 꺼내기 (로그인 안 되어 있으면 로그인 페이지로 이동) // 'user'라는 이름은 로그인 처리할
	 * 때 세션에 담은 이름이랑 똑같아야 함 MemberVO user = (MemberVO) session.getAttribute("user");
	 * 
	 * if (user == null) { return "redirect:/login"; // 로그인 안 했으면 로그인 먼저 }
	 * 
	 * // 2. 이 회원의 장바구니 번호(cart_idx) 가져오기 int cart_idx = user.getCart_idx();
	 * 
	 * // 3. XML에서 짠 JOIN 쿼리 호출해서 리스트 가져오기 List<CartItemVo> list =
	 * cartDao.getCartList(cart_idx);
	 * 
	 * // 4. JSP로 데이터 보내기 model.addAttribute("cartList", list);
	 * 
	 * // 5. cart.jsp 화면 띄우기 return "views/cart/cart.jsp"; }
	 */
}
