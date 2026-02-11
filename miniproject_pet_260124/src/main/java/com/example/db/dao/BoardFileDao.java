package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.BoardFileVo;

@Mapper
public interface BoardFileDao {
	// 조회용
    List<BoardFileVo> selectListByBoardIdx(int board_idx);
    BoardFileVo selectThumbnailByBoardIdx(int board_idx);
    
    // 파일등록용
    int selectNextFileIdx();          // 시퀀스 NEXTVAL 가져오기
    int insert(BoardFileVo vo);        // 파일 메타데이터 insert
    
    // 파일 수정용
    int update(BoardFileVo vo);
}

