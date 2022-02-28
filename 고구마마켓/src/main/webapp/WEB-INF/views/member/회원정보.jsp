<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>고구마마켓</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

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
 	.info_table{
 		border:0;
 		margin-bottom:20px;
 	
 	} 	
 	#id_text{
 		font-size:1.5em;
 		color:#EC9D75;
 	}
 	
 	td{
 		padding:5px;
 	}
 	
 	.tit{
 		font-weight:bold;
 	}
 	
 	#profile{
 		padding:9px;
 		width:440px;
 		height:440px;
 		border:1px solid #D3D3D3;
 		cursor:pointer;
 	}
 	
 	#profile:hover{
	box-shadow:2px 2px 2px 2px gray;
}
 	 	
 	#id, input[type=email], #name, input[type=tel]{
 		width:450px;
 		padding:10px;
 		border: 1px solid #D3D3D3;
 	}
 	
 	#password{
 		width:318px;
 		padding:10px;
 		border: 1px solid #D3D3D3;
 	} 
 	
 	#pwd_change_btn{
 		padding:10px;
 		color:white;
 		border-radius:5px;
 		font-weight:bold;
 		background:#EC9D75;
 		border:0;
 	}
 	
 	#submit_btn, #withdraw_btn{
 		width:450px;
 		padding:10px;
 		background:#EC9D75;
 		color:white;
 		font-weight:bold;
 		border-radius:5px;
 		border:1px solid #EC9D75;
 	}
 	
 	#pwd_change_btn:hover, #submit_btn:hover{
 		background:orange;
 	}
 	
 	.message{
 		color:red;
 		font-size:0.8em;
 	}
 	
 	#member_info_field_div{
 		width:454px;
 	
 		margin:35px auto 0px auto;
 	}
  </style>
</head>

<body>

  <!-- ======= Header ======= -->
 	<jsp:include page="../include/menu.jsp"></jsp:include>
 	<!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero">

    <div class="my_container">
    		<div id="member_info_field_div">
      		<form action="/member" method="post" onsubmit="return submitCheck()" enctype="multipart/form-data">
		
	<table class="info_table" id="join_table_content">	
		<tr><td><input type="hidden" name="mno" value="${member.mno }"></td></tr>
		<tr><td><input type="hidden" value=0 id="isImgChange" name="isImgChange"></td></tr>
		<tr><td><b id="id_text">${member.id}</b> 님의 정보</td></tr>
		<tr><th id="join_profile_line">
		<c:if test="${!profileSetting}">
		<img src="/img/member/member_basic_profile.png" id="profile" alt="기본프로필" onclick="document.getElementById('profileFile').click();">
		</c:if>
		<c:if test="${profileSetting}">
		<img src="/profile/${member.mno}" id="profile"  alt="프로필사진" onclick="document.getElementById('profileFile').click();">
		</c:if><br>
				<input type="file" name="profileFile" id="profileFile" style="display:none"><br>
				<span id="profile_message" class="message"></span>
			</th>
		</tr>	
		
		
		<tr><td><span class="tit">비밀번호</span><br>
				<input type="password" name="password" id="password" maxlength="14" placeholder="변경시 비밀번호 입력">
				<input type="button" value="비밀번호 변경" id="pwd_change_btn" onclick="openPwdChange()"><br>
				<span id="password_message" class="message"></span>
			</td>
		</tr>
		
		<tr><td><span class="tit">이름</span><br>
				<input type="text" name="name" id="name" maxlength="20" onblur="name_check()" placeholder="최대  20자" value="${member.name }"><br>
				<span id="name_message" class="message"></span>
			</td>
		</tr>
		<tr><td><span class="tit">이메일</span><br>
				<input type="email" id="email" name="email" onblur="email_std_check()" value="${member.email }"><br>
				<span id="email_message" class="message"></span>
			</td>
		</tr>
		<tr><td><span class="tit">휴대전화</span><br>
				<input type="tel" id="tel" name="tel" onblur="tel_std_check()" value="${member.tel }"><br>
				<span id="tel_message" class="message"></span>
			</td>
		</tr>
		
		<tr>
			
			<td align="center">
				<input type="submit" id="submit_btn" value="정보 변경"><br><br><br>
				<c:if test="${member.id != 'admin'}">
					<a href="/withdraw">회원 탈퇴</a>
				</c:if>
			</td>
		</tr>	
	
	</table>	
  </form>
  </div>
    </div>

  </section><!-- End Hero -->    

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
var focus_switch = false;

