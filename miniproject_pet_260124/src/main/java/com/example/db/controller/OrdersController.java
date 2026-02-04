package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.db.dao.CartDao;
import com.example.db.dao.OrdersDao;
import com.example.db.vo.CartItemVo;
import com.example.db.vo.MemberVo;
import com.example.db.vo.OrdersItemVo;
import com.example.db.vo.OrdersVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrdersController {
    @Autowired 
    OrdersDao ordersDao;
    
    @Autowired 
    CartDao cartDao;

    // 체크아웃 페이지 (장바구니 -> 주문서)
    @RequestMapping("/orders/orders_checkout.do")
    public String checkout(Model model, HttpSession session) {
    	 // 세션에서 user 가져오기 (CartController와 통일)
        MemberVo user = (MemberVo) session.getAttribute("user");
        
        // 테스트용 더미
        if (user == null) {
            user = new MemberVo();
            user.setMem_idx(1); // DB에 있는 회원번호
            session.setAttribute("user", user);
        }
        
        Integer mem_idx = user.getMem_idx(); // 여기서 mem_idx 뽑아서 사용

        List<CartItemVo> cartList = cartDao.getCartList(mem_idx);
        
        int total = 0;
        for (CartItemVo c : cartList) {
            total += c.getItem().getItem_price() * c.getCart_item_quantity();
        }
        
        model.addAttribute("total_price", total);
        
        return "orders/orders_checkout";
    }

    // 주문 생성
    @RequestMapping("/orders/create")
    @Transactional
    public String createOrder(OrdersVo ordersVo, HttpSession session) {
    	MemberVo user = (MemberVo) session.getAttribute("user");
    	
    	// 데스트용 더미
        if(user == null) {
            user = new MemberVo();
            user.setMem_idx(1);
            session.setAttribute("user", user);
        }
        
        Integer mem_idx = user.getMem_idx();
        ordersVo.setMem_idx(mem_idx);

        // 주문 마스터 생성
        ordersDao.createOrders(ordersVo); 

        // 장바구니 리스트 가져와서 상세 품목 저장
        List<CartItemVo> cartList = cartDao.getCartList(mem_idx);
        for (CartItemVo cart : cartList) {
            OrdersItemVo item = new OrdersItemVo();
            item.setOrders_idx(ordersVo.getOrders_idx());
            item.setItem_idx(cart.getItem().getItem_idx()); 
            item.setOrders_item_quantity(cart.getCart_item_quantity());
            item.setOrders_price_at(cart.getItem().getItem_price());
            ordersDao.createOrdersItem(item);
        }

        // 장바구니 비우기
        cartDao.clearCart(mem_idx);
        return "redirect:/orders/list";
    }

    // 주문 목록
    @RequestMapping("/orders/list")
    public String getOrdersList(Model model, HttpSession session, @RequestParam(value="searchKeyword", required=false) String searchKeyword) {
    	MemberVo user = (MemberVo) session.getAttribute("user");
    	
	    if(user == null) return "redirect:/login";
	    
	    Integer mem_idx = user.getMem_idx();
	    
	    // 검색어를 포함해서 리스트를 가져오기
	    model.addAttribute("list", ordersDao.getOrdersList(mem_idx, searchKeyword));
	    model.addAttribute("searchKeyword", searchKeyword); // 검색창에 검색어 남겨두기용
	    
	    return "orders/orders_list";
    }

    // 주문 상세
    @RequestMapping("/orders/detail/{orders_idx}")
    public String getOrdersDetail(@PathVariable("orders_idx") int orders_idx, Model model) {
    	model.addAttribute("order", ordersDao.getOrdersDetail(orders_idx));
        model.addAttribute("itemList", ordersDao.getOrdersItemList(orders_idx));
        
        return "orders/orders_detail";
    }
    
 // 주문 취소
    @RequestMapping("/orders/cancel/{orders_idx}")
    public String cancelOrder(@PathVariable("orders_idx") int orders_idx) {
        // DB에서 주문 상태를 취소로 변경하거나 삭제
        ordersDao.cancelOrders(orders_idx);
        
        // 취소 후 다시 주문 목록으로 리다이렉트
        return "redirect:/orders/list";
    }
}