<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 쇼핑몰 - 상품 목록</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<script>
	function addToCart(idx) {
	    alert('장바구니에 담겼습니다! 확인하러 갈게요! ><');
	    location.href = "/cart/add/" + idx;
	}
</script>
<style>
	.item-container { 
		display: flex; 
		flex-wrap: wrap; 
		gap: 20px; 
		padding: 20px; 
	}
	.item-card { 
		border: 1px solid #ddd; 
		padding: 15px; 
		width: 200px; 
		border-radius: 10px; 
		text-align: center; 
	}
	.item-card img { 
		width: 100%; 
		height: 150px; 
		object-fit: cover; 
		border-radius: 5px; 
	}
	/* 검색창 위치 잡기용 스타일 */
	.header-section { 
		display: flex; 
		justify-content: space-between; 
		align-items: center; 
		padding: 0 20px; 
	}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- 메인 컨텐츠 시작 -->
<main class="max-w-7xl mx-auto px-4 py-8">

    <!-- 상단: 타이틀 + 강아지/고양이 토글 -->
    <div class="flex flex-col md:flex-row justify-between items-end mb-8 gap-4">
        <div>
            <h1 class="text-3xl font-extrabold text-gray-900 mb-2">PetOn Store 🛍️</h1>
            <p class="text-gray-500">엄선된 프리미엄 상품을 만나보세요.</p>
        </div>

        <!-- petType 토글 (기능X, UI만) -->
        <div class="flex bg-gray-100 p-1.5 rounded-full">
            <button 
                type="button"
                onclick="location.href='/item/search.do?item_for=dog&type_idx=${curType}'"
                class="flex items-center gap-2 px-6 py-2.5 rounded-full font-bold transition-all
                			${curFor == 'dog' ? 'bg-white text-blue-600 shadow-sm' : 'text-gray-400'}">
                🐶 강아지
            </button>
            <button 
                type="button"
                onclick="location.href='/item/search.do?item_for=cat&type_idx=${curType}'"
                class="flex items-center gap-2 px-6 py-2.5 rounded-full font-bold transition-all
                			${curFor == 'cat' ? 'bg-white text-pink-600 shadow-sm' : 'text-gray-400'}">
                🐱 고양이
            </button>
        </div>
    </div>

    <div class="flex flex-col md:flex-row gap-8">
        <!-- 좌측 사이드바(카테고리 + 검색) -->
        <aside class="w-full md:w-64 flex-shrink-0">
            <div class="bg-white rounded-2xl border border-gray-100 p-6 md:sticky md:top-24">

                <!-- 카테고리 (기능은 기존 a 링크 그대로 유지해도 되는데, 지금은 단순 UI만) -->
                <h3 class="font-bold text-lg mb-6 flex items-center gap-2">
                    🧩 카테고리
                </h3>
                <ul class="space-y-2 mb-6">
                    <li>
                        <a href="/item/item_list.do"
                           class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors flex justify-between items-center bg-amber-50 text-amber-600">
                            전체보기
                            <div class="w-1.5 h-1.5 rounded-full bg-amber-500"></div>
                        </a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=1" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 1 ? 'bg-amber-50 text-amber-600' : ''}">
                    		일반
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=2" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 2 ? 'bg-amber-50 text-amber-600' : ''}">
                    		사료
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=3" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 3 ? 'bg-amber-50 text-amber-600' : ''}">
                    		간식
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=4" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 4 ? 'bg-amber-50 text-amber-600' : ''}">
                    		장난감
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=5" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 5 ? 'bg-amber-50 text-amber-600' : ''}">
                    		위생용품
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=6" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 6 ? 'bg-amber-50 text-amber-600' : ''}">
                    		배변용품
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=7" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 7 ? 'bg-amber-50 text-amber-600' : ''}">
                    		의류
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=8" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 8 ? 'bg-amber-50 text-amber-600' : ''}">
                    		방석/쿠션
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=9" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 9 ? 'bg-amber-50 text-amber-600' : ''}">
                    		야외활동
                    	</a>
                    </li>
                    <li>
                    	<a href="/item/search.do?item_for=${curFor}&type_idx=10" 
                    		class="block w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50
                    					${curType == 10 ? 'bg-amber-50 text-amber-600' : ''}">
                    		하우스/이동장
                    	</a>
                    </li>
                </ul>

                

                <!-- 사이드바 프로모션 배너 (UI만) -->
                <div class="mt-8 bg-gradient-to-br from-amber-400 to-orange-400 rounded-xl p-6 text-white text-center">
                    <p class="font-bold text-lg mb-2">첫 구매 혜택</p>
                    <p class="text-sm opacity-90 mb-4">30% 할인 쿠폰 즉시 지급!</p>
                    <button class="bg-white text-amber-500 font-bold text-xs py-2 px-4 rounded-full" type="button">
                        쿠폰 받기
                    </button>
                </div>
            </div>
        </aside>

        <!-- 우측 상품 그리드 -->
        <section class="flex-1">
            <!-- 정렬/카운트 (기능은 안 건드리고, 숫자는 일단 itemList length로 표시해도 됨) -->
            <div class="flex justify-between items-center mb-6">
            	<div>
	            	<c:if test="${sessionScope.user.mem_role_idx == 3}">
		                <button onclick="location.href='/item/insert_form.do'" 
		                        class="px-4 py-2 bg-blue-600 text-white text-xs font-bold rounded-lg hover:bg-blue-700 transition-colors">
		                    + 상품 등록
		                </button>
		            </c:if>
	                <span class="text-gray-500 font-bold text-sm">
	                    총 
	                    <span class="text-gray-900">
	                        <c:choose>
	                            <c:when test="${not empty itemList}">${fn:length(itemList)}</c:when>
	                            <c:otherwise>0</c:otherwise>
	                        </c:choose>
	                    </span>
	                    개의 상품
	                </span>
                </div>
                
                <!-- 검색폼: 기존 기능 그대로 -->
                <form action="/item/item_list.do" method="get" class="space-y-3">
                    <label class="block text-sm font-semibold text-gray-700">상품 검색</label>
                    <div class="flex gap-2">
                        <input
                            type="text"
                            name="searchKeyword"
                            value="${param.searchKeyword}"
                            placeholder="검색어를 입력하세요!"
                            class="flex-1 px-3 py-2 text-sm border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-amber-400"
                        />
                        <button
                            type="submit"
                            class="px-4 py-2 text-sm font-bold rounded-xl bg-amber-400 text-white hover:bg-amber-500">
                            검색
                        </button>
                        
	                    <select class="bg-transparent text-sm font-medium text-gray-600 focus:outline-none">
		                    <option>추천순</option>
		                    <option>인기순</option>
		                    <option>신상품순</option>
		                    <option>낮은가격순</option>
		                </select>
                    </div>
                </form>
            </div>

            <!-- 상품 카드 리스트: 여기서부터 기존 c:forEach 로직 그대로 이식 -->
            <div class="grid grid-cols-2 lg:grid-cols-3 gap-6">
                <c:forEach var="item" items="${itemList}">
                    <div class="group bg-white rounded-2xl border border-gray-100/50 hover:border-amber-200 hover:shadow-lg transition-all overflow-hidden">

                        <!-- 이미지 영역 -->
                        <div class="relative aspect-square bg-gray-100 overflow-hidden">
                            <c:if test="${not empty item.item_thumbnail_img}">
                                <img 
                                    src="${pageContext.request.contextPath}/img/${item.item_thumbnail_img}" 
                                    alt="상품이미지"
                                    class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                                />
                            </c:if>

                            <c:if test="${empty item.item_thumbnail_img}">
                                <div class="w-full h-full flex items-center justify-center text-gray-400 text-sm">
                                    이미지 준비중
                                </div>
                            </c:if>

                            <!-- 우측 상단: 좋아요/장바구니 아이콘 (장바구니는 기존 addToCart 연결) -->
                            <div class="absolute top-3 right-3 flex gap-2">
                                <button type="button"
                                        class="p-2 bg-white/80 rounded-full hover:bg-red-50 hover:text-red-500 text-gray-400 transition-colors shadow-sm">
                                    ❤️
                                </button>
                                <button type="button"
                                        class="p-2 bg-white/80 rounded-full hover:bg-amber-50 hover:text-amber-500 text-gray-400 transition-colors shadow-sm"
                                        onclick="addToCart(${item.item_idx})">
                                    🛒
                                </button>
                            </div>
                        </div>

                        <!-- 텍스트/가격 영역 -->
                        <div class="p-5">
                            <h5 class="text-base font-bold text-gray-900 mb-2 line-clamp-2 h-11">
                                ${item.item_name}
                            </h5>

                            <p class="mb-3">
                                <c:if test="${item.item_origin_price > item.item_now_price}">
                                    <span class="block text-xs text-gray-400 line-through mb-1">
                                        ${item.item_origin_price}원
                                    </span>
                                </c:if>
                                <span class="text-xl font-extrabold text-[#e44d26]">
                                    ${item.item_now_price}원
                                </span>
                            </p>

                            <div class="flex items-center justify-between border-t border-gray-50 pt-3">
                                <a href="/item/item_detail.do?item_idx=${item.item_idx}"
                                   class="text-xs font-bold text-amber-500 hover:text-amber-600">
                                    상세보기 →
                                </a>
                                <button type="button"
                                        class="text-xs font-bold text-gray-500 hover:text-gray-700"
                                        onclick="addToCart(${item.item_idx})">
                                    담기 🛒
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>