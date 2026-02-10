package com.example.db.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("cart_item")
public class CartItemVo {
//=========== 장바구니 아이템 ============
	int				cart_item_idx;	// pk

	int				cart_idx;		// fk: cart(cart_idx)
	int				item_idx;		// fk: item(item_idx)
	int				cart_item_quantity;
	// [핵심] 상품 정보 객체를 통째로 참조
    private ItemVo item; // 이렇게 하면 ItemVO에 있는 이름, 가격 다 쓸 수 있음
}
