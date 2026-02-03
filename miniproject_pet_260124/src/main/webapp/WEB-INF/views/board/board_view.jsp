<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

</body>
</html>