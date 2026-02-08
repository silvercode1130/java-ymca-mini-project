<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <title>펫온 로그인 | PetOn Login</title>
</head>
<body class="layout-body bg-amber-50/50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="min-h-[calc(100vh-160px)] flex items-center justify-center px-4 py-12">
    <div class="bg-white rounded-3xl shadow-xl p-8 w-full max-w-md border border-amber-100">

      <!-- 상단 아이콘/타이틀 -->
      <div class="text-center mb-8">
        <div class="w-12 h-12 bg-amber-400 rounded-full flex items-center justify-center text-white mx-auto mb-4 shadow-md text-xl">
          👤
        </div>
        <h2 class="text-2xl font-extrabold text-gray-900">로그인</h2>
        <p class="text-gray-500 text-sm mt-1">PetOn에 오신 것을 환영합니다!</p>
      </div>

      <!-- 로그인 폼 -->
      <form action="${pageContext.request.contextPath}/member/login.do"
            method="post"
            class="space-y-6">

        <div class="space-y-4">
          <!-- 아이디 -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-1">아이디</label>
            <div class="relative">
              <input
                type="text"
                name="mem_id"
                placeholder="아이디를 입력해주세요"
                class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                       focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all pl-11"
                required
              />
              <span class="absolute left-3 top-3.5 text-gray-400 text-sm">ID</span>
            </div>
          </div>

          <!-- 비밀번호 -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-1">비밀번호</label>
            <div class="relative">
              <input
                type="password"
                name="mem_pwd"
                id="loginPassword"
                placeholder="비밀번호를 입력해주세요"
                class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                       focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all pl-11 pr-11"
                required
              />
              <span class="absolute left-3 top-3.5 text-gray-400 text-sm">🔒</span>
              <!-- 비밀번호 보이기 토글 -->
              <button type="button"
                      class="absolute right-3 top-3.5 text-gray-400 hover:text-gray-600 text-sm"
                      onclick="const pw=document.getElementById('loginPassword'); pw.type = pw.type==='password' ? 'text' : 'password';">
                보이기
              </button>
            </div>
          </div>
        </div>

        <!-- 로그인 버튼 -->
        <button
          type="submit"
          class="w-full py-4 rounded-xl font-bold text-lg shadow-md
                 bg-amber-400 text-white hover:bg-amber-500 hover:shadow-lg
                 transition-all transform active:scale-95"
        >
          로그인
        </button>

        <!-- 하단 링크 -->
        <div class="flex items-center justify-center gap-4 text-sm text-gray-500">
          <button type="button" class="hover:text-amber-500 font-medium">
            아이디 찾기
          </button>
          <span class="w-px h-3 bg-gray-300"></span>
          <button type="button" class="hover:text-amber-500 font-medium">
            비밀번호 찾기
          </button>
          <span class="w-px h-3 bg-gray-300"></span>
          <button type="button"
                  class="hover:text-amber-500 font-medium"
                  onclick="location.href='${pageContext.request.contextPath}/member/join_form.do'">
            회원가입
          </button>
        </div>

        <!-- 에러 메시지 영역 (로그인 실패 시) -->
        <c:if test="${not empty loginError}">
          <p class="mt-2 text-center text-sm text-red-500 font-medium">
            <c:out value="${loginError}" />
          </p>
        </c:if>
      </form>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script>

</script>
</body>
</html>
