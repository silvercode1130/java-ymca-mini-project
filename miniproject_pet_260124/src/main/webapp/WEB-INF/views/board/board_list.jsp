<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
