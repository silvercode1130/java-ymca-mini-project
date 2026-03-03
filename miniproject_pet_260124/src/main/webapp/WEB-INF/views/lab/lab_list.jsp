<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>펫온 연구소 | PetOn Laboratory</title>
  <%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body class="layout-body bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="max-w-7xl mx-auto px-4 py-8">

    <!-- Lab Header -->
	<section class="mb-12">
	  <div class="bg-amber-50 rounded-3xl p-8 flex flex-col md:flex-row items-center justify-between gap-8 border border-amber-100 shadow-sm">
	    <div>
	      <span class="inline-block py-1 px-3 rounded-full bg-white text-amber-500 font-bold text-sm mb-4 border border-amber-200">
	        PetOn Laboratory
	      </span>
	      <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-2">반려동물 연구소 🧪</h1>
	      <p class="text-gray-600 text-sm md:text-base">
	        수의사와 반려동물 전문가들이 직접 검증한 믿을 수 있는 정보.<br/>
	        우리 아이의 건강하고 행복한 삶을 위한 연구 결과를 확인하세요.
	      </p>
	    </div>
	
	    <!-- 검색 박스 (free 스타일) -->
	    <div class="bg-gray-50 p-5 rounded-2xl border border-gray-100 w-full md:w-80">
	      <div class="flex items-center justify-between mb-2">
	        <h3 class="font-bold text-gray-900 text-sm">연구 내용 검색</h3>
	        <!-- 전체보기 버튼 -->
	        <button type="button"
	                onclick="location.href='${pageContext.request.contextPath}/lab/list.do?tag=ALL&page=1'"
	                class="text-[11px] px-2 py-0.5 rounded-full border border-gray-200 text-gray-500 hover:bg-gray-100">
	          전체보기
	        </button>
	      </div>
	
	      <form method="get"
	            action="${pageContext.request.contextPath}/lab/list.do"
	            class="space-y-2">
	
	        <!-- 태그 유지 -->
	        <input type="hidden" name="tag" value="${empty tag ? 'ALL' : tag}" />
	
	        <!-- 검색 타입 -->
	        <select name="searchType"
	                class="w-full text-xs border border-gray-200 rounded-lg px-2 py-1.5 bg-white focus:outline-none focus:ring-2 focus:ring-amber-400">
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
	
	        <!-- 검색어 -->
	        <div class="relative">
	          <span class="absolute left-3 top-2.5 text-gray-400 text-base">🔍</span>
	          <input
	            type="text"
	            name="keyword"
	            value="${keyword}"
	            placeholder="예: 분리불안, 사료 추천"
	            class="w-full pl-9 pr-3 py-2 bg-white rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 text-sm"
	          />
	        </div>
	
	        <button type="submit"
	                class="w-full mt-1 py-1.5 text-xs font-bold bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors">
	          검색
	        </button>
	      </form>
	    </div>
	  </div>
	</section>


    <!-- Category Tabs + 글쓰기 버튼 -->
	<section class="mb-12">
	  <div class="relative flex justify-center">
	    <div class="bg-gray-100 p-1.5 rounded-full flex gap-2">
	      <!-- 전체 연구 -->
	      <button type="button"
	              onclick="location.href='${pageContext.request.contextPath}/lab/list.do?tag=ALL&page=${page}'"
	              class="flex items-center gap-2 px-6 py-3 rounded-full font-bold text-sm transition-all
	                     <c:if test='${tag == "ALL"}'>bg-white text-amber-500 shadow-sm</c:if>
	                     <c:if test='${tag != "ALL"}'>text-gray-500 hover:text-gray-700</c:if>">
	        🧪 전체 연구
	      </button>
	      <!-- 강아지 연구소 -->
	      <button type="button"
	              onclick="location.href='${pageContext.request.contextPath}/lab/list.do?tag=DOG&page=${page}'"
	              class="flex items-center gap-2 px-6 py-3 rounded-full font-bold text-sm transition-all
	                     <c:if test='${tag == "DOG"}'>bg-white text-amber-500 shadow-sm</c:if>
	                     <c:if test='${tag != "DOG"}'>text-gray-500 hover:text-gray-700</c:if>">
	        🐶 강아지 연구소
	      </button>
	      <!-- 고양이 연구소 -->
	      <button type="button"
	              onclick="location.href='${pageContext.request.contextPath}/lab/list.do?tag=CAT&page=${page}'"
	              class="flex items-center gap-2 px-6 py-3 rounded-full font-bold text-sm transition-all
	                     <c:if test='${tag == "CAT"}'>bg-white text-amber-500 shadow-sm</c:if>
	                     <c:if test='${tag != "CAT"}'>text-gray-500 hover:text-gray-700</c:if>">
	        🐱 고양이 연구소
	      </button>
	    </div>
	
	    <!-- 로그인 후 돌아올 URL (연구소 리스트) -->
	    <c:set var="returnUrl"
	           value='/lab/list.do?page=${page}&tag=${tag}&searchType=${searchType}&keyword=${fn:escapeXml(keyword)}' />
	
	    <!-- 글쓰기 버튼: /lab/insert_form.do -->
	    <button type="button"
	            onclick="
	              <c:choose>
	                <c:when test='${canWrite}'>
	                  location.href='${pageContext.request.contextPath}/lab/insert_form.do?page=${page}&tag=${tag}';
	                </c:when>
	
	                <c:when test='${empty sessionScope.user}'>
	                  if (confirm('연구소 글쓰기는 로그인 후 이용 가능합니다.\n로그인 페이지로 이동할까요?')) {
	                    location.href='${pageContext.request.contextPath}/member/loginForm.do?reason=need_login&redirect=${fn:escapeXml(returnUrl)}';
	                  }
	                </c:when>
	
	                <c:otherwise>
	                  alert('작성 권한이 없습니다.');
	                </c:otherwise>
	              </c:choose>
	            "
	            class="absolute right-0 top-1/2 -translate-y-1/2 flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-lg font-bold hover:bg-gray-800 transition-colors text-sm">
	      <span class="text-xs">✏️</span> 글쓰기
	    </button>
	
	  </div>
	</section>

	<c:if test="${tag == 'ALL' and empty keyword}">
    <!-- 오늘의 추천 연구 (정적 1건) -->
    <section class="mb-16">
      <h2 class="text-2xl font-bold mb-6 flex items-center gap-2">
        <span class="w-2 h-8 bg-amber-400 rounded-sm"></span>
        오늘의 추천 연구
      </h2>

      <a href="${pageContext.request.contextPath}/lab/view.do?board_idx=105&page=1&tag=ALL"
         class="grid grid-cols-1 md:grid-cols-2 gap-8 bg-white rounded-3xl overflow-hidden border border-gray-100 shadow-sm hover:shadow-md transition-shadow cursor-pointer group">
        <div class="h-64 md:h-auto overflow-hidden">
          <img
            src="https://images.unsplash.com/photo-1701513519108-b0a234f26161?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080"
            alt="반려견 건강검진, 몇 살부터 시작해야 할까요?"
            class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
          />
        </div>
        <div class="p-8 flex flex-col justify-center">
          <div class="flex gap-2 mb-4">
            <span class="bg-amber-100 text-amber-700 font-bold px-3 py-1 rounded-full text-xs">건강</span>
            <span class="bg-gray-100 text-gray-600 font-bold px-3 py-1 rounded-full text-xs flex items-center gap-1">
              🐶 강아지
            </span>
          </div>
          <h3 class="text-2xl md:text-3xl font-extrabold text-gray-900 mb-4 leading-tight group-hover:text-amber-500 transition-colors">
            반려견 건강검진, 몇 살부터 시작해야 할까요?
          </h3>
          <p class="text-gray-500 mb-6 line-clamp-2">
            많은 보호자들이 궁금해하는 건강검진 시기와 항목. 연령별 필수 검진 항목과
            주의사항을 수의학 전문의가 상세하게 알려드립니다. 조기 발견이 장수의 지름길입니다.
          </p>
          <div class="flex items-center justify-between mt-auto">
            <div class="flex items-center gap-2">
              <div class="w-8 h-8 rounded-full bg-gray-200"></div>
              <span class="text-sm font-bold text-gray-700">김하림 수의사</span>
            </div>
            <span class="text-sm text-gray-400">2026.01.30</span>
          </div>
        </div>
      </a>
    </section>
    </c:if>

    <!-- 연구 리스트 -->
    <section class="mb-12">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <c:forEach var="vo" items="${list}">
          <a href="${pageContext.request.contextPath}/lab/view.do?board_idx=${vo.board_idx}&page=${page}&tag=${tag}"
             class="bg-white rounded-2xl border border-gray-100 overflow-hidden hover:shadow-lg transition-all group cursor-pointer">
            <article>
              <!-- 썸네일: 없으면 noimage -->
			<div class="h-48 bg-gray-100 relative overflow-hidden">
			  <c:choose>
			    <c:when test="${empty vo.board_thumbnail}">
			      <img
			        src="${pageContext.request.contextPath}/img/noimage.png"
			        alt="${vo.board_title}"
			        class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
			    </c:when>
			    <c:otherwise>
			      <img
			        src="${vo.board_thumbnail}"
			        alt="${vo.board_title}"
			        class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
			    </c:otherwise>
			  </c:choose>
			
			  <!-- 태그 뱃지 -->
			  <div class="absolute top-4 left-4">
			    <c:choose>
			      <c:when test="${vo.board_tag == 'DOG'}">
			        <span class="bg-white/90 backdrop-blur-sm text-blue-600 font-extrabold px-3 py-1 rounded-lg text-xs flex items-center gap-1 shadow-sm">
			          🐶 DOG
			        </span>
			      </c:when>
			      <c:when test="${vo.board_tag == 'CAT'}">
			        <span class="bg-white/90 backdrop-blur-sm text-pink-500 font-extrabold px-3 py-1 rounded-lg text-xs flex items-center gap-1 shadow-sm">
			          🐱 CAT
			        </span>
			      </c:when>
			      <c:otherwise>
			        <span class="bg-white/90 backdrop-blur-sm text-gray-600 font-extrabold px-3 py-1 rounded-lg text-xs flex items-center gap-1 shadow-sm">
			          📌 ETC
			        </span>
			      </c:otherwise>
			    </c:choose>
			  </div>
			</div>

              <!-- 카드 본문 -->
              <div class="p-6">
                <span class="text-amber-500 text-xs font-bold mb-2 block">
                  연구소
                </span>
                <h4 class="font-bold text-lg text-gray-900 mb-3 line-clamp-2 group-hover:text-amber-600 transition-colors">
                  <c:out value="${vo.board_title}" />
                </h4>
                <div class="flex items-center justify-between border-t border-gray-100 pt-4 mt-4">
                  <span class="text-xs text-gray-500 font-medium">
                    <c:out value="${vo.writer.mem_name}" />
                  </span>
                  <span class="text-xs text-gray-400">
                    <c:out value="${vo.boardRegdateFormatted}" />
                  </span>
                </div>
              </div>
            </article>
          </a>
        </c:forEach>

        <c:if test="${empty list}">
          <p class="col-span-full text-center text-sm text-gray-400 py-10">
            등록된 연구가 없습니다.
          </p>
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