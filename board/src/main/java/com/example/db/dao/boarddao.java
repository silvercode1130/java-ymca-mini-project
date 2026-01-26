package com.example.db.dao;

import java.util.List;
import java.util.Map;

import com.example.db.vo.boardVo;

@Map
public interface boarddao {

	//List<boardVo> selectList();
	
		List<boardVo> selectConditionList(Map<String, Object> map);
		boardVo		  selectOne(int idx);
		int 		  insert(boardVo vo);
		int 		  update(boardVo vo);
		int			  delete(int idx);
}
