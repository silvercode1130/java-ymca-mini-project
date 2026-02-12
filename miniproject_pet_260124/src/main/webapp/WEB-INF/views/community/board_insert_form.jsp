<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/views/common/head.jsp" %>
  <title>게시글 작성 | PetOn 커뮤니티</title>
  
<!-- CKEditor 4 -->
  <script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
  
</head>
<body class="layout-body bg-gray-50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="max-w-4xl mx-auto px-4 py-8">

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
        <span class="text-gray-900">게시글 작성</span>
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
             <script>
			// Replace the <textarea id="editor1"> with a CKEditor
			// instance, using default configuration.
			CKEDITOR.replace( 'board_content', {
			versionCheck: false,
			filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditorImageUpload.do',
			enterMode:CKEDITOR.ENTER_BR,
			shiftEnterMode:CKEDITOR.ENTER_P,
			toolbarGroups : [
				{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
				{ name: 'links' },
				{ name: 'insert' },
				'/',
				{ name: 'styles' },
				{ name: 'colors' },
				{ name: 'tools' },
				{ name: 'others' },
				{ name: 'about' }
				]
			});
			
			//이미지 업로드	
			CKEDITOR.on('dialogDefinition', function( ev ){
			   var dialogName = ev.data.name;
			   var dialogDefinition = ev.data.definition;
			 
			   switch (dialogName) {
			       case 'image': //Image Properties dialog
				   //dialogDefinition.removeContents('info');
				   dialogDefinition.removeContents('Link');
				   dialogDefinition.removeContents('advanced');
				   break;
			   }
			      });
			</script>
          </div>
        </div>

        <!-- 버튼 영역 -->
        <div class="flex justify-end items-center gap-3 mt-10 pt-6 border-t border-gray-100">
          <button type="button"
                  onclick="history.back();"
                  class="px-6 py-3 rounded-xl border-2 border-gray-200 text-gray-600 font-bold hover:bg-gray-50 transition-colors">
            목록으로
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
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

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

  //제목/내용 필수 체크
  function validatePostForm() {
    const title = document.getElementById('board_title').value.trim();

    // CKEditor에서 HTML 내용 가져오기
    let contentHtml = CKEDITOR.instances.board_content.getData();
    // 태그 제거하고 텍스트만 남긴 뒤 공백 제거
    let contentText = contentHtml
      .replace(/<[^>]*>/g, '')   // 모든 HTML 태그 제거
      .replace(/&nbsp;/g, ' ')   // nbsp 제거
      .replace(/\s+/g, '')       // 공백 몰아주기
      .trim();

    if (!title) {
      alert('제목을 입력해주세요.');
      document.getElementById('board_title').focus();
      return false;
    }
    if (!contentText) {
      alert('내용을 입력해주세요.');
      CKEDITOR.instances.board_content.focus();
      return false;
    }

    return true;
  }

</script>
<script type="text/javascript">
   //CKEditor내에서 이미지 삭제시 이벤트 처리
   let previousImageUrls = [];
   
   $(document).ready(function(){
	   
	   // CKEditor 내용을 작성하는 <textarea name="b_content">
	   const editor = CKEDITOR.instances.b_content; 
	   
	   editor.on('change', function () {

		    const currentHtml = editor.getData();
		    const currentImageUrls = extractImageUrls(currentHtml);

		    // 이전 이미지 중 현재 HTML에 없는 항목은 삭제 대상
		    previousImageUrls.forEach(oldUrl => {
		        if (!currentImageUrls.includes(oldUrl)) {
		        	
		        	//oldUrl =  http://localhost:8080/images/1763707289780_병아리.png
		            //console.log("삭제할 기존 이미지:", oldUrl);
		        	let lastIndex = oldUrl.lastIndexOf("/");
		        	let filename  = oldUrl.substring(lastIndex+1);
		        	filename      = decodeURIComponent(filename);
		        	//console.log("삭제할 화일명:", filename);
		            deleteImageOnServer(filename);
		        }
		    });
		    
		    // 현재 이미지 목록을 저장
		    previousImageUrls = currentImageUrls;
		  
		});
   });
      
   
   function extractImageUrls(html) {
	    const div = document.createElement('div');
	    div.innerHTML = html;

	    return Array.from(div.querySelectorAll('img')).map(img => img.src);
	}

	/**
	 * 서버로 이미지 삭제 요청
	 */
	function deleteImageOnServer(filename) {
		
		$.ajax({
			url			:	"${pageContext.request.contextPath}/ckeditorImageDelete.do",
			data		:	{"filename": filename },
			dataType	:	"json",
			success		:	function(res_data){
				
				// res_data = { "result" : true}
				console.log(res_data.result ? "삭제성공" : "삭제실패");
				
			},
			error		:	function(err){
				alert(err.responseText);
			}
		});
	}
</script>


</body>
</html>
