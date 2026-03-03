package com.example.db.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("reply")
public class ReplyVo {
//=========== 댓글 ============
	int				reply_idx;			// pk

	int				board_idx;			// fk: board(board_idx)
	int				mem_idx;			// fk: member(mem_idx)
	String			reply_content;
	String			reply_ip;
	LocalDateTime	reply_regdate;
	LocalDateTime	reply_moddate;
	String			reply_is_deleted;	// 댓글 삭제여부 (y/n)
	LocalDateTime	reply_deldate;		// 댓글 삭제일
	int				reply_ref;			// 원댓
	int				reply_step;			// 댓글 순서
	int				reply_depth;		// 댓글 깊이
	
	// 댓글 작성자 정보 (association)
    MemberVo        writer;
    
 // =========== 날짜 표기 변환용 게터 ============
    public String getReplyRegdateFormatted() {
        if (reply_regdate == null) return "";
        return reply_regdate.format(
                java.time.format.DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss")
        );
    }

}
