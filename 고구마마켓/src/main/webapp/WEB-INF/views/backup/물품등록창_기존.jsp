<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
.maincontainer{
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
 table{ 
	width:450px;  	
	margin: 0px auto; 
	margin-top:20px; 
 	border:0;
} 

/* caption{ */
/* 	font-size:2em; */
/* 	padding:3px; */
/* 	border-bottom:1px solid gray; */
/* 	text-align:left; */
/* 	color: black; */
/* } */

#picture{
	border: 1px solid;
	padding:5px;
	width:450px;
	height:450px;
}

/* .std_btn{ */
/* 	background: #D3D3D3; */
/* 	font-size:0.8em; */
/* 	border-radius:5px; */
/* 	padding:5px; */
/* 	color: black; */
/* 	float:right; */
/* 	margin-right:20px; */
/* 	cursor:pointer; */
	
/* } */

/* .std_btn:hover{ */
/* 	background-color :#FFDFC1 ; */
/* } */

input {
	width: 100%;
	padding: 10px 20px;
	box-sizing: border-box;
	border-radius:5px;			
	
}

textarea{
	width: 100%;
	height:300px;
	border-style: hidden;
}

input[type=text], input[type=number]{
/* 	background:#F5D0A9; */
	border:0;
}

input[type=submit]{
	background:#D3D3D3;
	color: black;
	border:0;
}
			
		
input[type=submit]:hover {
	background-color :#FFDFC1 ;
}

.table_space_line1{
	height:10px;
	border-top: 1px solid red;
}

.table_space_line2{
	height:5px;

}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#won{
	position:relative;
	top:27px;
	left:3px;
}

#price_tit{
position:relative;
top:-8px;
}

#product_add_btn{
	
}

</style>

<script>
function 등록하다(){
	alert( $('#summernote').val());
	return false;
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div class="maincontainer">
	<form class="productform" onsubmit="return 등록하다()" action ="/product"  method="post" enctype="multipart/form-data">
	<table>
<!-- 		<caption><i>물품등록</i><span onclick="location.href='/main'" class="std_btn">메인</span></caption> -->
		<tr><td class="table_space_line2"></td></tr>
		<tr><th><img src="/img/noimg1.png" id="picture"  alt="물품사진" onclick="document.getElementById('picturefile').click();"><br>
					<input type="file" name="picturefile" id="picturefile" style="display:none"><br>
					<span id="profile_message" class="message"></span>
				</th>	
			</tr>		
		<tr><td id="title_tit"><input type="text" id="title" name="title" placeholder="제목(최대 45자)" maxlength="45">
		</td><tr>
		<tr><td id="price_tit"><span id="won">￦</span><input type="number" id="price" name="price" placeholder="가격" onkeyup="inputNumberFormat(this)">
		<hr align="center" style="border: solid 0.25px #D3D3D3;"></td></tr>
		<tr><td class="table_space_line2"></td></tr>
		<tr><td><textarea id="contents" name="contents" placeholder="제품을 소개해주세요."></textarea></td></tr>
		<tr><td><input type="hidden" name="member_mno" value="${member_no}"></td></tr>
		<tr><td><b><input type="submit" value="등록" id="product_add_btn"></b></td></tr> 
	</table>
	</form>
</div>
</body>

<script>

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
    return ;
}
document.querySelector("#picturefile").addEventListener("change", 그림파일읽어출력하기, false);

// function comma(str) {
//     str = String(str);
//     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
// }

// function uncomma(str) {
//     str = String(str);
//     return str.replace(/[^\d]+/g, '');
// } 

// function inputNumberFormat(obj) {
//     obj.value = "￦" + comma(uncomma(obj.value));
// }

// function inputOnlyNumberFormat(obj) {
//     obj.value = onlynumber(uncomma(obj.value));
// }

// function onlynumber(str) {
//     str = String(str);
//     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
// }

</script> 
</html>
