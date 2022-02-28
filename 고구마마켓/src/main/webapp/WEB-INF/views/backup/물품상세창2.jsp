<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@page import="com.stone.goguma.product.common.Product"%>    
    
   <%
    	request.setCharacterEncoding("utf-8");
            Product product = (Product) request.getAttribute("product");
            	Boolean isWriter = (Boolean) request.getAttribute("isWriter");
    %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>물품상세창</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
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
header {
	
}

.content {
	text-align: center;
	padding: 0px 40px;
	margin: 60px auto;
}

#picture {
	width: 450px;
	height: 450px;
	border: 1px solid #D3D3D3;
}

#title, #product_add_btn {
	width: 450px;
	margin-bottom: 2px;
	border: 0;
}

#title {
	padding: 10px 10px;
}

#price {
	width: 430px;
	border: 0;
	padding: 10px 5px;
}

#price_tit {
	
}

#contents {
	width: 450px;
	height: 400px;
	padding: 10px;
	margin-top: 10px;
	border: 0;
}

#product_add_btn {
	padding: 10px 0px;
	background: #FA8258;
	color: white;
	font-weight: bold;
}

#product_add_btn:hover {
	background: orange;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.table_space_line {
	border-top: 1px solid #D3D3D3;
}

input:focus, #contents:focus {
	outline: none;
}

table {
	margin: 0px auto;
}
</style>
</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section>
		<div class="my_container">
			<div class="content">
				<!--  여기부터 작성하시면 될듯 -->
				<div id="tablebox">
					<form onsubmit="return submit_check()">
					<table>
						<tr>
							<td><h1>물품상세</h1></td>
						</tr>
						<tr>
							<th><img src="/picture/<%=product.getPno()%>" id="picture" alt="물품사진" onclick="document.getElementById('picturefile').click();"><br>
								<input type="file" name="picturefile" id="picturefile" style="display: none"><br> 
							</th>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td id="title_tit"><input type="text" id="title" name="title" placeholder="제목(최대 25자)" maxlength="25" autocomplete="off"></td>
						<tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td id="price_tit">￦<input type="number" id="price"	name="price" placeholder="가격" autocomplete="off" maxlength="10"></td>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td><textarea id="contents" name="contents" placeholder="제품을 소개해주세요."></textarea></td>
						</tr>
						<tr>
							<td><input type="hidden" name="member_mno"  value="${member_no}"></td>
						</tr>
						<tr>
							<td><b><input type="submit" value="등록"	id="product_add_btn"></b></td>
						</tr>
					</table>
					</form>
				</div>
			</div>


		</div>

	</section>
	<!-- End Hero -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

var isImgSetting = false;

function 그림파일읽어출력하기(이벤트) {
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
       return ;
    }
    var 파일리더 = new FileReader();
         파일리더.onload = function(선택된그림파일관리객체) {
  	  var imgPicture=document.getElementById("picture");    	  
  	  imgPicture.src=선택된그림파일관리객체.currentTarget.result;
    };      
    파일리더.readAsDataURL(선택된그림파일관리객체);
    isImgSetting = true;
    return ;
}
document.querySelector("#picturefile").addEventListener("change", 그림파일읽어출력하기, false);

function img_check(){
	if(!isImgSetting){
		alert("물품 이미지를 넣어주세요");
		return false;
	}
	return true;
}

function title_check(){
	
	var ele = document.getElementById("title");
	var value = ele.value;
	
	if(value.trim().length == 0){
		alert("제목을 입력해주세요.")
		ele.focus();
		return false;
	}
	return true;
}

function price_check(){
	
	
	var ele = document.getElementById("price");
	var value = ele.value;
	let value2 = value.trim();
	
	if(value2.length == 0){
		alert("가격을 입력해주세요.")
		ele.focus();
		return false;
	}
		
	if(value2 <= 0){
		alert("0 이상의 가격을 입력해주세요.");
		ele.focus();
		return false;
	}
	
	return true;
	
}

function contents_check(){
	
	 var value = $("#contents").val();
	 if(value.trim().length == 0){
		 alert("물품 소개글을 입력해주세요.");
		 return false;
	 }
	 return true;
}

// function onlynumber(ele) {	
// 	ele.value = ele.value.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
// }

function submit_check(){
	
	return img_check() && title_check() && price_check() && contents_check();
}
</script>
</html>