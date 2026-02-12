<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>QnA | PetOn 커뮤니티</title>
  <%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body class="layout-body bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="max-w-7xl mx-auto px-4 py-8">

    <!-- Header Section -->
    <section class="mb-8">
      <div class="mb-8 bg-blue-50 p-6 rounded-2xl border border-blue-100 flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
        <div>
          <h1 class="text-3xl font-extrabold text-gray-900 mb-2 flex items-center gap-2">
            질문과 답변 (Q&A)
            <span class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-white border border-blue-100 text-blue-500 text-xs font-bold">
              Q
            </span>
          </h1>
          <p class="text-gray-600 text-sm md:text-base">
            궁금한 점을 물어보세요. <strong>수의사 선생님</strong>과 커뮤니티가 함께 도와드립니다.
          </p>
        </div>
        <button type="button"
                onclick="location.href='${pageContext.request.contextPath}/qna/insert_form.do?type=QNA&page=${page}&tag=${tag}'"
                class="px-6 py-3 bg-blue-500 text-white rounded-xl font-bold hover:bg-blue-600 transition-colors shadow-md shadow-blue-200 text-sm">
          질문하기
        </button>
      </div>
    </section>

    <!-- Toolbar: 태그 필터 + 검색 -->
    <section class="mb-6">
      <div class="flex flex-col md:flex-row justify-between items-center gap-4">
        <!-- Filters -->
        <div class="flex gap-2 self-start md:self-auto">
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=ALL&page=${page}'"
                  class="px-4 py-2 rounded-full text-sm font-bold transition-all
                         ${tag == 'ALL' ? 'bg-amber-400 text-white' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'}">
            전체
          </button>
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=DOG&page=${page}'"
                  class="px-4 py-2 rounded-full text-sm font-bold transition-all
                         ${tag == 'DOG' ? 'bg-blue-100 text-blue-600' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'}">
            강아지
          </button>
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=CAT&page=${page}'"
                  class="px-4 py-2 rounded-full text-sm font-bold transition-all
                         ${tag == 'CAT' ? 'bg-pink-100 text-pink-600' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'}">
            고양이
          </button>
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=NONE&page=${page}'"
                  class="px-4 py-2 rounded-full text-sm font-bold transition-all
                         ${tag == 'NONE' ? 'bg-green-100 text-green-600' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'}">
            기타/자유
          </button>
        </div>

        <!-- Search (옵션) -->
        <div class="relative w-full md:w-64">
          <span class="absolute left-3 top-2.5 text-gray-400 text-sm">🔍</span>
          <input
            type="text"
            placeholder="질문 검색 (옵션)"
            class="w-full pl-9 pr-3 py-2 border border-gray-200 rounded-lg text-sm focus:outline-none focus:border-amber-400"
          />
        </div>
      </div>
    </section>

    <!-- QnA 리스트 (카드 스타일) -->
    <section class="mb-12">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <c:forEach var="b" items="${list}">
          <a href="${pageContext.request.contextPath}/qna/view.do?board_idx=${b.board_idx}&page=${page}&tag=${tag}"
             class="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm hover:shadow-md hover:border-amber-200 transition-all cursor-pointer group flex flex-col h-full">
            <div class="flex items-start justify-between mb-3">
              <div class="flex gap-2 items-center">
                <!-- 카테고리 뱃지 -->
                <c:choose>
                  <c:when test="${b.board_tag == 'DOG'}">
                    <span class="text-xs font-bold px-2 py-1 rounded border border-blue-100 text-blue-500 bg-blue-50">
                      강아지
                    </span>
                  </c:when>
                  <c:when test="${b.board_tag == 'CAT'}">
                    <span class="text-xs font-bold px-2 py-1 rounded border border-pink-100 text-pink-500 bg-pink-50">
                      고양이
                    </span>
                  </c:when>
                  <c:otherwise>
                    <span class="text-xs font-bold px-2 py-1 rounded border border-green-100 text-green-500 bg-green-50">
                      기타/자유
                    </span>
                  </c:otherwise>
                </c:choose>
              </div>

              <span class="text-xs text-gray-400">
                ${b.boardRegdateFormatted}
              </span>
            </div>

            <!-- 제목 + 썸네일 유무 -->
            <h3 class="text-lg font-bold text-gray-900 mb-2 group-hover:text-amber-600 transition-colors line-clamp-1 flex items-center gap-2">
              ${b.board_title}
              <c:if test="${not empty b.board_thumbnail}">
                <span class="inline-flex items-center justify-center w-5 h-5 rounded-full bg-gray-100">
                  <span class="text-[11px] text-gray-400">IMG</span>
                </span>
              </c:if>
            </h3>

            <!-- 내용 요약: 필요하면 board_content 일부를 잘라서 넘겨도 됨 -->
            <p class="text-gray-500 text-sm mb-4 line-clamp-2 flex-grow">
              <!-- 간단히 제목만 쓰거나, 서버에서 요약 필드 만들어서 써도 됨 -->
              ${b.board_preview}
            </p>

            <div class="flex items-center justify-between pt-4 border-t border-gray-50 mt-auto">
              <span class="text-sm font-bold text-gray-700">
                <c:choose>
                  <c:when test="${b.writer != null}">
                    ${b.writer.mem_id}
                  </c:when>
                  <c:otherwise>-</c:otherwise>
                </c:choose>
              </span>
              <div class="flex items-center gap-3 text-gray-400 text-xs font-medium">
                <span class="flex items-center gap-1">👁 ${b.board_readhit}</span>
                <!-- 좋아요/댓글 수는 추후 필드 생기면 교체 -->
                <span class="flex items-center gap-1">💬 0</span>
              </div>
            </div>
          </a>
        </c:forEach>

        <c:if test="${empty list}">
          <div class="col-span-full py-12 text-center text-gray-400">
            등록된 질문이 없습니다. 첫 질문의 주인공이 되어보세요!
          </div>
        </c:if>
      </div>
    </section>

    <!-- 페이지네이션: 추후 pageVo에 맞게 구현 -->
    <!-- 예: pageVo.curPage, pageVo.startPage, pageVo.endPage, pageVo.totalPage 등 -->

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
