package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.PetVo;

@Mapper
public interface PetDao {

	
	public int insert(PetVo vo);

	public List<PetVo> selectByMemIdx(int mem_idx);
	
	public PetVo selectOneByPetIdx(int pet_idx);

	public int update(PetVo vo);

	public void delete(int pet_idx);
	


}

