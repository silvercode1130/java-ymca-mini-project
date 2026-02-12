<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>자유게시판 | PetOn 커뮤니티</title>
  <%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body class="layout-body bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="max-w-7xl mx-auto px-4 py-8">

    <!-- Free Board Header -->
    <section class="mb-12">
      <div class="bg-white rounded-3xl p-8 flex flex-col md:flex-row items-center justify-between gap-8 border border-gray-100 shadow-sm">
        <div>
          <span class="inline-block py-1 px-3 rounded-full bg-amber-50 text-amber-500 font-bold text-sm mb-4 border border-amber-100">
            PetOn Community
          </span>
          <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-3">자유게시판 💬</h1>
          <p class="text-gray-600 text-sm md:text-base">
            소소한 일상부터 정보 공유까지, 반려생활 이야기를 자유롭게 나눠보세요.
          </p>
        </div>

        <!-- 검색 박스 (옵션) -->
        <div class="bg-gray-50 p-5 rounded-2xl border border-gray-100 w-full md:w-80">
          <h3 class="font-bold text-gray-900 mb-3 text-sm">게시글 검색 (옵션)</h3>
          <div class="relative">
            <span class="absolute left-3 top-2.5 text-gray-400 text-base">🔍</span>
            <input
              type="text"
              placeholder="제목 또는 내용 검색 (구현 옵션)"
              class="w-full pl-9 pr-3 py-2 bg-white rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 text-sm"
            />
          </div>
        </div>
      </div>
    </section>

    <!-- Tag Tabs + 글쓰기 버튼 -->
    <section class="mb-8">
      <div class="relative flex justify-center">
        <div class="bg-gray-100 p-1.5 rounded-full flex gap-2">
          <!-- 전체 -->
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/free/list.do?tag=ALL&page=${page}'"
                  class="flex items-center gap-2 px-6 py-2.5 rounded-full font-bold text-sm transition-all
                         <c:if test='${tag == \"ALL\"}'>bg-white text-amber-500 shadow-sm</c:if>
                         <c:if test='${tag != \"ALL\"}'>text-gray-500 hover:text-gray-700</c:if>">
            전체
          </button>
          <!-- 강아지 -->
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/free/list.do?tag=DOG&page=${page}'"
                  class="flex items-center gap-2 px-6 py-2.5 rounded-full font-bold text-sm transition-all
                         <c:if test='${tag == \"DOG\"}'>bg-white text-blue-500 shadow-sm</c:if>
                         <c:if test='${tag != \"DOG\"}'>text-gray-500 hover:text-gray-700</c:if>">
            🐶 강아지
          </button>
          <!-- 고양이 -->
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/free/list.do?tag=CAT&page=${page}'"
                  class="flex items-center gap-2 px-6 py-2.5 rounded-full font-bold text-sm transition-all
                         <c:if test='${tag == \"CAT\"}'>bg-white text-pink-500 shadow-sm</c:if>
                         <c:if test='${tag != \"CAT\"}'>text-gray-500 hover:text-gray-700</c:if>">
            🐱 고양이
          </button>
          <!-- 자유 -->
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/free/list.do?tag=NONE&page=${page}'"
                  class="flex items-center gap-2 px-6 py-2.5 rounded-full font-bold text-sm transition-all
                         <c:if test='${tag == \"NONE\"}'>bg-white text-green-500 shadow-sm</c:if>
                         <c:if test='${tag != \"NONE\"}'>text-gray-500 hover:text-gray-700</c:if>">
            📌 자유
          </button>
        </div>

        <!-- 글쓰기 버튼 -->
        <button type="button"
                onclick="location.href='${pageContext.request.contextPath}/free/insert_form.do?page=${page}&tag=${tag}'"
                class="absolute right-0 top-1/2 -translate-y-1/2 flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-lg font-bold hover:bg-gray-800 transition-colors text-sm">
          <span class="text-xs">✏️</span> 글쓰기
        </button>
      </div>
    </section>

    <!-- 게시글 리스트 (LAB 카드 말고, FREE는 리스트형) -->
    <section class="mb-12">
      <div class="bg-white rounded-2xl border border-gray-100 overflow-hidden shadow-sm">

        <!-- 헤더 (데스크탑) -->
        <div class="hidden md:flex py-3 border-b border-gray-200 bg-gray-50 text-xs font-bold text-gray-500 text-center">
          <div class="w-16">번호</div>
          <div class="w-24">카테고리</div>
          <div class="flex-1 text-left px-4">제목</div>
          <div class="w-24">작성자</div>
          <div class="w-28">작성일</div>
          <div class="w-16">조회</div>
        </div>

        <!-- 리스트 -->
        <div class="divide-y divide-gray-100">
          <c:forEach var="b" items="${list}">
            <c:set var="tagLabel">
              <c:choose>
                <c:when test="${b.board_tag == 'DOG'}">강아지</c:when>
                <c:when test="${b.board_tag == 'CAT'}">고양이</c:when>
                <c:otherwise>자유</c:otherwise>
              </c:choose>
            </c:set>

            <a href="${pageContext.request.contextPath}/free/view.do?board_idx=${b.board_idx}&page=${page}&tag=${tag}"
               class="block flex flex-col md:flex-row md:items-center py-4 md:py-3 hover:bg-amber-50/40 transition-colors cursor-pointer group">

              <!-- 모바일 상단: 카테고리 + 날짜 -->
              <div class="md:hidden flex justify-between items-center mb-1 px-4">
                <span class="text-[10px] font-bold px-1.5 py-0.5 rounded
                             <c:choose>
                               <c:when test='${b.board_tag == \"DOG\"}'>bg-blue-50 text-blue-500</c:when>
                               <c:when test='${b.board_tag == \"CAT\"}'>bg-pink-50 text-pink-500</c:when>
                               <c:otherwise>bg-green-50 text-green-500</c:otherwise>
                             </c:choose>">
                  ${tagLabel}
                </span>
                <span class="text-xs text-gray-400">
                  ${b.boardRegdateFormatted}
                </span>
              </div>

              <!-- 번호 (데스크탑) -->
              <div class="hidden md:block w-16 text-center text-sm text-gray-400">
                ${b.board_idx}
              </div>

              <!-- 카테고리 (데스크탑) -->
              <div class="hidden md:flex w-24 justify-center">
                <span class="text-xs font-bold px-2 py-0.5 rounded border
                             <c:choose>
                               <c:when test='${b.board_tag == \"DOG\"}'>border-blue-100 text-blue-500 bg-blue-50</c:when>
                               <c:when test='${b.board_tag == \"CAT\"}'>border-pink-100 text-pink-500 bg-pink-50</c:when>
                               <c:otherwise>border-green-100 text-green-500 bg-green-50</c:otherwise>
                             </c:choose>">
                  ${tagLabel}
                </span>
              </div>

              <!-- 제목 + 썸네일 아이콘 -->
              <div class="flex-1 px-4 min-w-0">
                <div class="flex items-center gap-2">
                  <h3 class="text-sm md:text-base font-medium text-gray-900 group-hover:text-amber-600 truncate">
                    ${b.board_title}
                  </h3>
                  <!-- 썸네일이 있으면 이미지 아이콘 표시 -->
                  <c:if test="${not empty b.board_thumbnail}">
                    <span class="inline-flex items-center justify-center w-5 h-5 rounded-full bg-gray-100">
                      <span class="text-[11px] text-gray-400">IMG</span>
                    </span>
                  </c:if>
                </div>
              </div>

              <!-- 작성자 / 날짜 / 조회수 -->
              <div class="flex justify-between items-center px-4 md:px-0 mt-1 md:mt-0">
                <div class="md:w-24 md:text-center text-sm text-gray-600">
                  <c:choose>
                    <c:when test="${b.writer != null}">
                      ${b.writer.mem_id}
                    </c:when>
                    <c:otherwise>-</c:otherwise>
                  </c:choose>
                </div>
                <div class="hidden md:block w-28 text-center text-xs text-gray-400">
                  ${b.boardRegdateFormatted}
                </div>
                <div class="flex items-center gap-1 md:w-16 md:justify-center text-xs text-gray-400">
                  ${b.board_readhit}
                </div>
              </div>
            </a>
          </c:forEach>

          <c:if test="${empty list}">
            <div class="py-12 text-center text-gray-400 text-sm">
              등록된 게시글이 없습니다.
            </div>
          </c:if>
        </div>
      </div>
    </section>

    <!-- 페이지네이션: 기존 페이징 변수에 맞게 교체해서 사용 -->
    <!-- 예시: pageVo.curPage / startPage / endPage / totalPage 이런 구조라면 여기서 JSTL로 렌더링 -->

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
