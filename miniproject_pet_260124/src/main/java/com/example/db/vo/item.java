package com.example.db.vo;

import java.time.LocalDateTime;

public class item {
	int				item_idx;		// pk

	String			item_name;
	int				item_price;
	String			item_thumbnail_img;
	String			item_detail_img;
	int				item_stock;		// 재고
	String			item_category;	// 상품분류 (강아지/고양이, 사료, 산책용품 등)
	LocalDateTime	item_regdate;
	LocalDateTime	item_moddate;
	
	
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public String getItem_thumbnail_img() {
		return item_thumbnail_img;
	}
	public void setItem_thumbnail_img(String item_thumbnail_img) {
		this.item_thumbnail_img = item_thumbnail_img;
	}
	public String getItem_detail_img() {
		return item_detail_img;
	}
	public void setItem_detail_img(String item_detail_img) {
		this.item_detail_img = item_detail_img;
	}
	public int getItem_stock() {
		return item_stock;
	}
	public void setItem_stock(int item_stock) {
		this.item_stock = item_stock;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public LocalDateTime getItem_regdate() {
		return item_regdate;
	}
	public void setItem_regdate(LocalDateTime item_regdate) {
		this.item_regdate = item_regdate;
	}
	public LocalDateTime getItem_moddate() {
		return item_moddate;
	}
	public void setItem_moddate(LocalDateTime item_moddate) {
		this.item_moddate = item_moddate;
	}
	
}
