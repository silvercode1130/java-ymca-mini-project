<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뎡뎡이의 장바구니</title>
<script>
	function updateQty(cartItemIdx, change) {
	    let qtyInput = document.getElementById('qty_' + cartItemIdx);
	    let newQty = parseInt(qtyInput.value) + change;
	
	    if (newQty < 1) {
	        alert("최소 1개는 담아야지");
	        return;
	    }
	
	    // 서버에 수량 업데이트 요청 (Ajax 또는 location.href)
	    // 간단하게 location.href로 구현하면:
	    location.href = "/cart/updateQty?idx=" + cartItemIdx + "&qty=" + newQty;
	}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2 class="mb-4">내 장바구니 🐾</h2>

    <table class="table table-hover">
        <thead class="table-light">
            <tr>
                <th>상품이미지</th>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty cartList}">
                    <c:forEach var="cart" items="${cartList}">
                        <tr>
                            <td>
                                <img src="${cart.item.item_thumbnail_img}" alt="상품이미지" style="width: 80px; height: 80px; object-fit: cover;">
                            </td>
                            <td class="align-middle">${cart.item.item_name}</td>
                            <td class="align-middle">
							    ${cart.item.item_price * cart.cart_item_quantity}원
							    	<small class="text-muted">(단가: ${cart.item.item_price}원)</small>
							</td>
                            <td class="align-middle">
							    <div class="input-group" style="width: 120px;">
							        <button class="btn btn-outline-secondary btn-sm" type="button" 
							                onclick="updateQty(${cart.cart_item_idx}, -1)">-</button>
							        
							        <input type="text" class="form-control form-control-sm text-center" 
							               id="qty_${cart.cart_item_idx}" value="${cart.cart_item_quantity}" readonly>
							        
							        <button class="btn btn-outline-secondary btn-sm" type="button" 
							                onclick="updateQty(${cart.cart_item_idx}, 1)">+</button>
							    </div>
							</td>
                            <td class="align-middle">
                                <form action="/cart/remove/${cart.cart_item_idx}" method="post">
                                    <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5" class="text-center py-5">장바구니가 비어있습니다</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
	
	<c:set var="totalPrice" value="0" />
	
	<div class="card mt-4 shadow-sm">
	    <div class="card-body text-end">
	        <c:forEach var="cart" items="${cartList}">
	            <c:set var="totalPrice" value="${totalPrice + (cart.item.item_price * cart.cart_item_quantity)}" />
	        </c:forEach>
	        
	        <h5 class="text-muted mb-2">주문 상품 총 <span class="text-primary">${cartList.size()}</span>건</h5>
	        <h3 class="mb-4">최종 결제 예정 금액: 
	            <span class="text-danger" id="total_sum">
	                <strong>${totalPrice}원</strong>
	            </span>
	        </h3>
		</div>
	</div>
    <div class="text-end mt-3">
        <a href="/item/item_list.do" class="btn btn-secondary">계속 쇼핑하기</a>
        <a href="/orders/orders_checkout.do" class="btn btn-secondary">주문하기</a>
    </div>
</body>
</html>