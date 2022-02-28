<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.stone.goguma.product.common.Product"%>

<%
	List<Product> products = (List<Product>) request.getAttribute("products");
int 현재페이지번호 = (int) request.getAttribute("pageNo");
int 마지막페이지번호 = (int) request.getAttribute("lastPageNo");

int 블럭당페이지수 = 5;
int 블럭시작페이지번호 = 현재페이지번호 - ((현재페이지번호 - 1) % 블럭당페이지수);
int 예상블럭끝페이지번호 = 블럭시작페이지번호 + 블럭당페이지수 - 1;
int 블럭끝페이지번호 = (마지막페이지번호 >= 예상블럭끝페이지번호) ? 예상블럭끝페이지번호 : 마지막페이지번호;

// System.out.println("예상끝:" + 예상블럭끝페이지번호);
// System.out.println("블럭끝:" + 블럭끝페이지번호);
// System.out.println("마지막페이지번호:" + 마지막페이지번호);

String search = (String)request.getAttribute("search");
String search_uri = "";
if(!search.trim().equals("")){
	search_uri = "&search="+search;
}
%>

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

.main_product_box {
	width: 240px;
	display: inline-block;
	height: 250px;
	margin: 20px;
	cursor: pointer;
}

.main_product_box:hover{
	box-shadow:2px 2px 2px 2px gray;
}

.main_product_img_div {
	width: 220px;
	height: 150px;
	padding: 0px 10px;
}

.main_product_img {
	border-radius: 10px;
	width: 220px;
	height: 150px;
}

.main_product_table {
	margin: 0px auto;
	font-size: 0.8em;
	width: 220px;
	table-layout: fixed;
}

.main_product_table td {
	padding: 5px 0px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.main_product_table_address {
	color: #A4A4A4;
}

.main_product_table_price {
	color: #F7BE81;
}

.like_count_box {
	float: right;
}

.like_count_text {
	color: black;
}

#content_box {
	width:1160px;
	margin:0px auto;
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
				<div id="content_box">
					<%
					if (마지막페이지번호 > 0) {
					for (int i = 0; i < products.size(); i++) {
						Product product = products.get(i);
				%>
				<div class="main_product_box" onclick="location.href='/product_detail/<%=product.getPno()%>?pageno=<%=현재페이지번호%><%=search_uri %>'">
					<div class="main_product_img_div">
						<img src="/picture/<%=product.getPno()%>"
							class="main_product_img">
					</div>
					<div>
						<table class="main_product_table">
							<tr>
								<td class="main_product_table_title"><b><%=product.getTitle()%></b></td>
							</tr>
							<tr>
								<td class="main_product_table_address"><%=product.getAddress() %>
							</tr>
							<tr>
								<td class="main_product_table_price"><%=product.getPrice()%> 원
									<span class="like_count_box"> <span
										class="like_count_text">♡ <%=product.getLikecnt()%></span></span></td>
							</tr>
						</table>
					</div>
				</div>
				<%
					}
				} else {
				%>
				<h3 class="nohasProduct_message">검색하신 물품은 없습니다.</h3>
				<%
					}
				%>
				<%if(마지막페이지번호 > 0){ %>
				<table class="page_table"><tr><th>
				<%
					if (블럭시작페이지번호 > 블럭당페이지수) {
				%>
				<a href="products?pageno=<%=블럭시작페이지번호 - 1%><%=search_uri %>" class="page_move_text">[이전]</a>
				<%
					}
				%>

				<%
					for (int 페이지번호 = 블럭시작페이지번호; 페이지번호 <= 블럭끝페이지번호; 페이지번호++) {
						if(페이지번호 == 현재페이지번호){
				%>
					<a href="products?pageno=<%=페이지번호%><%=search_uri %>" class="page_a" id="current_page_a"><%=페이지번호%></a>
					<%
						}else{	
					%>
					<a href="products?pageno=<%=페이지번호%><%=search_uri %>" class="page_a"><%=페이지번호%></a>
				<%}
						} %>

				<%
					if (블럭끝페이지번호 < 마지막페이지번호) {
				%>
				<a href="products?pageno=<%=블럭끝페이지번호 + 1%><%=search_uri %>" class="page_move_text">[다음]</a>
				<%
					}
				%>
				</th></tr></table>
				<%
				}
				%>
				
				
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

</html>