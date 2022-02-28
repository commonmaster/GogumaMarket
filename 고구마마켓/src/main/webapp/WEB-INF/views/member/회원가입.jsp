<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>회원가입창</title>
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
 	
 	.join_table{
 		margin-left:auto;
 		margin-right:auto;
 		padding:0px;
 		margin-top:20px;
 		margin-bottom:20px;
 	} 	
 	 	
 	td{
 		padding:5px 0px;
 	}
 	
 	.tit{
 		font-weight:bold; 			
 	}
 	
 	#profile{
 		border:1px solid #D3D3D3;
 		width:450px;
 		height:450px;
 		cursor:pointer;
 	}
 	
 	#id, #sample5_address{
 		width:360px;
 		padding:10px;
 	} 	
 	
 	input[type=password], input[type=email], #name, input[type=tel]{
 		width:450px;
 		padding:10px;
 	}
 	
 	
 	#duple_btn, #address_btn{
 		
 		padding:10px;
 		background:#EC9D75;
 		color:white;
 		font-weight:bold;
 		border-radius:5px;
 		border:1px solid #EC9D75;
 		cursor:pointer;
 	} 	
 	
 	#submit_btn{
 		width:450px;
 		padding:10px 0px;
 		background:#EC9D75;
 		color:white;
 		font-weight:bold;
 		border-radius:5px;
 		border:1px solid #EC9D75;
 		cursor:pointer;
 		margin-top:10px;
 	}
 	
 	#duple_btn:hover, #submit_btn:hover{
 		background:orange;
 	}
 	
 	.message{
 		color:red;
 		font-size:0.8em;
 	}
 	
 	
 </style>
 <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=541b3e72137e8f8597b81e63cc7e6f2f&libraries=services"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body>
	 <form action="/join" method="post" onsubmit="return submitCheck()" enctype="multipart/form-data">
		
	
	<table class="join_table" id="join_table_content">	
		
		<tr><th id="join_profile_line"><img src="/img/member/profile_add_img_goguma.png" id="profile"  alt="프로필사진" onclick="document.getElementById('profileFile').click();"><br>
				<input type="file" name="profileFile" id="profileFile" style="display:none"><br>
				<span id="profile_message" class="message"></span>
			</th>	
		</tr>		
		
		<tr><td><span class="tit">아이디</span><br>
				<input type="text" name="id" id="id" maxlength="14" readonly="readonly" placeholder="중복 검사를 실행하세요">&nbsp;<input type="button" value="중복검사" onclick="openIdDuplecation()" id="duple_btn"><br>
				<span id="id_message" class="message"></span>
			</td>
		</tr>
		<tr><td><span class="tit">비밀번호</span><br>
				<input type="password" name="password" id="password" maxlength="14" onblur="password_check()"><br>
				<span id="password_message" class="message"></span>
			</td>
		</tr>
		<tr><td><span class="tit">비밀번호확인</span><br>
				<input type="password" id="password2" maxlength="14" onblur="password2_check()"><br>
				<span id="password2_message" class="message"></span>
			</td>
		</tr>
		<tr><td><span class="tit">이름</span><br>
				<input type="text" name="name" id="name" maxlength="20" onblur="name_check()" placeholder="최대  20자"><br>
				<span id="name_message" class="message"></span>
			</td>
		</tr>
		<tr><td><span class="tit">이메일</span><br>
				<input type="email" id="email" name="email" onblur="email_std_check()" placeholder="aaa@aaa.com"><br>
				<span id="email_message" class="message"></span>
			</td>
		</tr>
		<tr><td><span class="tit">휴대전화</span><br>
				<input type="tel" id="tel" name="tel" onblur="tel_std_check()" placeholder=" -없이 휴대전화 입력"><br>
				<span id="tel_message" class="message"></span>
			</td>
		</tr>
		
		<tr><td>
			<div id="map" style="width:450px;height:400px;margin-top:10px;display:none"></div>
			</td>
		</tr>
		<tr>
			<td align="center"><input type="submit" id="submit_btn" value="가 입"></td>
		<tr>	
	</table>
  </form>	
 

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!--   <!-- Vendor JS Files -->
<!--   <script src="assets/vendor/purecounter/purecounter.js"></script> -->
<!--   <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<!--   <script src="assets/vendor/glightbox/js/glightbox.min.js"></script> -->
<!--   <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script> -->
<!--   <script src="assets/vendor/swiper/swiper-bundle.min.js"></script> -->
<!--   <script src="assets/vendor/php-email-form/validate.js"></script> -->

 
	<script src="assets/js/main.js"></script>
