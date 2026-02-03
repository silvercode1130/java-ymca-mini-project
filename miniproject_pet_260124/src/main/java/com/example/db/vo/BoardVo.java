package com.example.db.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVo {
	
		   int b_idx;   //pk
		   String b_subject;   //fk
		   String b_content;
		   String b_ip;
		   String b_readhit;
		   String b_regdate;
		   String b_modifydate;
		   int    mem_idx;
		   String mem_name;
		   int	  b_ref;
		   int	  b_step;
		   int    b_depth;
		   int	  b_type;
		   String b_use;
		   String b_moddate;
		   String filename;
		   MultipartFile Photo;
		   int 		board_type;
		   int board_type_idx; 
		   
	
		
		}


