<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/views/common/head.jsp" %>
  <title>장바구니 | PetOn 쇼핑몰</title>
</head>
<body class="layout-body bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="max-w-7xl mx-auto px-4 py-8">

    <c:choose>
      <c:when test="${empty cartItems}">
        <!-- 장바구니 비었을 때 -->
        <div class="min-h-[60vh] flex flex-col items-center justify-center text-center px-4">
          <div class="w-24 h-24 bg-gray-100 rounded-full flex items-center justify-center text-gray-400 mb-6 text-4xl">
            🛍
          </div>
          <h2 class="text-2xl font-bold text-gray-900 mb-2">장바구니가 비어있습니다.</h2>
          <p class="text-gray-500 mb-8">우리 아이를 위한 선물을 골라보세요!</p>
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/shop/list.do';"
                  class="px-8 py-3 bg-amber-400 text-white rounded-xl font-bold hover:bg-amber-500 transition-colors">
            쇼핑하러 가기
          </button>
        </div>
      </c:when>

      <c:otherwise>
        <h1 class="text-3xl font-extrabold text-gray-900 mb-8">장바구니 🛒</h1>

        <div class="flex flex-col lg:flex-row gap-8">
          <!-- Cart List -->
          <div class="flex-1">

            <!-- Header Actions -->
            <div class="flex justify-between items-center mb-4 pb-4 border-b border-gray-100">
              <div class="flex items-center gap-2">
                <input type="checkbox"
                       id="selectAll"
                       class="w-5 h-5 rounded border-gray-300 text-amber-500 focus:ring-amber-400 cursor-pointer"
                       onclick="toggleAllItems();" />
                <span class="text-sm font-bold text-gray-600">
                  전체 선택 (<span id="selectedCount">0</span>/<c:out value="${fn:length(cartItems)}" />)
                </span>
              </div>
              <button type="button"
                      onclick="deleteSelected();"
                      class="text-xs text-gray-400 hover:text-red-500 font-bold">
                선택 삭제
              </button>
            </div>

            <!-- Items -->
            <div class="space-y-4" id="cartList">
              <c:forEach var="item" items="${cartItems}">
                <div class="flex gap-4 p-4 border border-gray-100 rounded-2xl bg-white shadow-sm cart-item"
                     data-cart-idx="${item.cart_idx}"
                     data-price="${item.item_price}">
                  <div class="flex items-start pt-2">
                    <input type="checkbox"
                           class="item-check w-5 h-5 rounded border-gray-300 text-amber-500 focus:ring-amber-400 cursor-pointer"
                           onclick="refreshSummary();" />
                  </div>

                  <div class="w-24 h-24 bg-gray-50 rounded-xl flex-shrink-0 overflow-hidden">
                    <img src="${item.item_thumbnail_img}"
                         alt="${item.item_name}"
                         class="w-full h-full object-cover" />
                  </div>

                  <div class="flex-1 min-w-0">
                    <h3 class="font-bold text-gray-900 mb-1 cursor-pointer hover:text-amber-600 truncate"
                        onclick="location.href='${pageContext.request.contextPath}/item/detail.do?item_idx=${item.item_idx}';">
                      <c:out value="${item.item_name}" />
                    </h3>
                    <p class="text-xs text-gray-400 mb-3">
                      옵션:
                      <c:out value="${item.item_option}" default="기본" />
                    </p>

                    <div class="flex items-center justify-between">
                      <div class="flex items-center border border-gray-200 rounded-lg h-8">
                        <button type="button"
                                class="px-2 h-full hover:bg-gray-50 text-gray-500"
                                onclick="changeQty(this, -1);">
                          -
                        </button>
                        <div class="px-2 font-bold text-sm text-gray-900 w-8 text-center item-qty">
                          <c:out value="${item.item_qty}" />
                        </div>
                        <button type="button"
                                class="px-2 h-full hover:bg-gray-50 text-gray-500"
                                onclick="changeQty(this, 1);">
                          +
                        </button>
                      </div>

                      <div class="font-extrabold text-lg text-gray-900 item-total">
                        <fmt:formatNumber value="${item.item_price * item.item_qty}" type="number" />원
                      </div>
                    </div>
                  </div>

                  <button type="button"
                          class="text-gray-300 hover:text-red-500 self-start p-1"
                          onclick="deleteOne(${item.cart_idx});">
                    🗑
                  </button>
                </div>
              </c:forEach>
            </div>
          </div>

          <!-- Summary Card -->
          <div class="w-full lg:w-96 flex-shrink-0">
            <div class="bg-white rounded-2xl border border-gray-200 p-6 sticky top-24 shadow-sm">
              <h3 class="font-bold text-lg mb-6 text-gray-900">주문 예상 금액</h3>

              <div class="space-y-3 mb-6">
                <div class="flex justify-between text-gray-600">
                  <span>총 상품금액</span>
                  <span id="sumProduct" class="font-bold">0원</span>
                </div>
                <div class="flex justify-between text-gray-600">
                  <span>배송비</span>
                  <span id="shippingFee" class="font-bold">0원</span>
                </div>
                <div class="flex justify-between text-amber-500">
                  <span>할인 금액</span>
                  <span class="font-bold">-0원</span>
                </div>
              </div>

              <div class="border-t border-gray-100 pt-4 mb-6">
                <div class="flex justify-between items-center">
                  <span class="font-bold text-gray-900">총 결제금액</span>
                  <span id="finalPrice" class="text-2xl font-extrabold text-amber-600">
                    0원
                  </span>
                </div>
              </div>

              <button type="button"
                      id="btnCheckout"
                      class="w-full py-4 rounded-xl font-bold text-lg shadow-md transition-all bg-gray-200 text-gray-400 cursor-not-allowed"
                      onclick="checkoutSelected();"
                      disabled>
                결제하기
              </button>
            </div>
          </div>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
  const FREE_SHIPPING_LIMIT = 50000;
  const SHIPPING_FEE        = 3000;

  function parseNumber(text) {
    return parseInt(String(text).replace(/[^0-9]/g, ''), 10) || 0;
  }

  function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  // 수량 변경
  function changeQty(btn, delta) {
    const itemBox = btn.closest('.cart-item');
    const qtyEl   = itemBox.querySelector('.item-qty');
    const price   = parseInt(itemBox.dataset.price, 10);

    let qty = parseInt(qtyEl.textContent, 10);
    qty = qty + delta;
    if (qty < 1) qty = 1;
    qtyEl.textContent = qty;

    const totalEl = itemBox.querySelector('.item-total');
    totalEl.textContent = formatNumber(price * qty) + '원';

    refreshSummary();
  }

  // 전체 선택/해제
  function toggleAllItems() {
    const allCheck = document.getElementById('selectAll');
    const checks   = document.querySelectorAll('.item-check');
    checks.forEach(c => c.checked = allCheck.checked);
    refreshSummary();
  }

  // 선택 삭제
  function deleteSelected() {
    const checks = document.querySelectorAll('.item-check:checked');
    if (checks.length === 0) {
      alert('삭제할 상품을 선택하세요.');
      return;
    }
    if (!confirm('선택한 상품을 삭제하시겠습니까?')) return;

    // TODO: 실제 삭제 요청 (cart_idx 들 모아서 서버로 전송)
    checks.forEach(c => c.closest('.cart-item').remove());
    refreshSummary();
  }

  // 단일 삭제
  function deleteOne(cartIdx) {
    if (!confirm('해당 상품을 삭제하시겠습니까?')) return;
    // TODO: 실제 삭제 요청 (cartIdx 기준)
    const box = document.querySelector('.cart-item[data-cart-idx="' + cartIdx + '"]');
    if (box) box.remove();
    refreshSummary();
  }

  // 합계/배송비 계산
  function refreshSummary() {
    const checks     = document.querySelectorAll('.item-check');
    const checked    = document.querySelectorAll('.item-check:checked');
    const selectedCountEl = document.getElementById('selectedCount');

    selectedCountEl.textContent = checked.length;

    let sum = 0;
    checked.forEach(chk => {
      const box   = chk.closest('.cart-item');
      const price = parseInt(box.dataset.price, 10);
      const qty   = parseInt(box.querySelector('.item-qty').textContent, 10);
      sum += price * qty;
    });

    const sumEl      = document.getElementById('sumProduct');
    const shipEl     = document.getElementById('shippingFee');
    const finalEl    = document.getElementById('finalPrice');
    const btnCheckout= document.getElementById('btnCheckout');

    sumEl.textContent = formatNumber(sum) + '원';

    let shipping = 0;
    if (sum > 0 && sum < FREE_SHIPPING_LIMIT) {
      shipping = SHIPPING_FEE;
    }
    shipEl.textContent = shipping === 0 ? '무료' : '+' + formatNumber(shipping) + '원';

    const final = sum + shipping;
    finalEl.textContent = formatNumber(final) + '원';

    // 버튼 활성/비활성
    if (checked.length === 0) {
      btnCheckout.disabled = true;
      btnCheckout.className = 'w-full py-4 rounded-xl font-bold text-lg shadow-md transition-all bg-gray-200 text-gray-400 cursor-not-allowed';
    } else {
      btnCheckout.disabled = false;
      btnCheckout.className = 'w-full py-4 rounded-xl font-bold text-lg shadow-md transition-all bg-amber-400 text-white hover:bg-amber-500 hover:shadow-lg active:scale-95';
    }

    // 전체 체크박스 상태 동기화
    const allCheck = document.getElementById('selectAll');
    if (checks.length > 0 && checked.length === checks.length) {
      allCheck.checked = true;
    } else {
      allCheck.checked = false;
    }
  }

  function checkoutSelected() {
    const checked = document.querySelectorAll('.item-check:checked');
    if (checked.length === 0) {
      alert('결제할 상품을 선택하세요.');
      return;
    }
    // TODO: 선택된 cart_idx 들 모아서 주문 페이지로 이동
    alert('선택된 상품으로 주문 페이지로 이동 (백엔드 연동 필요)');
  }

  // 초기 합계 계산
  window.addEventListener('load', function() {
    const checks = document.querySelectorAll('.item-check');
    checks.forEach(c => c.checked = true);
    refreshSummary();
  });
</script>

</body>
</html>
