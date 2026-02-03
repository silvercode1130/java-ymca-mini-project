package com.example.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.db.vo.OrdersItemVo;
import com.example.db.vo.OrdersVo;

@Mapper
public interface OrdersDao {
    // 1. 주문 목록 조회
	// 기존: List<OrdersVo> getOrdersList(int mem_idx);
	List<OrdersVo> getOrdersList(@Param("mem_idx") int mem_idx, @Param("searchKeyword") String searchKeyword);
    
    // 2. 주문 상세 정보 (단건)
    OrdersVo getOrdersDetail(int orders_idx);
    
    // 3. 주문 상세 품목 리스트 (VO 안 건드리고 따로 호출용)
    List<OrdersItemVo> getOrdersItemList(int orders_idx);
    
    // 4. 주문 생성
    void createOrders(OrdersVo vo);
    void createOrdersItem(OrdersItemVo itemVo);
    
    // 5. 주문 취소
    void cancelOrders(int orders_idx);
}