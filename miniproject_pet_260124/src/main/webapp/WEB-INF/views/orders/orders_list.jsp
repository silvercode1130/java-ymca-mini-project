<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나의 주문 내역 | PetOn</title>
<script>
   // 1. 취소 버튼 클릭 시 스크롤 위치를 포함해서 이동하는 함수
   function cancelWithScroll(ordersIdx) {
       if(confirm('정말 취소하시겠습니까?')) {
           const scrollPos = window.scrollY; // 현재 스크롤 위치 저장
           // 주소 뒤에 scroll 파라미터를 붙여서 컨트롤러로 보냄
           location.href = '${pageContext.request.contextPath}/orders/cancel/' + ordersIdx + '?scroll=' + scrollPos;
       }
   }
   
   // 2. 페이지가 로드되었을 때 스크롤 위치가 파라미터에 있으면 복구!
   window.onload = function() {
       const urlParams = new URLSearchParams(window.location.search);
       const scrollPos = urlParams.get('scroll');
       if (scrollPos) {
           // 브라우저가 요소를 배치할 시간을 0.1초(100ms)만 
           setTimeout(function() {
               window.scrollTo({
                   top: parseInt(scrollPos),
                   behavior: 'instant' // 즉시 이동
               });
           }, 100);
       }
   };
