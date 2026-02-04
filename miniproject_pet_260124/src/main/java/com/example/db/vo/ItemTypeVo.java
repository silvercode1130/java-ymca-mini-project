package com.example.db.vo;

import lombok.Data;

@Data
public class ItemTypeVo {
	int				item_type_idx;		// pk
	
	String			item_type_category;	// 상품 카테고리 (사료, 간식, 장난감, 가구 등)
}