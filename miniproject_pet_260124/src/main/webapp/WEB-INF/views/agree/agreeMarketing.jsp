<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>(선택)마케팅 정보 수신 동의</title>

<style type="text/css">
    :root {
        /* 사이트 메인 컬러 – 필요하면 바꿔 */
        --peton-primary: #00b894;
        --peton-primary-soft: #e6f7f2;
        --text-main: #222;
        --text-sub: #555;
        --border-soft: #ececec;
    }

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif;
        background-color: #f5f5f7;
        color: var(--text-main);
    }

    .terms-container {
        width: 100%;
        max-width: 720px;
        background-color: #fff;
        border-radius: 16px;
        padding: 32px 28px 24px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
        border: 1px solid var(--border-soft);
    }

    .terms-header {
        margin-bottom: 20px;
        border-bottom: 1px solid #f0f0f0;
        padding-bottom: 12px;
    }

    .terms-badge {
        display: inline-flex;
        align-items: center;
        padding: 4px 10px;
        border-radius: 999px;
        font-size: 11px;
        font-weight: 600;
        color: var(--peton-primary);
        background-color: var(--peton-primary-soft);
        margin-bottom: 6px;
    }

    .terms-title {
        margin: 0;
        font-size: 20px;
        font-weight: 800;
        color: #111827;
    }

    .terms-subtitle {
        margin: 6px 0 0;
        font-size: 13px;
        color: var(--text-sub);
    }

    .terms-section-title {
        margin: 18px 0 8px;
        font-size: 15px;
        font-weight: 700;
        color: #111827;
    }

    .terms-text {
        margin: 0;
        font-size: 13px;
        line-height: 1.7;
        color: var(--text-sub);
    }

    .terms-text + .terms-text {
        margin-top: 6px;
    }

    .terms-highlight {
        font-weight: 600;
        color: #111827;
    }

    .terms-footer {
        margin-top: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 12px;
        color: #9ca3af;
    }

    .btn-back {
        height: 36px;
        padding: 0 18px;
        border-radius: 999px;
        border: 1px solid #e5e7eb;
        background: #f3f4f6;
        color: #4b5563;
        font-size: 13px;
        font-weight: 500;
        cursor: pointer;
        display: inline-flex;
        align-items: center;
        gap: 4px;
        transition: background 0.2s ease, transform 0.1s ease, box-shadow 0.2s ease;
    }

    .btn-back:hover {
        background: #e5e7eb;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.06);
    }

    .btn-back:active {
        transform: translateY(1px);
        box-shadow: none;
    }

    .btn-back-icon {
        font-size: 14px;
    }

    @media (max-width: 768px) {
        body {
            padding: 16px;
            align-items: flex-start;
        }
        .terms-container {
            padding: 24px 18px 18px;
            margin-top: 20px;
        }
    }
</style>
</head>
<body>

<div class="terms-container">
    <div class="terms-header">
        <div class="terms-badge">선택 약관</div>
        <h1 class="terms-title">마케팅 정보 수신 동의</h1>
        <p class="terms-subtitle">
            할인, 이벤트 및 맞춤형 상품 추천을 위한 광고성 정보 수신에 대한 안내입니다.
        </p>
    </div>

    <h2 class="terms-section-title">1. 광고성 정보의 이용목적</h2>
    <p class="terms-text">
        ㅇㅇ회사가 제공하는 이용자 맞춤형 서비스 및 상품 추천, 각종 경품 행사, 이벤트 등의 광고성 정보를
        전자우편이나 서신우편, 문자(SMS 또는 카카오 알림톡), 푸시, 전화 등을 통해 이용자에게 제공합니다.
    </p>
    <p class="terms-text">
        – 마케팅 수신 동의는 거부하실 수 있으며, 동의 이후에도 언제든지 철회하실 수 있습니다.<br>
        – 동의를 거부하시더라도 ㅇㅇ회사가 제공하는 서비스 이용에는 제한이 없습니다.<br>
        – 단, 할인, 이벤트 및 이용자 맞춤형 상품 추천 등의 마케팅 정보 안내 서비스는 제공되지 않을 수 있습니다.
    </p>

    <h2 class="terms-section-title">2. 미동의 시 불이익 사항</h2>
    <p class="terms-text">
        개인정보보호법 제22조 제5항에 따라 선택 정보 항목에 대해서는 동의를 거부하시더라도 서비스 이용에
        제한되지 않습니다. 단, 할인, 이벤트 및 이용자 맞춤형 상품 추천 등의 마케팅 정보 안내 서비스는
        제한될 수 있습니다.
    </p>

    <h2 class="terms-section-title">3. 서비스 정보 수신 동의 철회</h2>
    <p class="terms-text">
        ㅇㅇ회사가 제공하는 마케팅 정보를 원하지 않을 경우 <span class="terms-highlight">“마이페이지 &gt; 회원 정보 수정”</span> 메뉴에서
        수신 동의를 철회하실 수 있습니다.
    </p>
    <p class="terms-text">
        향후 마케팅 정보 수신에 새롭게 동의하고자 하는 경우에도 동일한 경로(<span class="terms-highlight">마이페이지 &gt; 회원 정보 수정</span>)를 통해
        동의를 변경하실 수 있습니다.
    </p>

    <div class="terms-footer">
        <span>시행일자 : 2019. 01. 01</span>
        <button type="button" class="btn-back" onclick="history.back();">
            <span class="btn-back-icon">←</span>
            이전으로
        </button>
    </div>
</div>

</body>
</html>
