<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/views/common/head.jsp" %>
  <title>${vo.board_title} | PetOn 커뮤니티</title>
</head>
<body class="layout-body bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="max-w-4xl mx-auto px-4 py-8">

    <!-- Breadcrumb -->
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-6 font-medium">
      <a href="${pageContext.request.contextPath}/community"
         class="cursor-pointer hover:text-amber-500">
        커뮤니티
      </a>
      <span class="text-gray-400">&gt;</span>
      <span class="text-gray-900">
        <c:choose>
            <c:when test="${vo.boardType.board_type_code == 'NOTICE'}">공지사항</c:when>
            <c:when test="${vo.boardType.board_type_code == 'EVENT'}">이벤트</c:when>
            <c:when test="${vo.boardType.board_type_code == 'LAB'}">연구소</c:when>
            <c:when test="${vo.boardType.board_type_code == 'QNA'}">QnA</c:when>
            <c:when test="${vo.boardType.board_type_code == 'FREE'}">자유게시판</c:when>
            <c:otherwise>게시판</c:otherwise>
        </c:choose>
      </span>
    </div>

    <!-- 게시글 상단 -->
    <div class="bg-white rounded-t-3xl border-x border-t border-gray-100 p-8 pb-4">
      <span class="inline-block bg-amber-50 text-amber-600 font-bold px-3 py-1 rounded-full text-xs mb-3">
        <c:choose>
            <c:when test="${vo.boardType.board_type_code == 'NOTICE'}">공지사항</c:when>
            <c:when test="${vo.boardType.board_type_code == 'EVENT'}">이벤트</c:when>
            <c:when test="${vo.boardType.board_type_code == 'LAB'}">연구소</c:when>
            <c:when test="${vo.boardType.board_type_code == 'QNA'}">QnA</c:when>
            <c:when test="${vo.boardType.board_type_code == 'FREE'}">자유게시판</c:when>
            <c:otherwise>게시판</c:otherwise>
        </c:choose>
      </span>

      <h1 class="text-2xl md:text-3xl font-extrabold text-gray-900 mb-6 leading-tight">
        <c:out value="${vo.board_title}" />
      </h1>

      <div class="flex items-center justify-between border-b border-gray-50 pb-4">
        <div class="flex items-center gap-3">
          <div class="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center text-gray-400">
            👤
          </div>
          <div>
            <div class="flex items-center gap-2">
              <span class="font-bold text-gray-900 text-sm">
                <c:out value="${vo.mem_name}" />
              </span>
              <!-- 역할 뱃지 -->
              <c:choose>
                <c:when test="${vo.mem_role == 'VET'}">
                  <span class="bg-green-100 text-green-700 text-[10px] font-bold px-1.5 py-0.5 rounded border border-green-200">수의사</span>
                </c:when>
                <c:when test="${vo.mem_role == 'ADMIN'}">
                  <span class="bg-red-100 text-red-700 text-[10px] font-bold px-1.5 py-0.5 rounded border border-red-200">관리자</span>
                </c:when>
                <c:otherwise>
                  <span class="bg-gray-100 text-gray-600 text-[10px] font-bold px-1.5 py-0.5 rounded border border-gray-200">회원</span>
                </c:otherwise>
              </c:choose>
            </div>
            <div class="flex items-center gap-2 text-xs text-gray-400">
              <span><fmt:formatDate value="${vo.board_regdate}" pattern="yyyy.MM.dd HH:mm" /></span>
              <span>·</span>
              <span>조회 ${vo.board_readhit}</span>
            </div>
          </div>
        </div>

        <!-- 더보기 아이콘 자리 -->
        <button type="button" class="text-gray-400 hover:text-gray-600 p-2">
          ⋯
        </button>
      </div>
    </div>

    <!-- 본문 + 이미지 -->
    <div class="bg-white border-x border-gray-100 p-8 min-h-[300px] text-gray-800 leading-loose">
      <c:if test="${not empty vo.board_image_url}">
        <img src="${vo.board_image_url}" alt="post image"
             class="rounded-xl mb-6 max-w-full h-auto" />
      </c:if>

      <div class="whitespace-pre-line">
        <c:out value="${vo.board_content}" escapeXml="false" />
      </div>
    </div>

    <!-- 하단 액션 -->
    <div class="bg-white rounded-b-3xl border-x border-b border-gray-100 p-6 flex items-center justify-between mb-8">
      <div class="flex gap-2">
        <button type="button"
                class="flex items-center gap-2 px-4 py-2 rounded-full border border-gray-200 text-gray-600 font-bold hover:bg-red-50 hover:text-red-500 hover:border-red-200 transition-colors text-sm">
          ♥ 좋아요 <span>${vo.board_like_cnt}</span>
        </button>
        <button type="button"
                class="flex items-center gap-2 px-4 py-2 rounded-full border border-gray-200 text-gray-600 font-bold hover:bg-blue-50 hover:text-blue-500 hover:border-blue-200 transition-colors text-sm">
          🔗 공유
        </button>
      </div>

      <div class="flex gap-2">
        <button type="button"
                onclick="location.href='${pageContext.request.contextPath}/${b_type}/list.do?page=${page}&tag=${tag}'"
                class="px-4 py-2 text-sm text-gray-500 font-bold hover:bg-gray-50 rounded-lg">
          목록으로
        </button>
      </div>
    </div>

    <!-- 댓글 영역 -->
    <div class="bg-gray-50 rounded-3xl p-6 md:p-8">
      <h3 class="font-bold text-lg text-gray-900 mb-6 flex items-center gap-2">
        댓글
        <span class="text-amber-500">
          <c:out value="${fn:length(commentList)}" />
        </span>
      </h3>

      <!-- 댓글 입력 -->
      <div class="bg-white p-4 rounded-xl border border-gray-200 shadow-sm mb-8">
        <c:choose>
          <c:when test="${not empty sessionScope.user}">
            <textarea id="reply_content"
                      name="reply_content"
                      placeholder="따뜻한 댓글을 남겨주세요."
                      class="w-full h-24 resize-none border-none focus:ring-0 text-sm p-0 mb-2 placeholder:text-gray-400"></textarea>
            <div class="flex justify-between items-center border-t border-gray-100 pt-3">
              <span class="text-xs text-gray-400">
                도배 및 비방글은 삭제될 수 있습니다.
              </span>
              <button type="button"
                      onclick="submitReply();"
                      class="px-4 py-2 bg-amber-400 text-white rounded-lg font-bold text-sm hover:bg-amber-500 transition-colors"
                      id="btnReply">
                등록
              </button>
            </div>
          </c:when>
          <c:otherwise>
            <div class="h-24 flex items-center justify-center text-gray-400 text-sm gap-2 cursor-pointer"
                 onclick="location.href='${pageContext.request.contextPath}/member/login_form.do';">
              ⚠ 로그인 후 댓글을 작성할 수 있습니다.
            </div>
          </c:otherwise>
        </c:choose>
      </div>

      <!-- 댓글 리스트 -->
      <div class="space-y-6">
        <c:forEach var="reply" items="${commentList}">
          <div class="flex gap-4">
            <div class="w-10 h-10 rounded-full bg-white border border-gray-100 flex-shrink-0 flex items-center justify-center text-gray-400 shadow-sm">
              👤
            </div>
            <div class="flex-1">
              <div class="flex items-center gap-2 mb-1">
                <span class="font-bold text-gray-900 text-sm">
                  <c:out value="${reply.mem_name}" />
                </span>
                <c:choose>
                  <c:when test="${reply.mem_role == 'VET'}">
                    <span class="bg-green-100 text-green-700 text-[10px] font-bold px-1.5 py-0.5 rounded border border-green-200">수의사</span>
                  </c:when>
                  <c:when test="${reply.mem_role == 'ADMIN'}">
                    <span class="bg-red-100 text-red-700 text-[10px] font-bold px-1.5 py-0.5 rounded border border-red-200">관리자</span>
                  </c:when>
                  <c:otherwise>
                    <span class="bg-gray-100 text-gray-600 text-[10px] font-bold px-1.5 py-0.5 rounded border border-gray-200">회원</span>
                  </c:otherwise>
                </c:choose>
                <span class="text-xs text-gray-400 ml-1">
                  <fmt:formatDate value="${reply.reply_regdate}" pattern="yyyy.MM.dd HH:mm" />
                </span>
              </div>
              <p class="text-gray-700 text-sm leading-relaxed mb-2 bg-white p-3 rounded-xl rounded-tl-none border border-gray-100 inline-block shadow-sm">
                <c:out value="${reply.reply_content}" />
              </p>
              <div class="flex items-center gap-3 ml-1 text-xs text-gray-400 font-bold">
                <button type="button" class="hover:text-amber-500 flex items-center gap-1">
                  ↳ 답글
                </button>
                <button type="button" class="hover:text-red-500 flex items-center gap-1">
                  ♥ 좋아요 <span>${reply.reply_like_cnt}</span>
                </button>
              </div>
            </div>
          </div>
        </c:forEach>

        <c:if test="${empty commentList}">
          <p class="text-sm text-gray-400">아직 댓글이 없습니다. 첫 번째 댓글을 남겨보세요.</p>
        </c:if>
      </div>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
  function submitReply() {
    const content = document.getElementById('reply_content').value.trim();
    if (!content) {
      alert('댓글 내용을 입력해주세요.');
      return;
    }
    // TODO: 실제 reply insert 요청 AJAX or form submit 로직 연결
    alert('댓글 등록 기능은 백엔드와 연결 후 구현하세요.');
  }
</script>
</body>
</html>
