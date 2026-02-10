package com.example.db.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
    public String root() {
        return "redirect:/main";
    }
	
	@GetMapping("/main")
    public String main() {
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