package com.example.db.vo;

public class replyVo {
    private int reply_idx;
    private int board_idx;   // b_idx 대신 이것만 쓰는 것을 추천
    private int mem_idx;
    private String reply_content;
    private String reply_regdate;
    private String reply_moddate;
    private String reply_ip;

    // Getter & Setter (이게 있어야 Controller에서 오류가 안 납니다)
    public int getBoard_idx() { return board_idx; }
    public void setBoard_idx(int board_idx) { this.board_idx = board_idx; }

    public int getMem_idx() { return mem_idx; }
    public void setMem_idx(int mem_idx) { this.mem_idx = mem_idx; }

    public String getReply_content() { return reply_content; }
    public void setReply_content(String reply_content) { this.reply_content = reply_content; }
	

    // ... 나머지 변수들에 대해서도 모두 생성 필요
}