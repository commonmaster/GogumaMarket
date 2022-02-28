<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 알림창</title>
<style>
body {
	text-align: center;
}

#cotents{
	margin-top:70px;
}
span {
	font-size: 1.5em;
}

button {
	width: 250px;
	padding:10px;
	color: white;
	border-radius: 5px;
	font-weight: bold;
	background: #EC9D75;
	border: 0;
}

button:hover{
	background:orange;
}
</style>
</head>
<body>
	<div id="cotents">
	<img src="/img/member/member_join_success.jpg" width="300px"><br>
	<span>${name}</span> 님 가입을 환영합니다.
	<br>
	<br>
	<button onclick="window.open('/main','_parent')">확인</button>
	</div>
</body>
<script>
	
</script>
</html>