<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>펫온 고객센터 | PetOn Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">

    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main">
  <div class="max-w-7xl mx-auto px-4 py-10">

    <!-- Service Header -->
    <section class="bg-white p-8 rounded-3xl border border-gray-100 shadow-sm mb-12 text-center relative overflow-hidden">
      <div class="relative z-10">
        <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-3">고객센터 🎧</h1>
        <p class="text-gray-500 text-sm md:text-base">
          무엇을 도와드릴까요?<br/>
          PetOn은 항상 고객님의 목소리에 귀 기울이고 있습니다.
        </p>
      </div>
      <!-- 장식 -->
      <div class="absolute top-0 left-0 w-32 h-32 bg-amber-100 rounded-full -translate-x-1/2 -translate-y-1/2 opacity-50"></div>
      <div class="absolute bottom-0 right-0 w-40 h-40 bg-blue-100 rounded-full translate-x-1/2 translate-y-1/2 opacity-50"></div>
    </section>

    <!-- Quick Links -->
    <section class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-16">
      <!-- FAQ 카드 -->
      <div class="bg-white p-8 rounded-3xl border border-gray-100 shadow-sm text-center hover:border-amber-300 transition-colors cursor-pointer group">
        <div class="w-16 h-16 bg-amber-100 rounded-full flex items-center justify-center text-amber-500 mx-auto mb-6 group-hover:scale-110 transition-transform text-3xl">
          ❓
        </div>
        <h3 class="font-bold text-xl mb-2">자주 묻는 질문</h3>
        <p class="text-gray-400 text-sm">궁금한 내용을 빠르게 확인하세요</p>
      </div>

      <!-- 1:1 문의 -->
      <div class="bg-white p-8 rounded-3xl border border-gray-100 shadow-sm text-center hover:border-amber-300 transition-colors cursor-pointer group">
        <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center text-blue-500 mx-auto mb-6 group-hover:scale-110 transition-transform text-3xl">
          💬
        </div>
        <h3 class="font-bold text-xl mb-2">1:1 문의하기</h3>
        <p class="text-gray-400 text-sm">로그인 후 상세한 답변을 받아보세요</p>
      </div>

      <!-- 동물병원 찾기 -->
      <div class="bg-white p-8 rounded-3xl border border-gray-100 shadow-sm text-center hover:border-amber-300 transition-colors cursor-pointer group">
        <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center text-green-500 mx-auto mb-6 group-hover:scale-110 transition-transform text-3xl">
          📍
        </div>
        <h3 class="font-bold text-xl mb-2">동물병원 찾기</h3>
        <p class="text-gray-400 text-sm">내 주변 24시 병원을 찾아보세요</p>
      </div>
    </section>

    <!-- FAQ Section -->
    <section class="max-w-3xl mx-auto mb-16">
      <h2 class="text-2xl font-bold mb-8 text-center">자주 묻는 질문 TOP 4</h2>

      <div class="space-y-4">
        <!-- 나중에 c:forEach 로 교체 가능 -->
        <div class="bg-white border border-gray-100 rounded-2xl overflow-hidden">
          <button type="button"
                  class="w-full flex items-center justify-between p-6 text-left font-bold text-gray-800 hover:bg-gray-50 transition-colors">
              <span class="flex items-center gap-3">
                <span class="text-amber-500">Q.</span>
                배송은 얼마나 걸리나요?
              </span>
              <span class="text-gray-400 text-sm">▼</span>
          </button>
          <div class="p-6 pt-0 bg-gray-50 border-t border-gray-100 text-gray-600 text-sm leading-relaxed">
            <span class="font-bold text-gray-800 mr-2">A.</span>
            평일 오후 2시 이전 주문 건은 당일 출고되며, 일반적으로 출고 다음 날 수령 가능합니다. (도서 산간 지역 제외)
          </div>
        </div>

        <div class="bg-white border border-gray-100 rounded-2xl overflow-hidden">
          <button type="button"
                  class="w-full flex items-center justify-between p-6 text-left font-bold text-gray-800 hover:bg-gray-50 transition-colors">
              <span class="flex items-center gap-3">
                <span class="text-amber-500">Q.</span>
                반품/교환은 어떻게 신청하나요?
              </span>
              <span class="text-gray-400 text-sm">▼</span>
          </button>
          <div class="p-6 pt-0 bg-gray-50 border-t border-gray-100 text-gray-600 text-sm leading-relaxed">
            <span class="font-bold text-gray-800 mr-2">A.</span>
            마이페이지 &gt; 주문내역에서 신청 가능합니다. 수령 후 7일 이내에만 가능하며, 단순 변심의 경우 배송비가 발생할 수 있습니다.
          </div>
        </div>

        <div class="bg-white border border-gray-100 rounded-2xl overflow-hidden">
          <button type="button"
                  class="w-full flex items-center justify-between p-6 text-left font-bold text-gray-800 hover:bg-gray-50 transition-colors">
              <span class="flex items-center gap-3">
                <span class="text-amber-500">Q.</span>
                회원 등급별 혜택이 궁금해요.
              </span>
              <span class="text-gray-400 text-sm">▼</span>
          </button>
          <div class="p-6 pt-0 bg-gray-50 border-t border-gray-100 text-gray-600 text-sm leading-relaxed">
            <span class="font-bold text-gray-800 mr-2">A.</span>
            PetOn은 패밀리, VIP, VVIP 3단계 등급제를 운영합니다. 등급별로 적립금 및 무료배송 혜택이 상이하니 '등급 혜택 안내' 페이지를 참고해주세요.
          </div>
        </div>

        <div class="bg-white border border-gray-100 rounded-2xl overflow-hidden">
          <button type="button"
                  class="w-full flex items-center justify-between p-6 text-left font-bold text-gray-800 hover:bg-gray-50 transition-colors">
              <span class="flex items-center gap-3">
                <span class="text-amber-500">Q.</span>
                동물병원 예약은 어떻게 하나요?
              </span>
              <span class="text-gray-400 text-sm">▼</span>
          </button>
          <div class="p-6 pt-0 bg-gray-50 border-t border-gray-100 text-gray-600 text-sm leading-relaxed">
            <span class="font-bold text-gray-800 mr-2">A.</span>
            서비스 &gt; 동물병원 찾기 메뉴에서 원하시는 병원을 선택 후 '예약하기' 버튼을 통해 실시간 예약을 진행할 수 있습니다.
          </div>
        </div>
      </div>
    </section>

    <!-- Contact Info -->
    <section class="bg-gray-900 rounded-3xl p-10 md:p-12 text-white flex flex-col md:flex-row items-center justify-between gap-8 relative overflow-hidden">
      <div className="relative z-10">
        <h2 class="text-2xl font-bold mb-2">고객센터 운영 안내</h2>
        <p class="text-gray-400 mb-6">
          평일 09:00 - 18:00 (점심시간 12:00 - 13:00) / 주말 및 공휴일 휴무
        </p>
        <div class="flex items-center gap-2 text-3xl font-extrabold text-amber-400">
          📞 1588-0000
        </div>
        <div class="mt-3 flex items-center gap-3 text-gray-400 text-sm">
          ✉️ <span>support@peton.com</span>
        </div>
      </div>

      <div class="relative z-10 flex flex-col sm:flex-row gap-4">
        <button class="px-8 py-3 bg-white text-gray-900 rounded-xl font-bold hover:bg-gray-100 transition-colors text-sm">
          카카오톡 상담
        </button>
        <button class="px-8 py-3 border border-gray-600 text-white rounded-xl font-bold hover:bg-gray-800 transition-colors text-sm">
          이메일 문의
        </button>
      </div>

      <!-- 장식용 블러 -->
      <div class="absolute top-0 right-0 w-64 h-64 bg-amber-500 rounded-full blur-3xl opacity-10 pointer-events-none -translate-y-1/2 translate-x-1/2"></div>
    </section>

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
