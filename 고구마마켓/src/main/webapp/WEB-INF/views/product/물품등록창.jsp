<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>물품등록창</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/img/goguma_icon.png" rel="icon">

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

.content_div {

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
	width: 420px;
	border: 0;
	padding: 10px 5px;
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
	background: #EC9D75;
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
	border-top: 0.5px solid #D3D3D3;
}

input:focus, #contents:focus {
	outline: none;
}


#won{
	margin-left:10px;
}

#tablebox{
	width:454px;
	
	margin:0px auto;	
}

#sample5_address{
 		width:360px;
 		padding:10px;
 		border:0; 		
 		
} 

#address_btn{
 		
 		padding:10px;
 		background:#EC9D75;
 		color:white;
 		font-weight:bold;
 		border-radius:5px;
 		border:1px solid #EC9D75;
 		cursor:pointer;
 		
 	} 	

</style>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=541b3e72137e8f8597b81e63cc7e6f2f&libraries=services"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section>
		<div class="my_container">
			<div class="content_div">
				<!--  여기부터 작성하시면 될듯 -->
				<div id="tablebox">
					<form onsubmit="return submit_check()" action ="/product"  method="post" enctype="multipart/form-data">
					<table>
						<tr>
							
						</tr>
						<tr>
							<th><img src="/img/product_img_add.png" id="picture" alt="물품사진" onclick="document.getElementById('picturefile').click();"><br>
								<input type="file" name="picturefile" id="picturefile" style="display: none"><br> 
								</th>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td id="title_tit"><input type="text" id="title" name="title" placeholder="제목(최대 25자)" maxlength="25" autocomplete="off"></td>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td id="price_tit"><span>￦</span><input type="number" id="price" name="price" placeholder="가격" autocomplete="off"></td>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>						
												
						<tr>
							<td><textarea id="contents" name="contents" placeholder="제품을 소개해주세요."></textarea></td>
						</tr>						
						<tr>
							<td class="table_space_line"></td>							
						</tr>
						<tr><td id="address_tit">
							<input type="text" id="sample5_address" placeholder="주소" readonly="readonly" name="address">
							<input type="button" onclick="sample5_execDaumPostcode()" value="주소검색" id="address_btn">
						</td></tr>
						<tr><td>
							<div id="map" style="width:450px;height:400px;margin-top:10px;display:none"></div>
							</td>
						</tr>
						<tr>
							<td class="table_space_line"></td>							
						</tr>						
						<tr>
							<td><input type="hidden" name="latitude" id="latitude"></td>
						</tr>
						
						<tr>
							<td><input type="hidden" name="longitude" id="longitude"></td>
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
	
	if(value2 > 999999999){
		alert("가격은 최대 9자리수 까지만 가능합니다.");
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

function address_check(){
	
	var ele = document.getElementById("sample5_address");
	if(ele.value.trim().length == 0){
		alert("판매할 지역을 선택해주세요");
		return false;
	}
	return true;
}



// function onlynumber(ele) {	
// 	ele.value = ele.value.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
// }

function submit_check(){
	
	return img_check() && title_check() && price_check() && contents_check() && address_check();
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
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
               
                
                var lat_ele = document.getElementById("latitude");
                var lng_ele = document.getElementById("longitude");
                lat_ele.value = result.y;
                lng_ele.value = result.x;
                
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