<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.item_name} - 상세정보</title>
<script>
	function addToCart(idx) {
	    if(!idx) {
	        alert("상품 번호를 찾을 수 없습니다!");
	        return;
	    }
	    location.href = "/cart/add/" + idx;
	}
</script>
</head>
<body>
    <h1>상품 상세 정보</h1>
    <hr>
    <img src="${vo.item_detail_img}" style="width:400px; border:1px solid #ccc;">
	
    <h2>상품명: ${vo.item_name}</h2>
  	<p>정 가: <span style="text-decoration: line-through;">${vo.item_origin_price}원</span></p>
	<p>판 매 가: <strong style="color:red;">${vo.item_now_price}원</strong></p>
	<p>남은수량: ${vo.item_stock}개</p>
    <p>카테고리: 
    <c:choose>
        <c:when test="${vo.item_type_idx == 1}">일반</c:when>
        <c:when test="${vo.item_type_idx == 2}">사료</c:when>
        <c:when test="${vo.item_type_idx == 3}">간식</c:when>
        <c:when test="${vo.item_type_idx == 4}">장난감</c:when>
        <c:when test="${vo.item_type_idx == 5}">위생용품</c:when>
        <c:when test="${vo.item_type_idx == 6}">배변용품</c:when>
        <c:when test="${vo.item_type_idx == 7}">의류</c:when>
        <c:when test="${vo.item_type_idx == 8}">방석/쿠션</c:when>
        <c:when test="${vo.item_type_idx == 9}">야외활동</c:when>
        <c:when test="${vo.item_type_idx == 10}">하우스/이동장</c:when>
        <c:otherwise>기타</c:otherwise>
    </c:choose>
</p>
    <p>남은수량: ${vo.item_stock}개</p>
    <p>등록일: ${vo.item_regdate}</p>

    <hr>
	<button type="button" onclick="location.href='/item/item_list.do'">목록으로 돌아가기</button>
	<button type="button" onclick="addToCart(${vo.item_idx})">장바구니 담기</button>
</body>
</html>