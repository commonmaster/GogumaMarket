<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
      
.no-drag {
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

#intro_div {	
	text-align: center;
	margin-top:130px;
	width:1000px;	
	display:inline-block;
	
}

#intro_text_div {
	display: inline-block;
	font-size: 1.5em;
	text-align: left;
	float: left;
}

.intro_text_p>b {
	color: #EC9D75;
}

#intro_img {
	display: inline-block;
}    

.my_container{
	text-align:center;
	
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
      		<div id="intro_div" class="no-drag">
				<div id="intro_text_div">
					<p class="intro_text_p">
						<b>고</b>민없이 물건을
					</p>
					<p class="intro_text_p">
						<b>구</b>하고 싶은
					</p>
					<p class="intro_text_p">
						<b>마</b>음이들을 위한
					</p>
					<p class="intro_text_p">
						<b>고구마</b>마켓
					</p>
				</div>
				<div id="intro_img">
					<img src="/img/intro_img.png" align="middle">
				</div>
			</div>			
    </div>

  </section><!-- End Hero -->    

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!--   <!-- Vendor JS Files --> -->
<!--   <script src="assets/vendor/purecounter/purecounter.js"></script> -->
<!--   <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<!--   <script src="assets/vendor/glightbox/js/glightbox.min.js"></script> -->
<!--   <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script> -->
<!--   <script src="assets/vendor/swiper/swiper-bundle.min.js"></script> -->
<!--   <script src="assets/vendor/php-email-form/validate.js"></script> -->

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>