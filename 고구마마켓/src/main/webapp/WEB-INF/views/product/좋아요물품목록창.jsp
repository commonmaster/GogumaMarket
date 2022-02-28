<%@page import="com.stone.goguma.product.common.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.stone.goguma.product.common.*" %>
<%

	List<Product> hproducts = (List<Product>) request.getAttribute("hproducts");
	
	int 현재페이지번호 = (int) request.getAttribute("pageNo");
	int 마지막페이지번호 = (int) request.getAttribute("lastPageNo");
	
	int 블럭당페이지수 = 5;
	int 블럭시작페이지번호 = 현재페이지번호 - ((현재페이지번호 - 1) % 블럭당페이지수);
	int 예상블럭끝페이지번호 = 블럭시작페이지번호 + 블럭당페이지수 - 1;
	int 블럭끝페이지번호 = (마지막페이지번호 >= 예상블럭끝페이지번호) ? 예상블럭끝페이지번호 : 마지막페이지번호;
	
	System.out.println("예상끝:" + 예상블럭끝페이지번호);
	System.out.println("블럭끝:" + 블럭끝페이지번호);
	System.out.println("마지막페이지번호:" + 마지막페이지번호);

%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>좋아요한 목록창</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/img/goguma_icon.png" rel="icon">

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
	.content_div {
		margin: 60px auto;
	}

	#my_products_div{
 		margin:0px auto;
 		border:1px solid #D3D3D3;
 		width:640px;
 		margin-bottom:10px;
 	}
 	
 	.my_product_div{
 		width:635px;
 		height:245px;
 		cursor:pointer;
 		padding:10px 0px;
 	}
 	
 	.my_product_img_div{
 		width:225px;
 		height:225px;
 		display:inline-block;
 		margin-left:10px;
 		float:left;
 	}
 	
 	.my_product_img{
 		width:225px;
 		height:225px
 	}	
 	
 	.my_product_text_div{
 		width:400px;
 		height:225px;
 		display:inline-block;
 		
 	}	
 	
 	.my_product_text_table{
 		width:400px;
 		table-layout: fixed;
 	}
 	
 	.my_product_text_table td{
 		overflow:hidden;
		white-space : nowrap;
		text-overflow: ellipsis;
		padding:0px 10px;
 	}
 	.my_product_title_td, .my_product_st_pr_td{
 		font-weight:bold;
 	}
 	.my_product_address_td{
 		font-size:0.9em;
 		color:#848484
 	}
 	
 	.my_product_like_td{
 		text-align:right;
 	}
 	.nohasProduct_message {
	position: absolute;
   	top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
	text-align: center;
	font-style: italic;
	color:#848484;
	}
	.page_table{
		margin: 40px auto;
	}
	
	.page_move_text{
		display:inline-block;
		padding:5px 10px;
		
	}
	
	.page_a{
		display:inline-block;
		padding:5px 10px;
		color:black;
		text-decoration:none;
	}
	
	#current_page_a{
		background:#EC9D75;
		color:white;
	}
	
	.my_product_div:hover{
	box-shadow:2px 2px 2px 2px gray;
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
			<div class="content_div">
				<!--  여기부터 작성하시면 될듯 -->
<% if(마지막페이지번호 > 0){
		
	for(int 일련번호=0;일련번호<hproducts.size();일련번호++){ 
	Product 물품 =hproducts.get(일련번호);//zero base
%>
		<div id="my_products_div">
      		<div class="my_product_div" onclick="location.href='/product_detail/<%=물품.getPno()%>'">
      			<div class="my_product_img_div"><img src="/picture/<%=물품.getPno() %>" class="my_product_img"></div>
      			<div class="my_product_text_div">
      				<table class="my_product_text_table">
      					<tr><td class="my_product_title_td"><%= 물품.getTitle() %></td></tr>
      					<tr><td class="my_product_address_td"><%=물품.getDate() %></td></tr>
      					<tr><td class="my_product_st_pr_td"><%=물품.getPrice() %>원</td></tr>
      					<tr><td class="my_product_like_td"><%=물품.getUser().getName() %></td></tr>
      				</table>
      			</div>
      		</div>
      	</div>	
   	<%}
	}else{ %>
		<h2 class="nohasProduct_message">해당하는 좋아요한 물품이 없습니다.</h2>		
	<%} %>
	<%if(마지막페이지번호 >0){ %>
		<table class="page_table"><tr><th>
	<%
		if (블럭시작페이지번호 > 블럭당페이지수) {
	%>
	<a href="hearted_products?pageno=<%=블럭시작페이지번호 - 1%>" class="page_move_text">[이전]</a>
	<%
		}
	%>

	<%
		for (int 페이지번호 = 블럭시작페이지번호; 페이지번호 <= 블럭끝페이지번호; 페이지번호++) {
			if(페이지번호 == 현재페이지번호){
	%>
		<a href="hearted_products?pageno=<%=페이지번호%>" class="page_a" id="current_page_a"><%=페이지번호%></a>
		<%
			}else{	
		%>
		<a href="hearted_products?pageno=<%=페이지번호%>" class="page_a"><%=페이지번호%></a>
	<%}
			} %>

	<%
		if (블럭끝페이지번호 < 마지막페이지번호) {
	%>
	<a href="hearted_products?pageno=<%=블럭끝페이지번호 + 1%>" class="page_move_text">[다음]</a>
	<%
		}
	%>
	</th></tr></table>
	<%} %>
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
</html>