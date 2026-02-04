<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 프로필 - href</title>

<style type="text/css">
	.petCard {
		width: 300px;
		height: 100px;
	
	}
</style>

<script type="text/javascript">

</script>

</head>
<body>
	<form action="">
		<h2>나의 반려동물</h2>
		'강아지 온라인 국가 동물등록'을 희망 할 시 <br>
		<span style="font-size: 12px; color: gray;">'동물보호관리시스템'</span> 에 방문하여 반려동물 등록을 진행해주세요. <br>
		고양이 온라인 국가 등록은 불가합니다. <br>
		
		<!-- type="button"  얘 빼면 form안에서는 submit으로 작동 -->
		<button type="button"  class="petCard"  onclick="location.href='/update/petUpdate.do'">
			<!-- #보류 -  동물 프로필 사진 -->
			 <div class="PetProfileImg">
				<img alt="(프로필 이미지)" src="${pet_img}" >
			</div>
			<!-- #삭제 - 👇 예정중 글자만 삭제 -->
			펫 이미지 펫 이름 펫 생일 (예정중)
			<div class="PetName">
				${ pet_name }
			</div>
			
			<div class="petBday">
				${ pet_bday }
			</div>
			
		</button>
		
		<div>
			<input type="button"  value="반려동물 등록"  onclick="location.href='/insert/petInsert.do'">
		</div>
		
	</form>
</body>
</html>