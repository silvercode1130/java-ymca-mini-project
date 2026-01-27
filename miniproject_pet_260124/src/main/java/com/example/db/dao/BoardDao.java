package com.example.db.dao;

import java.util.List;
import java.util.Map;

import com.example.db.vo.BoardVo;


public interface BoardDao {

	//List<boardVo> selectList();
	
		List<BoardVo> selectConditionList(Map<String, Object> map);
		BoardVo		  selectOne(int idx);
		int 		  insert(BoardVo vo);
		int 		  update(BoardVo vo);
		int			  delete(int idx);
}

