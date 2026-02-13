<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>개인정보 수집 및 동의</title>

<style type="text/css">
    :root {
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
        box-shadow: 0 8px 24px rgba(0,0,0,0.06);
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

    /* ===== 약관 테이블 ===== */
    table {
        width: 100%;
        margin: 16px 0 8px;
        border-collapse: separate;
        border-spacing: 0;
        border: 1px solid #ccc;
        background: #fff;
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0,0,0,0.03);
        font-size: 13px;
    }

    tr {
        background: #fdfdfd;
    }

    th, td {
        padding: 12px 14px;
        text-align: left;
        line-height: 1.5;
        border-bottom: 1px solid #e6e6e6;
        border-right: 1px solid #e6e6e6;
    }

    th {
        font-weight: 700;
        color: #222;
        background: #f4f4f5;
    }

    td:last-child, th:last-child {
        border-right: none;
    }

    tr:last-child td {
        border-bottom: none;
    }

    td:nth-child(1) { width: 30%; }
    td:nth-child(2) { width: 45%; }
    td:nth-child(3) { width: 25%; }

    .terms-footer {
        margin-top: 18px;
        display: flex;
        justify-content: flex-end;
        align-items: center;
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
        box-shadow: 0 2px 6px rgba(0,0,0,0.06);
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
        table {
            font-size: 12px;
        }
    }
</style>
</head>
<body>

<div class="terms-container">
    <div class="terms-header">
        <div class="terms-badge">필수 약관</div>
        <h1 class="terms-title">개인정보 수집 및 이용 동의</h1>
        <p class="terms-subtitle">
            ㅇㅇ회사는 개인정보를 안전하게 취급하는 데 최선을 다합니다.
        </p>
    </div>

    <h2 class="terms-section-title">[필수] 개인정보 수집 및 이용 동의</h2>
    <table>
        <tr>
            <th>목적</th>
            <th>항목</th>
            <th>보유 기간</th>
        </tr>
        <tr>
            <td>회원가입에 따른 이용자 식별 및 회원관리</td>
            <td>이메일(아이디), 비밀번호, 닉네임, SNS 간편가입 업체의 사용자별 고유키, 프로필 사진</td>
            <td>회원 탈퇴 후 지체 없이 삭제</td>
        </tr>
    </table>

    <p class="terms-text terms-highlight">개인정보 수집 및 이용 동의를 거부할 권리</p>
    <p class="terms-text">
        이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 다만, 회원가입 시 수집하는 최소한의
        개인정보, 즉 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우 서비스 회원가입이 어려울 수 있습니다.
    </p>

    <div class="terms-footer">
        <button type="button" class="btn-back" onclick="history.back();">
            <span class="btn-back-icon">←</span>
            이전으로
        </button>
    </div>
</div>

</body>
</html>
