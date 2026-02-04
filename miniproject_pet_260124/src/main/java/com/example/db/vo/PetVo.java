package com.example.db.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("pet")	// 별칭(as) 만듦 	  👉 패키지명.클래스명 == as
public class PetVo {
	// 반려동물 정보
	int pet_idx;					// 반려동물 인덱스 (pk)
	int mem_idx;				// 회원 인덱스 (fk)
	String pet_name;		// 동물 이름	
	String pet_species;		// 동물 종류 ex) 강아지 / 고양이
	String pet_gender;		// 동물 성별
	String pet_breed;		// 동물 품종 ex) 포메 / 시츄
	int pet_age;				// 동물 나이
	String pet_bday;			// 동물 생일
	String is_primary;		// 다견가정의 대표 반려동물 설정
		
}
