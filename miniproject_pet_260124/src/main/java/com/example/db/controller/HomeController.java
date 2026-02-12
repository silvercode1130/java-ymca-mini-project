package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.db.dao.ItemDao;
import com.example.db.vo.ItemVo;

@Controller
public class HomeController {
	
	@Autowired
    private ItemDao itemDao; // 1. ItemDao 주입! (위에 import 잊지 마뎡!)
	
	@GetMapping("/")
    public String root() {
        return "redirect:/main";
    }
	
	@GetMapping("/main")
    public String main(Model model) {

        // 1. 재고 20개 이하인 상품 4개 가져오기 (재고떨이 상품)
        List<ItemVo> lowStockList = itemDao.getLowStockItems();
        
        // 2. 만약 리스트가 비어있지 않다면 모델에 담아서 JSP로 보내기
        if (lowStockList != null && !lowStockList.isEmpty()) {
            model.addAttribute("lowStockList", lowStockList);
        } else {
            // 데이터가 없을 때를 대비한 로그 (디버깅용)
            System.out.println("=== [알림] 재고 20개 이하인 상품이 없습니다! ===");
        }
        
        model.addAttribute("lowStockList", lowStockList);
        
        return "main";   // /WEB-INF/views/main.jsp
    }
	
	@GetMapping("/lab")
	public String lab() {
		return "redirect:/lab/list.do";
	}
	
	@GetMapping("/shop")
	public String shop() {
		return "redirect:/item/item_list.do"; 
	}
	
	@GetMapping("/community")
	public String board() {
		return "community/community_list";
	}
	
	@GetMapping("/service")
	public String service() {
		return "service/service_list";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "redirect:/profile/myProfile.do";
	}
	
}