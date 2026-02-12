<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 | PetOn 커뮤니티</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss/dist/tailwind.min.css">
</head>
<body class="bg-gray-50">

<div class="max-w-7xl mx-auto px-4 py-10">

    <!-- Header Section -->
    <div class="mb-8">
        <h1 class="text-3xl font-extrabold text-gray-900 mb-2">자유게시판 💬</h1>
        <p class="text-gray-500 text-sm">
            소소한 일상부터 정보 공유까지, 자유롭게 이야기를 나눠보세요.
        </p>
    </div>

    <!-- Toolbar -->
    <div class="flex flex-col md:flex-row justify-between items-center gap-4 mb-6">
        <!-- Tag Filters -->
        <form method="get" action="list.do" class="flex gap-2 self-start md:self-auto">
            <button type="submit" name="tag" value="ALL"
                    class="px-4 py-2 rounded-full text-sm font-bold transition-all
                    ${tag == 'ALL' ? 'bg-amber-400 text-white' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'}">
                전체
            </button>
            <button type="submit" name="tag" value="DOG"
                    class="px-4 py-2 rounded-full text-sm font-bold transition-all
                    ${tag == 'DOG' ? 'bg-blue-100 text-blue-600' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'}">
                강아지
            </button>
            <button type="submit" name="tag" value="CAT"
                    class="px-4 py-2 rounded-full text-sm font-bold transition-all
                    ${tag == 'CAT' ? 'bg-pink-100 text-pink-600' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'}">
                고양이
            </button>
            <button type="submit" name="tag" value="NONE"
                    class="px-4 py-2 rounded-full text-sm font-bold transition-all
                    ${tag == 'NONE' ? 'bg-green-100 text-green-600' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'}">
                자유
            </button>
        </form>

        <!-- Actions (검색 + 글쓰기) -->
        <div class="flex gap-3 w-full md:w-auto justify-end">
            <!-- 검색은 나중에 붙일 거면 form으로 감싸면 됨 -->
            <div class="relative flex-1 md:w-64">
                <input
                    type="text"
                    placeholder="게시글 검색 (옵션)"
                    class="w-full pl-3 pr-3 py-2 border border-gray-200 rounded-lg text-sm
                           focus:outline-none focus:border-amber-400"
                />
            </div>
            <a href="../insert_form.do?type=FREE"
               class="flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-lg
                      font-bold hover:bg-gray-800 transition-colors text-sm flex-shrink-0">
                글쓰기
            </a>
        </div>
    </div>

    <!-- Board List (Table 스타일) -->
    <div class="bg-white border border-gray-200 rounded-2xl overflow-hidden shadow-sm">

        <!-- 헤더 (데스크탑) -->
        <div class="hidden md:flex py-3 border-b border-gray-200 bg-gray-50 text-xs font-bold text-gray-500 text-center">
            <div class="w-16">번호</div>
            <div class="w-24">카테고리</div>
            <div class="flex-1 text-left px-4">제목</div>
            <div class="w-24">작성자</div>
            <div class="w-28">작성일</div>
            <div class="w-16">조회</div>
        </div>

        <!-- 리스트 -->
        <div class="divide-y divide-gray-100">
            <c:forEach var="b" items="${list}">
                <c:set var="tagLabel">
                    <c:choose>
                        <c:when test="${b.board_tag == 'DOG'}">강아지</c:when>
                        <c:when test="${b.board_tag == 'CAT'}">고양이</c:when>
                        <c:otherwise>자유</c:otherwise>
                    </c:choose>
                </c:set>

                <a href="../view.do?board_idx=${b.board_idx}"
                   class="block flex flex-col md:flex-row md:items-center py-4 md:py-3
                          hover:bg-amber-50/40 transition-colors cursor-pointer group">

                    <!-- 모바일 상단: 카테고리 + 날짜 -->
                    <div class="md:hidden flex justify-between items-center mb-1 px-4">
                        <span class="text-[10px] font-bold px-1.5 py-0.5 rounded
                                     <c:choose>
                                        <c:when test="${b.board_tag == 'DOG'}">bg-blue-50 text-blue-500</c:when>
                                        <c:when test="${b.board_tag == 'CAT'}">bg-pink-50 text-pink-500</c:when>
                                        <c:otherwise>bg-green-50 text-green-500</c:otherwise>
                                     </c:choose>">
                            ${tagLabel}
                        </span>
                        <span class="text-xs text-gray-400">
                            <fmt:formatDate value="${b.board_regdate}" pattern="yyyy.MM.dd" />
                        </span>
                    </div>

                    <!-- 번호 (데스크탑) -->
                    <div class="hidden md:block w-16 text-center text-sm text-gray-400">
                        ${b.board_idx}
                    </div>

                    <!-- 카테고리 (데스크탑) -->
                    <div class="hidden md:flex w-24 justify-center">
                        <span class="text-xs font-bold px-2 py-0.5 rounded border
                                     <c:choose>
                                        <c:when test="${b.board_tag == 'DOG'}">border-blue-100 text-blue-500 bg-blue-50</c:when>
                                        <c:when test="${b.board_tag == 'CAT'}">border-pink-100 text-pink-500 bg-pink-50</c:when>
                                        <c:otherwise>border-green-100 text-green-500 bg-green-50</c:otherwise>
                                     </c:choose>">
                            ${tagLabel}
                        </span>
                    </div>

                    <!-- 제목 -->
                    <div class="flex-1 px-4 min-w-0">
                        <h3 class="text-sm md:text-base font-medium text-gray-900
                                   group-hover:text-amber-600 truncate">
                            ${b.board_title}
                        </h3>
                    </div>

                    <!-- 작성자 / 날짜 / 조회수 -->
                    <div class="flex justify-between items-center px-4 md:px-0 mt-1 md:mt-0">
                        <div class="md:w-24 md:text-center text-sm text-gray-600">
                            <c:choose>
                                <c:when test="${b.writer != null}">
                                    ${b.writer.mem_id}
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                        <div class="hidden md:block w-28 text-center text-xs text-gray-400">
                            <fmt:formatDate value="${b.board_regdate}" pattern="yyyy.MM.dd" />
                        </div>
                        <div class="flex items-center gap-1 md:w-16 md:justify-center text-xs text-gray-400">
                            ${b.board_readhit}
                        </div>
                    </div>
                </a>
            </c:forEach>

            <c:if test="${empty list}">
                <div class="py-12 text-center text-gray-400 text-sm">
                    등록된 게시글이 없습니다.
                </div>
            </c:if>
        </div>
    </div>

    <!-- 글쓰기 버튼 (모바일에서 한 번 더 강조하고 싶으면) -->
    <div class="mt-6 flex justify-end md:hidden">
        <a href="../insert_form.do?type=FREE"
           class="inline-flex items-center gap-2 px-4 py-2 bg-gray-900 text-white rounded-lg
                  font-bold text-sm hover:bg-gray-800">
            글쓰기
        </a>
    </div>

</div>

</body>
</html>
