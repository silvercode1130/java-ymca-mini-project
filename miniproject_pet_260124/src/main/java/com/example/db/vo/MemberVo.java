package com.example.db.vo;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("member")	// 별칭(as) 만듦 	  👉 패키지명.클래스명 == as
public class MemberVo {
	// 회원정보 (가입 시)
	int mem_idx;					// 인덱스(pk)
	String mem_id; 				// 아이디(unique)
	String mem_pwd;			// 비밀번호
	String mem_name;			// 회원 이름
	String mem_tel;				// 회원 연락처
	String mem_email;			// 회원 이메일
	Integer mem_grade_idx; 		// 회원 등급(fk)		bronze?? / silver / gold / vip
	Integer mem_role_idx; 			// 회원 종류(fk)		role / doctor / admin
	String mem_bday;			// 회원 생일
	String mem_regdate;		// 회원 가입일자
	
	
	// 마이페이지
	String mem_nickname;	// 회원 닉네임
	String mem_intro;			// 회원 자기소개 한줄
	String mem_img;				// 회원 프로필 이미지
	
	
	// 회원 주소 (구매 시)
	int addr_idx; 							// 주소 인덱스 (pk)
	String mem_addr;					// 회원 주소 
	String mem_addr_detail;		// 상세 주소
	int mem_zipcode;					// 우편 주소
	
	
	// 회원 종류
	// int mem_role_idx; 		// 회원 종류 인덱스 (pk)
	String mem_role_name;		// user / doctor / admin
	
	
	// 회원 등급
	int  grade_idx;					// 회원 등급 인덱스 (pk)
	String mem_grade_name;		// basic / silver / gold / vip
	String discount_rate;		// 등급별 할인율 ( 0.05 / 0.1 / 0.2 )

}