</body>
 
<script>
var focus_switch = false;

function idGet(value){
	
	var ele = document.getElementById("id");
	ele.value = value;
	correctInputID = true;
}

function openIdDuplecation(){
		
	var win = window.open("/duplication","duple","width=350,height=250,top=200,left=800");
	var ele = document.getElementById("id");
	
	correctInputID = false;
	ele.value = "";
}

function password_check(){
	
	var ele = document.getElementById("password");
	var password2_ele = document.getElementById("password2");
	var message_ele = document.getElementById("password_message");
	var message_ele2 = document.getElementById("password2_message");
	
	var value = ele.value;
	var pattern = /^[0-9a-zA-Z]{4}[0-9a-zA-Z]*$/;
	
	if(value.length == 0){
		message_ele.innerHTML = "필수입력사항입니다.";
		if(focus_switch){
			ele.focus();
		}
		return false;
		
	}
	else{
		if(pattern.test(value)){
			if(value == password2_ele.value){
				message_ele.innerHTML = "";
				message_ele2.innerHTML = "";
				return true;
			}			
			else{
			
				message_ele.innerHTML = "비밀번호 불일치";
				
				return false;
			}
		}
		else{
			message_ele.innerHTML = "4~14자의 영문대소문자, 숫자만 사용가능합니다.";
			if(focus_switch){
				ele.focus();
			}
			return false;
		}
	}	
}


function password2_check(){
	
	var ele = document.getElementById("password2");
	var password_ele = document.getElementById("password");
	var message_ele = document.getElementById("password2_message");
	var message_ele2 = document.getElementById("password_message");
	
	var value = ele.value;
	var pattern = /^[0-9a-zA-Z]{4}[0-9a-zA-Z]*$/;
	
	if(value.length == 0){
		message_ele.innerHTML = "필수입력사항입니다.";
		if(focus_switch){
			ele.focus();
		}
		return false;
		
	}
	else{
		if(pattern.test(value)){
			if(value == password_ele.value){
				message_ele.innerHTML = "";
				message_ele2.innerHTML = "";
				return true;
			}			
			else{
			
				message_ele.innerHTML = "비밀번호 불일치";
				
				return false;
			}
		}
		else{
			message_ele.innerHTML = "4~14자의 영문대소문자, 숫자만 사용가능합니다.";
			if(focus_switch){
				ele.focus();
			}
			return false;
		}
	}	
}

function name_check(){
	
	var ele = document.getElementById("name");
	var value = ele.value;
	var message_ele = document.getElementById("name_message");
	var pattern = /^[0-9a-zA-Z가-힣]([_-]?[0-9a-zA-Z가-힣])*$/;
	
	if(value.length == 0){
		message_ele.innerHTML = "필수입력사항입니다.";
		if(focus_switch){
			ele.focus();
		}
		return false;
		
	}
	else{
		if(pattern.test(value)){
			
			message_ele.innerHTML = "";
			return true;
		}
		else{
			message_ele.innerHTML = "1~20자 한글, 영문대소문자, 숫자, 특수문자( _ )(-)만 사용가능합니다.";	
			if(focus_switch){
				ele.focus();
			}
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
		if(focus_switch){
			ele.focus();
		}
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
	var allCheck = password_check() && password2_check() && name_check() && email_std_check() && tel_std_check();
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
    correctFile = true;
    return;
}
document.querySelector("#profileFile").addEventListener("change", 그림파일읽어출력하기, false);



    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

</html>