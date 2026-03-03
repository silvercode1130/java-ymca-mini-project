<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${vo.item_name} - 상세정보 | PetOn 쇼핑</title>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>

    <script>
      let quantity = 1;
      const itemPrice = ${vo.item_now_price};

      function updateQuantityDisplay() {
        const qtyInput = document.getElementById('quantityInput');
        const totalEl  = document.getElementById('totalPrice');
        if (!qtyInput || !totalEl) return;
        qtyInput.value = quantity;
        const total = itemPrice * quantity;
        totalEl.innerText = total.toLocaleString('ko-KR') + '원';
      }

      function changeQuantity(delta) {
        const newQty = quantity + delta;
        if (newQty < 1) return;
        quantity = newQty;
        updateQuantityDisplay();
      }

      function addToCart(idx) {
        if (!idx) {
          alert("상품 번호를 찾을 수 없습니다.");
          return;
        }
        // 수량 넘기고 싶으면 쿼리스트링 등으로 추가 가능
        location.href = "${pageContext.request.contextPath}/cart/add/" + idx + "?qty=" + quantity;
      }

      function buyNow(idx) {
        if (!idx) {
          alert("상품 번호를 찾을 수 없습니다.");
          return;
        }
        // 추후 주문 플로우 붙일 자리
        alert("결제페이지로 이동합니다. (item_idx=" + idx + ", qty=" + quantity + ")");
      }

      // 초기 총액 세팅
      document.addEventListener('DOMContentLoaded', function() {
        updateQuantityDisplay();
      });
    </script>
