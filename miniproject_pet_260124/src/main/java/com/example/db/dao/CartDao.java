package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.db.vo.CartItemVo;

@Mapper
public interface CartDao {
	List<CartItemVo> getCartList(@Param("mem_idx") int mem_idx);  // 장바구니에 있는 상품 리스트 조회 메서드

	void addToCart(@Param("mem_idx") int mem_idx, @Param("item_idx") int item_idx);  // 장바구니에 상품 추가 메서드

	void removeFromCart(int cart_item_idx);  // 장바구니에 상품 제거 메서드
	
	void updateItemQty(@Param("idx") int cart_item_idx, @Param("qty") int qty);  // 장바구니에 있는 상품 수량 변경 메서드
	
	void clearCart(int mem_idx);  // 주문 완료 후 주문한 상품을 장바구니에서 비워주는 메서드 
	
	Integer getCartIdxByMemIdx(int mem_idx);
	
	void createCart(int mem_idx);
}
