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
import com.example.db.vo.GradeVo;
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
            user.setMem_grade_idx(4); // 더미용 등급 번호 추가!
            session.setAttribute("user", user);
        }
        
        Integer mem_idx = user.getMem_idx(); // 여기서 mem_idx 뽑아서 사용

        List<CartItemVo> cartList = cartDao.getCartList(mem_idx);
        
        int total = 0;
        for (CartItemVo c : cartList) {
            total += c.getItem().getItem_now_price() * c.getCart_item_quantity();
        }
        
        // 2. [추가] 등급 할인 정보 가져오기
        // (ordersDao나 memberDao에 등급 정보를 가져오는 메서드가 있어야 해뎡!)
        GradeVo grade = ordersDao.getGradeInfo(user.getMem_grade_idx());
        
        // 3. [추가] 할인 금액 및 최종 금액 계산
        // 할인액 = 원금 * 할인율 (예: 10000 * 0.05 = 500)
        double discountRate = grade.getGrade_discount_rate().doubleValue(); 
        int discountAmount = (int)(total * discountRate);
        int finalPrice = total - discountAmount;
        
        model.addAttribute("total_price", total);
        model.addAttribute("grade_discount_amount", discountAmount); // JSP의 ${grade_discount_amount}
        model.addAttribute("final_price", finalPrice);               // JSP의 ${final_price}
        
        return "orders/orders_checkout";
    }

    // 주문 생성
    @RequestMapping("/orders/create")
    @Transactional
    public String createOrder(HttpSession session, @RequestParam("orders_total_price") int total_price, 
            																	   @RequestParam(value="orders_grade_discount", defaultValue="0") double grade_discount) {
    	MemberVo user = (MemberVo) session.getAttribute("user");
    	
    	// 데스트용 더미
        if(user == null) {
            user = new MemberVo();
            user.setMem_idx(1);
            session.setAttribute("user", user);
        }
        
        Integer mem_idx = user.getMem_idx();
        
        // 1. 주문 마스터 생성
        OrdersVo vo = new OrdersVo();
        vo.setMem_idx(mem_idx);
        vo.setOrders_total_price(total_price);
        
        // [중요] BigDecimal 타입으로 등급 할인액 세팅!
        vo.setOrders_grade_discount(java.math.BigDecimal.valueOf(grade_discount));
        vo.setOrders_status_idx(1); // 결제대기 상태

        ordersDao.createOrders(vo); // 여기서 orders_idx가 채워짐
        int orders_idx = vo.getOrders_idx();
        
        // 2. 장바구니 아이템들을 주문 상세로 이동
        List<CartItemVo> cartList = cartDao.getCartList(mem_idx);
        for (CartItemVo cart : cartList) {
            OrdersItemVo item = new OrdersItemVo();
            item.setOrders_idx(orders_idx);
            item.setItem_idx(cart.getItem_idx());
            item.setOrders_item_quantity(cart.getCart_item_quantity());
            item.setOrders_price_at(cart.getItem().getItem_now_price());
            
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
    	
    	// 2. [순서 변경] 더미 데이터 체크를 맨 위로!
        if(user == null) {
            user = new MemberVo();
            user.setMem_idx(1); // 테스트용 1번 회원
            user.setMem_grade_idx(1); // 등급도 1번으로!
            session.setAttribute("user", user);
        }
    	
	    // if(user == null) return "redirect:/login";
	    
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
    public String cancelOrder(@PathVariable("orders_idx") int orders_idx, HttpSession session) {
    	// 취소할 때도 혹시 세션 끊길지 모르니까 더미 체크!
        MemberVo user = (MemberVo) session.getAttribute("user");
        if(user == null) {
            user = new MemberVo();
            user.setMem_idx(1);
            session.setAttribute("user", user);
        }
    	
    	// DB에서 주문 상태를 취소로 변경하거나 삭제
        ordersDao.cancelOrders(orders_idx);
        
        // 취소 후 다시 주문 목록으로 리다이렉트
        return "redirect:/orders/list";
    }
}