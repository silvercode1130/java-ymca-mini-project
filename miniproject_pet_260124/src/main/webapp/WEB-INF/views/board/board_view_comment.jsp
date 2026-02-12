<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<title>${vo.board_title}| PetOn 커뮤니티</title>

<script>
  function copyCurrentUrl() {
    const url = window.location.href;

    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(url)
        .then(function() {
          alert('링크가 복사되었습니다.');
        })
        .catch(function() {
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

  // 원댓글 등록
  function submitReply() {
    const contentEl = document.getElementById('reply_content');
    const content = contentEl.value.trim();
    if (!content) {
      alert('댓글 내용을 입력해 주세요.');
      contentEl.focus();
      return;
    }

    const boardIdx = '${vo.board_idx}';

    fetch('${pageContext.request.contextPath}/reply/insert.do', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
      },
      body: new URLSearchParams({
        board_idx: boardIdx,
        reply_content: content
      })
    })
    .then(res => res.json())
    .then(data => {
      if (data.result) {
        contentEl.value = '';
        location.reload();
      } else {
        alert('댓글 등록에 실패했습니다. 다시 시도해 주세요.');
      }
    })
    .catch(err => {
      console.error(err);
      alert('댓글 등록 중 오류가 발생했습니다.');
    });
  }

  // 대댓글 입력창 토글
  function toggleReplyForm(replyIdx) {
    const box = document.getElementById('reply-form-' + replyIdx);
    if (!box) return;

    if (box.classList.contains('hidden')) {
      box.classList.remove('hidden');
    } else {
      box.classList.add('hidden');
    }
  }

  // 대댓글 등록
  function submitReReply(baseReplyIdx) {
    const box = document.getElementById('reply-form-' + baseReplyIdx);
    if (!box) return;

    const textarea = box.querySelector('textarea');
    const content = textarea.value.trim();
    if (!content) {
      alert('답글 내용을 입력해 주세요.');
      textarea.focus();
      return;
    }

    const boardIdx = '${vo.board_idx}';

    fetch('${pageContext.request.contextPath}/reply/rereply.do', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
      },
      body: new URLSearchParams({
        reply_idx: baseReplyIdx,
        board_idx: boardIdx,
        reply_content: content
      })
    })
    .then(res => res.json())
    .then(data => {
      if (data.result) {
        textarea.value = '';
        box.classList.add('hidden');
        location.reload();
      } else {
        alert('답글 등록에 실패했습니다. 다시 시도해 주세요.');
      }
    })
    .catch(err => {
      console.error(err);
      alert('답글 등록 중 오류가 발생했습니다.');
    });
  }

  // 댓글 수정 폼 토글
  function toggleEditForm(replyIdx) {
    const box = document.getElementById('reply-edit-' + replyIdx);
    if (!box) return;

    if (box.classList.contains('hidden')) {
      box.classList.remove('hidden');
    } else {
      box.classList.add('hidden');
    }
  }

  // 댓글 수정
  function submitReplyUpdate(replyIdx) {
    const box = document.getElementById('reply-edit-' + replyIdx);
    if (!box) return;

    const textarea = box.querySelector('textarea');
    const content = textarea.value.trim();
    if (!content) {
      alert('수정할 내용을 입력해 주세요.');
      textarea.focus();
      return;
    }

    fetch('${pageContext.request.contextPath}/reply/update.do', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
      },
      body: new URLSearchParams({
        reply_idx: replyIdx,
        reply_content: content
      })
    })
    .then(res => res.json())
    .then(data => {
      if (data.result) {
        box.classList.add('hidden');
        location.reload();
      } else {
        alert('댓글 수정에 실패했습니다. 다시 시도해 주세요.');
      }
    })
    .catch(err => {
      console.error(err);
      alert('댓글 수정 중 오류가 발생했습니다.');
    });
  }
</script>
</head>

