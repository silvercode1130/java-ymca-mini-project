package com.example.db.vo;


import java.time.LocalDateTime;
import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;

@Getter
@Alias("member")
public class MemberVo {

//=========== 회원정보 ============
	int	mem_idx;	// pk
	String mem_name;
	String mem_id;	// unique
	String mem_pwd;
	String mem_email;
	String mem_tel;
	String mem_zipcode;
	String mem_addr;
	String mem_ip;
	LocalDateTime mem_regdate;
	LocalDateTime	mem_deldate;	// 탈퇴일
	String mem_role;
	String			mem_is_deleted;	// 탈퇴여부 (y/n)
	int				mem_role_idx;	// fk: role(role_idx)
	int				mem_grade_idx;	// fk: grade(grade_idx)
	String			mem_bday;
	

}

