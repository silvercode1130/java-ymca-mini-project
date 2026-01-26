package com.example.db.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.db.dao.boarddao;
import com.example.db.vo.boardVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class boardcontroller {

	@Autowired
	boarddao boarddao;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext application;
	// 수정폼 띄우기
	// /visit/edit_form.do?idx=142
	
	@Autowired
	public boardcontroller(boarddao boardDao) {
		super();
		this.boarddao = boardDao;
		
	
	}
	
	// 입력폼띄우기
		@RequestMapping("/write_form.do")
		public String writeboard_form() {

			return "board/writeboard_form";
		}

		// /visit/insert.do?name=홍길동&content=잘 들어가나?\r\n정말?&pwd=1234
		// 등록
		@RequestMapping("/board/writeboard_form.do")
		public String insert(boardVo vo, Object mem_id) {
			// parameter 받아서 boardVo로 포장해줘/ request도 줘
			// content:\n -> <br> 변경
			String content = vo.getBoard_content().replaceAll("\n", "<br>");
			vo.setBoard_content(content);

			String ip = request.getRemoteAddr();
			vo.setBoard_id(ip);

			// DB insert
			int res = boarddao.insert(vo);

			return "redirect:list.do";
			// DispacherServlet에게 response.sendRedirect("list.do");하도록 정보제공
		}


	@RequestMapping("/edit_form.do")
	public String edit_form(int idx, Model model) {

		boardVo vo = boarddao.selectOne(idx);

		// <br> -> \n
		
		String content = vo.getBoard_content().replaceAll("<br>", "\n");
		vo.setBoard_content(content);
		// request binding(model통해서)
		model.addAttribute("vo", vo);

		return "visit/visit_modify_form";
	}

	// 수정
	// / /visit/update.do?idx=81&name=홍길동&content=동해물과&pwd=1234
	@RequestMapping("/board/update.do")
	public String update(boardVo vo) {
		// parameter받아서 boardVo포장해서 달라는 의미

		// \n -> <br>
		String content = vo.getBoard_content().replaceAll("\n", "<br>");
		vo.setBoard_content(content);

		// ip 받기
		String ip = request.getRemoteAddr();
		//vo.setip(ip);

		// DB update
		//int res = boarddao.update(vo);

		return "redirect:list.do";
	}

//		삭제

	// /visit/delete.do?idx=123
	@RequestMapping("visit/delete.do")
	public String delete(int idx) {

		int res = boarddao.delete(idx);

		return "redirect:list.do";
	}

//		   @RequestMapping("/visit/delete.do")
//		   public String delete(int idx) {
//		      
//		      int      res   = visitDao.delete(idx);
//		      
//		      return "redirect:list.do";
//		   }
	@RequestMapping("/visit/list.do")
	public String list(@RequestParam(name="search", defaultValue = "all") String search,
						String search_text, Model model) {
		
		//if(search==null) search="all";
		
		//검색조건을 담을 Map
		Map<String, Object> map = new HashMap()<String, Object>();
		
		if(search.equals("name")) {
			//이름을 검색
			map.put("name", search_text);
			
		}else if(search.equals("content")) {
			//내용으로 검색
			map.put("content", search_text);

		}else if(search.equals("name_content")) {
			//이름 + 내용으로 검색
			map.put("name", search_text);
			map.put("content", search_text);
		}
		
		List<VisitVo> list = visitDao.selectConditionList(map);
		
		model.addAttribute("list",list);
		
		return "visit/visit_list";
		
		
	}
}

}
