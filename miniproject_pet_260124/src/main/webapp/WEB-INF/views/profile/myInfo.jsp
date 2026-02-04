<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 조회</title>

<style type="text/css">
    /* 초기 화면에서 탭 내용을 몽땅 숨겨버리는 마법 */
    .tab-content {
        display: none;
    }
</style>

<script type="text/javascript">
function showTab(tabId) {
  // 모든 탭 숨기기
  document.querySelectorAll('.tab-content').forEach(el => el.style.display = 'none');
  
  // 선택된 탭만 보이기
  document.getElementById(tabId).style.display = 'block';
}
</script>

</head>
<body>
	<form class="menu"  action="">
		<div>
			<a href="#"  onclick="showTab('profile')">프로필</a>
			<a href="#"  onclick="showTab('community')">커뮤니티</a>
		</div>
		
		<div id="profile"  class="tab-content">
			<a href="/profile/myProfile.do" >내 프로필</a>
			<a href="/profile/petProfile.do">반려동물 프로필</a>
		</div>
		
		<!--! #연결 - 커뮤니티(서윤님)으로 연결 -->
		<div id="community"  class="tab-content">
			<a href="">QnA</a>
			<a href="">내가 작성한 글</a>
			<a href="">댓글</a>
		</div>
		
	</form>
</body>
</html>