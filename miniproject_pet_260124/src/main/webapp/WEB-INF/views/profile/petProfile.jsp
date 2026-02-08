<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 프로필</title>

<style>
    body {
        font-family: Arial, sans-serif;
    }

    .pet-box {
        border: 1px solid #ddd;
        padding: 15px;
        margin-bottom: 15px;
        border-radius: 8px;
    }

    .pet-title {
        font-weight: bold;
        font-size: 18px;
        margin-bottom: 5px;
    }

    .pet-sub {
        font-size: 13px;
        color: gray;
    }

    .btn-area {
        margin-top: 20px;
    }
</style>

</head>
<body>

	<h2>나의 반려동물</h2>
	
	<p>
		'강아지 온라인 국가 동물등록'을 희망 할 시 <br>
		<span style="font-size: 12px; color: gray;">'동물보호관리시스템'</span> 에 방문하여 반려동물 등록을 진행해주세요. <br>
		고양이 온라인 국가 등록은 불가합니다.
	</p>
	
	<hr>
	
	<!-- ✅ 등록된 반려동물 목록 -->
	<c:choose>
	    <c:when test="${not empty petList}">
	        <c:forEach var="pet" items="${petList}">
	            <div class="pet-box">
	
	                <div class="pet-title">
	                    ${pet.pet_name}
	                    <c:if test="${pet.is_primary eq 'Y'}">
	                        <span style="color: hotpink;">(대표)</span>
	                    </c:if>
	                </div>
	
	                <div class="pet-sub">
	                    종류 : ${pet.pet_species} <br>
	                    성별 : ${pet.pet_gender} <br>
	                    품종 : ${fn:replace(pet.pet_breed, ',', '')} <br>
	                    나이 : ${pet.pet_age}살 <br>
	                    생일 : ${pet.pet_bday}
	                </div>
	                
	                <input type="button"  value="반려동물 수정"  
	    				onclick="location.href='/update/petUpdate_form.do?pet_idx=${pet.pet_idx}'">
	
	            </div>
	        </c:forEach>
	    </c:when>
	
	    <c:otherwise>
	        <p style="color: gray;">등록된 반려동물이 없습니다.</p>
	    </c:otherwise>
	    
	</c:choose>
	
	<div class="btn-area">
	    <input type="button"  value="반려동물 등록"  onclick="location.href='/insert/petInsert_form.do'">
	    
	</div>

</body>
</html>