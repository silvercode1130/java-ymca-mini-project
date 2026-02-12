<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>게시글 상세</title>

<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
}

th {
	width: 120px;
	background: #f4f4f4;
}

.btns a, .btns form {
	display: inline-block;
}
</style>

<script type="text/javascript">
	function reply_form() {

		//alert(location.href); //현재 URL주소 =>location.href

		//로그인 안된경우
		if ("${ empty user}" == "true") {

			if (confirm("글쓰기는 로그인후에 가능합니다\n로그인 하시겠습니다?") == false)
				return;

			//로그인폼으로 이동
			location.href = "../member/login_form.do?url="
					+ encodeURIComponent(location.href, "utf-8");

			return;
		}

		//답글쓰기 폼으로 이동
		location.href = "reply_form.do?b_idx=${ vo.b_idx }&page=${param.page}";

	}//end:reply_form()

	function board_delete() {

		if (confirm("정말 삭제 하시겠습니까?") == false)
			return;

		//location.href="delete.do?b_idx=${vo.b_idx}";

		f.method = "POST";
		f.action = "delete.do";
		f.submit();

	}//endl:board_delete()
</script>

</head>

<body>


	<h2>${vo.board_title }</h2>

	<table>

		<tr>
			<th>게시판</th>
			<td>${vo.boardType.board_type_name}</td>
		</tr>
		<tr>
			<th>태그</th>
			<td>${vo.board_tag }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.board_readhit }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${vo.board_regdate}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre style="white-space: pre-wrap;">${vo.board_content }</pre></td>
		</tr>
	</table>

	<div class="btns">
		<a href="list.do">[목록]</a>

		<!-- 내 글일 때만 수정/삭제 버튼 노출 (session 에 user 있다고 가정) -->
		<c:if
			test="${not empty sessionScope.user 
				and sessionScope.user.mem_idx == vo.mem_idx}">
			<a href="update_form.do?board_idx=${vo.board_idx }">[수정]</a>

			<form action="delete.do" method="post" style="display: inline;">
				<input type="hidden" name="board_idx" value="${vo.board_idx }">

			</form>

		</c:if>
	</div>





	<th>등록일</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="b" items="${list}">
			<tr>
				<td>${b.board_idx}</td>
				<td>${b.boardType.board_type_name}</td>
				<td>${b.board_tag}</td>
				<td><a href="view.do?board_idx=${b.board_idx}">
						${b.board_title} </a></td>
				<td><c:choose>
						<c:when test="${b.writer != null}">
                        ${b.writer.mem_id}
                    </c:when>
						<c:otherwise>
                        -
                    </c:otherwise>
					</c:choose></td>
				<td>${b.board_readhit}</td>
				<td>${b.board_regdate}</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>

	<p>
		<a href="insert_form.do?type=FREE">[자유게시판 글쓰기]</a>
	</p>
=======
<style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { width: 120px; background: #f4f4f4; }
        .btns a, .btns form { display: inline-block; }
    </style>
=======
<%@ include file="/WEB-INF/views/common/head.jsp" %>
  <title>${vo.board_title} | PetOn 커뮤니티</title>
  
  <script>
  function copyCurrentUrl() {
    const url = window.location.href;

    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(url)
        .then(function() {
          alert('링크가 복사되었습니다.');
        })
        .catch(function() {
          // 실패 시 fallback
          fallbackCopy(url);
        });
    } else {
      fallbackCopy(url);
    }
  }

  function fallbackCopy(text) {
    const textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.style.position = 'fixed';
    textarea.style.left = '-9999px';
    document.body.appendChild(textarea);
    textarea.select();
    try {
      document.execCommand('copy');
      alert('링크가 복사되었습니다.');
    } catch (e) {
      alert('복사에 실패했습니다. 주소창을 직접 복사해주세요.');
    } finally {
      document.body.removeChild(textarea);
    }
  }
</script>
  
  
>>>>>>> edd65d63a477e028c890b686b4a2de3b0320cd2e
</head>
<body class="layout-body bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body class="bg-gray-50">

