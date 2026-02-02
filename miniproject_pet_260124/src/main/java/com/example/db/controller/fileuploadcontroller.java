package com.example.db.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Controller
public class fileuploadcontroller {
	
	@Autowired
	ServletContext application;
	//upload1.do?title=제목&photo=a.jpg
	
	@RequestMapping("/upload1.do")
	public String upload(String title,
						@RequestParam MultipartFile photo,
						Model model) throws Exception, IOException {
		
		// Web경로 -> 절대경로 구하기 
		String webPath = "/images/";
		String absPath = application.getRealPath(webPath);
		System.out.println(absPath);
		
		String filename = "no_file";
		
		// 업로드된 이미지가 있으면
		if(!photo.isEmpty()) {
			
			//업로드된 화일명 얻어오기
			filename = photo.getOriginalFilename();
			
			File f = new File(absPath, filename);
			//업로드 위치에 동일한 화일명이 존재하나?
			if(f.exists()) {
				
				long tm = System.currentTimeMillis(); //현재시간을 milisecond로 구한다
				//			filename = 시간_filename
				filename = String.format("%d_%s", tm,filename);
				
				f = new File(absPath, filename);
			}
			//임시공간의 화일을 복사한다
			photo.transferTo(f);
			
		}//end: if(!photo.isEmpty())
		
		//model이용해서 request binding
		model.addAttribute("title", title);
		model.addAttribute("filename", filename);
		
		
		return "result1";
	}
	
	//upload2.do?title=제목&photo=a.jpg&photo=b.jpg
	
		@RequestMapping("/upload2.do")
		public String upload2(String title,
							@RequestParam(name="photo") MultipartFile [] photo_array,
							Model model
							) throws Exception, IOException {
			
			// Web경로 -> 절대경로 구하기 
			String webPath = "/images/";
			String absPath = application.getRealPath(webPath);
			
			String filename1 = "no_file";
			String filename2 = "no_file";
			
			for(int i=0; i<photo_array.length; i++) {	// i = 0 1
				
				MultipartFile photo = photo_array[i];
				
				
				// 업로드된 이미지가 있으면
				if(!photo.isEmpty()) {
					
					//업로드된 화일명 얻어오기
					String filename = photo.getOriginalFilename();
					
					File f = new File(absPath, filename);
					//업로드 위치에 동일한 화일명이 존재하나?
					if(f.exists()) {
						
						long tm = System.currentTimeMillis(); //현재시간을 milisecond로 구한다
						//			filename = 시간_filename
						filename = String.format("%d_%s", tm,filename);
						
						f = new File(absPath, filename);
					}
					//임시공간의 화일을 복사한다
					photo.transferTo(f);
					
					if(i==0) filename1 = filename;
					if(i==1) filename2 = filename;
					
					}//end: if(!photo.isEmpty())
				
			}//end:for
			
			//결과적으로 request binding
			
			model.addAttribute("title",title);
			model.addAttribute("filename1",filename1);
			model.addAttribute("filename2",filename2);
			
			return "result2";
		}
		
		//upload3.do?title=제목&photo=a.jpg&photo=b.jpg&photo=c.jpg&photo=d.jpg
		
		@RequestMapping("/upload3.do")
		public String upload3(String title,
							@RequestParam(name="photo") List<MultipartFile> photo_list,
							Model model
				) throws IllegalStateException, IOException {
			// Web경로 -> 절대경로 구하기 
			String webPath = "/images/";
			String absPath = application.getRealPath(webPath);
			
			// 업로드된 화일명을 저장할 List
			List<String> filename_list = new ArrayList<String>();
			
			for(MultipartFile photo : photo_list) {
				

				// 업로드된 이미지가 있으면
				if(!photo.isEmpty()) {
					
					//업로드된 화일명 얻어오기
					String filename = photo.getOriginalFilename();
					
					File f = new File(absPath, filename);
					//업로드 위치에 동일한 화일명이 존재하나?
					if(f.exists()) {
						
						long tm = System.currentTimeMillis(); //현재시간을 milisecond로 구한다
						//			filename = 시간_filename
						filename = String.format("%d_%s", tm,filename);
						
						f = new File(absPath, filename);
					}
					//임시공간의 화일을 복사한다
					photo.transferTo(f);
					
					//업로드된 화일명을 list에 저장
					filename_list.add(filename);
					
					}//end: if(!photo.isEmpty())
				
			}//end: for
			
			//request binding
			
			model.addAttribute("title",title);
			model.addAttribute("filename_list",filename_list);
			
			return "result3";
		}

}
