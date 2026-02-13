package com.example.db.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.db.vo.BoardVo;

@Mapper
public interface BoardDao {
	// 기본 CRUD
    List<BoardVo> selectList();								// 전체 게시글 조회 (is_deleted = 'N')
    List<BoardVo> selectListByMemIdx(int mem_idx);			// 회원 idx로 글 목록 조회
    BoardVo       selectOne(int board_idx);					// 글번호로 한 개 조회

    int insert(BoardVo vo);									// 글쓰기
    int update(BoardVo vo);									// 수정하기
    int softDelete(int board_idx);							// 글 삭제(soft delete)

    int updateReadhit(int board_idx);						// 조회수 증가
    int selectTypeIdxByCode(String board_type_code);		// 게시판 타입코드로 게시판 타입번호 얻기

    // 게시판 별 전체글조회 (NOTICE, EVENT, LAB, QNA, FREE)
    List<BoardVo> 	selectListByTypeCode(String board_type_code);

    // 게시판 타입 + 태그(DOG/CAT/NONE) 별 목록 조회
    List<BoardVo> 	selectListByTypeCodeAndTag(
            @Param("board_type_code") String board_type_code,
            @Param("board_tag")       String board_tag
    );

    // 게시판 타입 + 글번호로 상세
    BoardVo 		selectOneByIdxAndTypeCode(
            @Param("board_idx")       int board_idx,
            @Param("board_type_code") String board_type_code
    );
    
    // 게시판 검색 (타입 + 태그 + 검색)
    List<BoardVo> selectSearchListByTypeCodeTag(Map<String, Object> param);
    
    // 페이징용
    int selectRowTotalByTypeTagSearch(Map<String, Object> param);

    List<BoardVo> selectPageListByTypeTagSearch(Map<String, Object> param);
    
    // 게시판 타입코드로 최소 롤 조회
    int selectMinRoleByTypeCode(String board_type_code);
}

