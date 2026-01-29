package com.example.db.vo;

//=========== 주문정보 ============
public class order {
	int order_id;  // pk
	 
	String mem_id;  // fk
	String total_price;
	String grade_discount;
	String coupon_discount;
	String order_regdate;
	String status;  // 주문상태 (결제됨 / 취소됨 / 배송중 등)
}
