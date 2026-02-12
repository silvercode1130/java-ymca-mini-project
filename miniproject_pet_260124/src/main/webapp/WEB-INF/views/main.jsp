<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>펫온: 반려동물 종합 플랫폼</title>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>

</head>
<body class="layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main">
    <!-- 상단 히어로 배너 영역 -->
    <%@ include file="/WEB-INF/views/home/hero.jsp" %>

    <!-- 마케팅 배너 섹션 -->
<section class="section section-marketing">
    <div class="section-inner">
        <h3 class="section-title">
            <span class="section-title-bar"></span>
            펫온 추천 서비스
        </h3>
        <p class="section-subtitle">
            반려생활을 더 편하게 만들어 줄 맞춤 서비스들을 만나보세요.
        </p>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mt-4">
            <!-- 배너 1: 건강관리 -->
            <a href="${pageContext.request.contextPath}/lab/list.do"
               class="group relative overflow-hidden rounded-2xl shadow-sm hover:shadow-lg transition-shadow duration-300">
                <div class="w-full" style="position:relative; padding-top:75%; overflow:hidden;">
                    <img src="${pageContext.request.contextPath}/static/img/banner01.png"
                         alt="건강 관리"
                         style="position:absolute; top:0; left:0; width:100%; height:100%; object-fit:cover; transform-origin:center; transition:transform .4s;"
                         class="group-hover:scale-105">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent"></div>
                    <div class="absolute bottom-4 left-4 right-4 text-white">
                        <span class="inline-block px-2 py-0.5 mb-2 text-[11px] font-bold rounded-full bg-emerald-500/90">
                            건강 관리
                        </span>
                        <h4 class="text-base md:text-lg font-extrabold mb-1">
                            수의사 콘텐츠로<br class="hidden md:block"> 건강 체크하기
                        </h4>
                        <p class="text-xs md:text-sm text-gray-100/90">
                            PetOn LAB에서 믿을 수 있는 건강 정보를 확인해 보세요.
                        </p>
                    </div>
                </div>
            </a>

            <!-- 배너 2: 쇼핑 특가 -->
            <a href="${pageContext.request.contextPath}/item/item_list.do"
               class="group relative overflow-hidden rounded-2xl shadow-sm hover:shadow-lg transition-shadow duration-300">
                <div class="w-full" style="position:relative; padding-top:75%; overflow:hidden;">
                    <img src="${pageContext.request.contextPath}img/banner02.png"
                         alt="쇼핑 특가"
                         style="position:absolute; top:0; left:0; width:100%; height:100%; object-fit:cover; transform-origin:center; transition:transform .4s;"
                         class="group-hover:scale-105">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent"></div>
                    <div class="absolute bottom-4 left-4 right-4 text-white">
                        <span class="inline-block px-2 py-0.5 mb-2 text-[11px] font-bold rounded-full bg-amber-400/95">
                            쇼핑 특가
                        </span>
                        <h4 class="text-base md:text-lg font-extrabold mb-1">
                            오늘만 이 가격<br class="hidden md:block"> 반려용품 특가 모음
                        </h4>
                        <p class="text-xs md:text-sm text-gray-100/90">
                            마감 임박 특가와 시즌 한정 상품을 한 번에.
                        </p>
                    </div>
                </div>
            </a>

            <!-- 배너 3: 커뮤니티 -->
            <a href="${pageContext.request.contextPath}/board?type=FREE"
               class="group relative overflow-hidden rounded-2xl shadow-sm hover:shadow-lg transition-shadow duration-300">
                <div class="w-full" style="position:relative; padding-top:75%; overflow:hidden;">
                    <img src="${pageContext.request.contextPath}/static/img/banner04.png"
                         alt="커뮤니티"
                         style="position:absolute; top:0; left:0; width:100%; height:100%; object-fit:cover; transform-origin:center; transition:transform .4s;"
                         class="group-hover:scale-105">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent"></div>
                    <div class="absolute bottom-4 left-4 right-4 text-white">
                        <span class="inline-block px-2 py-0.5 mb-2 text-[11px] font-bold rounded-full bg-sky-500/90">
                            커뮤니티
                        </span>
                        <h4 class="text-base md:text-lg font-extrabold mb-1">
                            집사들의 진짜 이야기
                        </h4>
                        <p class="text-xs md:text-sm text-gray-100/90">
                            반려생활 꿀팁과 고민, 다른 집사들과 나눠보세요.
                        </p>
                    </div>
                </div>
            </a>

            <!-- 배너 4: QnA / 상담 -->
            <a href="${pageContext.request.contextPath}/board?type=QNA"
               class="group relative overflow-hidden rounded-2xl shadow-sm hover:shadow-lg transition-shadow duration-300">
                <div class="w-full" style="position:relative; padding-top:75%; overflow:hidden;">
                    <img src="${pageContext.request.contextPath}/static/img/banner05.png"
                         alt="QnA 상담"
                         style="position:absolute; top:0; left:0; width:100%; height:100%; object-fit:cover; transform-origin:center; transition:transform .4s;"
                         class="group-hover:scale-105">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent"></div>
                    <div class="absolute bottom-4 left-4 right-4 text-white">
                        <span class="inline-block px-2 py-0.5 mb-2 text-[11px] font-bold rounded-full bg-violet-500/90">
                            QnA
                        </span>
                        <h4 class="text-base md:text-lg font-extrabold mb-1">
                            궁금한 건 바로 질문
                        </h4>
                        <p class="text-xs md:text-sm text-gray-100/90">
                            사료, 건강, 행동까지 전문가와 집사들의 답변을 확인해요.
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</section>


    <!-- 쇼핑몰 추천 상품 -->
    <%-- <section class="section section-shop">
        <div class="section-inner">
            <div class="section-header">
                <h3 class="section-title best-title">이번 주 인기 상품 🏆</h3>
