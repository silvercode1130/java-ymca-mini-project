<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>

<h2>글쓰기 (${b_type})</h2>

<form action="${pageContext.request.contextPath}/${b_type}/insert.do" method="post">
    <!-- 목록 복귀용 상태값 -->
    <input type="hidden" name="page" value="${page}">
    <input type="hidden" name="tag" value="${tag}">

    <p>
        제목:
        <input type="text" name="board_title" style="width:400px;">
    </p>

    <p>
        태그:
        <select name="board_tag">
            <option value="NONE">자유</option>
            <option value="DOG">강아지</option>
            <option value="CAT">고양이</option>
        </select>
    </p>

    <p>
        내용:<br>
        <textarea name="board_content" rows="10" cols="80"></textarea>
    </p>

    <p>
        <button type="submit">등록</button>
        <a href="${pageContext.request.contextPath}/${b_type}/list.do?page=${page}&tag=${tag}">목록</a>
    </p>
</form>

</body>
</html>
