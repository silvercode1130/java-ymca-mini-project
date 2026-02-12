package com.example.db.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.db.vo.ItemVo;

@Mapper
public interface ItemDao {
	// 상품 목록 조회 메서드
	List<ItemVo> getItemList();  // 담긴 파라미터 없음 = 전체 값을 조회함(여러 값이라서 list로)
	
	// 이번에 만든 필터/검색용 방식 (Map 받는 것)
	List<ItemVo> getItemListWithFilter(Map<String, Object> map);
		
    // 상세 정보 조회용 메서드
    ItemVo getItemDetail(int item_idx);
    
    // 상품 검색 메서드
    List<ItemVo> searchItem(String searchKeyword);  // 검색한 키워드에 맞는 상품을 여러개(list) 조회
    
    // 카테고리별 조회 메서드
    List<ItemVo> getItemByCategory(@Param("type_idx") int type_idx);  // 클릭한 카테고리에 맞는 상품 여러개(list) 조회
    
    void insertItem(ItemVo vo);
    
	// 회원의 mem_idx를 넣으면 대표 동물의 종(고양이/강아지)을 한글로 반환!
	public String getPrimaryPetSpecies(int mem_idx);
	
	// 재고 20개 이하 상품 4개 가져오기
	List<ItemVo> getLowStockItems();
}