</script>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body class="bg-gray-50 layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main max-w-6xl mx-auto px-4 py-8">
  <div class="flex flex-col md:flex-row gap-8">

    <!-- 왼쪽: 마이페이지 사이드바 -->
    <aside class="w-full md:w-64 flex-shrink-0">
      <div class="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 sticky top-24">
        <h2 class="text-xl font-extrabold text-gray-900 mb-6 px-2">마이페이지</h2>
        <nav class="flex flex-row md:flex-col gap-2 overflow-x-auto md:overflow-visible pb-4 md:pb-0">
          <a href="${pageContext.request.contextPath}/profile/myProfile.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">👤</span>
            <span class="flex-1 text-left">나의 프로필</span>
          </a>
          <a href="${pageContext.request.contextPath}/profile/petProfile_form.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">💗</span>
            <span class="flex-1 text-left">마이펫</span>
          </a>
          <a href="${pageContext.request.contextPath}/orders/list"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap bg-amber-50 text-amber-600 font-bold">
            <span class="text-amber-500">📦</span>
            <span class="flex-1 text-left">나의 주문</span>
          </a>
          <a href="${pageContext.request.contextPath}/update/myUpdate_form.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">⚙️</span>
            <span class="flex-1 text-left">회원정보수정</span>
          </a>
        </nav>
      </div>
    </aside>

    <!-- 오른쪽: 나의 주문 내역 -->
    <section class="flex-1 min-w-0 flex justify-center">
      <div class="w-full max-w-4xl">

        <!-- 상단 헤더 + 검색 -->
        <div class="flex items-center justify-between mb-6">
          <h2 class="text-2xl font-bold text-gray-900">나의 주문 내역</h2>
          <div class="relative">
            <form action="${pageContext.request.contextPath}/orders/list" method="get">
              <input 
                type="text" 
                name="searchKeyword"
                value="${searchKeyword}"
                placeholder="주문 상품 검색" 
                class="pl-9 pr-4 py-2 border border-gray-200 rounded-lg text-sm focus:outline-none focus:border-amber-400 bg-white"
              />
            </form>
            <span class="absolute left-3 top-2.5 text-gray-400 text-sm">🔍</span>
          </div>
        </div>

        <!-- 상태 요약: orders_status_idx 기준 간단 집계 -->
        <c:set var="cntWait"   value="0" />
        <c:set var="cntPaid"   value="0" />
        <c:set var="cntShip"   value="0" />
        <c:set var="cntDone"   value="0" />
        <c:set var="cntCancel" value="0" />
        <c:forEach var="o" items="${list}">
          <c:choose>
            <c:when test="${o.orders_status_idx == 1}">
              <c:set var="cntWait" value="${cntWait + 1}" />
            </c:when>
            <c:when test="${o.orders_status_idx == 2}">
              <c:set var="cntPaid" value="${cntPaid + 1}" />
            </c:when>
            <c:when test="${o.orders_status_idx == 3}">
              <c:set var="cntShip" value="${cntShip + 1}" />
            </c:when>
            <c:when test="${o.orders_status_idx == 4}">
              <c:set var="cntDone" value="${cntDone + 1}" />
            </c:when>
            <c:when test="${o.orders_status_idx == 5}">
              <c:set var="cntCancel" value="${cntCancel + 1}" />
            </c:when>
          </c:choose>
        </c:forEach>

        <div class="bg-gray-50 rounded-2xl p-6 flex justify-between items-center text-center mb-8 border border-gray-100">
          <div class="flex-1 border-r border-gray-200">
            <div class="text-gray-500 text-sm mb-1">결제대기</div>
            <div class="font-bold text-xl">${cntWait}</div>
          </div>
          <div class="flex-1 border-r border-gray-200">
            <div class="text-gray-500 text-sm mb-1">결제완료</div>
            <div class="font-bold text-xl text-blue-600">${cntPaid}</div>
          </div>
          <div class="flex-1 border-r border-gray-200">
            <div class="text-gray-500 text-sm mb-1">배송중</div>
            <div class="font-bold text-xl text-amber-500">${cntShip}</div>
          </div>
          <div class="flex-1 border-r border-gray-200">
            <div class="text-gray-500 text-sm mb-1">배송완료</div>
            <div class="font-bold text-xl text-green-600">${cntDone}</div>
          </div>
          <div class="flex-1">
            <div class="text-gray-500 text-sm mb-1">취소/환불</div>
            <div class="font-bold text-xl">${cntCancel}</div>
          </div>
        </div>

        <!-- 주문 리스트 -->
        <div class="space-y-6">
          <c:forEach var="vo" items="${list}">

            <!-- 상태 배지 클래스 계산 -->
            <c:set var="badgeClass" value="bg-gray-100 text-gray-600" />
            <c:choose>
              <c:when test="${vo.orders_status_idx == 1}">
                <c:set var="badgeClass" value="bg-gray-100 text-gray-600" />
              </c:when>
              <c:when test="${vo.orders_status_idx == 2}">
                <c:set var="badgeClass" value="bg-blue-100 text-blue-600" />
              </c:when>
              <c:when test="${vo.orders_status_idx == 3}">
                <c:set var="badgeClass" value="bg-amber-100 text-amber-600" />
              </c:when>
              <c:when test="${vo.orders_status_idx == 4}">
                <c:set var="badgeClass" value="bg-green-100 text-green-600" />
              </c:when>
              <c:when test="${vo.orders_status_idx == 5}">
                <c:set var="badgeClass" value="bg-gray-100 text-gray-500" />
              </c:when>
            </c:choose>

            <div class="border border-gray-100 rounded-2xl p-6 hover:shadow-md transition-shadow bg-white">
              <!-- 헤더: 날짜/번호/상태/상세보기 -->
              <div class="flex items-center justify-between mb-4 pb-4 border-b border-gray-50">
                <div class="flex items-center gap-4">
                  <span class="font-bold text-lg text-gray-900">
                    ${vo.orders_regdate} 주문
                  </span>
                  <span class="text-sm text-gray-400 font-mono">
                    주문번호 ${vo.orders_idx}
                  </span>
                  <a href="${pageContext.request.contextPath}/orders/detail/${vo.orders_idx}"
                    class="text-[10px] text-gray-400 hover:text-gray-600 hover:underline transition-colors ml-2">
                     상세내역보기 <span class="text-[8px]">〉</span>
                 </a>
                </div>
              </div>
           
           <div class="mb-5 space-y-3">
             <%-- itemMap에서 현재 주문번호(vo.orders_idx)에 해당하는 리스트를 꺼내서 돌림 --%>
             <c:forEach var="oi" items="${itemMap[vo.orders_idx]}">
               <div class="flex items-center gap-4">
                 <img src="${pageContext.request.contextPath}/img/${oi.item.item_thumbnail_img}" 
                      alt="상품" class="w-12 h-12 rounded-lg object-cover bg-gray-50 border border-gray-100">
               
                 <div class="flex-1 min-w-0">
                   <p class="text-sm font-bold text-gray-800 truncate">${oi.item.item_name}</p>
                   <p class="text-xs text-gray-400">
                       ${oi.orders_price_at}원 · ${oi.orders_item_quantity}개
                   </p>
                 </div>
               </div>
             </c:forEach>
           </div>
           
              <!-- 바디: 상태 배지 + 금액/버튼 -->
              <div class="flex flex-col sm:flex-row gap-4 sm:items-center sm:justify-between">
                <div class="flex items-center gap-2">
                  <span class="px-2 py-0.5 rounded text-xs font-bold ${badgeClass}">
                    ${vo.status.orders_status_name}
                  </span>
                </div>

                <div class="flex flex-col sm:flex-row gap-3 sm:items-center sm:justify-end w-full sm:w-auto">
                  <span class="text-lg font-bold text-gray-900 text-right sm:text-left">
                    ${vo.orders_total_price}원
                  </span>

                  <div class="flex flex-wrap gap-2 justify-end">
                    <c:if test="${vo.orders_status_idx == 1}">
                      <button type="button"
                              onclick="location.href='${pageContext.request.contextPath}/orders/pay/${vo.orders_idx}'"
                              class="px-4 py-2 bg-amber-50 text-amber-700 border border-amber-200 rounded-lg text-sm font-bold hover:bg-amber-100">
                        결제하기
                      </button>
                    </c:if>

                    <%-- 오직 '결제대기(1)' 상태일 때만 취소 버튼이 보이게 --%>
               <c:if test="${vo.orders_status_idx < 3}">
                   <button type="button"
                           onclick="if(confirm('정말 취소하시겠습니까?')) { location.href='${pageContext.request.contextPath}/orders/cancel/${vo.orders_idx}?scroll=' + window.scrollY; }"
                           class="px-4 py-2 border border-red-200 rounded-lg text-sm font-bold text-red-500 hover:bg-red-50">
                       주문취소
                   </button>
               </c:if>
               
               <%-- 결제완료(2) 이상이거나 취소(5)된 경우에는 상태만 보여줌 --%>
               <c:if test="${vo.orders_status_idx >= 3}">
                   <span class="px-4 py-2 bg-gray-50 rounded-lg text-sm font-medium text-gray-500">
                       취소 불가
                   </span>
               </c:if>
               
                  
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>

          <c:if test="${empty list}">
            <div class="text-center text-gray-400 py-12 bg-white rounded-2xl border border-gray-100">
              조회된 주문 내역이 없습니다.
            </div>
          </c:if>
        </div>

      </div>
    </section>
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
