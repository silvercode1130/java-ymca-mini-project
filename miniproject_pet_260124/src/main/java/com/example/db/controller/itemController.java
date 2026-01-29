package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.db.dao.ItemDao;
import com.example.db.vo.item;

@Controller
public class itemController {
	@Autowired  // new 해서 객체를 생성했던 부분을 단축 시켜주는 어노테이션(주석, 설명문 느낌)
    private ItemDao itemDao;  // controller에 필요한 dao데이터를 넣어주는 객체 생성
	
	@RequestMapping("/item/item_list.do")
	public String itemList(String searchKeyword, String category, Model model) {
	    List<item> list;

	    if (category != null && !category.trim().isEmpty()) {
	        list = itemDao.getItemByCategory(category);
	    } 
	    else if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
	        list = itemDao.searchItem(searchKeyword);
	    } 
	    else {
	        list = itemDao.getItemList();
	    }

	    model.addAttribute("itemList", list);
	    return "item/item_list"; 
	}
	
    @RequestMapping("/item/item_detail.do")
    public String itemDetail(int item_idx, Model model) {
        item vo = itemDao.getItemDetail(item_idx);
        
        model.addAttribute("vo", vo);
        
        return "item/item_detail";
    }
}
