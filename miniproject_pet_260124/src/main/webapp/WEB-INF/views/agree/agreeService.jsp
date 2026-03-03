<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>서비스 이용약관 동의</title>

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
        max-width: 860px;
        background-color: #fff;
        border-radius: 16px;
        padding: 32px 28px 24px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.06);
        border: 1px solid var(--border-soft);
        max-height: 90vh;
        overflow: hidden;
        display: flex;
        flex-direction: column;
    }

    .terms-header {
        margin-bottom: 16px;
        border-bottom: 1px solid #f0f0f0;
        padding-bottom: 12px;
        flex-shrink: 0;
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

    .terms-body {
        margin-top: 10px;
        padding-right: 4px;
        overflow-y: auto;
        flex: 1 1 auto;
    }

    .terms-body h1,
    .terms-body h2 {
        font-weight: 700;
        color: #111827;
        margin: 18px 0 8px;
        font-size: 15px;
    }

    .terms-body h1:first-child {
        margin-top: 0;
        font-size: 17px;
    }

    .terms-body p,
    .terms-body div {
        font-size: 13px;
        line-height: 1.7;
        color: var(--text-sub);
        margin: 0 0 6px;
    }

    .terms-footer {
        margin-top: 12px;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        flex-shrink: 0;
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
            max-height: calc(100vh - 40px);
        }
    }
</style>
</head>
<body>

