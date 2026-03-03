package com.example.db.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
//        // 세션에서 user 가져오기 (CartController와 통일)
//        MemberVo user = (MemberVo) session.getAttribute("user");
//        
//        // 테스트용 더미
//        if (user == null) {
//            user = new MemberVo();
//            user.setMem_idx(1); // DB에 있는 회원번호
//            user.setMem_grade_idx(4); // 더미용 등급 번호 추가
//            session.setAttribute("user", user);
//        }
//        
//        Integer mem_idx = user.getMem_idx(); // 여기서 mem_idx 뽑아서 사용
//
//        List<CartItemVo> cartList = cartDao.getCartList(mem_idx);
//        
//        int total = 0;
//        for (CartItemVo c : cartList) {
//            total += c.getItem().getItem_now_price() * c.getCart_item_quantity();
//        }
//        
//        // 등급 할인 정보 가져오기
//        GradeVo grade = ordersDao.getGradeInfo(user.getMem_grade_idx());
//        
//        // 할인 금액 및 최종 금액 계산
//        // 할인액 = 원금 * 할인율 (예: 10000 * 0.05 = 500)
//        double discountRate = grade.getGrade_discount_rate().doubleValue(); 
//        int discountAmount = (int)(total * discountRate);
//        int finalPrice = total - discountAmount;
//        
//        model.addAttribute("total_price", total);
//        model.addAttribute("grade_discount_amount", discountAmount); // JSP의 ${grade_discount_amount}
//        model.addAttribute("final_price", finalPrice);               // JSP의 ${final_price}
//        
//        int couponDiscount = 0;
//        // 세션에 쿠폰이 있다면 30% 추가 할인 계산!
//        if (session.getAttribute("hasFirstCoupon") != null) {
//            couponDiscount = (int)(total * 0.3);
//        }
//
//        int finPrice = total - discountAmount - couponDiscount; // 등급할인 + 쿠폰할인 적용!
//
//        model.addAttribute("total_price", total);
//        model.addAttribute("grade_discount_amount", discountAmount);
//        model.addAttribute("coupon_discount_amount", couponDiscount); // JSP에 전달!
//        model.addAttribute("finPrice", finPrice);
//        
       MemberVo user = (MemberVo) session.getAttribute("user");
        Integer mem_idx = user.getMem_idx();

        List<CartItemVo> cartList = cartDao.getCartList(mem_idx);
        
        int total = 0;
        for (CartItemVo c : cartList) {
            total += c.getItem().getItem_now_price() * c.getCart_item_quantity();
        }
        
        // 1. 등급 할인 계산
        GradeVo grade = ordersDao.getGradeInfo(user.getMem_grade_idx());
        double discountRate = grade.getGrade_discount_rate().doubleValue(); 
        int discountAmount = (int)(total * discountRate);
        
        // 2. [여기 주목!] 쿠폰 사용 자격 확인 (DB 체크)
        int usedCount = ordersDao.checkCouponUsed(mem_idx);
        int couponDiscount = 0;

        // 세션에 쿠폰이 '있고' + DB에 사용 기록이 '없어야(0)' 할인 적용!
        if (session.getAttribute("hasFirstCoupon") != null && usedCount == 0) {
            couponDiscount = (int)(total * 0.3);
        } else {
            // 자격이 없으면 세션에서도 지워버려서 확실하게 정리해뎡!
            session.removeAttribute("hasFirstCoupon");
        }

        // 3. 최종 금액 계산
        int finalPrice = total - discountAmount - couponDiscount;

        // 4. JSP로 전달 (변수명 중요!)
        model.addAttribute("total_price", total);
        model.addAttribute("grade_discount_amount", discountAmount);
        model.addAttribute("coupon_discount_amount", couponDiscount); // 이게 0이면 JSP에서 안 떠뎡!
        model.addAttribute("final_price", finalPrice);
        
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
        
        // 주문 마스터 생성
        OrdersVo vo = new OrdersVo();
        vo.setMem_idx(mem_idx);
        vo.setOrders_total_price(total_price);
        
        // BigDecimal 타입으로 등급 할인액 세팅
        vo.setOrders_grade_discount(java.math.BigDecimal.valueOf(grade_discount));
        vo.setOrders_status_idx(1); // 결제대기 상태
        
        ordersDao.createOrders(vo); // 여기서 orders_idx가 채워짐
        int orders_idx = vo.getOrders_idx();
        
        // 장바구니 아이템들을 주문 상세로 이동
        List<CartItemVo> cartList = cartDao.getCartList(mem_idx);
        for (CartItemVo cart : cartList) {
            OrdersItemVo item = new OrdersItemVo();
            item.setOrders_idx(orders_idx);
            item.setItem_idx(cart.getItem_idx());
            item.setOrders_item_quantity(cart.getCart_item_quantity());
            item.setOrders_price_at(cart.getItem().getItem_now_price());
            
            ordersDao.createOrdersItem(item);
        }
        
        // [추가] 결제가 완료되었으니 세션에서 쿠폰을 지워버려뎡!
        // 이렇게 하면 다음 주문 때는 쿠폰 할인이 적용되지 않아뎡.
        session.removeAttribute("hasFirstCoupon");
        
        // 장바구니 비우기
        cartDao.clearCart(mem_idx);
        
        return "redirect:/orders/list";
    }

    // 주문 목록
    @RequestMapping("/orders/list")
    public String getOrdersList(Model model, HttpSession session, @RequestParam(value="searchKeyword", required=false) String searchKeyword) {
       MemberVo user = (MemberVo) session.getAttribute("user");
       
//       // 더미 데이터 체크를 맨 위로
//        if(user == null) {
//            user = new MemberVo();
//            user.setMem_idx(1); // 테스트용 1번 회원
//            user.setMem_grade_idx(4); // 등급도 4번
//            session.setAttribute("user", user);
//        }
       
       // if(user == null) return "redirect:/login";
       
       Integer mem_idx = user.getMem_idx();
       List<OrdersVo> list = ordersDao.getOrdersList(mem_idx, searchKeyword);
       
       // [핵심] 각 주문번호별로 상품 리스트를 담을 맵을 생성
       // Key: 주문번호(orders_idx), Value: 상품리스트(List<OrdersItemVo>)
       Map<Integer, List<OrdersItemVo>> itemMap = new HashMap<>();
       
       for(OrdersVo vo : list) {
           int oIdx = vo.getOrders_idx();
           
           List<OrdersItemVo> items = ordersDao.getOrdersItemList(oIdx);
           itemMap.put(oIdx, items);
       }
       
       model.addAttribute("list", list);
       model.addAttribute("itemMap", itemMap); // JSP에서 사용할 상품 데이터 맵
       model.addAttribute("searchKeyword", searchKeyword);
       
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
    public String cancelOrder(@PathVariable("orders_idx") int orders_idx, HttpSession session, @RequestParam(value="scroll", required=false) String scroll) {
       // 취소할 때도 혹시 세션 끊길지 모르니까 더미 체크
        MemberVo user = (MemberVo) session.getAttribute("user");
        if(user == null) {
            user = new MemberVo();
            user.setMem_idx(1);
            session.setAttribute("user", user);
        }
       
       // DB에서 주문 상태를 취소로 변경하거나 삭제
        ordersDao.cancelOrders(orders_idx);
        
        // ✨ 리다이렉트 주소 조립!
        String redirectUrl = "redirect:/orders/list";
        if (scroll != null && !scroll.isEmpty()) {
            redirectUrl += "?scroll=" + scroll;
        }
        
        // 취소 후 다시 주문 목록으로 리다이렉트
        return redirectUrl;
    }
    
    // 결제 처리 
    @RequestMapping("/orders/pay/{orders_idx}")
    public String payOrder(@PathVariable("orders_idx") int orders_idx) {
        
        // orders_status_idx를 2(결제완료)로 업데이트하는 DAO 메서드 호출
        ordersDao.updateOrderStatus(orders_idx, 2); 
        
        // 결제 완료 후 다시 목록으로
        return "redirect:/orders/list";
    }
    
    @RequestMapping("/orders/get_coupon.do")
    @ResponseBody // 페이지 이동 없이 데이터만 보낼 때 사용해뎡!
    public String getCoupon(HttpSession session) {
       MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) return "login_required";

        // [핵심!] DB에서 이 사용자의 이전 주문 내역을 조회해뎡!
        // 주문 테이블에서 이 사용자가 '쿠폰 할인'을 받아서 결제한 건수가 있는지 체크!
        int usedCount = ordersDao.checkCouponUsed(user.getMem_idx());

        if (usedCount > 0) {
            return "already_used_permanently"; // 이미 주문할 때 써먹은 사람!
        }

        session.setAttribute("hasFirstCoupon", true);
        return "success";
    }
}
