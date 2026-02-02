package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.FileVo;
@Mapper
public interface FileDao {

	//List<boardVo> selectList();
	// 전체 파일 목록 조회
	List<FileVo> selectList();
	// 특정 파일 번호로 조회 (보통 하나만 반환하므로 FileVo)
	List<FileVo> selectOneFromIdx(int f_idx);
	// 특정 게시글에 속한 파일 개수 또는 ID 확인
	int		  selectOneFromboardid (int board_idx);
	// 파일 수정 (수정된 행의 수 반환)
	FileVo			update(FileVo vo);
	// 파일 추가 (추가된 행의 수 반환)
	FileVo				add(FileVo vo);
	// 파일 삭제 (삭제된 행의 수 반환)
	int				delete(int r_idx);

	
}