</head>
<body class="layout-body bg-gray-50">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="max-w-7xl mx-auto px-4 py-8 relative">

    <!-- 상단 영역: 상세 페이지 타이틀/뒤로가기 -->
    <div class="flex items-center justify-between mb-6">
      <h1 class="text-xl md:text-2xl font-extrabold text-gray-900">
        상품 상세 정보
      </h1>
      <button type="button"
              onclick="location.href='${pageContext.request.contextPath}/item/item_list.do'"
              class="text-sm text-gray-500 hover:text-gray-900 font-bold flex items-center gap-1">
        ← 목록으로 돌아가기
      </button>
    </div>

    <div class="flex flex-col md:flex-row gap-12 mb-16">
      <!-- Left: Images -->
      <div class="w-full md:w-[45%]">
        <div class="aspect-square bg-gray-100 rounded-3xl overflow-hidden mb-4 relative border border-gray-100 shadow-sm">
          <img
            src="${pageContext.request.contextPath}/img/${vo.item_thumbnail_img}"
            alt="${vo.item_name}"
            class="w-full h-full object-cover"
          />
          <div class="absolute top-4 left-4 flex flex-col items-start gap-2">
			  <c:if test="${vo.item_is_sale == 'Y'}">
			    <span class="bg-amber-400 text-white font-bold px-3 py-1 rounded-full text-xs shadow-sm">
			      SALE
			    </span>
			  </c:if>
			  <c:if test="${vo.item_stock <= 5}">
			    <span class="bg-red-500 text-white font-bold px-3 py-1 rounded-full text-xs shadow-sm">
			      품절 임박
			    </span>
			  </c:if>
			</div>

        </div>

        <!-- 썸네일 영역: 아직 없으면 placeholder -->
        <div class="flex gap-4 overflow-x-auto pb-2">
          <div class="w-20 h-20 rounded-xl bg-gray-100 flex-shrink-0 overflow-hidden border-2 border-amber-400">
            <img
              src="${pageContext.request.contextPath}/img/${vo.item_thumbnail_img}"
              alt="${vo.item_name}"
              class="w-full h-full object-cover"
            />
          </div>
          <!-- 추가 이미지 필요하면 여기다 반복 -->
        </div>
      </div>

      <!-- Right: Info -->
      <div class="w-full md:w-[55%]">
        <!-- 태그/카테고리 -->
        <div class="flex flex-wrap gap-2 mb-4">
          <span class="px-3 py-1 bg-gray-100 text-gray-600 rounded-full text-xs font-bold">
            #${vo.item_for}
          </span>
          <span class="px-3 py-1 bg-gray-100 text-gray-600 rounded-full text-xs font-bold">
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
          </span>
          <c:if test="${vo.item_is_sale == 'Y'}">
            <span class="px-3 py-1 bg-red-50 text-red-500 rounded-full text-xs font-bold">
              세일중
            </span>
          </c:if>
        </div>

        <h2 class="text-2xl md:text-3xl font-extrabold text-gray-900 mb-4 leading-tight">
          ${vo.item_name}
        </h2>

        <!-- 가격 영역 -->
        <div class="mb-6 border-b border-gray-100 pb-6">
          <div class="flex items-center gap-3 mb-2">
            <c:if test="${vo.item_origin_price > vo.item_now_price}">
              <span class="text-gray-400 line-through text-lg">
                <fmt:formatNumber value="${vo.item_origin_price}" type="number"/>원
              </span>
              <span class="bg-red-100 text-red-500 font-bold px-2 py-1 rounded-md text-sm">
                <!-- 간단한 할인율 계산 -->
                <c:set var="discountRate"
                       value="${(vo.item_origin_price - vo.item_now_price) * 100 / vo.item_origin_price}" />
                <c:out value="${fn:substringBefore(discountRate, '.')}"/>% OFF
              </span>
            </c:if>
          </div>
          <div class="flex items-end gap-1">
            <span class="text-3xl md:text-4xl font-extrabold text-gray-900">
              <fmt:formatNumber value="${vo.item_now_price}" type="number" />
            </span>
            <span class="text-2xl text-gray-600 font-bold mb-1">원</span>
          </div>
        </div>

        <!-- 재고/기본 정보 -->
        <div class="flex items-center gap-4 text-sm text-gray-500 mb-6">
          <span>
            남은 수량:
            <span class="font-bold text-gray-900">${vo.item_stock}</span>개
          </span>
          <span class="text-gray-300">|</span>
          <span>
            브랜드:
            <span class="font-bold text-gray-900">
              <c:out value="${empty vo.item_brand ? '기타' : vo.item_brand}" />
            </span>
          </span>
        </div>

        <!-- 수량/총금액 -->
        <div class="bg-amber-50 rounded-xl p-6 mb-8">
          <div class="flex justify-between items-center mb-4">
            <span class="font-bold text-gray-700">구매 수량</span>
            <div class="flex items-center bg-white rounded-lg border border-gray-200">
              <button
                type="button"
                onclick="changeQuantity(-1)"
                class="p-2 text-gray-400 hover:text-gray-600 disabled:opacity-50"
                id="btnQtyMinus">
                -
              </button>
              <input
                type="text"
                id="quantityInput"
                value="1"
                readonly
                class="w-12 text-center font-bold text-gray-900 focus:outline-none border-none bg-transparent"
              />
              <button
                type="button"
                onclick="changeQuantity(1)"
                class="p-2 text-gray-400 hover:text-gray-600"
                id="btnQtyPlus">
                +
              </button>
            </div>
          </div>
          <div class="flex justify-between items-center border-t border-amber-100 pt-4">
            <span class="font-bold text-gray-900">총 상품 금액</span>
            <span id="totalPrice" class="text-2xl font-extrabold text-amber-600">
              <!-- JS에서 채움 -->
            </span>
          </div>
        </div>

        <!-- 액션 버튼들 -->
        <div class="flex flex-wrap gap-4">
          <button
            type="button"
            onclick="addToCart(${vo.item_idx})"
            class="flex-1 min-w-[150px] bg-amber-400 text-white font-bold py-3 md:py-4 rounded-xl text-base md:text-lg hover:bg-amber-500 shadow-md transition-all active:scale-95 text-center">
            장바구니 담기
          </button>
          <button
            type="button"
            onclick="buyNow(${vo.item_idx})"
            class="flex-1 min-w-[150px] bg-white border-2 border-amber-400 text-amber-500 font-bold py-3 md:py-4 rounded-xl text-base md:text-lg hover:bg-amber-50 transition-all active:scale-95 text-center">
            바로 구매하기
          </button>
        </div>
      </div>
    </div>

    <!-- 하단 상세 설명 (간단 버전) -->
    <div class="mb-20">
      <div class="border-b border-gray-200 mb-6">
        <div class="flex gap-8">
          <button
            type="button"
            class="pb-4 font-bold text-lg text-amber-500 relative">
            상세 정보
            <div class="absolute bottom-0 left-0 w-full h-1 bg-amber-500 rounded-t-full" />
          </button>
          <button
            type="button"
            class="pb-4 font-bold text-lg text-gray-300 cursor-not-allowed">
            리뷰 (준비중)
          </button>
          <button
            type="button"
            class="pb-4 font-bold text-lg text-gray-300 cursor-not-allowed">
            문의 (준비중)
          </button>
        </div>
      </div>

      <div class="max-w-4xl mx-auto bg-white rounded-2xl p-8 border border-gray-100 shadow-sm leading-loose text-gray-600 text-base md:text-lg">
          <img
              src="${pageContext.request.contextPath}/img/${vo.item_detail_img}"><br>
        <h3 class="text-2xl font-bold text-gray-900 mb-6">상품 상세 설명</h3>
        <p class="mb-6">
          ${vo.item_name} 상품의 상세 이미지는 상단에서 확인하실 수 있습니다.<br/>
          상품에 대한 보다 구체적인 정보(원재료, 급여량, 주의사항 등)는 제조사 측에 문의해주시기 바랍니다.
        </p>
        <div class="bg-gray-50 p-6 md:p-8 rounded-xl mb-8">
          <h4 class="font-bold text-gray-900 mb-4">기본 정보</h4>
          <ul class="list-disc pl-5 space-y-2 text-sm md:text-base">
            <li>카테고리:
              <span class="font-bold">
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
              </span>
            </li>
            <li>대상: <span class="font-bold">${vo.item_for}</span></li>
            <li>남은 수량: <span class="font-bold">${vo.item_stock}</span>개</li>
            <li>등록일: <span class="font-bold">${vo.item_regdate}</span></li>
          </ul>
        </div>
        <p class="text-sm md:text-base">
          PetOn은 반려동물에게 안전하고 믿을 수 있는 상품만 선별하여 제공하기 위해 노력하고 있습니다.
        </p>
      </div>
    </div>

  </div>
</main>
<!-- 오른쪽 플로팅 툴박스 -->
<aside class="floating-toolbox">
    <!-- <button type="button" class="toolbox-btn" title="내 정보">
        <span class="toolbox-icon">👤</span>
    </button>
    <button type="button" class="toolbox-btn" title="알림">
        <span class="toolbox-icon">🔔</span>
    </button>
    <button type="button" class="toolbox-btn" title="설정">
        <span class="toolbox-icon">⚙️</span>
    </button>
    <div class="toolbox-divider"></div> -->
    <button type="button" class="toolbox-btn" id="btnScrollTop" title="맨 위로">
        <span class="toolbox-icon">↑</span>
    </button>
    <button type="button" class="toolbox-btn" id="btnScrollBottom" title="맨 아래로">
        <span class="toolbox-icon">↓</span>
    </button>
</aside>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
