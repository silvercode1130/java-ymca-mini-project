package com.example.db.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("item")
public class ItemVo {
//=========== 상품정보 ============
	int				item_idx;			// pk

	String			item_name;
	int				item_origin_price;	// 정가
	int				item_now_price;		// 현재가격
	int				item_stock;			// 재고
	int				item_type_idx;		// fk: item_type(item_type_idx)
	String			item_for;			// 사용동물 (DOG/CAT/GENERAL)
	String			item_is_sale;		// 세일중 여부 (y/n)
	String			item_brand;			// 제품 브랜드 (로얄캐닌, 하림 등)
	String			item_thumbnail_img;
	String			item_detail_img;
	LocalDateTime	item_regdate;
	LocalDateTime	item_moddate;
	
	private ItemTypeVo type;
}
