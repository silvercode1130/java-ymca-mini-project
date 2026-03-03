package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.PetVo;

@Mapper
public interface PetDao {

	int 		insert(PetVo vo);

	List<PetVo> selectByMemIdx(int mem_idx);
	PetVo 		selectOneByPetIdx(int pet_idx);

	int 		update(PetVo vo);

	int 		delete(int pet_idx);

	// void updatePrimaryPet(int pet_idx);

	void resetPrimaryByPetIdx(int pet_idx);

	void setPrimaryByPetIdx(int pet_idx);

	void resetPrimaryByMemIdx(int mem_idx);
	
	public int updatePrimaryPet(int pet_idx);
	


}
