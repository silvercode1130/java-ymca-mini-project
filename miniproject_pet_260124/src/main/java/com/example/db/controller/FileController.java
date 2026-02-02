package com.example.db.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FileController {

	@GetMapping("/download")
	public void fileDownload(@RequestParam("filename") String filename, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		// 1. 파일이 저장된 물리적 경로 가져오기 
		String webPath = "/resources/upload/"; // 웹상 경로
		String absPath = request.getServletContext().getRealPath(webPath);
		
		// 2. 실제 파일 객체 생성
		File file = new File(absPath, filename);
		
		// 3. 파일이 존재하는지 확인
		if(!file.exists()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		// 4.브라우저에게 "이건 다운로드용 파일이야"라고 알려주는 설정 (헤더)

		
			
		}
	}
}
