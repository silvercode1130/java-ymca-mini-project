package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.db.vo.BoardVo;

@Mapper
public interface BoardDao {

	//List<boardVo> selectList();
		
		List<BoardVo> selectList(); //전체 게시글 조회
		List<BoardVo> selectbyMemIdx(int mem_idx); // 회원 idx로 글 목록 조회
		BoardVo		  selectOne(int board_idx); // 글번호로 한개 조회
		int 		  insert(BoardVo vo); // 글쓰기
		int 		  update(BoardVo vo); // 수정하기
		int 		  softDelete(int board_idx); // 글 삭제(soft delete)
		int			  updateReadhit(int board_idx); // 조회수 증가
		int			  Board_type_idx( int board_type_idx);
		int 		  selectTypeIdxByCode(String board_type_code);

		// 게시판 별 전체글조회(NOTICE, EVENT, LAB, QNA, FREE)
		
		List<BoardVo> selectListByTypeCode(String board_type_code);
		
		// 게시판 타입 + 태그(DOG/CAT/NONE) 별 목록 조회
		// <select id="메서드이름" resultType="BoardVo">
	    //SELECT * FROM board
	    //WHERE board_type_code = #{board_type_code}  AND board_tag = #{board_tag}
		List<BoardVo> selectListByTypeCodeAndTag(@Param("board_type_code") String board_type_code, 
				                                 @Param("board_tag") String board_tag);

		// 게시판 타입 + 글번호로 상세
		BoardVo selectOneByIdxAndTypeCode(@Param("board_idx")int board_idx, 
										  @Param("board_type_code") String board_type_code);
		int reply(BoardVo vo);
		int updateStep(BoardVo baseVo);
		
}



