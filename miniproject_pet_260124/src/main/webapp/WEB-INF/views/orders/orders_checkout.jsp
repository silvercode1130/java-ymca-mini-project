<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>주문/결제 | PetOn</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body class="bg-gray-50 layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main max-w-7xl mx-auto px-4 py-8">
  <h1 class="text-3xl font-extrabold text-gray-900 mb-8">주문/결제</h1>

  <div class="flex flex-col lg:flex-row gap-8">

    <!-- 왼쪽 컬럼: 배송지 + 주문 상품 + 결제수단 -->
    <div class="flex-1 space-y-8">

      <!-- 배송지 정보 (MapPin 섹션) -->
      <section class="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm">
        <h2 class="text-xl font-bold text-gray-900 mb-6 flex items-center gap-2">
          <span class="text-amber-500">📍</span> 배송지 정보
        </h2>
        <div class="space-y-4">
          <div class="flex flex-col md:flex-row gap-4">
            <div class="flex-1">
              <label class="block text-sm font-bold text-gray-600 mb-2">받는 분</label>
              <input type="text"
                     value="${user.mem_name}"
                     class="w-full px-4 py-3 rounded-xl border border-gray-200 bg-gray-50"
                     readonly />
            </div>
            <div class="flex-1">
              <label class="block text-sm font-bold text-gray-600 mb-2">연락처</label>
              <input type="text"
                     value="${user.mem_tel}"
                     class="w-full px-4 py-3 rounded-xl border border-gray-200 bg-gray-50"
                     readonly />
            </div>
          </div>

          <div>
            <label class="block text-sm font-bold text-gray-600 mb-2">주소</label>
            <div class="flex gap-2 mb-2">
              <input type="text"
                     value="${user.addr.mem_zipcode}"
                     class="w-32 px-4 py-3 rounded-xl border border-gray-200 bg-gray-50 text-sm"
                     readonly />
              <button type="button"
                      class="px-4 py-2 border border-gray-200 rounded-xl text-sm font-bold text-gray-600 bg-gray-50 cursor-not-allowed"
                      disabled>
                우편번호 찾기
              </button>
            </div>
            <input type="text"
                   value="${user.addr.mem_addr}"
                   class="w-full px-4 py-3 rounded-xl border border-gray-200 mb-2 bg-gray-50 text-sm"
                   readonly />
            <input type="text"
                   value="${user.addr.mem_addr_detail}"
                   class="w-full px-4 py-3 rounded-xl border border-gray-200 bg-gray-50 text-sm"
                   readonly />
          </div>

          <div>
            <label class="block text-sm font-bold text-gray-600 mb-2">배송 요청사항</label>
            <select class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:border-amber-400 text-sm">
              <option>부재 시 문 앞에 놓아주세요</option>
              <option>배송 전 연락바랍니다</option>
              <option>경비실에 맡겨주세요</option>
              <option>직접 입력</option>
            </select>
          </div>
        </div>
      </section>

      <!-- 주문 상품 정보: 지금은 금액만 넘어오니까, 간단 타이틀/금액 느낌만 -->
      <section class="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm">
        <h2 class="text-xl font-bold text-gray-900 mb-6">
          주문 상품 요약
        </h2>
        <div class="space-y-2 text-sm text-gray-600">
          <p>장바구니에서 선택한 상품들에 대한 결제입니다.</p>
          <p>주문 금액 기준: <span class="font-bold">${total_price}원</span></p>
        </div>
      </section>

      <!-- 결제 수단 (옵션만, 실제 기능 없음) -->
      <section class="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm">
        <h2 class="text-xl font-bold text-gray-900 mb-6">결제 수단</h2>
        <div class="grid grid-cols-2 gap-4">
          <button type="button"
                  class="flex flex-col items-center justify-center p-6 rounded-xl border-2 border-amber-400 bg-amber-50 text-amber-600">
            <span class="text-2xl mb-2">💳</span>
            <span class="font-bold">신용/체크카드</span>
          </button>
          <button type="button"
                  class="flex flex-col items-center justify-center p-6 rounded-xl border-2 border-gray-100 hover:bg-gray-50 text-gray-500">
            <span class="text-2xl mb-2">₩</span>
            <span class="font-bold">무통장입금</span>
          </button>
        </div>
      </section>

    </div>

    <!-- 오른쪽 컬럼: 결제 요약 + 동의 + 결제 버튼(폼 포함) -->
    <div class="w-full lg:w-96 flex-shrink-0">
      <form action="/orders/create" method="post"
            class="bg-white rounded-2xl border border-gray-200 p-6 sticky top-24 shadow-lg space-y-6">

        <h3 class="font-bold text-lg text-gray-900">최종 결제 금액</h3>

        <div class="space-y-3 text-sm text-gray-700">
          <div class="flex justify-between">
            <span>주문 금액</span>
            <span class="font-bold">${total_price}원</span>
          </div>
          <div class="flex justify-between">
            <span>등급 할인</span>
            <span class="font-bold text-red-500">-${grade_discount_amount}원</span>
          </div>
          
		  <c:if test="${coupon_discount_amount > 0}">
			  <div class="flex justify-between">
				  <span>첫 구매 쿠폰(30%)</span>
				  <span class="font-bold text-red-500">-${coupon_discount_amount}원</span>
			  </div>
		  </c:if>
          
          <div class="flex justify-between text-gray-500">
            <span>배송비</span>
            <span class="font-bold">0원</span>
          </div>
        </div>

        <div class="border-t border-gray-100 pt-4">
          <div class="flex justify-between items-center">
            <span class="font-bold text-gray-900">총 결제금액</span>
            <span class="text-2xl font-extrabold text-amber-600">
              ${final_price}원
            </span>
          </div>
        </div>

        <!-- 주문 내용 확인 및 동의 (그대로) -->
        <div class="bg-gray-50 p-4 rounded-xl">
          <label class="flex items-start gap-2 cursor-pointer">
            <input 
              type="checkbox"
              class="mt-1 w-5 h-5 rounded border-gray-300 text-amber-500 focus:ring-amber-400"
              required />
            <span class="text-sm text-gray-600">
              주문 내용을 확인하였으며, 정보 제공 등에 동의합니다. (필수)
            </span>
          </label>
        </div>

        <!-- hidden 값: 원래 JSP 기능 그대로 -->
        <input type="hidden" name="orders_total_price" value="${final_price}">
        <input type="hidden" name="orders_grade_discount" value="${grade_discount_amount}">

        <!-- 결제 버튼: 우측 요약 박스 하단 -->
        <button type="submit"
                class="w-full py-4 bg-amber-400 text-white rounded-xl font-bold text-lg shadow-md hover:bg-amber-500 transition-colors flex items-center justify-center gap-2">
          ${final_price}원 결제하기
        </button>
      </form>
    </div>

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
