package com.example.db.vo;

public class order_item {
	int order_item_id;  // pk
	 
	String order_id;  // fk
	String item_id;  // fk
	String order_item_quantity;
	String price_at_order;  // 주문시점 단가
}
