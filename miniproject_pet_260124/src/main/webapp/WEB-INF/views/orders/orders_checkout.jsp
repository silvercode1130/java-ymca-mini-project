<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>주문서 작성</h2>
	<form action="/orders/create" method="post">
	    <div class="card p-4">
	        <h4>결제 정보</h4>
	        <p>최종 결제 금액: <strong>${total_price}원</strong></p>
	        <input type="hidden" name="orders_total_price" value="${total_price}">
	        
	        <button type="submit" class="btn btn-danger w-100">결제하기</button>
	    </div>
	</form>
</body>
</html>