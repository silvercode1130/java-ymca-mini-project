<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>펫온 쇼핑몰 | PetOn Shop</title>
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">

    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- 메인 컨텐츠 시작 -->
    <main class="max-w-7xl mx-auto px-4 py-8">

        <!-- 상단: 타이틀 + 강아지/고양이 토글 -->
        <div class="flex flex-col md:flex-row justify-between items-end mb-8 gap-4">
            <div>
                <h1 class="text-3xl font-extrabold text-gray-900 mb-2">PetOn Store 🛍️</h1>
                <p class="text-gray-500">엄선된 프리미엄 상품을 만나보세요.</p>
            </div>

            <!-- 여기 petType 토글은 나중에 JS/JSP로 연결 -->
            <div class="flex bg-gray-100 p-1.5 rounded-full">
                <button 
                    class="flex items-center gap-2 px-6 py-2.5 rounded-full font-bold transition-all bg-white text-blue-600 shadow-sm">
                    🐶
                    강아지
                </button>
                <button 
                    class="flex items-center gap-2 px-6 py-2.5 rounded-full font-bold transition-all text-gray-400 hover:text-gray-600">
                    🐱
                    고양이
                </button>
            </div>
        </div>

        <div class="flex flex-col md:flex-row gap-8">
            <!-- 좌측 사이드바(카테고리) -->
            <aside class="w-full md:w-64 flex-shrink-0">
                <div class="bg-white rounded-2xl border border-gray-100 p-6 md:sticky md:top-24">
                    <h3 class="font-bold text-lg mb-6 flex items-center gap-2">
                        <!-- Filter 아이콘 대신 텍스트/이모지 -->
                        🧩 카테고리
                    </h3>
                    <ul class="space-y-2">
                        <!-- 카테고리는 일단 하드코딩, 나중에 코드테이블 연동 가능 -->
                        <li>
                            <button 
                                class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors flex justify-between items-center bg-amber-50 text-amber-600">
                                전체보기
                                <div class="w-1.5 h-1.5 rounded-full bg-amber-500"></div>
                            </button>
                        </li>
                        <li><button class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50">사료</button></li>
                        <li><button class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50">간식</button></li>
                        <li><button class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50">장난감</button></li>
                        <li><button class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50">하우스</button></li>
                        <li><button class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50">방석</button></li>
                        <li><button class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50">야외활동</button></li>
                        <li><button class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50">배변용품</button></li>
                        <li><button class="w-full text-left px-4 py-3 rounded-xl text-sm font-medium transition-colors text-gray-600 hover:bg-gray-50">위생용품</button></li>
                    </ul>

                    <!-- 사이드바 프로모션 배너 -->
                    <div class="mt-8 bg-gradient-to-br from-amber-400 to-orange-400 rounded-xl p-6 text-white text-center">
                        <p class="font-bold text-lg mb-2">첫 구매 혜택</p>
                        <p class="text-sm opacity-90 mb-4">30% 할인 쿠폰 즉시 지급!</p>
                        <button class="bg-white text-amber-500 font-bold text-xs py-2 px-4 rounded-full">
                            쿠폰 받기
                        </button>
                    </div>
                </div>
            </aside>

            <!-- 우측 상품 그리드 -->
            <section class="flex-1">
                <!-- 정렬/카운트 -->
                <div class="flex justify-between items-center mb-6">
                    <span class="text-gray-500 font-bold text-sm">
                        총 <span class="text-gray-900">
                        <!-- 나중에 ${totalCount}로 교체 -->
                        8
                        </span>개의 상품
                    </span>
                    <select class="bg-transparent text-sm font-medium text-gray-600 focus:outline-none">
                        <option>추천순</option>
                        <option>인기순</option>
                        <option>신상품순</option>
                        <option>낮은가격순</option>
                    </select>
                </div>

                <!-- 상품 카드 리스트 (일단 1개 샘플, 나중에 c:forEach로 반복) -->
                <div class="grid grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- 상품 카드 1개 예시 -->
                    <div class="group bg-white rounded-2xl border border-gray-100/50 hover:border-amber-200 hover:shadow-lg transition-all overflow-hidden cursor-pointer">
                        <div class="relative aspect-square bg-gray-100 overflow-hidden">
                            <img 
                                src="https://images.unsplash.com/photo-1684882726821-2999db517441?auto=format&fit=crop&w=600&q=80" 
                                alt="유기농 연어 사료 2kg"
                                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                            />
                            <div class="absolute top-3 right-3 flex gap-2">
                                <button class="p-2 bg-white/80 rounded-full hover:bg-red-50 hover:text-red-500 text-gray-400 transition-colors shadow-sm">
                                    ❤️
                                </button>
                                <button class="p-2 bg-white/80 rounded-full hover:bg-amber-50 hover:text-amber-500 text-gray-400 transition-colors shadow-sm">
                                    🛒
                                </button>
                            </div>

                            <!-- Pet Badge -->
                            <div class="absolute bottom-3 left-3">
                                <span class="text-[10px] font-extrabold px-2 py-1 rounded-md bg-white/90 backdrop-blur-sm shadow-sm text-blue-600">
                                    DOG
                                </span>
                            </div>
                        </div>

                        <div class="p-5">
                            <div class="text-xs text-amber-500 font-bold mb-1">사료</div>
                            <h3 class="text-base font-bold text-gray-900 mb-2 line-clamp-2 h-11">
                                유기농 연어 사료 2kg
                            </h3>
                            <div class="flex items-end gap-1 mb-3">
                                <span class="text-xl font-extrabold text-gray-900">
                                    28,900
                                </span>
                                <span class="text-sm text-gray-400 font-medium mb-1">원</span>
                            </div>
                            <div class="flex items-center gap-1 border-t border-gray-50 pt-3">
                                <span class="text-amber-400 text-xs">★</span>
                                <span class="text-xs font-bold text-gray-700">4.9</span>
                                <span class="text-xs text-gray-400">(1,234)</span>
                            </div>
                        </div>
                    </div>

                    <%-- 여기서부터는 c:forEach로 ItemVo 리스트를 반복해서 카드 렌더링 예정 --%>
                </div>

                <!-- 더보기 버튼 -->
                <div class="mt-12 text-center">
                    <button class="px-8 py-3 border border-gray-200 rounded-full text-gray-600 font-bold hover:bg-gray-50 transition-colors">
                        상품 더보기
                    </button>
                </div>
            </section>
        </div>
    </main>
    <!-- 메인 컨텐츠 끝 -->

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <!-- 공통 JS -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
