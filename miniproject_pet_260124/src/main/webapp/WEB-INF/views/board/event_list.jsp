<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>

    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background: #f4f4f4; }
        a { text-decoration: none; color: #333; }
    </style>
    
</head>

<body>

<h2>이벤트</h2>

<!-- 태그 필터 -->
<form method="get" action="list.do">
    <select name="tag">
        <option value="ALL"  ${tag == 'ALL'  ? 'selected' : ''}>전체</option>
        <option value="DOG"  ${tag == 'DOG'  ? 'selected' : ''}>강아지</option>
        <option value="CAT"  ${tag == 'CAT'  ? 'selected' : ''}>고양이</option>
        <option value="NONE" ${tag == 'NONE' ? 'selected' : ''}>자유</option>
    </select>
    <button type="submit">필터</button>
</form>

<table>
    <thead>
    <tr>
        <th>번호</th>
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
            <td>${b.board_tag}</td>
            <td>
                <a href="../view.do?board_idx=${b.board_idx}">
                    ${b.board_title}
                </a>
            </td>
            <td>
                <c:choose>
                    <c:when test="${b.writer != null}">
                        ${b.writer.mem_id}
                    </c:when>
                    <c:otherwise>-</c:otherwise>
                </c:choose>
            </td>
            <td>${b.board_readhit}</td>
            <td>${b.board_regdate}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<p>
    <a href="../insert_form.do?type=EVENT">[글쓰기]</a>
</p>

</body>
</html>
