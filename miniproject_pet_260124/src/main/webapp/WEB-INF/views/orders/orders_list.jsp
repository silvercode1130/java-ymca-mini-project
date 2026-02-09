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
	<h2>나의 주문 목록</h2>
	<div class="mb-3">
	    <form action="/orders/list" method="get" class="d-flex" style="width: 300px;">
	        <input type="text" name="searchKeyword" class="form-control me-2" 
	               placeholder="주문번호 또는 상품명" value="${searchKeyword}">
	        <button type="submit" class="btn btn-outline-primary">검색</button>
	    </form>
	</div>
	<table class="table">
	    <thead>
	        <tr>
	            <th>주문번호</th>
	            <th>주문날짜</th>
	            <th>총 결제금액</th>
	            <th>상태</th>
	            <th>상세보기</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach var="vo" items="${list}">
	            <tr>
	                <td>${vo.orders_idx}</td>
	                <td>${vo.orders_regdate}</td>
	                <td>${vo.orders_total_price}원</td>
	                <td><span class="badge bg-info">${vo.status.orders_status_name}</span></td>
	                <td>
	                    <button type="button" onclick="location.href='/orders/detail/${vo.orders_idx}'">상세보기</button>
	                    
	                    <c:if test="${vo.orders_status_idx == 1}">
					        <button type="button" onclick="location.href='${pageContext.request.contextPath}/orders/pay/${vo.orders_idx}'">
					            결제하기
					        </button>
					    </c:if>
	                    
            			<button type="button" onclick="if(confirm('정말 취소하시겠습니까?')) { location.href='/orders/cancel/${vo.orders_idx}'; }">주문취소</button>
	                </td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
</body>
</html>