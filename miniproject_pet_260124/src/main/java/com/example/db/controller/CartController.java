package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	// HttpSession : 로그인정보를 담아주는 파라미터
	// Model : jsp로 보내도록 값을 담아주는 파라미터 
    public String getCart(HttpSession session, Model model) {
		// [테스트용 더미 추가] 로그인 안 되어 있으면 강제로 1번 회원 만들기
//	    if (session.getAttribute("user") == null) {
//	        MemberVo dummy = new MemberVo();
//	        dummy.setMem_idx(1);  // DB에 있는 회원번호로
//	        session.setAttribute("user", dummy);
//	    }
		
		// 세션에서 로그인한 회원 정보를 MemberVo로 꺼내기(다운캐스팅)
        MemberVo user = (MemberVo) session.getAttribute("user"); 
        
        //  만약 회원정보가 없다면 로그인 페이지로 이동
        if (user == null) {
            return "redirect:/member/loginForm.do"; 
        }

        // 로그인 한 회원의 회원 번호로 장바구니 목록을 조회(dao 메서드 호출) 후 그 값을 list로 받음
        List<CartItemVo> list = cartDao.getCartList(user.getMem_idx());

        // list로 받은 값을 model에 담아서 jsp에 cartlist라는 값으로 보냄
        model.addAttribute("cartList", list);

        // cart.jsp 화면으로 이동
        return "cart/cart";
    }
	
	// 장바구니에 상품 추가
	@RequestMapping("/cart/add/{item_idx}")
	// @PathVariable : 주소창에 붙어온 번호({item_idx})를 받아서 자바 변수로 만듬
    public String addToCart(@PathVariable("item_idx") int item_idx, HttpSession session) {
//		// 로그인이 안 되어 있어도 1번 회원이 담는 것으로 처리
//	    if (session.getAttribute("user") == null) {
//	        MemberVo dummy = new MemberVo();
//	        dummy.setMem_idx(1); 
//	        session.setAttribute("user", dummy);
//	    }
		
	    // 세션에서 로그인한 회원 정보를 MemberVo로 꺼내기(다운캐스팅)
        MemberVo user = (MemberVo) session.getAttribute("user");
        
        //  만약 회원정보가 없다면 로그인 페이지로 이동
        if (user == null) {
        	// [중요!] 로그인 성공 후 돌아올 주소를 세션에 저장해뎡!
            session.setAttribute("redirectURL", "/cart/add/" + item_idx);
            // [핵심!] 이 사람은 비로그인 상태에서 전체 리스트를 보다 왔다는 증거를 남겨뎡!
            session.setAttribute("forceAllList", true);
            
        	return "redirect:/member/loginForm.do";
        }
        
        int mem_idx = user.getMem_idx();
        // 이 회원의 장바구니(cart_idx)가 DB에 있는지 확인해보기
        Integer cartIdx = cartDao.getCartIdxByMemIdx(mem_idx);
        
        // 만약 없다면(null이라면)? 장바구니 방을 먼저 만들어주기
        if (cartIdx == null) {
            cartDao.createCart(mem_idx); 
        }
        
        // 상품 번호와 회원정보를 DB 장바구니 목록에 저장(dao 메서드 호출)
        cartDao.addToCart(user.getMem_idx(), item_idx);
        
        // (redirect:/cart : 일을 마친 뒤 "새로고침" 하듯이 장바구니 화면을 다시 보여주라는 뜻)
        // 다시 장바구니(cart.jsp) 화면으로 이동
        return "redirect:/cart";
    }

    // 장바구니에서 상품 제거
	@RequestMapping("/cart/remove/{cart_item_idx}")
    public String removeFromCart(@PathVariable("cart_item_idx") int cart_item_idx) {  
		//  받은 지울 상품의 번호를 DB에서 삭제(dao에서 지우는 메서드 호출)
        cartDao.removeFromCart(cart_item_idx);
        
        // 다시 장바구니(cart.jsp) 화면으로 이동
        return "redirect:/cart";
    }
	
	// 장바구니에서 상품 수량 변경
	@RequestMapping("/cart/updateQty")
	// @RequestParam : 주소창에서 ? 뒤에 붙는(URL 쿼리스트링) 값을 변수(파라미터)로 받는 것
	public String updateQty(@RequestParam("idx") int cart_item_idx, @RequestParam("qty") int qty) {
	    
	    // DAO를 통해서 DB의 수량을 업데이트
	    cartDao.updateItemQty(cart_item_idx, qty);
	    
	    // 수정이 끝났으면 다시 장바구니 목록 페이지로 돌아가기
	    return "redirect:/cart"; 
	}
}
