<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>물품변경창</h1>
<form  action="/update" method="post">
<input type="hidden" name="pno" value="${product.pno} " /><br>


  제목<input type="text" name="title" value="${product.title} " /><br>
  내용<textarea id="summernote" name="contents" >${product.contents}</textarea><br>
  
 <%--  <img id="picture" src="/img/no_image.jpg" width="200" height="300"/><br>
     <input type="file" name="picturefile" id="picturefile" value="${product.picture} "/><br> --%>
  
  
  가격<input type="text" name="price" value="${product.price} " /><br>
 <input type="submit" value="변경" />
</form>
</body>
</html>
<script>
$(document).ready(function() {
	  $('#summernote').summernote();
	});

</script>
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
</script> 