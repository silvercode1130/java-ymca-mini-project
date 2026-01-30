<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { width: 120px; background: #f4f4f4; }
        .btns a, .btns form { display: inline-block; }
    </style>
</head>
<body>

<h2>${vo.board_title}</h2>

<table>
    <tr>
        <th>게시판</th>
        <td>${vo.boardType.board_type_name}</td>
    </tr>
    <tr>
        <th>태그</th>
        <td>${vo.board_tag}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>
            <c:choose>
                <c:when test="${vo.writer != null}">
                    ${vo.writer.mem_id}
                </c:when>
                <c:otherwise>-</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${vo.board_readhit}</td>
    </tr>
    <tr>
        <th>등록일</th>
        <td>${vo.board_regdate}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td><pre style="white-space: pre-wrap;">${vo.board_content}</pre></td>
    </tr>
</table>

<div class="btns">
    <a href="list.do">[목록]</a>

    <!-- 내 글일 때만 수정/삭제 버튼 노출 (session 에 user 있다고 가정) -->
    <c:if test="${not empty sessionScope.user 
                 and sessionScope.user.mem_idx == vo.mem_idx}">
        <a href="update_form.do?board_idx=${vo.board_idx}">[수정]</a>

        <form action="delete.do" method="post" style="display:inline;">
            <input type="hidden" name="board_idx" value="${vo.board_idx}">
            <button type="submit">[삭제]</button>
        </form>
    </c:if>
</div>

</body>
</html>