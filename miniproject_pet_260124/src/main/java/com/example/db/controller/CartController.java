package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.db.dao.CartDao;
import com.example.db.vo.CartItemVo;
import com.example.db.vo.MemberVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	private CartDao cartDao;
	
	// 장바구니 조회
	@RequestMapping("/cart")
    public String getCart(HttpSession session, Model model) {
		
		// [테스트용 더미 추가] 로그인 안 되어 있으면 강제로 1번 회원 만들기
	    if (session.getAttribute("user") == null) {
	        MemberVo dummy = new MemberVo();
	        dummy.setMem_idx(1); // 뎡뎡이 DB에 있는 회원번호로!
	        session.setAttribute("user", dummy);
	    }
		
		// 세션에서 로그인한 회원 정보 꺼내기
        MemberVo user = (MemberVo) session.getAttribute("user"); 
        
        //  만약 회원정보가 없다면 로그인 페이지로 이동
        if (user == null) {
            return "redirect:/loginForm"; 
        }

        // 회원번호로 장바구니 리스트 한 번에 가져오기 (XML 호출)
        List<CartItemVo> list = cartDao.getCartList(user.getMem_idx());

        // JSP로 데이터 보내기
        model.addAttribute("cartList", list);

        // 화면 이동
        return "cart/cart";
    }
	
	// 장바구니에 상품 추가
	@RequestMapping("/cart/add/{item_idx}")
	// @PathVariable : 주소창에 붙어온 번호({item_idx})를 받아서 자바 변수로 만듬
    public String addToCart(@PathVariable("item_idx") int item_idx, HttpSession session) {
											// 클릭한 상품의 번호를 받음
		
		// [추가] 로그인이 안 되어 있어도 1번 회원이 담는 것으로 처리
	    if (session.getAttribute("user") == null) {
	        MemberVo dummy = new MemberVo();
	        dummy.setMem_idx(1); 
	        session.setAttribute("user", dummy);
	    }
		
		// 세션에서 로그인한 회원 정보 꺼내서 user에 담음
        MemberVo user = (MemberVo) session.getAttribute("user");
        
        //  만약 회원정보가 없다면 로그인 페이지로 이동
        if (user == null) {
        	return "redirect:/loginForm";
        }
        
        // 상품 번호와 회원정보를 DB 장바구니 목록에 저장
        cartDao.addToCart(user.getMem_idx(), item_idx);
        
        // 다시 장바구니 화면으로 이동(redirect:/cart : 일을 마친 뒤 "새로고침" 하듯이 장바구니 화면을 다시 보여주라는 뜻)
        return "redirect:/cart";
    }

    // 장바구니에서 상품 제거
	@RequestMapping("/cart/remove/{cart_item_idx}")
    public String removeFromCart(@PathVariable("cart_item_idx") int cart_item_idx) {  
													// 지울 상품의 번호를 받음
		//  DB에서 해당 제품을 삭제
        cartDao.removeFromCart(cart_item_idx);
        
        // 다시 장바구니 화면으로 이동
        return "redirect:/cart";
    }
	
	// CartController.java에 추가

	@GetMapping("/cart/updateQty")
	public String updateQty(@RequestParam("idx") int cart_item_idx, 
	                        @RequestParam("qty") int qty) {
	    
	    // 1. 서비스나 DAO를 통해서 DB의 수량을 업데이트해뎡
	    cartDao.updateItemQty(cart_item_idx, qty);
	    
	    // 2. 수정이 끝났으면 다시 장바구니 목록 페이지로 돌아가기!
	    return "redirect:/cart"; 
	}
}