function openPwdChange(){
	
	var win = window.open("/pwd_change","pwdChange","width=230,height=390,top=300,left=900");
	
}

function password_check(){
	
	var ele = document.getElementById("password");
	var message_ele = document.getElementById("password_message");
	
	
	var value = ele.value;
	var pattern = /^[0-9a-zA-Z]{4}[0-9a-zA-Z]*$/;
	
	if(value.length == 0){
		//message_ele.innerHTML = "필수입력사항입니다.";
		ele.focus();
		return false;
		
	}
	else{
		message_ele.innerHTML = "";
		return true;
	}	
}

function name_check(){
	
	var ele = document.getElementById("name");
	var value = ele.value;
	var message_ele = document.getElementById("name_message");
	var pattern = /^[0-9a-zA-Z가-힣]([_-]?[0-9a-zA-Z가-힣])*$/;
	
	if(value.length == 0){
		message_ele.innerHTML = "필수입력사항입니다.";
		ele.focus();
		return false;
		
	}
	else{
		if(pattern.test(value)){
			
			message_ele.innerHTML = "";
			return true;
		}
		else{
			message_ele.innerHTML = "1~20자 한글, 영문대소문자, 숫자, 특수문자( _ )(-)만 사용가능합니다.";	
			ele.focus();
			return false;
		}		
	}	
}

function email_std_check(){
	
	var ele = document.getElementById("email");
	var value = ele.value;
	var message_ele = document.getElementById("email_message");
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	if (regEmail.test(value) === true) {
		message_ele.innerHTML = "";
		return true;
	}
	else{
		message_ele.innerHTML = "올바르지 못한 이메일 형식입니다.";
		ele.focus();
		return false;
	}	
}

function tel_std_check(){
	
	var ele = document.getElementById("tel");
	var value = ele.value;
	var message_ele = document.getElementById("tel_message");
	var regTel = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
	
	if (regTel.test(value) === true) {
		message_ele.innerHTML = "";
		return true;
	}
	else{
		message_ele.innerHTML = "올바르지 못한 휴대전화 형식입니다.";
		if(focus_switch){
			ele.focus();
		}
		return false;
	}	
}


function submitCheck(){
	
	focus_switch = true;
	var allCheck = password_check() && name_check() && email_std_check() && tel_std_check();
	focus_switch = false;
	
	return allCheck;
}



function 그림파일읽어출력하기(이벤트) {
	correctFile = false;
	var fileInput=이벤트.target;
	//change이벤트.target(대상)은 <input type="file" name="profileFile" id="profileFile"/>
    var 선택된그림파일관리객체 = fileInput.files[0]; 
    var 선택된그림size = 선택된그림파일관리객체.size;
     /*
    if(선택된그림size > 1024*10){
    	alert("10K 요량초과!");
    	fileInput.value="";
    	return ;
    }
     */
    if (!선택된그림파일관리객체.type.match('image.*')) {
       alert("욱! 그림이 아니예요!");
       fileInput.value="";
       correctFile = false;
       return;
    }
    var 파일리더 = new FileReader();
         파일리더.onload = function(선택된그림파일관리객체) {
  	  var imgFile=document.getElementById("profile");    	  
  	  imgFile.src=선택된그림파일관리객체.currentTarget.result;
    }
         
	파일리더.readAsDataURL(선택된그림파일관리객체);
  	
	var ele = document.getElementById("isImgChange");
    ele.value = 1;
	
    return;
}
document.querySelector("#profileFile").addEventListener("change", 그림파일읽어출력하기, false);



</script>
</html>