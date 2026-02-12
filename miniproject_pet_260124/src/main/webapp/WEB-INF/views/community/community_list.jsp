<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>펫온 커뮤니티 | PetOn Community</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
  
  <!-- Tailwind CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="max-w-7xl mx-auto px-4 py-8">

  <!-- Community Header -->
  <div class="bg-white p-8 rounded-3xl border border-gray-100 shadow-sm mb-8 text-center relative overflow-hidden">
    <div class="relative z-10">
      <h1 class="text-3xl font-extrabold text-gray-900 mb-3">PetOn 커뮤니티 🗣️</h1>
      <p class="text-gray-500">
        궁금한 점을 묻고, 즐거운 일상을 공유해보세요.<br/>
        수의사 선생님들의 전문적인 답변도 받을 수 있어요.
      </p>
    </div>
    <!-- Simple decoration -->
    <div class="absolute top-0 left-0 w-32 h-32 bg-amber-100 rounded-full -translate-x-1/2 -translate-y-1/2 opacity-50"></div>
    <div class="absolute bottom-0 right-0 w-40 h-40 bg-blue-100 rounded-full translate-x-1/2 translate-y-1/2 opacity-50"></div>
  </div>

  <!-- Board Tabs -->
  <div class="flex items-center justify-between mb-6">
    <div class="flex gap-2">
      <!-- QnA 탭 -->
      <button 
        class="px-6 py-3 rounded-xl font-bold transition-all bg-amber-400 text-white shadow-md">
        질문과 답변 (Q&A)
      </button>
      <!-- 자유게시판 탭 -->
      <button 
        class="px-6 py-3 rounded-xl font-bold transition-all bg-white text-gray-500 hover:bg-gray-50 border border-gray-100">
        자유게시판
      </button>
    </div>
	
	
    <button class="flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-lg font-bold hover:bg-gray-800 transition-colors text-sm"
    		onclick="location.href='${pageContext.request.contextPath}/free/insert_form.do?page=${page}&tag=${tag}'">
      <!-- 아이콘은 일단 텍스트로 대체 -->
      <span class="text-xs">✏️</span> 글쓰기
    </button>
	</a>
  </div>

  <!-- Post List -->
  <div class="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
    <div class="divide-y divide-gray-100">

      <!-- 여기부터 한 줄이 게시글 하나 (나중에 c:forEach로 반복 예정) -->
      <div class="p-6 hover:bg-amber-50/30 transition-colors cursor-pointer group">
        <div class="flex items-start gap-4">
          <!-- Pet Badge -->
          <div class="mt-1 flex-shrink-0 w-12 h-12 rounded-xl flex items-center justify-center text-xl shadow-sm bg-blue-50 text-blue-500">
            🐶
          </div>

          <div class="flex-1 min-w-0">
            <div class="flex items-center gap-2 mb-1">
              <span class="text-xs font-bold px-2 py-0.5 rounded border border-blue-100 text-blue-500 bg-blue-50">
                강아지
              </span>
              <span class="flex items-center gap-1 text-xs font-bold px-2 py-0.5 rounded bg-green-100 text-green-700 border border-green-200">
                🏅 수의사 답변
              </span>
              <span class="text-xs text-gray-400 ml-auto">방금 전</span>
            </div>

            <h3 class="text-lg font-bold text-gray-900 mb-2 group-hover:text-amber-600 transition-colors truncate">
              강아지가 산책 중에 자꾸 주저앉아요. 관절 문제일까요?
            </h3>
            <p class="text-gray-500 text-sm mb-4 overflow-hidden text-ellipsis whitespace-nowrap">
              5살 푸들인데 요즘 들어 산책을 나가면 10분도 안돼서...
            </p>

            <div class="flex items-center justify-between">
              <span class="text-sm font-medium text-gray-700">초코맘</span>
              <div class="flex items-center gap-4 text-gray-400 text-xs font-medium">
                <span class="flex items-center gap-1">👁 12</span>
                <span class="flex items-center gap-1">❤️ 0</span>
                <span class="flex items-center gap-1">💬 2</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 게시글 없을 때 -->
      <%-- 
      <c:if test="${empty postList}">
        <div class="p-12 text-center text-gray-400">
          게시글이 없습니다. 첫 번째 글을 작성해보세요!
        </div>
      </c:if>
      --%>

    </div>
  </div>

  <!-- Pagination -->
  <div class="flex justify-center mt-8">
    <div class="flex gap-1">
      <button class="px-3 py-2 text-gray-400 hover:text-amber-500 disabled:opacity-50">이전</button>
      <button class="w-8 h-8 rounded-lg bg-amber-400 text-white font-bold">1</button>
      <button class="w-8 h-8 rounded-lg hover:bg-gray-100 text-gray-600 font-medium">2</button>
      <button class="w-8 h-8 rounded-lg hover:bg-gray-100 text-gray-600 font-medium">3</button>
      <button class="px-3 py-2 text-gray-400 hover:text-amber-500">다음</button>
    </div>
  </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>