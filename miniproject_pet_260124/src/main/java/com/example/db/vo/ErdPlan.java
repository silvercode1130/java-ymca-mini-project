package com.example.db.vo;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class ErdPlan {
// 각 클래스 변수들을 한 눈에 보려고 정리한 파일입니다.
// vo 만들때 참조하세요.
}

//=========== 회원정보 ============
class member {
	int				mem_idx;		// pk

	String			mem_id;			// unique
	String			mem_pwd;
	String			mem_name;
	String			mem_tel;
	String			mem_email;
	int				mem_role_idx;	// fk: role(role_idx)
	int				mem_grade_idx;	// fk: grade(grade_idx)
	String			mem_bday;
	LocalDateTime	mem_regdate;
}

class member_profile {
	int				mem_idx;		// pk

	String			mem_nickname;
	String			mem_intro;
	String			mem_img;
}

class member_addr {
	int				addr_idx;		// pk

	int				mem_idx;		// fk: member(mem_idx)
	String			mem_zipcode;
	String			mem_addr;
	String			mem_addr_detail;
}

class role {
	int				role_idx;		// pk

	String			role_name;		// user / doctor / admin
}

class grade {
	int				grade_idx;				// pk

	String			grade_name;				// basic / silver / gold / vip
	BigDecimal 		grade_discount_rate;	// 등급별 할인율 (0.05 / 0.1 / 0.2)

}

//=========== 반려동물정보 ============
class pet {
	int				pet_idx;		// pk

	int				mem_idx;		// fk: member(mem_idx)
	String			pet_name;
	String			is_primary;		// 대표동물여부 (y/n)
	String			pet_species;
	String			pet_gender;
	String			pet_breed;
	int				pet_age;
	String			pet_bday;
}

// =========== 상품정보 ============
class item {
	int				item_idx;		// pk

	String			item_name;
	int				item_price;
	String			item_thumbnail_img;
	String			item_detail_img;
	int				item_stock;		// 재고
	String			item_category;	// 상품분류 (강아지/고양이, 사료, 산책용품 등)
	LocalDateTime	item_regdate;
	LocalDateTime	item_moddate;

}

//=========== 장바구니 ============
class cart {
	int				cart_idx;		// pk

	int				mem_idx;		// fk: member(mem_idx)
	LocalDateTime	cart_regdate;
}

class cart_item {
	int				cart_item_idx;	// pk

	int				cart_idx;		// fk: cart(cart_idx)
	int				item_idx;		// fk: item(item_idx)
	int				cart_item_quantity;

}

//=========== 주문정보 ============
class orders {
	int				order_idx;				// pk

	int				mem_idx;				// fk: member(mem_idx)
	int				order_total_price;
	BigDecimal 		order_grade_discount;	// 등급할인액
	BigDecimal 		order_coupon_discount;	// 쿠폰할인액
	int				order_status_idx;		// fk: order_status(order_status_idx)
	LocalDateTime	order_regdate;
}

class orders_item {
	int				order_item_idx;			// pk

	int				order_idx;				// fk: order(order_idx)
	int				item_idx;				// fk: item(item_idx)
	int				order_item_quantity;
	int				order_price_at; 		// 주문시점 단가
}

class orders_status {
	int				order_status_idx;		// pk
	String			order_status_name;		// 주문상태 (결제됨 / 취소됨 / 배송중 등)
}

//=========== 커뮤니티 ============
class board {
	int				board_idx;		// pk

	int				mem_idx;		// fk: member(mem_idx)
	String			board_title;
	String			board_content;
	String			board_ip;
	String			board_type;		// 게시판 타입 (QnA / 공지사항 등)
	LocalDateTime	board_regdate;
	LocalDateTime	board_moddate;
}

class board_file {
	int				file_idx;			// pk

	int				board_idx;			// fk: board(board_idx)
	String			file_original_name;	// 유저가 본래 저장한 파일 이름
	String			file_saved_name;	// 서버에서 중복을 피하기 위해 임의로 붙이는 이름
	String			file_path;
	int				file_size;			// 파일 용량 확인. db 관리에 필요
	String			file_type;			// jpeg, png 등의 확장자
	LocalDateTime	file_regdate;

}

class reply {
	int				reply_idx;		// pk

	int				board_idx;		// fk: board(board_idx)
	int				mem_idx;		// fk: member(mem_idx)
	String			reply_content;
	String			reply_ip;
	LocalDateTime	reply_regdate;
	LocalDateTime	reply_moddate;
}