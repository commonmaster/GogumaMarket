<%@page import="com.stone.goguma.product.common.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");
Product product = (Product) request.getAttribute("product");
Boolean isWriter = (Boolean) request.getAttribute("isWriter");
Integer loginMno = (Integer) request.getAttribute("loginMno");
System.out.println(loginMno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>물품 상세창</title>
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
<style>


header {
	border-style: hidden;
}


.maincontainer {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#picture {
	border: 1px solid black;
	padding: 5px;
	width: 450px;
	height: 450px;
}

.img-sec, .writer-sec, .title-sec, .contents-sec, .etc-sec, .heart-sec,
	.btn-sec {
	width: 450px;
	word-wrap: break-word;
}

.product-btn {
	background: #D3D3D3;
	width: 20%;
	padding: 10px 10px;
	box-sizing: border-box;
	border-radius: 5px;
	border-style: hidden
}

.maincontainer{
	border:10px solid red;
	text-align: center;

	margin: 160px auto;
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
			<div>
				<div class="maincontainer">
					<div class="img-sec">
						<img src="/img/noimg1.png" id="picture" width="450" height="450" /><br>
					</div>
					<div class="writer-sec">
						<h2>
							<strong>작성자: ${product.mno}</strong>
						</h2>
						<hr align="center" style="border: solid 1px #D3D3D3;">
					</div>
					<div class="title-sec">
						<h2>
							<strong>${product.title}</strong>
						</h2>
						<hr align="center" style="border: solid 0.25px #D3D3D3;">
						<h2>
							<strong>${product.price}</strong>
						</h2>
						<hr align="center" style="border: solid 0.25px #D3D3D3;">
					</div>
					<div class="contents-sec">
						<p>${product.contents}</p>
					</div>
					<div class="etc-sec">
						<h6>조회수 : ${product.views} 작성일 : ${product.date}</h6>
						<hr align="center" style="border: solid 0.25px #D3D3D3;">
					</div>
					<div class="heart-sec">
						<a class="heart" style="text-decoration-line: none;"> <img
							id="heart" src="img/icon/heart.svg"> 좋아요 ${product.likecnt}
						</a><br>
						<hr align="center" style="border: solid 0.25px #D3D3D3;">
					</div>
					<div class="btn-sec">
						<!-- 글쓴이와 로그인한 회원이 동일 인 일때 -->
						<%
							if (isWriter != null && isWriter == true) {
						%>
						<button class="product-btn"
							onclick="location.href='/prepare_update?pno=<%=product.getPno()%>'">변경</button>
						<button class="product-btn"
							onclick="location.href='/delete?pno=<%=product.getPno()%>'">삭제</button>
						<%
							}
						%>
						<button class="product-btn" onclick="location.href='구매창.jsp'">구매하기</button>
						<button class="product-btn" onclick="location.href='/products'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
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
    $(document).ready(function () {
		
        var heartval = ${heart.likecheck}

        console.log(heartval)

        if(heartval>0) {
            console.log(heartval);
            $("#heart").prop("src", "img/icon/heart-fill.svg");
            $(".heart").prop('name',heartval)
        }
        else {
            console.log(heartval);
            $("#heart").prop("src", "img/icon/heart.svg");
            $(".heart").prop('name',heartval)
        }

        $(".heart").on("click", function () {
			alert("하트클릭");
            var that = $(".heart");
            
	            $.ajax({
	                url :'/heartM',
	                type :'POST',
	                data : {'pno':${product.pno}, 'mno':${loginMno}},
	                success : function(data){
	                    that.prop('name',data);
	                    if(data==1) {
	                        $('#heart').prop("src","img/icon/heart-fill.svg");
	                    } else {
	                        $('#heart').prop("src","img/icon/heart.svg");
	                    }
	                    
	
	                }

	            });
	            
		location.reload();
        });
        
    });
</script>
</html>