<p class="section-subtitle">집사님들이 가장 많이 선택한 베스트셀러</p>
                <a href="${pageContext.request.contextPath}/shop" class="section-link">전체 보기</a>
            </div>
            <div class="card-grid">
                <c:forEach var="item" items="${todayRecommendList}">
                    <a href="${pageContext.request.contextPath}/shop/item/detail?itemIdx=${item.item_idx}"
                       class="item-card">
                        <div class="item-thumb">
                            <img src="${item.item_thumbnail_img}" alt="${item.item_name}">
                            <span class="item-tag item-tag-for-${item.item_for}">${item.item_for}</span>
                        </div>
                        <div class="item-info">
                            <p class="item-name">${item.item_name}</p>
                            <div class="item-meta">
                                <span class="item-meta-star">★ 4.9</span>
                                <span class="item-meta-count">(1,234)</span>
                            </div>
                            <p class="item-price">
                                <span class="item-price-sale">10%</span>
                                <span class="item-price-now">
                                    <fmt:formatNumber value="${item.item_now_price}" type="number"/>원
                                </span>
                                <c:if test="${item.item_origin_price > item.item_now_price}">
                                    <span class="item-price-origin">
                                        <fmt:formatNumber value="${item.item_origin_price}" type="number"/>원
                                    </span>
                                </c:if>
                            </p>
                        </div>
                    </a>
                </c:forEach>
                <c:if test="${empty todayRecommendList}">
                    <div class="item-card placeholder-box">
                        오늘의 추천 상품을 준비 중입니다.
                    </div>
                </c:if>
            </div>
        </div>
    </section> --%>
    
