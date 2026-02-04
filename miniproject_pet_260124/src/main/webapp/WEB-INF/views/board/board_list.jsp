<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

=======
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> origin/je
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
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
	width: 600px;
	margin: auto;
	margin-top: 20px;
}

#title {
	text-align: center;
	font-size: 26px;
	color: rgb(51, 122, 183);
	text-shadow: 1px 1px 1px black;
}

.common {
	border: 1px solid #cccccc;
	margin: 5px;
	padding: 5px;
	box-shadow: 1px 1px 1px #aaaaaa;
}

.content {
	min-height: 60px;
}
</style>


<script type="text/javascript">
	function visit_delete(f) {
		let idx = f.idx.value;
		let c_pwd = f.c_pwd.value.trim(); // 각 게시글에서 입력받는 비밀번호(confirm pwd)

		if (c_pwd == "") {
			alert("삭제 비밀번호를 입력하세요.");
			f.c_pwd.value = "";
			f.c_pwd.focus();
			return;
		}

		// jQuery Ajax 이용해서 비번체크
		$.ajax({
			url : "check_pwd.do", // VisitCheckPwdAction
			data : {
				"idx" : idx,
				"c_pwd" : c_pwd
			}, // check_pwd.do?idx=1@c_pwd=1234
			dataType : "json",
			success : function(res_data) {
				// res_data={result:true,exist:true} or { result:false }

				if (res_data.exist == false) {
					alert("이미 삭제된 게시물 입니다");
					location.href = ""; // 자신의 페이지를 호출
					return;
				}

				if (res_data.result == false) {
					alert("비밀번호가 틀립니다");
					return;
				}

				// 삭제 확인
				if (confirm("정말 삭제하시겠습니까?") == false)
					return;

				// 삭제요청
				location.href = "delete.do?idx=" + idx;
			},
			error : function(err) {
				alert(err.responseText);
			}

		});

	} // end: visit_delete()
	function visit_modify(f) {

		let idx = f.idx.value;
		let c_pwd = f.c_pwd.value.trim(); //입력비번

		if (c_pwd == "") {
			alert("수정 비밀번호를 입력하세요!");
			f.c_pwd.value = "";
			f.c_pwd.focus();
			return;
		}

		// jQuery Ajax 이용해서 수정체크
		$.ajax({
			url : "check_mod.do", // VisitCheckPwdAction
			data : {
				"idx" : idx,
				"c_pwd" : c_pwd
			}, // check_pwd.do?idx=1@c_pwd=1234
			dataType : "json",
			success : function(res_data) {
				// res_data={result:true,exist:true} or { result:false }
				if (res_data.exist == false) {
					alert("이미 삭제된 게시물 입니다");
					location.href = ""; // 자신의 페이지를 호출
					return;
				}

				if (res_data.result == false) {
					alert("비밀번호가 틀립니다");
					return;
				}

				// 수정폼 띄우기
				location.href = "modify_form.do?idx=" + idx;
			},
			error : function(err) {
				alert(err.responseText);
			}

		});

	}//end:visit_modify()
	
	function find(){
		//				document.getElementById("search").value;
		//				document.querySelector("#search").value;
		let search 		= $("#search").val();
		let search_text = $("#search_text").val().trim();
		
		//전체보기가 아닐때 값이 비어있으면 
		if(search !='all' && search_text==""){
			alert("검색어를 입력하세요!");
			$("#search_text").val("");
			$("#search_text").focus();
			return;
		}
		
		//검색요청
		location.href = "list.do?search="+ search +
			                                      
					"&search_text=" + encodeURIComponent(search_text, "utf-8");
		
	}//end:find()
	
</script>

<!-- 초기화 이벤트 -->
<script type="text/javascript">

 $(document).ready(function(){
	 
	 if("${ not empty param.search }"=="true"){
		 
	 $("#search").val("${ param.search }");
	 }
	 
	 //전체보기면
	 if("${ param.search eq 'all'}" == "true"){
		 
		 $("#search_text").val("");
	 }
	 
 });
	
</script>

</head>
<body>

	<div id="box">
		<h1 id="title">:::: 게시판 ::::</h1>

		<div class="row" style="margin-top: 30px; margin-bottom: 5px;">
			<div class="col-sm-2">

				<input class="btn btn-primary" type="button" value="글쓰기"
					onclick="location.href='insert_form.do'">
			</div>

			<!-- 게시판목록 -->
			<div class="col-sm-10" style="text-align: right;">
				<form class="form-inline">
					<select id="search" class="form-control">
						<option value="all">전체보기</option>
						<option value="name">이름</option>
						<option value="content">내용</option>
						<option value="name_content">이름+내용</option>
					</select>
					
					<input id="search_text" class="form_control"
						value="${param.search_text }">
					<input type="button" value="검색" class="btn btn-primary" onclick="find()">
				</form>
			</div>
		</div>


		
		<!-- 내용작성 -->
		<!-- for(VisitVo vo : list)  -->
		<c:forEach var="vo" items="${ list }">

			<form class="form-inline">
				<input type="hidden" name="B_idx" value="${ vo.b_idx }">

				<!-- Bootstrap 3.x  Panel -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>
							<b>${ vo.b_name }</b>님의 글(${  vo.b_ip }):
						</h4>
					</div>

					<!-- 내용 -->
					<div class="panel-body">
						<div class="common content">${ fn:replace(vo.b_content,'<style>','') }</div>
						<div class="common">
							<label>작성일자 :</label> ${ vo.b_regdate }
						</div>
						<div class="common">
							<label>수정일자 :</label> ${ vo.b_modifydate }
						</div>

						<div class="common">
							<label>비밀번호(${ vo.b_pwd }) :</label> <input class="form-control"
								type="password" name="b_pwd"> <input
								class="btn btn-info" type="button" value="수정"
								onclick="board_modify(this.form);"> <input
								class="btn btn-danger" type="button" value="삭제"
								onclick="board_delete(this.form);">
						</div>

					</div>
				</div>
			</form>

		</c:forEach>

	</div>

</body>
</html>
=======
<title>전체 게시글 목록</title>

    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background: #f4f4f4; }
        a { text-decoration: none; color: #333; }
    </style>
    
</head>

<body>

<h2>전체 게시글 목록</h2>

<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>게시판</th>
        <th>태그</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>등록일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="b" items="${list}">
        <tr>
            <td>${b.board_idx}</td>
            <td>${b.boardType.board_type_name}</td>
            <td>${b.board_tag}</td>
            <td>
                <a href="view.do?board_idx=${b.board_idx}">
                    ${b.board_title}
                </a>
            </td>
            <td>
                <c:choose>
                    <c:when test="${b.writer != null}">
                        ${b.writer.mem_id}
                    </c:when>
                    <c:otherwise>
                        -
                    </c:otherwise>
                </c:choose>
            </td>
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
>>>>>>> origin/je
