<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 쇼핑몰 - 상품 목록</title>
<script>
	function addToCart(idx) {
	    alert('장바구니에 담겼습니다! 확인하러 갈게요! ><');
	    location.href = "/cart/add/" + idx;
	}
</script>
<style>
	.item-container { 
		display: flex; 
		flex-wrap: wrap; 
		gap: 20px; 
		padding: 20px; 
	}
	.item-card { 
		border: 1px solid #ddd; 
		padding: 15px; 
		width: 200px; 
		border-radius: 10px; 
		text-align: center; 
	}
	.item-card img { 
		width: 100%; 
		height: 150px; 
		object-fit: cover; 
		border-radius: 5px; 
	}
	/* 검색창 위치 잡기용 스타일 */
	.header-section { 
		display: flex; 
		justify-content: space-between; 
		align-items: center; 
		padding: 0 20px; 
	}
</style>
</head>
<body>

    <div class="header-section">
        <h1>상품 목록</h1>
        
        <div class="category-menu" style="margin: 20px 0;">
		    <a href="/item/item_list.do">전체</a> |
		    <a href="/item/item_list.do?type_idx=1">일반</a> |
		    <a href="/item/item_list.do?type_idx=2">사료</a> |
		    <a href="/item/item_list.do?type_idx=3">간식</a> |
		    <a href="/item/item_list.do?type_idx=4">장난감</a> |
		    <a href="/item/item_list.do?type_idx=5">위생용품</a> |
		    <a href="/item/item_list.do?type_idx=6">배변용품</a> |
		    <a href="/item/item_list.do?type_idx=7">의류</a> |
		    <a href="/item/item_list.do?type_idx=8">방석/쿠션</a> |
		    <a href="/item/item_list.do?type_idx=9">야외활동</a> |
		    <a href="/item/item_list.do?type_idx=10">하우스/이동장</a>
		</div>
        
        <form action="/item/item_list.do" method="get">
            <input type="text" name="searchKeyword" value="${param.searchKeyword}" placeholder="검색어를 입력하세요!">
            <button type="submit">검색</button>
        </form>
    </div>

    <div class="item-container">
        <c:forEach var="item" items="${itemList}">
            <div class="item-card">
                <c:if test="${not empty item.item_thumbnail_img}">
				    <img src="${item.item_thumbnail_img}" alt="상품이미지">
				</c:if>
				
				<c:if test="${empty item.item_thumbnail_img}">
				    <div style="background:#eee; height:150px; line-height:150px;">이미지 준비중</div>
				</c:if>
				
				<div class="item-info">
				    <h5 class="item-title">${item.item_name}</h5>
				    <p class="item-price">
				        <c:if test="${item.item_origin_price > item.item_now_price}">
				            <span style="text-decoration: line-through; color: #999; font-size: 0.9em;">${item.item_origin_price}원</span>
				        </c:if>
				        <strong style="color: #e44d26;">${item.item_now_price}원</strong>
				    </p>
				    <a href="/item/item_detail.do?item_idx=${item.item_idx}">상세보기</a>
				    <button type="button" class="btn-cart" onclick="addToCart(${item.item_idx})">담기 🛒</button>
				</div>
				
            </div>
        </c:forEach>
    </div>

</body>
</html>