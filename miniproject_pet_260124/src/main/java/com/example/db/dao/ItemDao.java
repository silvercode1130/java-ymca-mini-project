package com.example.db.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.db.vo.ItemVo;

@Mapper
public interface ItemDao {
	// 상품 목록 조회 메서드
	List<ItemVo> getItemList();  // 담긴 파라미터 없음 = 전체 값을 조회함(여러 값이라서 list로)
    
    // 상세 정보 조회용 메서드
    ItemVo getItemDetail(int item_idx);
    
    // 상품 검색 메서드
    List<ItemVo> searchItem(String searchKeyword);  // 검색한 키워드에 맞는 상품을 여러개(list) 조회
    
    // 카테고리별 조회 메서드
    List<ItemVo> getItemByCategory(@Param("type_idx") int type_idx);  // 클릭한 카테고리에 맞는 상품 여러개(list) 조회
}
