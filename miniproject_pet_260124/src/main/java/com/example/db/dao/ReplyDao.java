package com.example.db.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.ReplyVo;

@Mapper
public interface ReplyDao {
	
	List<ReplyVo> selectListByBoardIdx(int board_idx);
	ReplyVo selectOne(int reply_idx);
	
	// 멤버 아이디로 댓글 목록 조회
	List<ReplyVo> selectOneFromId(String mem_id);
	
	int insert(ReplyVo vo);				// 댓글 등록
	int update(ReplyVo vo);				// 댓글 수정
	int softDelete(int reply_idx);		// 댓글 삭제
	
	// 대댓글 기능 (필수 아님!)
	int rereply(ReplyVo vo);
	int updateStep(ReplyVo baseVo);
	
	// paging 위한 부분조회
	List<ReplyVo> selectConditionList(Map<String, Object> map);

}