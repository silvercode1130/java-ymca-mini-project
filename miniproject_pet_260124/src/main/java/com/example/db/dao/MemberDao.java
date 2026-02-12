package com.example.db.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.db.vo.MemberVo;
import com.example.db.vo.MemberProfileVo;
import com.example.db.vo.MemberAddrVo;
import com.example.db.vo.RoleVo;
import com.example.db.vo.GradeVo;

@Mapper
public interface MemberDao {

    // 회원가입
    int 			insertMember(MemberVo vo);

    // 로그인
    MemberVo 		login(Map<String, String> param);

    
    // 회원 정보 수정 관련 ---------------------------------------------------------------------------------
    
    
    // 회원 전체조회
    List<MemberVo> 	selectList();

    // 회원번호로 조회 (빠른 단건)
    MemberVo 		electOneFromIdx(int mem_idx);

    // 아이디로 전체조회 (myUpdate용)
    MemberVo 		selectOneFromId(String mem_id);
    
    // 회원정보 수정
    int 	update(MemberVo vo);

    // 회원탈퇴 (soft delete)
    int 	delete(int mem_idx);

    
    // 회원 정보 수정 관련 ---------------------------------------------------------------------------------
    
    
    // 닉네임 중복체크
    int 	checkNickname(String mem_nickname);

    // 기본 권한 조회
    RoleVo 	selectDefaultRole();

    // 기본 등급 조회
    GradeVo selectDefaultGrade();

    // 프로필 단독조회
    MemberProfileVo selectProfileByMemIdx(int mem_idx);

    // 프로필 수정
    int updateProfile(MemberProfileVo vo);
    int insertProfile(MemberProfileVo vo);
    
    
    // 주소 관련 ---------------------------------------------------------------------------------

    
    // 주소 간단 수정
    int updateAddrSimple(MemberAddrVo vo);

    // 주소 전체 수정
    int updateAddr(MemberAddrVo vo);

    // 주소 없으면 insert / 주소 있으면 update
	MemberAddrVo selectAddrByMemIdx(int mem_idx);
	void insertAddr(MemberAddrVo vo);


}
