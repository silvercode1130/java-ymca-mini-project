<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<<<<<<< HEAD


</head>
<body>
	

      
<h2>글쓰기 (${type})</h2>

<form action="insert.do" method="post" enctype="multipart/form-data">
=======
</head>
<body>

<h2>글쓰기 (${type})</h2>

<form action="insert.do" method="post">
>>>>>>> origin/je
    <!-- 게시판 타입 코드 넘기기 -->
    <input type="hidden" name="board_type_code" value="${type}"/>

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
        <a href="list.do">목록</a>
    </p>
<<<<<<< HEAD
 
</form>

</body>
</html>
=======
</form>

</body>
</html>
>>>>>>> origin/je
