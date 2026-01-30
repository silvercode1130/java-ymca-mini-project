package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.MemberVo;

@Mapper
public interface MemberDao {
	
	List<MemberVo>	selectList();
	MemberVo		selectOne(int mem_idx);
	int				insert(MemberVo vo);
	int				update(MemberVo vo);
	int				delete(int mem_idx);
}
