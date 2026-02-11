package com.example.db.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("board")
public class BoardVo {
	//=========== 게시판 ============
	int				board_idx;			// pk

	int				mem_idx;			// fk: member(mem_idx)
	String			board_title;
	String			board_content;
	String			board_ip;
	String			board_tag;			// 글 주제 ('DOG', 'CAT', 'NONE')
	String			board_thumbnail;
	int				board_readhit;		// 조회수
	int				board_type_idx;		// fk: board_type(board_type_idx)
	LocalDateTime	board_regdate;
	LocalDateTime	board_moddate;
	String			board_is_deleted;	// 게시글 삭제여부 (y/n)
	LocalDateTime	board_deldate;		// 삭제일
	
	// =========== 조인 객체 ============
	MemberVo		writer;				// 조인된 참조테이블을 객체째로 담음
	BoardTypeVo		boardType;			// vo.getWriter().getMem_id()
	
	// =========== 날짜 표기 변환용 게터 ============
    public String getBoardRegdateFormatted() {
        if (board_regdate == null) return "";
        return board_regdate.toLocalDate().toString(); // 2026-02-06 이런 형태
        // 또는 원하는 패턴으로:
        // return board_regdate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
    }
}
