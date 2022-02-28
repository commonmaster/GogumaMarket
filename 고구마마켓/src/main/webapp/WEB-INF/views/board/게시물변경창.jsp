<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>게시물변경창</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/img/goguma_icon.png" rel="icon">


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
.content_div {
	padding: 0px 40px;
	margin: 60px auto;
}


#board_form_div{
	width:644px;
	margin:0px auto;
}

.table_space_line{
	border:0.5px solid #d3d3d3;
}
#title{
	width:640px;
	padding:10px;
	border:0;
}

#board_change_btn{
	width:640px;
	padding:10px 0px;
	background:#EC9D75;
	color:white;
	border:0;
	font-weight:bold;
}

#board_change_btn:hover{
	background:orange;
}

input:focus {
	outline: none;
}

</style>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section>
		<div class="my_container">
			<div class="content_div">
				<!--  여기부터 작성하시면 될듯 -->
				<div id="board_form_div">
				<form action="/board_update" onsubmit="return 등록하다()"  method="post">
					<input type="hidden" name="bno" value="${board.bno}">
					<table id="board_add_table">
						
						<tr><td class="table_space_line"></td>
						<tr><td id="title_tit"><input type="text" id="title" name="title" placeholder="제목(최대 40자)" maxlength="40" value="${board.title}"></td><tr>
						<tr><td class="table_space_line"></td></tr>
						<tr><td><p></p></td></tr>
						<tr><td><textarea id="summernote" name="contents">${board.contents}</textarea></td></tr>						
						<tr><td><input type="submit" value="변경" id="board_change_btn"></td></tr> 
					</table>
				</form>
				</div>
			</div>
		</div>

	</section>
	<!-- End Hero -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i	class="bi bi-arrow-up-short"></i></a>

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
$(document).ready(function() {
	$('#summernote').summernote({    
	    height: 400,
	    width:640
	  });
	});
</script>
</html>