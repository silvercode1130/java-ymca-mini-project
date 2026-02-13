<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>새 상품 등록 (관리자용)</h2>
   <form action="${pageContext.request.contextPath}/item/insert.do" method="post">
       <table border="1">
           <tr>
               <th>상품명</th>
               <td><input type="text" name="item_name" required></td>
           </tr>
           <tr>
               <th>브랜드</th>
               <td><input type="text" name="item_brand" placeholder="예: 로얄캐닌"></td>
           </tr>
           <tr>
               <th>카테고리 (타입)</th>
               <td>
                   <select name="item_type_idx">
                       <option value="1">일반(가구)</option>
                       <option value="2">사료</option>
                       <option value="3">간식</option>
                       <option value="4">장난감</option>
                       <option value="5">위생용품</option>
                       <option value="6">배변용품</option>
                        <option value="7">의류</option>
                       <option value="8">방석/쿠션</option>
                       <option value="9">야외활동</option>
                       <option value="10">하우스/이동장</option>
                   </select>
               </td>
           </tr>
           <tr>
               <th>대상 동물</th>
               <td>
                   <select name="item_for">
                       <option value="DOG">강아지</option>
                       <option value="CAT">고양이</option>
                       <option value="GENERAL">공용</option>
                   </select>
               </td>
           </tr>
           <tr>
               <th>원가</th>
               <td><input type="number" name="item_origin_price" value="0"></td>
           </tr>
           <tr>
               <th>판매가</th>
               <td><input type="number" name="item_now_price" value="0"></td>
           </tr>
           <tr>
               <th>재고 수량</th>
               <td><input type="number" name="item_stock" value="100"></td>
           </tr>
           <tr>
               <th>세일 여부</th>
               <td>
                   <input type="radio" name="item_is_sale" value="Y" checked> 세일함
                   <input type="radio" name="item_is_sale" value="N"> 세일안함
               </td>
           </tr>
           <tr>
               <th>썸네일 경로</th>
               <td><input type="text" name="item_thumbnail_img" placeholder="item_thumbnail/test01.jpg"></td>
           </tr>
           <tr>
               <th>상세이미지 경로</th>
               <td><input type="text" name="item_detail_img" placeholder="item_detail/long01.jpg"></td>
           </tr>
       </table>
       <br>
       <button type="submit">상품 등록하기</button>
   </form>
</body>
</html>