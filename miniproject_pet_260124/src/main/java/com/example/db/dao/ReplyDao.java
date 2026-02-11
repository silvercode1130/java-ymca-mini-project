package com.example.db.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.replyVo;

@Mapper
public interface ReplyDao {

	//List<boardVo> selectList();
	List <replyVo> selectList();
	replyVo selectOneFromIdx(int reply_idx); 
	replyVo			selectOneFromId(int mem_idx);//mem_id?
	 int       		insert (replyVo vo);
	 int			update(replyVo vo); 			
	 int			delete(int r_idx);
	 List <replyVo>	selectConditionList(Map<String, Object> map);
	List <replyVo>	content();

	 }
		
		


