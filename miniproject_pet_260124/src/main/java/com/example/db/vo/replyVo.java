package com.example.db.vo;

public class replyVo {
	
	
	int reply_idx; // pk


	int board_idx; // fk(foreign key)
	int mem_idx; // fk
	String reply_content;
	String reply_regdate;
	String reply_moddate;
	public void setMem_idx(int mem_idx2) {
		// TODO Auto-generated method stub
		
	}
}
