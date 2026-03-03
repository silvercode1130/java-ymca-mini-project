<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>

<style>
  :root{
    --brand: #BA8E23;
    --brand-soft: #FFF3C4;
    --bg: #FFFBF0;
    --card: #FFFFFF;
    --line: #E9DFC6;
    --text: #2B2B2B;
    --muted: #666;
  }

  body{
    margin: 0;
    background: var(--bg);
    color: var(--text);
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Noto Sans KR", Arial, sans-serif;
  }

  .wrap{
    max-width: 920px;
    margin: 40px auto;
    padding: 0 16px;
  }

  .card{
    background: var(--card);
    border: 1px solid var(--line);
    border-radius: 14px;
    padding: 18px;
    box-shadow: 0 10px 24px rgba(0,0,0,.06);
  }

  .page-title{
    text-align: center;
    margin: 0 0 14px 0;
    font-size: 22px;
    letter-spacing: -0.2px;
  }

  .meta{
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px 16px;
    margin-bottom: 16px;
  }

  .meta-item{
    border: 1px solid var(--line);
    background: #FFFDF6;
    border-radius: 12px;
    padding: 10px 12px;
  }

  .meta-k{
    font-size: 12px;
    color: var(--muted);
    margin-bottom: 4px;
  }

  .meta-v{
    font-size: 14px;
  }

  .meta-pay{
    grid-column: 1 / -1;
    border-left: 6px solid var(--brand);
    background: #FFF7DF;
  }

  .meta-pay .meta-v{
    font-size: 18px;
    font-weight: 800;
  }

  .badge{
    display: inline-block;
    padding: 4px 10px;
    border-radius: 999px;
    border: 1px solid rgba(186,142,35,.28);
    background: rgba(186,142,35,.12);
    color: #6B4D08;
    font-size: 12px;
    font-weight: 700;
  }

  table.order-table{
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    border: 1px solid var(--line);
    border-radius: 14px;
    overflow: hidden;
    background: #fff;
  }

  table.order-table thead th{
    padding: 12px 10px;
    text-align: center;
    font-size: 13px;
    background: linear-gradient(180deg, var(--brand-soft), #FFE59A);
    border-bottom: 1px solid var(--line);
  }

  table.order-table tbody td{
    padding: 12px 10px;
    text-align: center;
    border-bottom: 1px solid #F2EAD6;
    font-size: 14px;
  }

  table.order-table tbody tr:last-child td{
    border-bottom: 0;
  }

  .td-name{
    text-align: left;
    padding-left: 14px;
  }

  .num{
    font-variant-numeric: tabular-nums;
  }
</style>
</head>

<body>
  <div class="wrap">
    <h2 class="page-title">주문 상세 정보 (번호: ${order.orders_idx})</h2>

    <div class="card">
      <div class="meta">
        <div class="meta-item">
          <div class="meta-k">주문일시</div>
          <div class="meta-v num">${order.orders_regdate}</div>
        </div>

        <div class="meta-item">
          <div class="meta-k">주문상태</div>
          <div class="meta-v"><span class="badge">${order.status.orders_status_name}</span></div>
        </div>

        <div class="meta-item">
          <div class="meta-k">등급 할인액</div>
          <div class="meta-v num">-${order.orders_grade_discount}원</div>
        </div>

        <div class="meta-item meta-pay">
          <div class="meta-k">최종 결제액</div>
          <div class="meta-v num">${order.orders_total_price}원</div>
        </div>
      </div>

      <table class="order-table">
        <thead>
          <tr>
            <th>상품명</th>
            <th>가격(구매당시)</th>
            <th>수량</th>
            <th>소계</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${itemList}">
            <tr>
              <td class="td-name">${item.item.item_name}</td>
              <td class="num">${item.orders_price_at}원</td>
              <td class="num">${item.orders_item_quantity}개</td>
              <td class="num">${item.orders_price_at * item.orders_item_quantity}원</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
