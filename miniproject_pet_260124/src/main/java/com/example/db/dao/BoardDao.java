package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.BoardVo;

@Mapper
public interface BoardDao {
	List<BoardVo>		selectList();							// 전체 게시글 조회
	List<BoardVo>		selectListFromType(int board_type_idx);	// 전체 게시글 조회
	BoardVo				selectOneFromIdx(int board_idx);		// 글번호로 글 한 개 조회
	List<BoardVo>		selectOneFromMemId(int mem_id);			// 아이디로 글 목록 조회
	int					insert(BoardVo vo);						// 글쓰기
	int					update(BoardVo vo);						// 수정하기
	int					delete(int board_idx);					// 글 삭제(hard delete)
	int					updateReadhit(int board_idx);			// 조회수 증가
}
