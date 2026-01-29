package com.example.db.vo;

//=========== 장바구니 ============
public class cart_item {
	String cart_item_id;  //pk
	 
	String cart_id;  //fk
	String item_id;  //fk
	String cart_item_quantity;
}
