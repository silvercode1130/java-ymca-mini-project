<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	    <!-- 로그인 후 돌아올 URL (QnA 리스트) -->
	    <c:set var="returnUrl"
	           value='/qna/list.do?page=${page}&tag=${tag}&searchType=${searchType}&keyword=${fn:escapeXml(keyword)}' />
	
	    <!-- 질문하기 버튼 -->
	    <button type="button"
	            onclick="
	              <c:choose>
	                <c:when test='${canWrite}'>
	                  location.href='${pageContext.request.contextPath}/qna/insert_form.do?type=QNA&page=${page}&tag=${tag}';
	                </c:when>
	
	                <c:when test='${empty sessionScope.user}'>
	                  if (confirm('질문 작성은 로그인 후 이용 가능합니다.\n로그인 페이지로 이동할까요?')) {
	                    location.href='${pageContext.request.contextPath}/member/loginForm.do?reason=need_login&redirect=${fn:escapeXml(returnUrl)}';
	                  }
	                </c:when>
	
	                <c:otherwise>
	                  alert('질문 작성 권한이 없습니다.');
	                </c:otherwise>
	              </c:choose>
	            "
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
                  onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=ALL&page=1&searchType=${searchType}&keyword=${fn:escapeXml(keyword)}'"
                  class="px-4 py-2 rounded-full text-sm font-bold transition-all
                         <c:if test='${empty tag || tag == "ALL"}'>bg-amber-400 text-white</c:if>
                         <c:if test='${!empty tag && tag != "ALL"}'>bg-gray-100 text-gray-500 hover:bg-gray-200</c:if>">
            전체
          </button>
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=DOG&page=1&searchType=${searchType}&keyword=${fn:escapeXml(keyword)}'"
                  class="px-4 py-2 rounded-full text-sm font-bold transition-all
                         <c:if test='${tag == "DOG"}'>bg-blue-100 text-blue-600</c:if>
                         <c:if test='${tag != "DOG"}'>bg-gray-100 text-gray-500 hover:bg-gray-200</c:if>">
            강아지
          </button>
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=CAT&page=1&searchType=${searchType}&keyword=${fn:escapeXml(keyword)}'"
                  class="px-4 py-2 rounded-full text-sm font-bold transition-all
                         <c:if test='${tag == "CAT"}'>bg-pink-100 text-pink-600</c:if>
                         <c:if test='${tag != "CAT"}'>bg-gray-100 text-gray-500 hover:bg-gray-200</c:if>">
            고양이
          </button>
          <button type="button"
                  onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=NONE&page=1&searchType=${searchType}&keyword=${fn:escapeXml(keyword)}'"
                  class="px-4 py-2 rounded-full text-sm font-bold transition-all
                         <c:if test='${tag == "NONE"}'>bg-green-100 text-green-600</c:if>
                         <c:if test='${tag != "NONE"}'>bg-gray-100 text-gray-500 hover:bg-gray-200</c:if>">
            기타/자유
          </button>
        </div>

        <!-- Search -->
        <div class="bg-white border border-gray-200 rounded-xl px-3 py-2 w-full md:w-80">
		  <div class="flex items-center justify-between mb-1">
		    <span class="text-xs font-bold text-gray-600">질문 검색</span>
		    <!-- 전체보기 버튼 -->
		    <button type="button"
		            onclick="location.href='${pageContext.request.contextPath}/qna/list.do?tag=ALL&page=1'"
		            class="text-[11px] px-2 py-0.5 rounded-full border border-gray-200 text-gray-500 hover:bg-gray-100">
		      전체보기
		    </button>
		  </div>
		
		  <form method="get"
		        action="${pageContext.request.contextPath}/qna/list.do"
		        class="flex flex-col gap-2">
		
		    <!-- 태그 유지 -->
		    <input type="hidden" name="tag" value="${empty tag ? 'ALL' : tag}" />
		
		    <div class="flex gap-2">
		      <select name="searchType"
		              class="w-28 text-xs border border-gray-200 rounded-lg px-2 py-2 bg-gray-50 focus:outline-none focus:ring-2 focus:ring-amber-400">
		        <option value="title"
		                <c:if test="${searchType == 'title'}">selected</c:if>>
		          제목
		        </option>
		        <option value="content"
		                <c:if test="${searchType == 'content'}">selected</c:if>>
		          내용
		        </option>
		        <option value="titleContent"
		                <c:if test="${searchType == 'titleContent' || empty searchType}">selected</c:if>>
		          제목+내용
		        </option>
		      </select>
		
		      <div class="relative flex-1">
		        <span class="absolute left-3 top-2.5 text-gray-400 text-sm">🔍</span>
		        <input
		          type="text"
		          name="keyword"
		          value="${keyword}"
		          placeholder="검색어를 입력하세요"
		          class="w-full pl-8 pr-3 py-2 border border-gray-200 rounded-lg text-sm focus:outline-none focus:border-amber-400"
		        />
		      </div>
		
		      <button type="submit"
		              class="px-3 py-2 text-xs font-bold bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors">
		        검색
		      </button>
		    </div>
		  </form>
		</div>

      </div>
    </section>

    <!-- QnA 리스트 (카드 스타일) -->
    <section class="mb-12">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <c:forEach var="b" items="${list}">
          <!-- 작성자: 닉네임 > 아이디 -->
          <c:set var="writerName"
                 value="${empty b.writerProfile.mem_nickname ? b.writer.mem_id : b.writerProfile.mem_nickname}" />

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

            <!-- 내용 요약 -->
            <p class="text-gray-500 text-sm mb-4 line-clamp-2 flex-grow">
              ${b.board_preview}
            </p>

            <div class="flex items-center justify-between pt-4 border-t border-gray-50 mt-auto">
              <span class="text-sm font-bold text-gray-700 truncate">
                <c:choose>
                  <c:when test="${not empty writerName}">
                    ${writerName}
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

    <!-- 페이지네이션 -->
    <section class="flex justify-center mt-6 mb-4">
      <c:if test="${not empty pageMenu}">
        <div class="inline-block">
          <c:out value="${pageMenu}" escapeXml="false" />
        </div>
      </c:if>
    </section>

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
