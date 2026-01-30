package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.db.vo.CartItemVo;

@Mapper
public interface CartDao {
	List<CartItemVo> getCartList(int cart_idx);
}