<body class="layout-body bg-gray-50">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="max-w-4xl mx-auto px-4 py-12">

		<!-- Breadcrumb -->
		<div
			class="flex items-center gap-2 text-sm text-gray-500 mb-8 font-medium">
			<span class="cursor-pointer hover:text-amber-500"
				onclick="location.href='list.do'"> <c:choose>
					<c:when test="${vo.boardType.board_type_code == 'NOTICE'}">공지사항</c:when>
					<c:when test="${vo.boardType.board_type_code == 'EVENT'}">이벤트</c:when>
					<c:when test="${vo.boardType.board_type_code == 'LAB'}">연구소</c:when>
					<c:when test="${vo.boardType.board_type_code == 'QNA'}">QnA</c:when>
					<c:when test="${vo.boardType.board_type_code == 'FREE'}">자유게시판</c:when>
					<c:otherwise>게시판</c:otherwise>
				</c:choose>
			</span> <span>&gt;</span> <span class="text-gray-900">게시글 상세</span>
		</div>

		<article
			class="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 md:p-10">

			<!-- Header -->
			<header class="text-center mb-12">
				<span
					class="inline-block border border-amber-200 text-amber-600 font-bold px-4 py-1.5 rounded-full text-sm mb-4 bg-amber-50">
					${vo.boardType.board_type_name} <c:if
						test="${vo.board_tag ne 'NONE'}">
          &nbsp;&gt;&nbsp;${vo.board_tag}
        </c:if>
				</span>

				<h1
					class="text-2xl md:text-4xl font-extrabold text-gray-900 mb-4 leading-tight">
					${vo.board_title}</h1>

				<c:if test="${vo.board_tag ne 'NONE'}">
					<p class="text-md md:text-lg text-gray-500 mb-8 font-medium">
						#${vo.board_tag}</p>
				</c:if>

				<div
					class="flex flex-wrap items-center justify-center gap-4 md:gap-6 text-sm text-gray-500 border-y border-gray-100 py-4 md:py-6">
					<div class="flex items-center gap-2">
						<span
							class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-gray-100 text-gray-500 text-xs font-bold">
							작성 </span> <span class="font-bold text-gray-900"> <c:choose>
								<c:when test="${vo.writer != null}">
                ${vo.writer.mem_id}
              </c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</span>

						<c:if test="${vo.writer != null && vo.writer.mem_role_idx == 2}">
							<span
								class="bg-green-100 text-green-700 text-[10px] font-bold px-1.5 py-0.5 rounded border border-green-200">
								VET </span>
						</c:if>
					</div>

					<div class="flex items-center gap-2">
						<span class="text-gray-400 text-xs">등록일</span> <span>${vo.board_regdate}</span>
					</div>

					<div class="flex items-center gap-2">
						<span class="text-gray-400 text-xs">조회수</span> <span>${vo.board_readhit}</span>
					</div>
				</div>
			</header>

			<!-- 대표 이미지 -->
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
             prose-li:list-disc prose-li:ml-4 prose-li:mb-2">
				<c:out value="${vo.board_content}" escapeXml="false" />
			</div>

			<style>
