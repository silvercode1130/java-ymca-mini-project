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
		    <p>주문 금액: ${total_price}원</p>
		    <p>등급 할인: <span class="text-danger">-${grade_discount_amount}원</span></p>
		    <hr>
		    <p>최종 결제 금액: <strong>${final_price}원</strong></p>
		    
		    <input type="hidden" name="orders_total_price" value="${final_price}">
		    <input type="hidden" name="orders_grade_discount" value="${grade_discount_amount}">
		    
		    <button type="submit" class="btn btn-danger w-100">결제하기</button>
		</div>
	</form>
</body>
</html>