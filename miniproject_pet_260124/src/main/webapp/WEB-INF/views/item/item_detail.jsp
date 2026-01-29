<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${vo.item_name} - 상세정보</title>
</head>
<body>
    <h1>상품 상세 정보</h1>
    <hr>
    <img src="${vo.item_detail_img}" style="width:400px; border:1px solid #ccc;">

    <h2>상품명: ${vo.item_name}</h2>
    <p>가 격: ${vo.item_price}원</p>
    <p>카테고리: ${vo.item_category}</p>
    <p>남은수량: ${vo.item_stock}개</p>
    <p>등록일: ${vo.item_regdate}</p>

    <hr>
    <button onclick="location.href='/item/list'">목록으로 돌아가기</button>
    <button onclick="alert('장바구니에 담겼습니다!')">장바구니 담기</button>
</body>
</html>