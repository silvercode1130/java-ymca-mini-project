<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.x -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#box {
	width: 800px;
	margin: auto;
	margin-top: 50px;
}

.common {
	border: 1px solid #dddddd;
	border-radius: 10px;
	padding: 5px;
}

.content {
	min-height: 80px;
}
</style>

<script type="text/javascript">
	// 답글 폼 이동
	function reply_form() {
	//로그인 안된경우
		if ("${ empty user}" == "true") {

			if (confirm("답글는 로그인후에 가능합니다\n로그인 하시겠습니까?")) == false)
				return;

			//로그인폼으로 이동
			location.href = "../member/login_form.do?url="
					+ encodeURIComponent(location.href, "utf-8");

			return;
		}

		//답글쓰기 폼으로 이동
		location.href = "reply_form.do?b_idx=${ vo.b_idx }&page=${param.page}";

		function send(f) {

			let b_subject = f.b_subject.value.trim();
			let b_content = f.b_content.value.trim();

			if (b_subject == "") {
				alert("제목을 입력하세요!");
				f.b_subject.value = "";
				f.b_subject.focus();
				return;
			}

			if (b_content == "") {
				alert("내용을 입력하세요!");
				f.b_content.value = "";
				f.b_content.focus();
				return;
			}

			f.method = "POST";
			f.action = "reply.do";
			f.submit();

		}
	}//end:reply_form()

	// 게시글 삭제
	function board_delete() {

		if (confirm("정말 삭제 하시겠습니까?") == false)
			return;

		//location.href="delete.do?b_idx=${vo.b_idx}";

		f.method = "POST";
		f.action = "delete.do";
		f.submit();

	}
	//endlboard_delete()
	
	//게시글 수정 폼 이동
	
	
</script>

</head>
<body>

	<form>

		<input type="hidden" name="b_idx" value="${param.b_idx }"> <input
			type="hidden" name="page" value="${param.page }">

		<div id="box">
			<!-- Bootstrap 3.x  Panel -->
			<div class="panel panel-primary">

				<div class="panel-heading">
					<h4>${vo.mem_name }님의글:</h4>
				</div>

				<div class="panel-body">

					<!-- 1 line -->
					<div>
						<label>제목</label>
						<p class="common subject">${ vo.b_subject }</p>
					</div>

					<!-- 2 line -->
					<div>
						<label>내용</label>
						<p class="common content">${ vo.b_content }</p>
					</div>

					<div>
						<label>작성(수정)일자</label>
						<p class="common regdate">${ vo.b_regdate }(${ vo.b_modifydate })</p>
					</div>

					<!-- 3 line -->
					<div class="common" style="text-align: center;">
						<input class="btn btn-success" type="button" value="메인화면"
							onclick="location.href='list.do'">

						
					</div>
				</div>
			</div>
</body>
</html>







