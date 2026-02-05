package com.example.db.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.MemberProfileVo;
import com.example.db.vo.MemberVo;

@Mapper
public interface MemberDao {

	MemberVo selectOneFromId(String mem_id);
     int  insertMember(MemberVo vo);
     MemberVo  login(MemberVo vo);
	 void update(MemberVo vo);
	 public void updateProfile(MemberVo vo);
	 
	 
	 // 추가 - 지피티 (문제시 삭제)
	// MemberDao.java (인터페이스)
	 public MemberVo selectOneFromNickname(String mem_nickname);
	 void updateAddr(MemberVo vo);
	 MemberProfileVo selectProfile(String mem_id); 

	 
	 
	 
	 

}

