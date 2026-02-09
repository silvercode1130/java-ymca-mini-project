package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.BoardFileVo;

@Mapper
public interface BoardFileDao {
	List<BoardFileVo> selectListByBoardIdx(int board_idx);

	BoardFileVo selectThumbnailByBoardIdx(int board_idx); // is_thumbnail = 'Y'

}
