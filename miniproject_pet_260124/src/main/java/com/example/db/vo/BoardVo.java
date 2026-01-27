package com.example.db.vo;

import lombok.Data;

@Data
public class BoardVo {
	
		   String board_id;   //pk
		   
		   String mem_id;   //fk
		   String title;
		   String board_content;
		   String type;
		   // 게시판 타입 (QnA / 공지사항 등)
		   public static int insert(BoardVo vo) {
			// TODO Auto-generated method stub
			return 0;
		   }
		}


