package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.CartItemVo;

@Mapper
public interface CartDao {
	List<CartItemVo> getCartList(int cart_idx);  // 장바구니에 있는 상품 리스트 조회 메서드
	int getCartIdxByMemIdx(int mem_idx);  // 회원번호로 장바구니번호 가져오는 메서드
}