<section class="section section-shop">
    <div class="section-inner">
        <div class="section-header">
            <h3 class="section-title best-title">마감 임박 상품 🚨</h3>
            <p class="section-subtitle">재고가 20개 이하인 상품들입니다. 서두르세요!</p>
        </div>
        
        <div class="card-grid">
            <c:forEach var="itemvo" items="${lowStockList}">
                <a href="${pageContext.request.contextPath}/item/item_detail.do?item_idx=${itemvo.item_idx}" class="item-card">
                    <div class="item-thumb">
                        <img src="${pageContext.request.contextPath}/img/${itemvo.item_thumbnail_img}" alt="${itemvo.item_name}">
                        <span class="item-tag" style="background-color: #ff4d4d; color: white;">품절주의</span>
                    </div>
                    
                    <div class="item-info">
                        <p class="item-name">${itemvo.item_name}</p>
                        <div class="item-meta">
                            <span class="item-meta-star">★ 남은 수량:</span>
                            <span class="item-meta-count">${itemvo.item_stock}</span>
                        </div>
                        <p class="item-price">
                            <span class="item-price-sale">LAST</span>
    <span class="item-price-now">
        ${itemvo.item_now_price}원
    </span>
                        </p>
                    </div>
                </a>
            </c:forEach>
            
            <c:if test="${empty lowStockList}">
                <div class="item-card placeholder-box" style="grid-column: span 4; text-align: center; padding: 60px; border: 1px dashed #ccc;">
                    현재 마감 임박 상품이 없습니다.
                </div>
            </c:if>
        </div>
    </div>
</section>

    <!-- 커뮤니티 최신글 / QnA 최신글 -->
    <section class="section section-community">
        <div class="section-inner section-inner-flex community-wrap">
            <div class="section-block community-block">
                <div class="section-header">
                    <h3 class="section-title community-title">커뮤니티 최신글 🔥</h3>
                    <a href="${pageContext.request.contextPath}/board?type=FREE" class="section-link">더 보기</a>
                </div>
                <ul class="board-list board-list-card">
                    <c:forEach var="post" items="${latestCommunityList}">
                        <li>
                            <a href="${pageContext.request.contextPath}/board/detail?boardIdx=${post.board_idx}">
                                <div class="board-card">
                                    <div class="board-card-header">
                                        <span class="board-tag-pill board-tag-${post.board_tag}">
                                            ${post.board_tag}
                                        </span>
                                        <span class="board-date">
                                            <fmt:formatDate value="${post.board_regdate}" pattern="yyyy.MM.dd"/>
                                        </span>
                                    </div>
                                    <div class="board-card-title">${post.board_title}</div>
                                    <div class="board-card-meta">
                                        <span>조회 ${post.board_readhit}</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    <c:if test="${empty latestCommunityList}">
                        <li class="board-empty">최신 커뮤니티 글이 없습니다.</li>
                    </c:if>
                </ul>
            </div>

            <div class="section-block community-block">
                <div class="section-header">
                    <h3 class="section-title">QnA 최신글</h3>
                    <a href="${pageContext.request.contextPath}/board?type=QNA" class="section-link">더 보기</a>
                </div>
                <ul class="board-list board-list-card">
                    <c:forEach var="qna" items="${latestQnaList}">
                        <li>
                            <a href="${pageContext.request.contextPath}/board/detail?boardIdx=${qna.board_idx}">
                                <div class="board-card">
                                    <div class="board-card-header">
                                        <span class="board-tag-pill">QnA</span>
                                        <span class="board-date">
                                            <fmt:formatDate value="${qna.board_regdate}" pattern="yyyy.MM.dd"/>
                                        </span>
                                    </div>
                                    <div class="board-card-title">${qna.board_title}</div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    <c:if test="${empty latestQnaList}">
                        <li class="board-empty">등록된 QnA 글이 없습니다.</li>
                    </c:if>
                </ul>
            </div>
        </div>
    </section>
</main>

<!-- 오른쪽 플로팅 툴박스 -->
<aside class="floating-toolbox">
    <button type="button" class="toolbox-btn" title="내 정보">
        <span class="toolbox-icon">👤</span>
    </button>
    <button type="button" class="toolbox-btn" title="알림">
        <span class="toolbox-icon">🔔</span>
    </button>
    <button type="button" class="toolbox-btn" title="설정">
        <span class="toolbox-icon">⚙️</span>
    </button>
    <div class="toolbox-divider"></div>
    <button type="button" class="toolbox-btn" id="btnScrollTop" title="맨 위로">
        <span class="toolbox-icon">↑</span>
    </button>
    <button type="button" class="toolbox-btn" id="btnScrollBottom" title="맨 아래로">
        <span class="toolbox-icon">↓</span>
    </button>
</aside>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
