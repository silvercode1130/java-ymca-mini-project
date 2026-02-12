<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>펫온 쇼핑몰 | PetOn Shop</title>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <script>
        // 기존 수량 변경 기능 유지
        function updateQty(cartItemIdx, change) {
            let qtyInput = document.getElementById('qty_' + cartItemIdx);
            let newQty = parseInt(qtyInput.value) + change;

            if (newQty < 1) {
                alert("최소 1개는 담아야지");
                return;
            }

            location.href = "/cart/updateQty?idx=" + cartItemIdx + "&qty=" + newQty;
        }

        // 기존 삭제 기능 그대로 사용 (form POST /cart/remove/{idx})
        // 장바구니 비었을 때 쇼핑하러 가기 버튼
        function goShop() {
            location.href = "/item/item_list.do";
        }
    </script>
</head>
<body class="bg-gray-50 layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main max-w-7xl mx-auto px-4 py-8">

    <!-- 장바구니 비어있을 때 -->
    <c:if test="${empty cartList}">
        <div class="min-h-[60vh] flex flex-col items-center justify-center text-center px-4">
            <div class="w-24 h-24 bg-gray-100 rounded-full flex items-center justify-center text-gray-400 mb-6">
                🛍️
            </div>
            <h2 class="text-2xl font-bold text-gray-900 mb-2">장바구니가 비어있습니다.</h2>
            <p class="text-gray-500 mb-8">우리 아이를 위한 선물을 골라보세요!</p>
            <button 
                type="button"
                onclick="location.href='/item/item_list.do'"
                class="px-8 py-3 bg-amber-400 text-white rounded-xl font-bold hover:bg-amber-500 transition-colors">
                쇼핑하러 가기
            </button>
        </div>
    </c:if>

    <!-- 장바구니에 상품이 있을 때 -->
    <c:if test="${not empty cartList}">
        <h1 class="text-3xl font-extrabold text-gray-900 mb-8">장바구니 🛒</h1>

        <!-- 총액 계산 (기존 로직 그대로) -->
        <c:set var="totalPrice" value="0" />
        <c:forEach var="cart" items="${cartList}">
            <c:set var="totalPrice" value="${totalPrice + (cart.item.item_now_price * cart.cart_item_quantity)}" />
        </c:forEach>

        <div class="flex flex-col lg:flex-row gap-8">
            <!-- 왼쪽: 장바구니 리스트 -->
            <div class="flex-1 bg-white rounded-2xl border border-gray-100 p-4 lg:p-6 shadow-sm">
                <div class="flex justify-between items-center mb-4 pb-4 border-b border-gray-100">
                    <span class="text-sm font-bold text-gray-600">
                        상품 <span class="text-amber-500">${cartList.size()}</span>개
                    </span>
                    <!-- 선택 삭제는 원래 기능 없어서 텍스트만 -->
                    <span class="text-xs text-gray-300">선택 삭제 기능은 추후 추가 예정</span>
                </div>

                <div class="space-y-4">
                    <c:forEach var="cart" items="${cartList}">
                        <div class="flex flex-col md:flex-row md:items-center gap-4 p-4 border border-gray-100 rounded-2xl bg-white">
                            <!-- 상품 이미지 -->
                            <div class="w-24 h-24 bg-gray-50 rounded-xl flex-shrink-0 overflow-hidden">
                                <img 
                                    src="${pageContext.request.contextPath}/img/${cart.item.item_thumbnail_img}" 
                                    alt="상품이미지" 
                                    class="w-full h-full object-cover" />
                            </div>

                            <!-- 상품 정보 -->
                            <div class="flex-1 min-w-0">
                                <h3 class="font-bold text-gray-900 mb-1 truncate">
                                    ${cart.item.item_name}
                                </h3>
                                <p class="text-xs text-gray-400 mb-2">
                                    단가: ${cart.item.item_now_price}원
                                </p>

                                <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                                    <!-- 수량 조절 (기존 updateQty 그대로 사용) -->
                                    <div class="flex items-center border border-gray-200 rounded-lg h-8 w-fit">
                                        <button type="button"
                                                onclick="updateQty(${cart.cart_item_idx}, -1)"
                                                class="px-2 h-full hover:bg-gray-50 text-gray-500 text-sm">
                                            -
                                        </button>
                                        <input type="text"
                                               id="qty_${cart.cart_item_idx}"
                                               value="${cart.cart_item_quantity}"
                                               readonly
                                               class="w-10 text-center text-sm font-bold border-0 bg-transparent" />
                                        <button type="button"
                                                onclick="updateQty(${cart.cart_item_idx}, 1)"
                                                class="px-2 h-full hover:bg-gray-50 text-gray-500 text-sm">
                                            +
                                        </button>
                                    </div>

                                    <!-- 합계 금액 -->
                                    <div class="text-right sm:text-left">
                                        <div class="font-extrabold text-lg text-gray-900">
                                            ${cart.item.item_now_price * cart.cart_item_quantity}원
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 삭제 버튼 (기존 form 그대로) -->
                            <div class="self-start md:self-center">
                                <form action="/cart/remove/${cart.cart_item_idx}" method="post">
                                    <button type="submit"
                                            class="text-xs px-3 py-1.5 rounded-full border border-red-200 text-red-500 hover:bg-red-50">
                                        삭제
                                    </button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- 오른쪽: 결제 요약 -->
            <div class="w-full lg:w-96 flex-shrink-0">
                <div class="bg-white rounded-2xl border border-gray-200 p-6 sticky top-24 shadow-sm">
                    <h3 class="font-bold text-lg mb-6 text-gray-900">주문 예상 금액</h3>

                    <div class="space-y-3 mb-6">
                        <div class="flex justify-between text-gray-600">
                            <span>총 상품금액</span>
                            <span class="font-bold">${totalPrice}원</span>
                        </div>
                        <!-- 기존 장바구니 페이지에는 배송비/할인 계산 없어서 0/없음으로 표시 -->
                        <div class="flex justify-between text-gray-600">
                            <span>배송비</span>
                            <span class="font-bold">0원</span>
                        </div>
                    </div>

                    <div class="border-t border-gray-100 pt-4 mb-4">
                        <div class="flex justify-between items-center">
                            <span class="font-bold text-gray-900">최종 결제 예정 금액</span>
                            <span class="text-2xl font-extrabold text-amber-600">
                                ${totalPrice}원
                            </span>
                        </div>
                        <p class="text-xs text-gray-400 mt-1 text-right">
                            주문 상품 총 ${cartList.size()}건
                        </p>
                    </div>

                    <div class="flex flex-col gap-2">
                        <a href="/orders/orders_checkout.do"
                           class="w-full text-center py-3 rounded-xl font-bold text-white bg-amber-400 hover:bg-amber-500 shadow-md">
                            주문하기
                        </a>
                        <c:choose>
						    <%-- 비로그인 담기 -> 로그인 과정을 거쳐온 특수한 경우라면? --%>
						    <c:when test="${sessionScope.forceAllList == true}">
						        <a href="/item/item_list.do?item_for=all&from=cart"
						           onclick="<% session.removeAttribute("forceAllList"); %>" <%-- 한번 썼으면 증거 인멸! --%>
						           class="w-full text-center py-3 rounded-xl font-bold text-gray-600 bg-gray-100 hover:bg-gray-200">
						            계속 쇼핑하기
						        </a>
						    </c:when>
						    
						    <%-- 그 외에 평범하게 장바구니에 온 경우 --%>
						    <c:otherwise>
						        <a href="/item/item_list.do?from=cart"
						           class="w-full text-center py-3 rounded-xl font-bold text-gray-600 bg-gray-100 hover:bg-gray-200">
						            계속 쇼핑하기
						        </a>
						    </c:otherwise>
						</c:choose>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
