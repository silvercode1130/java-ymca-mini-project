package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.replyVo;
@Mapper
public interface ReplyDao {

	//List<boardVo> selectList();
	List <replyVo> selectList();
	List <replyVo> selectOneFromIdx(int reply_idx); 
	replyVo			selectOneFromId(int mem_idx);
	 replyVo       add (replyVo vo);
	 replyVo		update(replyVo vo); 			
	 replyVo		delete(replyVo vo);
}
