<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>주문 상세 정보 (번호: ${order.orders_idx})</h2>
	<div class="border p-3 mb-3">
	    <p>주문일시: ${order.orders_regdate}</p>
	    <p>주문상태: ${order.status.orders_status_name}</p>
	    <p>등급 할인액: -${order.orders_grade_discount}원</p> 
	    <p>최종 결제액: <strong>${order.orders_total_price}원</strong></p>
	</div>
		
	<table class="table">
	    <thead>
	        <tr>
	            <th>상품명</th>
	            <th>가격(구매당시)</th>
	            <th>수량</th>
	            <th>소계</th>
	        </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="item" items="${itemList}">
	        <tr>
	            <td>${item.item.item_name}</td>
	            <td>${item.orders_price_at}원</td>
	            <td>${item.orders_item_quantity}개</td>
	            <td>${item.orders_price_at * item.orders_item_quantity}원</td>
	        </tr>
	    </c:forEach>
	</tbody>
	</table>
</body>
</html>