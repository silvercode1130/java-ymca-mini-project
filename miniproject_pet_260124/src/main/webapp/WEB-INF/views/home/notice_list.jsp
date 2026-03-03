<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body class="bg-gray-50">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="max-w-7xl mx-auto px-4 py-8">

    <!-- Header -->
    <div class="bg-gray-900 rounded-3xl p-8 mb-8 text-white relative overflow-hidden">
        <div class="relative z-10">
            <h1 class="text-3xl font-extrabold mb-3 flex items-center gap-3">
                <span class="inline-flex items-center justify-center w-9 h-9 rounded-full bg-amber-400 text-gray-900 font-bold text-lg">
                    !
                </span>
                공지사항
            </h1>
            <p class="text-gray-300">
                PetOn의 새로운 소식과 중요한 안내사항을 확인하세요.
            </p>
        </div>
    </div>

    <!-- 로그인 후 돌아올 URL (공지 리스트) -->
    <c:set var="returnUrl"
           value='${pageContext.request.contextPath}/notice/list.do?page=${page}' />

    <!-- 상단 툴바: 태그 필터 + 글쓰기 버튼 -->
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-4">

        <!-- 태그 필터 -->
        <form method="get" action="list.do" class="flex flex-wrap items-center gap-2">
            <div class="flex rounded-xl bg-gray-100 p-1">
                <button type="submit" name="tag" value="ALL"
                        class="px-4 py-2 text-sm font-bold rounded-lg
                        <c:out value='${tag == "ALL" ? "bg-gray-900 text-white" : "text-gray-700"}'/>">
                    전체
                </button>
            </div>
        </form>

        <!-- 글쓰기 버튼만 -->
        <div class="flex items-center gap-3 w-full md:w-auto justify-end">
            <button
                type="button"
                onclick="
                  <c:choose>
                    <c:when test='${canWrite}'>
                      location.href='${pageContext.request.contextPath}/notice/insert_form.do?page=${page}';
                    </c:when>

                    <c:when test='${empty sessionScope.user}'>
                      if (confirm('공지 등록은 로그인 후 이용 가능합니다.\n로그인 페이지로 이동할까요?')) {
                        location.href='${pageContext.request.contextPath}/member/loginForm.do?reason=need_login&redirect=${fn:escapeXml(returnUrl)}';
                      }
                    </c:when>

                    <c:otherwise>
                      alert('공지 등록 권한이 없습니다.');
                    </c:otherwise>
                  </c:choose>
                "
                class="flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-lg font-bold hover:bg-gray-800 transition-colors text-sm"
            >
                <span class="text-xs">✏️</span> 글쓰기
            </button>
        </div>
    </div>

    <!-- List -->
    <div class="bg-white rounded-2xl border border-gray-200 overflow-hidden">
        <!-- 헤더 -->
        <div class="hidden md:grid grid-cols-12 gap-4 px-4 py-3 bg-gray-50 text-xs font-bold text-gray-500 border-b border-gray-200">
            <div class="col-span-1 text-center">번호</div>
            <div class="col-span-2 text-center">태그</div>
            <div class="col-span-6">제목</div>
            <div class="col-span-1 text-center">작성자</div>
            <div class="col-span-1 text-center">조회수</div>
            <div class="col-span-1 text-center">등록일</div>
        </div>

        <!-- 본문 리스트 -->
        <c:forEach var="b" items="${list}">
            <a href="${pageContext.request.contextPath}/notice/view.do?board_idx=${b.board_idx}&page=${page}"
               class="block">
                <div
                    class="grid grid-cols-12 gap-4 items-center px-4 py-4 border-b border-gray-100
                           cursor-pointer hover:bg-gray-50 text-sm">
                    <!-- 번호 -->
                    <div class="col-span-2 md:col-span-1 text-xs md:text-sm text-gray-400 text-center">
                        ${b.board_idx}
                    </div>

                    <!-- 태그 -->
                    <div class="col-span-3 md:col-span-2 flex justify-center">
                        <span class="inline-flex items-center px-2 py-1 rounded-md text-[11px] font-bold
                               <c:choose>
                                   <c:when test='${b.board_tag == "DOG"}'>bg-amber-100 text-amber-700</c:when>
                                   <c:when test='${b.board_tag == "CAT"}'>bg-blue-100 text-blue-700</c:when>
                                   <c:when test='${b.board_tag == "NONE"}'>bg-gray-100 text-gray-600</c:when>
                                   <c:otherwise>bg-gray-100 text-gray-600</c:otherwise>
                               </c:choose>">
                            <c:choose>
                                <c:when test="${b.board_tag == 'DOG'}">강아지</c:when>
                                <c:when test="${b.board_tag == 'CAT'}">고양이</c:when>
                                <c:when test="${b.board_tag == 'NONE'}">자유</c:when>
                                <c:otherwise>${b.board_tag}</c:otherwise>
                            </c:choose>
                        </span>
                    </div>

                    <!-- 제목 -->
                    <div class="col-span-7 md:col-span-6 min-w-0">
                        <div class="truncate font-medium text-gray-800">
                            ${b.board_title}
                        </div>
                    </div>

                    <!-- 작성자 -->
                    <div class="hidden md:block md:col-span-1 text-center text-gray-500 text-xs md:text-sm">
                        <c:choose>
                            <c:when test="${b.writer != null}">
                                ${b.writer.mem_id}
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </div>

                    <!-- 조회수 -->
                    <div class="hidden md:block md:col-span-1 text-center text-gray-400 text-xs md:text-sm">
                        ${b.board_readhit}
                    </div>

                    <!-- 등록일 -->
                    <div class="col-span-2 md:col-span-1 text-right md:text-center text-gray-400 text-xs md:text-sm">
                        ${b.boardRegdateFormatted}
                    </div>
                </div>
            </a>
        </c:forEach>

        <c:if test="${empty list}">
            <div class="px-4 py-10 text-center text-gray-400 text-sm">
                등록된 공지사항이 없습니다.
            </div>
        </c:if>
    </div>

    <!-- Pagination -->
    <section class="flex justify-center mt-8 mb-4">
      <c:if test="${not empty pageMenu}">
        <div class="inline-block">
          <c:out value="${pageMenu}" escapeXml="false" />
        </div>
      </c:if>
    </section>

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
