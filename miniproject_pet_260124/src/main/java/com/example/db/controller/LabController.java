package com.example.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.db.dao.BoardDao;
import com.example.db.vo.BoardVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/lab")
public class LabController {
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	// 연구소 내 태그별 조회 (tag 로 DOG/CAT/NONE 필터)
    @GetMapping("/list.do")
    public String labList(@RequestParam(defaultValue = "ALL") String tag,
                          Model model) {
		
    	// tag 값에 따라 조회 내용이 바뀜
        List<BoardVo> list = boardDao.selectListByTypeCodeAndTag("LAB", tag);
        model.addAttribute("list", list);
        model.addAttribute("tag", tag);
        
        return "lab/lab_list";
    }
}
