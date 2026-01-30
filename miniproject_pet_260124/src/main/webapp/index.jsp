<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetLife | 우리 아이와 함께하는 행복한 시간</title>
    <style>
        /* 기본 폰트 및 스타일 초기화 */
        body, h1, h2, p { margin: 0; padding: 0; font-family: 'Pretendard', sans-serif; }
        body { line-height: 1.6; color: #333; background-color: #fcfcfc; }

        /* 네비게이션 */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 10%;
            background: #fff;
            border-bottom: 1px solid #eee;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .logo { font-size: 24px; font-weight: bold; color: #FFB74D; text-decoration: none; }
        nav a { margin-left: 20px; text-decoration: none; color: #555; font-weight: 500; }

        /* 히어로 섹션 */
        .hero {
            background-color: #FFF9C4;
            padding: 80px 10%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .hero-text h1 { font-size: 40px; margin-bottom: 20px; color: #444; }
        .hero-text p { font-size: 18px; color: #666; margin-bottom: 30px; }
        .hero-img img { width: 450px; border-radius: 30px; box-shadow: 20px 20px 0px #FFB74D; }

        /* 회사 소개 섹션 */
        .about { padding: 80px 10%; text-align: center; }
        .about h2 { font-size: 32px; margin-bottom: 40px; }
        .features { display: flex; gap: 20px; justify-content: space-around; }
        .feature-item {
            flex: 1;
            padding: 30px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        .feature-item:hover { transform: translateY(-10px); }
        .feature-item img { width: 60px; margin-bottom: 20px; }
        .feature-item h3 { margin-bottom: 15px; color: #FFB74D; }

        /* 버튼 스타일 */
        .btn {
            background: #FFB74D;
            color: #fff;
            padding: 12px 25px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
        }

        /* 푸터 */
        footer { background: #333; color: #fff; padding: 40px 10%; text-align: center; }
    </style>
</head>
<body>

<header>
    <a href="#" class="logo">🐾 PetLife</a>
    <nav>
        <a href="#">홈</a>
		<a href="#">컨텐츠</a>
		<a href="#">쇼핑</a>
		<a href="#">커뮤니티</a>
        <a href="#">서비스</a>
	    <a href="#">크리에이터</a>
        <a href="#">고객지원</a>
	    <a href="#">로그인</a>
    </nav>
</header>

<section class="hero">
    <div class="hero-text">
        <h1>반려동물의 건강한 삶,<br>우리가 함께 고민합니다.</h1>
        <p>초보 집사부터 베테랑 반려인까지,<br>신뢰할 수 있는 정보를 지금 바로 확인하세요.</p>
        <a href="#" class="btn">자세히 알아보기</a>
    </div>
    <div class="hero-img">
        <img src="https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80" alt="반려동물">
    </div>
</section>

<section class="about">
    <h2>PetLife가 제공하는 가치</h2>
    <div class="features">
        <div class="feature-item">
            <img src="https://cdn-icons-png.flaticon.com/512/3047/3047928.png" alt="백과사전">
            <h3>반려 지식 백과</h3>
            <p>질병 정보부터 훈련법까지, 전문가가 검수한 신뢰성 높은 콘텐츠를 제공합니다.</p>
        </div>
        <div class="feature-item">
            <img src="https://cdn-icons-png.flaticon.com/512/3652/3652191.png" alt="커뮤니티">
            <h3>집사 커뮤니티</h3>
            <p>이웃 집사들과 일상을 공유하고 궁금한 점을 함께 해결해보세요.</p>
        </div>
        <div class="feature-item">
            <img src="https://cdn-icons-png.flaticon.com/512/1041/1041916.png" alt="쇼핑">
            <h3>맞춤형 큐레이션</h3>
            <p>우리 아이의 나이와 건강 상태에 꼭 맞는 상품을 추천해 드립니다.</p>
        </div>
    </div>
</section>

<footer>
    <p>(주) 펫라이프 | 대표: 장정은 | 대구광역시 중구 YMCA </p>
    <p>© 2026 PetLife. All rights reserved.</p>
</footer>

</body>
</html>