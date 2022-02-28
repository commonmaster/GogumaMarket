<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Integer result = (Integer)request.getAttribute("result");
	// 밑에서 null 값 처리하기 귀찮아서 미리함
	if(result == null){
		result = 1;
	}
	String prev_url = (String)request.getAttribute("prev_url");
	if(prev_url == null){
		prev_url = "/main";
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>로그인창</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/img/goguma_icon.png" rel="icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Resi - v4.7.0
  * Template URL: https://bootstrapmade.com/resi-free-bootstrap-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
 	body {text-align:center;}
	
	#logo_img{		
		width:450px;
		margin-bottom:5px;
		cursor:pointer;
	}
		
	input[type=text], input[type=password]{
		width:300px;
		font-size:1.2em;
		padding:10px;
	}	
	
	

	#log {display:inline-block;}
	
	
	#button { background:#EC9D75;
		color:white;
		font-weight:bold;
		border-radius:3px;
		font-size:1.5em;
		padding:10px 5px;
		cursor:pointer;
		border: 1px solid #F5D0A9;
		}
		
	#button:hover{
		background:orange;
	}	
	
	.button_line {padding:0px 9px;}

	.underline a{font-size:1.2em;
				color:gray;
				text-decoration:none;
				}
				
	#message{font-size:0.8em;
			color:red;}
			
	#login_box{
		position: absolute;
   		top: 25%;
    	left: 50%;
    	transform: translate(-50%, -25%);
	}
	
	
 </style>
</head>

<body>
	<div id="login_box">
  <img id="logo_img" src="/img/goguma_logo2.png" onclick="location.href='/main'"><br>
  <form id="log" action="/login" method="post" onsubmit="return submitCheck()" target="_parent">
	<table border="0">
		<tr>
			<td><input type="text" id="id" name="id" placeholder="아이디" maxlength="14"></td>
			<td rowspan="2" class="button_line"><input type="submit" value="로 그 인" id="button"></td>
		</tr>
		<tr>
			<td><input type="password" id="password" name="password" placeholder="비밀번호" maxlength="14"></td>
		</tr>
		<tr>
			<td></td>
			<td class="underline"><a href="/join">회원가입</a></td>
		</tr>
		<tr><td><span id="message">
		<% if(result == -99){%>
			아이디가 존재하지 않습니다
		<%} %>
		<% if(result == -1){%>
			아이디 또는 비밀번호 오류
		<%} %>
			
		</span></td></tr>
	</table>
	<input type="hidden" value="${prev_url}" name="prev_url">
  </form>
  </div>
 

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!--   <!-- Vendor JS Files -->
<!--   <script src="assets/vendor/purecounter/purecounter.js"></script> -->
<!--   <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<!--   <script src="assets/vendor/glightbox/js/glightbox.min.js"></script> -->
<!--   <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script> -->
<!--   <script src="assets/vendor/swiper/swiper-bundle.min.js"></script> -->
<!--   <script src="assets/vendor/php-email-form/validate.js"></script> -->

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
<script>
function idCheck(){
	
	var ele = document.getElementById("id");
	var message_ele = document.getElementById("message");
	var value = ele.value.trim();
	ele.value = value;
	
	if(ele.value.length == 0){
		message_ele.innerHTML = "아이디를 입력해주세요.";
		ele.focus();
		return false;
		
	}
	else{		
		message_ele.innerHTML = "";
		return true;
				
	}
}

function pwdCheck(){
	
	var ele = document.getElementById("password");
	var message_ele = document.getElementById("message");
	var value = ele.value.trim();
	ele.value = value;
	
	if(ele.value.length == 0){
		message_ele.innerHTML = "비밀번호를 입력해주세요.";
		ele.focus();
		return false;
		
	}
	else{
		message_ele.innerHTML = "";
		return true;	
	}
}

function submitCheck(){
	
	return idCheck() && pwdCheck();
}

</script>
</html>