<div class="max-w-4xl mx-auto px-4 py-12">

    <!-- Breadcrumb -->
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-8 font-medium">
        <span class="cursor-pointer hover:text-amber-500"
              onclick="location.href='list.do'">
            <c:choose>
                <c:when test="${vo.boardType.board_type_code == 'NOTICE'}">공지사항</c:when>
                <c:when test="${vo.boardType.board_type_code == 'EVENT'}">이벤트</c:when>
                <c:when test="${vo.boardType.board_type_code == 'LAB'}">연구소</c:when>
                <c:when test="${vo.boardType.board_type_code == 'QNA'}">QnA</c:when>
                <c:when test="${vo.boardType.board_type_code == 'FREE'}">자유게시판</c:when>
                <c:otherwise>게시판</c:otherwise>
            </c:choose>
        </span>
        <span>&gt;</span>
        <span class="text-gray-900">게시글 상세</span>
    </div>

    <article class="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 md:p-10">

        <!-- Header -->
        <header class="text-center mb-12">
            <span class="inline-block border border-amber-200 text-amber-600 font-bold px-4 py-1.5 rounded-full text-sm mb-4 bg-amber-50">
                ${vo.boardType.board_type_name}
                <c:if test="${vo.board_tag ne 'NONE'}">
                    &nbsp;&gt;&nbsp;${vo.board_tag}
                </c:if>
            </span>

            <h1 class="text-2xl md:text-4xl font-extrabold text-gray-900 mb-4 leading-tight">
                ${vo.board_title}
            </h1>

            <!-- 서브타이틀 자리에 태그나 한 줄 설명 넣고 싶으면 여기 -->
            <c:if test="${vo.board_tag ne 'NONE'}">
                <p class="text-md md:text-lg text-gray-500 mb-8 font-medium">
                    #${vo.board_tag}
                </p>
            </c:if>

            <div class="flex flex-wrap items-center justify-center gap-4 md:gap-6 text-sm text-gray-500 border-y border-gray-100 py-4 md:py-6">
                <div class="flex items-center gap-2">
                    <span class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-gray-100 text-gray-500 text-xs font-bold">
                        작성
                    </span>
                    <span class="font-bold text-gray-900">
                        <c:choose>
                            <c:when test="${vo.writer != null}">
                                ${vo.writer.mem_id}
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </span>

                    <!-- 예: 의사(VET) 라벨을 role 기반으로 보여주고 싶으면 -->
                    <c:if test="${vo.writer != null && vo.writer.mem_role_idx == 2}">
                        <span class="bg-green-100 text-green-700 text-[10px] font-bold px-1.5 py-0.5 rounded border border-green-200">
                            VET
                        </span>
                    </c:if>
                </div>

                <div class="flex items-center gap-2">
                    <span class="text-gray-400 text-xs">등록일</span>
                    <span>${vo.board_regdate}</span>
                </div>

                <div class="flex items-center gap-2">
                    <span class="text-gray-400 text-xs">조회수</span>
                    <span>${vo.board_readhit}</span>
                </div>
            </div>
        </header>

        <!-- 대표 이미지 (LAB이나 썸네일 있을 때만) -->
        <c:if test="${not empty thumbnail}">
            <figure class="mb-12 rounded-3xl overflow-hidden shadow-lg">
                <img src="${thumbnail.file_path}" alt="게시글 대표 이미지"
                     class="w-full h-auto object-cover max-h-[500px]" />
            </figure>
        </c:if>

        <!-- Content -->
        <div
           class="prose prose-lg max-w-none text-gray-800 leading-loose
                  prose-headings:font-bold prose-headings:text-gray-900 prose-headings:mb-4 prose-headings:mt-8
                  prose-p:mb-6 prose-strong:text-amber-600 prose-strong:font-extrabold
                  prose-li:list-disc prose-li:ml-4 prose-li:mb-2"
        >
            <!-- CKEditor 쓸 거면 escapeXml=false 로 HTML 그대로 렌더 -->
            <c:out value="${vo.board_content}" escapeXml="false" />
        </div>

        <!-- tip-box 스타일 (LAB 같은 곳에서 쓸 수 있음) -->
        <style>
           .tip-box {
              background-color: #FFFBEB;
              border: 1px solid #FCD34D;
              border-radius: 1rem;
              padding: 1.5rem;
              margin: 2rem 0;
           }
        </style>

        <!-- 첨부파일 리스트 (있으면) -->
        <c:if test="${not empty fileList}">
            <div class="mt-10 pt-6 border-t border-gray-100">
                <h3 class="text-sm font-bold text-gray-700 mb-3">첨부파일</h3>
                <ul class="space-y-2">
                    <c:forEach var="f" items="${fileList}">
                        <li class="flex items-center justify-between text-sm">
                            <div class="flex items-center gap-2">
                                <span class="text-gray-400">📎</span>
                                <a href="${pageContext.request.contextPath}${f.file_path}"
                                   class="text-amber-600 hover:text-amber-700 font-medium"
                                   download="${f.file_original_name}">
                                    ${f.file_original_name}
                                </a>
                            </div>
                            <span class="text-xs text-gray-400">
                                <c:if test="${f.is_thumbnail == 'Y'}">대표이미지 · </c:if>
                                ${f.file_size}bytes
                            </span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <!-- Footer Actions -->
        <div class="border-t border-gray-200 mt-12 pt-6 flex flex-wrap items-center justify-between gap-4">
            <button
               type="button"
               onclick="location.href='list.do'"
               class="flex items-center gap-2 text-gray-500 font-bold hover:text-gray-900 transition-colors"
            >
                ← 목록으로 돌아가기
            </button>

            <div class="flex items-center gap-2">

                <!-- 내 글이거나 관리자일때만 수정/삭제 -->
                <c:if test="${not empty sessionScope.user and
                			(sessionScope.user.mem_idx == vo.mem_idx or sessionScope.user.mem_role_idx == 3)}">

                    <button
                        type="button"
                        onclick="location.href='modify_form.do?board_idx=${vo.board_idx}'"
                        class="px-4 py-2 bg-white border border-gray-300 rounded-xl text-sm font-bold text-gray-700 hover:bg-gray-50"
                    >
                        수정
                    </button>

                    <form action="delete.do" method="post"
                          onsubmit="return confirm('정말 삭제할까요?');">
                        <input type="hidden" name="board_idx" value="${vo.board_idx}">
                        <button
                            type="submit"
                            class="px-4 py-2 bg-red-500 text-white rounded-xl text-sm font-bold hover:bg-red-600"
                        >
                            삭제
                        </button>
                    </form>
                </c:if>

                <!-- 공유 버튼 -->
                <button type="button"
				        onclick="copyCurrentUrl()"
				        class="flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-xl text-sm font-bold hover:bg-gray-800 shadow-md transition-all">
				    공유하기
				</button>

            </div>
        </div>

    </article>

    <!-- 이전/다음 글 (옵션: controller 에서 prevVo / nextVo 넘겨주면 사용) -->
    <c:if test="${not empty prevVo or not empty nextVo}">
        <div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-4">
            <div class="group border border-gray-200 p-4 md:p-6 rounded-2xl hover:border-amber-300 cursor-pointer transition-colors"
                 onclick="location.href='view.do?board_idx=${prevVo.board_idx}'">
                <span class="text-xs font-bold text-gray-400 mb-2 block">이전 글</span>
                <h4 class="font-bold text-gray-900 truncate group-hover:text-amber-600 transition-colors">
                    <c:choose>
                        <c:when test="${not empty prevVo}">${prevVo.board_title}</c:when>
                        <c:otherwise>이전 글이 없습니다.</c:otherwise>
                    </c:choose>
                </h4>
            </div>
            <div class="group border border-gray-200 p-4 md:p-6 rounded-2xl hover:border-amber-300 cursor-pointer transition-colors text-right"
                 onclick="location.href='view.do?board_idx=${nextVo.board_idx}'">
                <span class="text-xs font-bold text-gray-400 mb-2 block">다음 글</span>
                <h4 class="font-bold text-gray-900 truncate group-hover:text-amber-600 transition-colors">
                    <c:choose>
                        <c:when test="${not empty nextVo}">${nextVo.board_title}</c:when>
                        <c:otherwise>다음 글이 없습니다.</c:otherwise>
                    </c:choose>
                </h4>
            </div>
        </div>
    </c:if>
<<<<<<< HEAD
</div>
>>>>>>> origin/je
=======
>>>>>>> edd65d63a477e028c890b686b4a2de3b0320cd2e

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