<div class="terms-container">
    <div class="terms-header">
        <div class="terms-badge">필수 약관</div>
        <h1 class="terms-title">서비스 이용약관</h1>
        <p class="terms-subtitle">
            본 약관은 ㅇㅇ회사가 제공하는 서비스 이용과 관련하여 회원과 회사 간의 권리, 의무 및 책임 사항을 규정합니다.
        </p>
    </div>

    <div class="terms-body">
        <h1>이용약관</h1>

        <h2>제 1조 목적</h2>
        <p>
            본 이용약관은 "ㅇㅇ회사"(이하 "사이트")의 서비스의 이용조건과 운영에 관한 제반사항 규정을 목적으로 합니다.
        </p>

        <h2>제2조 용어의 정의</h2>
        <p>
            회원 : 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서 사이트와의 이용계약을 체결하고 사이트를 이용하는 이용자를 말합니다.<br>
            이용계약 : 사이트 이용과 관련하여 사이트와 회원간에 체결 하는 계약을 말합니다.<br>
            회원 아이디(이하 "ID") : 회원의 식별과 회원의 서비스 이용을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.<br>
            비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.<br>
            운영자 : 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.<br>
            해지 : 회원이 이용계약을 해약하는 것을 말합니다.
        </p>

        <h2>제 3조 약관 외 규칙</h2>
        <p>
            운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며 본 약관과 운영정책이 중첩될 경우 운영정책이 우선 적용됩니다.
        </p>

        <h2>제 4조 이용계약 체결</h2>
        <p>
            이용계약은 회원으로 등록하여 사이트를 이용하려는 자의 본 약관 내용에 대한 동의와 가입신청에 대하여 운영자의 이용승낙으로 성립합니다.<br>
            회원으로 등록하여 서비스를 이용하려는 자는 사이트 가입신청 시 본 약관을 읽고 아래에 있는 “동의합니다”를 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.
        </p>

        <h2>제5조 서비스 이용 신청</h2>
        <p>
            회원으로 등록하여 사이트를 이용하려는 이용자는 사이트에서 요청하는 제반정보(이용자ID, 비밀번호, 닉네임 등)를 제공해야 합니다.<br>
            타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 사이트 이용과 관련하여 아무런 권리를 주장할 수 없으며 관계 법령에 따라 처벌 받을 수 있습니다.
        </p>

        <h2>제6조 개인정보처리방침</h2>
        <p>
            사이트 및 운영자는 회원가입시 제공한 개인정보 중 비밀번호를 가지고 있지 않으며 이와 관련된 부분은 사이트의 개인정보처리방침을 따릅니다.<br>
            운영자는 관계법령이 정하는 바에 따라 회원등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다.<br>
            회원의 개인정보보호에 관하여 관계법령 및 사이트가 정하는 개인정보처리방침에 정한 바에 따릅니다.<br>
            단 회원의 귀책사유로 인해 노출된 정보에 대해 운영자는 일체의 책임을 지지 않습니다.<br>
            운영자는 회원이 미풍양속에 저해되거나 국가안보에 위배되는 게시물 등 위법한 게시물을 등록·배포할 경우 관련기관의 요청이 있을 시 회원의 자료를 열람 및 해당 자료를 관련기관에 제출할 수 있습니다.
        </p>

        <h2>제7조 운영자의 의무</h2>
        <p>
            운영자는 이용회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 가급적 빨리 처리하여야 합니다.<br>
            다만 개인적인 사정으로 신속한 처리가 곤란한 경우에는 사후에 공지 또는 이용회원에게 쪽지, 전자우편 등을 보내는 등 최선을 다합니다.<br>
            운영자는 계속적이고 안정적인 사이트 제공을 위하여 설비에 장애가 생기거나 유실된 때에는 이를 지체 없이 수리 또는 복구할 수 있도록 사이트에 요구할 수 있습니다.<br>
            다만 천재지변 또는 사이트나 운영자에 부득이한 사유가 있는 경우 사이트 운영을 일시 정지할 수 있습니다.
        </p>

        <h2>제8조 회원의 의무</h2>
        <p>
            회원은 본 약관에서 규정하는 사항과 운영자가 정한 제반규정, 공지사항 및 운영정책 등 사이트가 공지하는 사항 및 관계법령을 준수하여야 하며 기타 사이트의 업무에 방해가 되는 행위, 사이트의 명예를 손상시키는 행위를 해서는 안됩니다.<br>
            회원은 사이트의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.<br>
            이용고객은 아이디 및 비밀번호 관리에 상당한 주의를 기울여야 하며 운영자나 사이트의 동의 없이 제3자에게 아이디를 제공하여 이용하게 할 수 없습니다.<br>
            회원은 운영자와 사이트 및 제3자의 지적 재산권을 침해해서는 안됩니다.<br>
            회원은 사회통념상 타인에게 혐오감을 줄 수 있는 콘텐츠를 사이트 내 게재하여서는 안되며 운영자는 회원이 이와 같은 콘텐츠를 게재하였음을 발견 시 즉각적으로 탈퇴 조치를 시행합니다.
        </p>

        <h2>제9조 서비스 이용시간</h2>
        <p>
            서비스 이용시간은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다.<br>
            단 사이트는 시스템 정기점검, 증설 및 교체를 위해 사이트가 정한 날이나 시간에 서비스를 일시중단 할 수 있으며 예정된 작업으로 인한 서비스 일시 중단은 사이트의 홈페이지에 사전에 공지합니다.<br>
            단, 사이트는 다음 경우에 대하여 사전 공지나 예고없이 서비스를 일시적 혹은 영구적으로 중단할 수 있습니다.<br>
            (1) 긴급한 시스템 점검, 증설, 교체, 고장 혹은 오동작을 일으키는 경우<br>
            (2) 국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우<br>
            (3) 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지한 경우<br>
            (4) 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우<br>
            전항에 의한 서비스 중단의 경우 사이트는 사전에 공지사항 등을 통하여 회원에게 통지합니다. 단 통제 불가능한 사유로 사전공지가 불가능한 경우에는 사후공지로 대신합니다.
        </p>

        <h2>제10조 서비스 이용 해지</h2>
        <p>
            회원이 사이트와의 이용계약을 해지하고자 하는 경우에는 회원 본인이 온라인을 통하여 등록해지신청을 하여야 합니다.<br>
            한편 사이트 이용해지와 별개로 사이트에 대한 이용계약 해지는 별도로 하셔야 합니다.<br>
            해지신청과 동시에 사이트가 제공하는 사이트 관련 프로그램이 회원관리 화면에서 자동적으로 삭제되며, 운영자는 더 이상 해지신청자의 정보를 볼 수 없습니다.
        </p>

        <h2>제11조 서비스 이용 제한</h2>
        <p>
            회원은 다음 각 호에 해당하는 행위를 하여서는 아니되며 해당 행위를 한 경우 사이트는 회원의 서비스 이용 제한 및 적법한 조치를 취할 수 있으며 이용계약을 해지하거나 기간을 정하여 서비스를 중지할 수 있습니다.<br>
            (1) 회원 가입시 혹은 가입 후 정보 변경시 허위 내용을 등록하는 행위<br>
            (2) 타인의 사이트 이용을 방해하거나 정보를 도용하는 행위<br>
            (3) 사이트의 운영진, 직원 또는 관계자를 사칭하는 행위<br>
            (4) 사이트, 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위<br>
            (5) 다른 회원의 ID를 부정하게 사용하는 행위<br>
            (6) 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위<br>
            (7) 범죄와 결부된다고 객관적으로 판단되는 행위<br>
            (8) 기타 관련 법령에 위배되는 행위
        </p>

        <h2>제12조 게시물의 관리</h2>
        <p>
            회사는 항상 불량 게시물 및 자료에 대하여 모니터링을 하여야 하며, 불량 게시물 및 자료를 발견하거나 신고를 받으면 해당 게시물 및 자료를 삭제하고 이를 등록한 회원에게 주의를 줄 수 있습니다.<br>
            이용회원이 올린 게시물에 대해서는 게시자 본인에게 책임이 있으므로, 회원 스스로 본 이용약관에서 위배되는 게시물을 게재해서는 안됩니다.<br>
            정보통신윤리위원회 등 공공기관의 시정요구가 있는 경우 혹은 불량 게시물로 판단되는 경우 회사는 회원의 사전 동의 없이 게시물을 삭제하거나 이동할 수 있습니다.<br>
            불량게시물의 판단기준은 다음과 같습니다.<br>
            (1) 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우<br>
            (2) 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우<br>
            (3) 불법복제 또는 해킹을 조장하는 내용인 경우<br>
            (4) 영리를 목적으로 하는 광고일 경우<br>
            (5) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우<br>
            (6) 다른 이용자 또는 제3자와 저작권 등 기타 권리를 침해하는 경우<br>
            (7) 기타 관계법령에 위배된다고 판단되는 경우
        </p>

        <h2>제13조 게시물의 보관</h2>
        <p>
            사이트 운영자가 불가피한 사정으로 본 사이트를 중단하게 될 경우, 회원에게 사전 공지를 하고 게시물의 이전이 쉽도록 모든 조치를 취하기 위해 노력합니다.
        </p>

        <h2>제14조 게시물에 대한 저작권</h2>
        <p>
            회원이 사이트 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다.<br>
            다만, 사이트 운영자와 협의에 따라 에디터 및 작가로 임명된 자가 작성하는 글에 대한 저작권은 사이트에게 귀속됩니다.<br>
            사회통념상 허용하는 범위 안에서, 회사는 회원이 작성한 게시글을 회사의 서비스를 홍보 목적으로 사용할 수 있습니다.<br>
            회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.
        </p>

        <h2>제15조 손해배상</h2>
        <p>
            본 사이트에서 발생한 모든 민·형법상 책임은 회원 본인에게 1차적으로 있습니다.<br>
            본 사이트로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 않습니다.
        </p>

        <h2>제16조 면책</h2>
        <p>
            회사는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br>
            회사는 본 사이트의 서비스 기반 및 타 통신업자가 제공하는 전기통신서비스의 장애로 인한 경우에는 책임이 면제되며 회원이 저장, 게시 또는 전송한 자료와 관련하여 일체의 책임을 지지 않습니다.<br>
            회사는 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임지지 아니합니다.<br>
            회사는 회원 상호간 또는 회원과 제3자 상호간의 일체의 활동에 대하여 책임을 지지 않으며, 자료들의 진위, 신뢰도, 정확성 등 그 내용에 대해서는 책임지지 아니합니다.
        </p>
    </div>

    <div class="terms-footer">
        <button type="button" class="btn-back" onclick="history.back();">
            <span class="btn-back-icon">←</span>
            이전으로
        </button>
    </div>
</div>

</body>
</html>