.tip-box {
	background-color: #FFFBEB;
	border: 1px solid #FCD34D;
	border-radius: 1rem;
	padding: 1.5rem;
	margin: 2rem 0;
}
</style>

		</article>

		<!-- Comments -->
		<div class="mt-10 bg-gray-50 rounded-3xl p-6 md:p-8">
			<h3
				class="font-bold text-lg text-gray-900 mb-6 flex items-center gap-2">
				댓글 <span class="text-amber-500"> <c:out
						value="${empty replyList ? 0 : fn:length(replyList)}" />
				</span>
			</h3>

			<!-- 댓글 입력 -->
			<div
				class="bg-white p-4 rounded-xl border border-gray-200 shadow-sm mb-8">
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<textarea id="reply_content" placeholder="따뜻한 댓글을 남겨주세요."
							class="w-full h-24 resize-none border-none focus:ring-0 text-sm p-0 mb-2 placeholder:text-gray-400"></textarea>
						<div
							class="flex justify-between items-center border-t border-gray-100 pt-3">
							<span class="text-xs text-gray-400">도배 및 비방글은 삭제될 수 있습니다.</span>
							<button type="button" onclick="submitReply()"
								class="px-4 py-2 bg-amber-400 text-white rounded-lg font-bold text-sm hover:bg-amber-500 transition-colors">
								등록</button>
						</div>
					</c:when>
					<c:otherwise>
						<div
							class="h-24 flex items-center justify-center text-gray-400 text-sm gap-2 cursor-pointer"
							onclick="location.href='${pageContext.request.contextPath}/member/login_form.do'">
							로그인 후 댓글을 작성할 수 있습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- Comment List -->
			<c:if test="${not empty replyList}">
				<div class="space-y-6">
					<c:forEach var="r" items="${replyList}">
						<div class="flex gap-4 group">
							<div
								class="w-10 h-10 rounded-full bg-white border border-gray-100 flex-shrink-0 flex items-center justify-center text-gray-400 shadow-sm">
								<i class="fa-regular fa-user"></i>
							</div>
							<div class="flex-1">
								<div class="flex items-center gap-2 mb-1">
									<!-- 작성자 -->
									<span class="font-bold text-gray-900 text-sm"> <c:choose>
											<c:when test="${r.writer != null}">
                      ${r.writer.mem_id}
                    </c:when>
											<c:otherwise>탈퇴회원</c:otherwise>
										</c:choose>
									</span>

									<!-- 역할 배지 -->
									<c:choose>
										<c:when
											test="${r.writer != null && r.writer.mem_role_idx == 2}">
											<span
												class="bg-green-100 text-green-700 text-[10px] font-bold px-1.5 py-0.5 rounded border border-green-200">
												수의사 </span>
										</c:when>
										<c:when
											test="${r.writer != null && r.writer.mem_role_idx == 3}">
											<span
												class="bg-red-100 text-red-700 text-[10px] font-bold px-1.5 py-0.5 rounded border border-red-200">
												관리자 </span>
										</c:when>
										<c:otherwise>
											<span
												class="bg-gray-100 text-gray-600 text-[10px] font-bold px-1.5 py-0.5 rounded border border-gray-200">
												회원 </span>
										</c:otherwise>
									</c:choose>

									<!-- 날짜 -->
									<span class="text-xs text-gray-400 ml-1">
										${r.replyRegdateFormatted} </span>
								</div>

								<!-- 댓글 본문 -->
								<p
									class="text-gray-700 text-sm leading-relaxed mb-2 bg-white p-3 rounded-xl rounded-tl-none border border-gray-100 inline-block shadow-sm">
									<c:choose>
										<c:when test="${r.reply_is_deleted == 'Y'}">
											<span class="text-gray-400 text-xs">삭제된 댓글입니다.</span>
										</c:when>
										<c:otherwise>
											<c:out value="${r.reply_content}" />
										</c:otherwise>
									</c:choose>
								</p>

								<!-- 댓글 수정 폼 -->
								<div id="reply-edit-${r.reply_idx}" class="mt-2 ml-1 hidden">
									<textarea
										class="w-full h-16 resize-none border border-gray-200 rounded-lg text-sm p-2 mb-2">${r.reply_content}</textarea>
									<div class="flex justify-end gap-2">
										<button type="button"
											class="px-3 py-1.5 text-xs rounded-lg bg-gray-100 text-gray-500 font-bold"
											onclick="toggleEditForm(${r.reply_idx})">취소</button>
										<button type="button"
											class="px-3 py-1.5 text-xs rounded-lg bg-blue-500 text-white font-bold hover:bg-blue-600"
											onclick="submitReplyUpdate(${r.reply_idx})">수정 완료</button>
									</div>
								</div>

								<!-- 액션 영역 -->
								<div
									class="flex items-center gap-3 ml-1 text-xs text-gray-400 font-bold">
									<!-- 대댓글 버튼 -->
									<button type="button" class="hover:text-amber-500"
										onclick="toggleReplyForm(${r.reply_idx})">↳ 답글</button>

									<!-- 작성자 본인 또는 관리자만 수정/삭제 -->
									<c:if
										test="${not empty sessionScope.user and
                    (sessionScope.user.mem_idx == r.mem_idx or sessionScope.user.mem_role_idx == 3)}">

										<!-- 수정 버튼 -->
										<button type="button" class="hover:text-blue-500 ml-2"
											onclick="toggleEditForm(${r.reply_idx})">수정</button>

										<form action="reply_delete.do" method="post" class="inline">
											<input type="hidden" name="reply_idx" value="${r.reply_idx}">
											<input type="hidden" name="board_idx" value="${vo.board_idx}">
											<button type="submit" class="hover:text-red-500 ml-2">
												삭제</button>
										</form>
									</c:if>
								</div>

								<!-- 대댓글 입력 폼 -->
								<div id="reply-form-${r.reply_idx}" class="mt-2 ml-8 hidden">
									<textarea
										class="w-full h-16 resize-none border border-gray-200 rounded-lg text-sm p-2 mb-2"
										placeholder="이 댓글에 대한 답글을 남겨보세요."></textarea>
									<div class="flex justify-end gap-2">
										<button type="button"
											class="px-3 py-1.5 text-xs rounded-lg bg-gray-100 text-gray-500 font-bold"
											onclick="toggleReplyForm(${r.reply_idx})">취소</button>
										<button type="button"
											class="px-3 py-1.5 text-xs rounded-lg bg-amber-400 text-white font-bold hover:bg-amber-500"
											onclick="submitReReply(${r.reply_idx})">답글 등록</button>
									</div>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>

		<!-- Footer Actions: 댓글 아래로 이동 -->
		<div
			class="border-t border-gray-200 mt-12 pt-6 flex flex-wrap items-center justify-between gap-4">
			<button type="button" onclick="location.href='list.do'"
				class="flex items-center gap-2 text-gray-500 font-bold hover:text-gray-900 transition-colors">
				← 목록으로 돌아가기</button>

			<div class="flex items-center gap-2">
				<c:if
					test="${not empty sessionScope.user and
          (sessionScope.user.mem_idx == vo.mem_idx or sessionScope.user.mem_role_idx == 3)}">

					<button type="button"
						onclick="location.href='modify_form.do?board_idx=${vo.board_idx}'"
						class="px-4 py-2 bg-white border border-gray-300 rounded-xl text-sm font-bold text-gray-700 hover:bg-gray-50">
						수정</button>

					<form action="delete.do" method="post"
						onsubmit="return confirm('정말 삭제할까요?');">
						<input type="hidden" name="board_idx" value="${vo.board_idx}">
						<button type="submit"
							class="px-4 py-2 bg-red-500 text-white rounded-xl text-sm font-bold hover:bg-red-600">
							삭제</button>
					</form>
				</c:if>

				<button type="button" onclick="copyCurrentUrl()"
					class="flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-xl text-sm font-bold hover:bg-gray-800 shadow-md transition-all">
					공유하기</button>
			</div>
		</div>

		<!-- 이전/다음 글 -->
		<c:if test="${not empty prevVo or not empty nextVo}">
			<div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-4">
				<div
					class="group border border-gray-200 p-4 md:p-6 rounded-2xl hover:border-amber-300 cursor-pointer transition-colors"
					onclick="location.href='view.do?board_idx=${prevVo.board_idx}'">
					<span class="text-xs font-bold text-gray-400 mb-2 block">이전
						글</span>
					<h4
						class="font-bold text-gray-900 truncate group-hover:text-amber-600 transition-colors">
						<c:choose>
							<c:when test="${not empty prevVo}">${prevVo.board_title}</c:when>
							<c:otherwise>이전 글이 없습니다.</c:otherwise>
						</c:choose>
					</h4>
				</div>
				<div
					class="group border border-gray-200 p-4 md:p-6 rounded-2xl hover:border-amber-300 cursor-pointer transition-colors text-right"
					onclick="location.href='view.do?board_idx=${nextVo.board_idx}'">
					<span class="text-xs font-bold text-gray-400 mb-2 block">다음
						글</span>
					<h4
						class="font-bold text-gray-900 truncate group-hover:text-amber-600 transition-colors">
						<c:choose>
							<c:when test="${not empty nextVo}">${nextVo.board_title}</c:when>
							<c:otherwise>다음 글이 없습니다.</c:otherwise>
						</c:choose>
					</h4>
				</div>
			</div>
		</c:if>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
