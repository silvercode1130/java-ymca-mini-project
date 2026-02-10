<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/views/common/head.jsp" %>
  <title>게시글 작성 | PetOn 커뮤니티</title>
</head>
<body class="layout-body bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="max-w-4xl mx-auto px-4 py-8">

    <!-- Breadcrumb -->
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
      <a href="${pageContext.request.contextPath}/community"
         class="hover:text-amber-500">
        커뮤니티
      </a>
      <span class="text-gray-400">&gt;</span>
      <span class="font-bold text-gray-900">게시글 작성</span>
    </div>

    <form action="${pageContext.request.contextPath}/${b_type}/insert.do"
	      method="post"
	      enctype="multipart/form-data"
	      onsubmit="return validatePostForm();">

      <div class="bg-white rounded-3xl shadow-sm border border-gray-100 p-8">

        <!-- 헤더 영역 -->
        <div class="flex justify-between items-start mb-8 pb-6 border-b border-gray-100">
          <div>
            <h1 class="text-2xl font-extrabold text-gray-900 mb-2">게시글 작성</h1>
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-amber-50 text-amber-600 font-bold text-xs">
              현재 게시판:
              <span class="text-amber-700">
                <c:out value="${b_type}"/>
              </span>
            </div>
          </div>
        </div>

        <!-- 태그 선택 -->
        <div class="mb-8">
          <label class="block text-sm font-bold text-gray-700 mb-3">
            태그 / 대상
          </label>
          <div class="flex gap-3">
            <button type="button"
                    class="tag-btn px-6 py-3 rounded-full font-bold text-sm transition-all border-2
                           bg-white border-gray-200 text-gray-500 hover:border-amber-200 hover:bg-amber-50"
                    data-value="DOG"
                    onclick="selectTag(this);">
              강아지 🐶
            </button>
            <button type="button"
                    class="tag-btn px-6 py-3 rounded-full font-bold text-sm transition-all border-2
                           bg-white border-gray-200 text-gray-500 hover:border-amber-200 hover:bg-amber-50"
                    data-value="CAT"
                    onclick="selectTag(this);">
              고양이 🐱
            </button>
            <button type="button"
                    class="tag-btn px-6 py-3 rounded-full font-bold text-sm transition-all border-2
                           bg-amber-400 border-amber-400 text-white shadow-md"
                    data-value="NONE"
                    onclick="selectTag(this);">
              자유 💬
            </button>
          </div>
          <input type="hidden" name="board_tag" id="board_tag" value="NONE" />
        </div>

        <!-- 제목 / 내용 / 파일 -->
        <div class="space-y-6">

          <!-- 제목 -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-2">
              제목 <span class="text-red-500">*</span>
            </label>
            <input type="text"
                   name="board_title"
                   id="board_title"
                   placeholder="제목을 입력해주세요"
                   class="w-full px-4 py-3 rounded-xl border border-gray-200
                          focus:outline-none focus:ring-2 focus:ring-amber-400
                          font-medium text-gray-900 placeholder:text-gray-400" />
          </div>

          <!-- 내용 -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-2">
              내용 <span class="text-red-500">*</span>
            </label>
            <textarea name="board_content"
                      id="board_content"
                      placeholder="내용을 입력해주세요. (건전한 커뮤니티 문화를 위해 비방, 욕설 등은 삼가주세요.)"
                      class="w-full px-4 py-4 rounded-xl border border-gray-200
                             focus:outline-none focus:ring-2 focus:ring-amber-400
                             font-medium text-gray-900 h-64 resize-none leading-relaxed
                             placeholder:text-gray-400"></textarea>
          </div>

          <!-- 첨부파일 -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-2">
              첨부파일
            </label>
            <label class="inline-flex items-center gap-2 px-4 py-3 rounded-xl border border-gray-200
                          text-gray-600 font-bold hover:bg-gray-50 transition-colors cursor-pointer">
              📎
              <span>파일 첨부</span>
              <input type="file"
                     name="files"
                     id="files"
                     multiple
                     class="hidden"
                     onchange="handleFileList(this);" />
            </label>

            <div id="fileList" class="mt-4 grid grid-cols-1 sm:grid-cols-2 gap-3"></div>
          </div>
        </div>

        <!-- 버튼 영역 -->
        <div class="flex justify-end items-center gap-3 mt-10 pt-6 border-t border-gray-100">
          <button type="button"
                  onclick="history.back();"
                  class="px-6 py-3 rounded-xl border-2 border-gray-200 text-gray-600 font-bold hover:bg-gray-50 transition-colors">
            목록으로
          </button>
          <button type="button"
                  class="px-6 py-3 rounded-xl text-amber-600 font-bold hover:bg-amber-50 transition-colors">
            임시저장
          </button>
          <button type="submit"
                  id="btnSubmit"
                  class="px-8 py-3 rounded-xl bg-amber-400 text-white font-bold
                         hover:bg-amber-500 shadow-md transition-all
                         disabled:opacity-50 disabled:cursor-not-allowed">
            등록하기
          </button>
        </div>
      </div>
    </form>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
  // 태그 선택
  function selectTag(btn) {
    document.querySelectorAll('.tag-btn').forEach(function(b) {
      b.className = 'tag-btn px-6 py-3 rounded-full font-bold text-sm transition-all border-2 ' +
        'bg-white border-gray-200 text-gray-500 hover:border-amber-200 hover:bg-amber-50';
    });

    btn.className = 'tag-btn px-6 py-3 rounded-full font-bold text-sm transition-all border-2 ' +
      'bg-amber-400 border-amber-400 text-white shadow-md';

    document.getElementById('board_tag').value = btn.getAttribute('data-value');
  }

  // 파일 리스트 표시 (프론트용, 실제 업로드는 input의 files 사용)
  function handleFileList(input) {
    const container = document.getElementById('fileList');
    container.innerHTML = '';

    const files = input.files;
    if (!files || files.length === 0) return;

    Array.from(files).forEach(function(file, idx) {
      const item = document.createElement('div');
      item.className = 'flex items-center gap-3 p-3 rounded-xl bg-gray-50 border border-gray-100';

      const thumb = document.createElement('div');
      thumb.className = 'w-10 h-10 rounded-lg bg-white border border-gray-200 flex items-center justify-center text-gray-400';
      thumb.textContent = '🖼';

      const info = document.createElement('div');
      info.className = 'flex-1 min-w-0';
      const name = document.createElement('p');
      name.className = 'text-sm font-bold text-gray-700 truncate';
      name.textContent = file.name;
      const size = document.createElement('p');
      size.className = 'text-xs text-gray-400';
      size.textContent = (file.size / 1024 / 1024).toFixed(1) + ' MB';
      info.appendChild(name);
      info.appendChild(size);

      const removeBtn = document.createElement('button');
      removeBtn.type = 'button';
      removeBtn.className = 'p-1 text-gray-400 hover:text-red-500 transition-colors';
      removeBtn.textContent = '✕';
      removeBtn.onclick = function() {
        // 단순히 리스트에서만 제거 (input.files 는 그대로 유지)
        item.remove();
      };

      item.appendChild(thumb);
      item.appendChild(info);
      item.appendChild(removeBtn);
      container.appendChild(item);
    });
  }

  // 제목/내용 필수 체크
  function validatePostForm() {
    const title = document.getElementById('board_title').value.trim();
    const content = document.getElementById('board_content').value.trim();

    if (!title) {
      alert('제목을 입력해주세요.');
      document.getElementById('board_title').focus();
      return false;
    }
    if (!content) {
      alert('내용을 입력해주세요.');
      document.getElementById('board_content').focus();
      return false;
    }
    return true;
  }
</script>
</body>
</html>
