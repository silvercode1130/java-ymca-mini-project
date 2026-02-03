package com.example.db.controller;

import java.io.File;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import jakarta.servlet.ServletContext;

@Controller
public class BoardFileController {
    
    @Autowired
    ServletContext application;

    // 단일 파일 업로드 전용 매핑
    @PostMapping("/board/upload.do") // insert.do에서 이쪽으로 파일을 보내거나, 로직을 합칠 때 참조하세요.
    public String upload(String title,
                        @RequestParam MultipartFile photo,
                        Model model) throws Exception {
        
        // 1. 서버 내 실제 저장 경로 확인
        String webPath = "/resources/upload/"; // 보통 board용은 따로 관리합니다.
        String absPath = application.getRealPath(webPath);
        
        String filename = "no_file";
        
        // 2. 파일이 비어있지 않은 경우에만 처리
        if(photo != null && !photo.isEmpty()) {
            
            filename = photo.getOriginalFilename();
            File f = new File(absPath, filename);
            
            // 3. 중복 파일명 방지 (시간_파일명)
            if(f.exists()) {
                long tm = System.currentTimeMillis();
                filename = String.format("%d_%s", tm, filename);
                f = new File(absPath, filename);
            }
            
            // 4. 물리적 저장
            photo.transferTo(f);
            
        }
        
        // 5. 결과 전달
        model.addAttribute("title", title);
        model.addAttribute("filename", filename);
        
        return "board/result_view"; // 결과 확인 페이지
    }
}