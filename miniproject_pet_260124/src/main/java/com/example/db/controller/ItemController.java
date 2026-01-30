/*
	.replaceAll("\\s","") =>  탭, 줄바꿈, 스페이스 제거
*/
package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.db.dao.ItemDao;
import com.example.db.vo.ItemVo;

@Controller // 이 클래스는 웹 요청 처리의 용도라고 알려주는 어노테이션 
public class ItemController {
	// 객체 생성 어노테이션
	@Autowired  // new 해서 객체를 생성했던 부분을 단축 시켜주는 어노테이션(주석, 설명문 느낌)
    private ItemDao itemDao;  // controller에 필요한 dao데이터를 넣어주는 객체 생성
	
	@RequestMapping("/item/item_list.do")  // 사용자가 이 주소의 브라우저로 접근하면 
	public String itemList(String searchKeyword, String category, Model model) {  // 실행되는 메서드
		// 위 메서드의 매개값은 스프링이 브라우저에서 자동으로 값을 받아줌 
	    List<ItemVo> list; // 결과로 가져올 상품 목록을 담을 변수
	    
	    // 카테고리일 경우 (카테고리별 상품 조회)
	    // .trim().isEmpty() => 공백 제거(trim) 후 문장의 길이가 0인지(isEmpty)
	    if (category != null && !category.trim().isEmpty()) { // 만약 카테고리에 값이 있고 공백도 아닐 경우
	        list = itemDao.getItemByCategory(category);  // (위 조건을 만족하면) 입력받은 값을 담아서 메서드를 실행 후 받은 값을 list에 담음
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
	
    @RequestMapping("/item/item_detail.do")  // 사용자가 이 주소의 브라우저로 접근하면 
    public String itemDetail(int item_idx, Model model) {  // 실행되는 메서드
    	// 위 메서드의 매개값은 스프링이 브라우저에서 자동으로 값을 받아줌 
        ItemVo vo = itemDao.getItemDetail(item_idx);  // 입력받은 값을 담아서 메서드 실행 후 받은 값을 vo에 담음
        
     // vo에 있는 값을 jsp로 보냄 -> jsp는 vo라는 값으로 받고 사용
        model.addAttribute("vo", vo);
        
        return "item/item_detail";  // 해당 jsp 주소로 이동
    }
}
