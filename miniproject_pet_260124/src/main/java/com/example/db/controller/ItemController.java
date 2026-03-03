/*
   .replaceAll("\\s","") =>  탭, 줄바꿈, 스페이스 제거
*/
package com.example.db.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.db.dao.ItemDao;
import com.example.db.dao.OrdersDao;
import com.example.db.vo.ItemVo;
import com.example.db.vo.MemberVo;

import jakarta.servlet.http.HttpSession;

@Controller // 이 클래스는 웹 요청 처리의 용도라고 알려주는 어노테이션 
public class ItemController {
   // 객체 생성 어노테이션
   @Autowired  // new 해서 객체를 생성했던 부분을 단축 시켜주는 어노테이션(주석, 설명문 느낌)
    private ItemDao itemDao;  // controller에 필요한 dao데이터를 넣어주는 객체 생성
   
   @Autowired
   HttpSession session;
   
   @Autowired
   private OrdersDao ordersDao;
   
   @RequestMapping("/item/item_list.do")  // 사용자가 이 주소의 브라우저로 접근하면 
   public String itemList(HttpSession session, String searchKeyword, String category, Model model, @RequestParam(value="type_idx", required=false) Integer type_idx, @RequestParam(value="item_for", required=false) String item_for) {  // 실행되는 메서드
      // 위 메서드의 매개값은 스프링이 브라우저에서 자동으로 값을 받아줌 
       List<ItemVo> list = null; // 결과로 가져올 상품 목록을 담을 변수
       
       // [1번으로 이동!] 먼저 로그인 확인하고 orderCount부터 챙겨뎡!
       MemberVo user = (MemberVo) session.getAttribute("user");
       int orderCount = 0; 
       if (user != null) {
           orderCount = ordersDao.checkCouponUsed(user.getMem_idx());
       }
       // 어떤 리턴을 만나더라도 이 값은 들고 가게 미리 넣어둬뎡!
       model.addAttribute("orderCount", orderCount);
       
       // ===============================================================================
       
       // 1. [추천 로직] 오직 "처음" 들어왔을 때만 실행 (모든 파라미터가 null일 때)
       if (type_idx == null && searchKeyword == null && item_for == null) {
           MemberVo member = (MemberVo) session.getAttribute("user");
           if (member != null) {
               String species = itemDao.getPrimaryPetSpecies(member.getMem_idx());
               if (species != null) {
                   String s = species.trim().toUpperCase();
                   String auto_for = (s.contains("고양이") || s.equals("CAT")) ? "cat" : 
                                    ((s.contains("강아지") || s.contains("개") || s.equals("DOG")) ? "dog" : null);
                   if (auto_for != null) {
                       Map<String, Object> map = new HashMap<>();
                       map.put("item_for", auto_for);
                       list = itemDao.getItemListWithFilter(map);
                       model.addAttribute("curFor", auto_for);
                       
                       if (list != null) {
                           model.addAttribute("itemList", list);
                           return "item/item_list"; // 추천 상품 보여주고 바로 종료!
                       }
                   }
               }
           }
       }
       
       // 카테고리일 경우 (카테고리별 상품 조회)
       // .trim().isEmpty() => 공백 제거(trim) 후 문장의 길이가 0인지(isEmpty)
       if (type_idx != null) {
           // 카테고리 번호가 넘어오면 번호로 검색!
          list = itemDao.getItemByCategory(type_idx);
       }
       // 검색어일 경우 (검색어별 상품 조회)
       else if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {  // 만약 검색어가 있고 공백도 아닐 경우
           list = itemDao.searchItem(searchKeyword);  // (위 조건을 만족하면) 입력받은 값을 담아서 메서드를 실행 후 받은 값을 list에 담음
       } 
       // 모두 아닐 경우 (전체 조회)
       else {
           list = itemDao.getItemList();  // 입력받은 값이 없음(전체조회라서)  
       }
       
       // list에 있는 값을 jsp로 보냄 -> jsp는 itemList라는 값으로 받고 사용
       model.addAttribute("itemList", list);
       
       return "item/item_list";  // 해당 jsp 주소로 이동
   }
   
   @RequestMapping("/item/search.do") 
   public String searchItem(@RequestParam(value="item_for", required=false) String item_for,
                            @RequestParam(value="type_idx", required=false) Integer type_idx,
                            @RequestParam(value="searchKeyword", required=false) String searchKeyword,
                            Model model) {
      Map<String, Object> map = new HashMap<>();
       
       // 값이 있을 때만 map에 들어가서 필터가 작동
       if (item_for != null && !item_for.isEmpty()) {
           map.put("item_for", item_for);
       }
       
       map.put("type_idx", type_idx);
       
       if(searchKeyword != null && !searchKeyword.trim().isEmpty()) {
           map.put("searchKeyword", searchKeyword.trim());
       }

       List<ItemVo> list = itemDao.getItemListWithFilter(map);

       model.addAttribute("itemList", list);
       
       // JSP에 현재 상태 전달 
       model.addAttribute("curFor", item_for);
       model.addAttribute("curType", type_idx);
       
       return "item/item_list";
   }
   
    @RequestMapping("/item/item_detail.do")  // 사용자가 이 주소의 브라우저로 접근하면 
    public String itemDetail(int item_idx, Model model) {  // 실행되는 메서드
       // 위 메서드의 매개값은 스프링이 브라우저에서 자동으로 값을 받아줌 
        ItemVo vo = itemDao.getItemDetail(item_idx);  // 입력받은 값을 담아서 메서드 실행 후 받은 값을 vo에 담음
        
        // vo에 있는 값을 jsp로 보냄 -> jsp는 vo라는 값으로 받고 사용
        model.addAttribute("vo", vo);
        
        return "item/item_detail";  // 해당 jsp 주소로 이동
    }
    
    // 상품 등록 폼 이동
    @RequestMapping("/item/insert_form.do")
    public String insertForm(HttpSession session) {
        MemberVo user = (MemberVo) session.getAttribute("user");
        
        // 권한 체크 
        if (user == null || user.getMem_role_idx() != 3) {
        	System.out.println(user.getMem_role_idx());
            return "redirect:/shop"; 
        }
        
        return "item/item_insert_form";
    }

    // 상품 등록 실행
    @RequestMapping("/item/insert.do")
    public String insertItem(ItemVo vo) {
        itemDao.insertItem(vo);
        
        return "redirect:/shop"; // 등록 후 쇼핑몰 리스트로 이동
    }
}

