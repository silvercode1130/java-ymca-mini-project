<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의 이벤트</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body class="bg-gray-50">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="max-w-7xl mx-auto px-4 py-8">

    <!-- Header = 이달의 이벤트 섹션 -->
    <div class="bg-amber-100 rounded-3xl p-8 mb-8 relative overflow-hidden">
        <div class="relative z-10">
            <span class="bg-white text-amber-500 font-bold px-3 py-1 rounded-full text-xs shadow-sm mb-3 inline-block">
                EVENT
            </span>
            <h1 class="text-3xl font-extrabold text-gray-900 mb-3 flex items-center gap-3">
                이달의 이벤트 🎁
            </h1>
            <p class="text-gray-700">
                풍성한 혜택과 즐거움이 가득한 PetOn의 이벤트를 놓치지 마세요!
            </p>
        </div>
        <div class="absolute right-0 bottom-0 opacity-20 pointer-events-none select-none">
            <div class="w-52 h-52 rounded-full border-[6px] border-amber-400 flex items-center justify-center text-6xl text-amber-400 translate-x-10 translate-y-10">
                🎁
            </div>
        </div>
    </div>

    <!-- 로그인 후 돌아올 URL (이벤트 리스트) -->
    <c:set var="returnUrl"
           value='${pageContext.request.contextPath}/event/list.do?page=${page}' />

    <!-- Toolbar: 오른쪽 글쓰기 버튼 -->
    <div class="flex justify-end mb-6">
        <button
            class="flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-lg font-bold hover:bg-gray-800 transition-colors text-sm"
            onclick="
              <c:choose>
                <c:when test='${canWrite}'>
                  location.href='${pageContext.request.contextPath}/event/insert_form.do?page=${page}';
                </c:when>

                <c:when test='${empty sessionScope.user}'>
                  if (confirm('이벤트 등록은 로그인 후 이용 가능합니다.\n로그인 페이지로 이동할까요?')) {
                    location.href='${pageContext.request.contextPath}/member/loginForm.do?reason=need_login&redirect=${fn:escapeXml(returnUrl)}';
                  }
                </c:when>

                <c:otherwise>
                  alert('이벤트 등록 권한이 없습니다.');
                </c:otherwise>
              </c:choose>
            ">
          <span class="text-xs">✏️</span> 글쓰기
        </button>
    </div>

    <!-- Grid: 이벤트 리스트 -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <c:forEach var="b" items="${list}">
            <!-- 제목에 '종료'가 들어가면 종료 상태 -->
            <c:set var="status" value="progress" />
            <c:if test="${fn:contains(b.board_title, '종료')}">
                <c:set var="status" value="end" />
            </c:if>

            <!-- 카드 전체를 링크로 감싸기 -->
            <a href="${pageContext.request.contextPath}/event/view.do?board_idx=${b.board_idx}&page=${page}"
               class="group cursor-pointer bg-white rounded-2xl overflow-hidden border border-gray-100 hover:shadow-xl transition-all block">
                
                <!-- 이미지 영역 -->
                <div class="relative aspect-video bg-gray-100 overflow-hidden">
                    <!-- 썸네일: 없으면 noimage -->
                    <c:choose>
                        <c:when test="${empty b.board_thumbnail}">
                            <img 
                                src="${pageContext.request.contextPath}/img/noimage.png"
                                alt="이벤트 썸네일 없음"
                                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105" />
                        </c:when>
                        <c:otherwise>
                            <img 
                                src="${b.board_thumbnail}"
                                alt="${b.board_title}"
                                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105
                                       <c:out value='${status == "end" ? "grayscale opacity-70" : ""}'/>" />
                        </c:otherwise>
                    </c:choose>

                    <!-- 종료 상태 오버레이 -->
                    <c:if test="${status == 'end'}">
                        <div class="absolute inset-0 bg-black/50 flex items-center justify-center">
                            <span class="text-white font-extrabold text-2xl border-4 border-white px-4 py-2 rounded-xl transform -rotate-12">
                                종료
                            </span>
                        </div>
                    </c:if>

                    <!-- 진행중 뱃지 -->
                    <c:if test="${status == 'progress'}">
                        <div class="absolute top-4 left-4 bg-amber-400 text-white font-bold px-3 py-1 rounded-lg text-sm shadow-md">
                            진행중
                        </div>
                    </c:if>
                </div>

                <!-- 카드 내용 영역 -->
                <div class="p-6">
                    <h3 class="font-bold text-lg text-gray-900 mb-3 group-hover:text-amber-500 transition-colors line-clamp-2">
                        ${b.board_title}
                    </h3>

                    <div class="flex items-center justify-between text-xs text-gray-400 mb-1">
                        <span>
                            <c:choose>
                                <c:when test="${b.writer != null}">
                                    ${b.writer.mem_id}
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </span>
                        <span>${b.boardRegdateFormatted}</span>
                    </div>
                </div>
            </a>
        </c:forEach>

        <c:if test="${empty list}">
            <div class="col-span-full text-center text-gray-400 text-sm py-10">
                진행 중인 이벤트가 없습니다.
            </div>
        </c:if>
    </div>

    <!-- 페이지네이션 -->
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
