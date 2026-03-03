<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지 | PetOn</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body class="bg-gray-50 layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main max-w-7xl mx-auto px-4 py-8">
  <div class="flex flex-col md:flex-row gap-8">

    <!-- Sidebar -->
    <aside class="w-full md:w-64 flex-shrink-0">
      <div class="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 sticky top-24">
        <h2 class="text-xl font-extrabold text-gray-900 mb-6 px-2">마이페이지</h2>

        <nav class="flex flex-row md:flex-col gap-2 overflow-x-auto md:overflow-visible pb-4 md:pb-0">
          <!-- 나의 프로필 -->
          <a href="${pageContext.request.contextPath}/profile/myProfile.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap
                    bg-amber-50 text-amber-600 font-bold">
            <span class="text-amber-500">👤</span>
            <span class="flex-1 text-left">나의 프로필</span>
          </a>

          <!-- 마이펫 -->
          <a href="${pageContext.request.contextPath}/profile/petProfile_form.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap
                    text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">💗</span>
            <span class="flex-1 text-left">마이펫</span>
          </a>

          <!-- 나의 주문 -->
          <a href="${pageContext.request.contextPath}/orders/list"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap
                    text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">📦</span>
            <span class="flex-1 text-left">나의 주문</span>
          </a>

          <!-- 회원정보수정 -->
          <a href="${pageContext.request.contextPath}/profile/myInfo.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap
                    text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">⚙️</span>
            <span class="flex-1 text-left">회원정보수정</span>
          </a>
        </nav>
      </div>
    </aside>

    <!-- 오른쪽 영역: 현재는 더미, 각 URL에서는 자기 JSP가 전체를 채움 -->
    <section class="flex-1 min-w-0">
      <div class="bg-white rounded-3xl border border-gray-100 p-8 shadow-sm">
        <h1 class="text-2xl font-bold text-gray-900 mb-2">나의 프로필</h1>
        <p class="text-gray-500 text-sm">
          이 화면은 마이페이지의 기본 진입 화면이야.  
          실제 프로필 상세 내용은 <code>profile/myProfile.jsp</code>에서 구현돼.
        </p>
      </div>
    </section>

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
