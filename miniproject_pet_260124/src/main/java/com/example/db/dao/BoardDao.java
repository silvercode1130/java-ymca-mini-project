package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.BoardVo;

@Mapper
public interface BoardDao {
	List<BoardVo>		selectList();
	BoardVo				selectOneFromIdx(int b_idx);
	BoardVo				selectOneFromMemId(int mem_id);
	int					insert(BoardVo vo);
	int					update(BoardVo vo);
	int					delete(int b_idx);
}
