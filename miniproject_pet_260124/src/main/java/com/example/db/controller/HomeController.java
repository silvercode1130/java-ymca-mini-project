package com.example.db.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/main")
    public String main() {
        return "main";   // /WEB-INF/views/main.jsp
    }
	
	// 공지사항
	// 공지사항 세부
	// 이벤트
	// 이벤트 세부
}