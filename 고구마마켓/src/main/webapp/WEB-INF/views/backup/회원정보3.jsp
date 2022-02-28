<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>회원 정보</title>
 <style>

 	.info_table{
 		margin:30px auto 0px auto;
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
 	}
 	 	
 	#id, input[type=email], #name, input[type=tel]{
 		width:430px;
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
				
	

 </style>
 </head>
 <body>
  
  <form action="/member" method="post" onsubmit="return submitCheck()" enctype="multipart/form-data">
		
	<table class="info_table" id="join_table_content">	
		<tr><td><input type="hidden" name="mno" value="${member.mno }"></td></tr>
		<tr><td><input type="hidden" value=0 id="isImgChange" name="isImgChange"></td></tr>
		<tr><td><b id="id_text">${member.id}</b> 님의 정보</td></tr>
		<tr><th id="join_profile_line">
		<c:if test="${!profileSetting}">
		<img src="/img/member/minion.jpg" id="profile" alt="기본프로필" onclick="document.getElementById('profileFile').click();">
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