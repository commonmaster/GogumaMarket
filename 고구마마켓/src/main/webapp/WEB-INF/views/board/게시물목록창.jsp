<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.stone.goguma.board.common.Board"%>
<%-- <% List<제품> 제품리스트 = request.getAttribute("제품리스트"); %>     --%>
<%
List<Board> boards= (List<Board>) request.getAttribute("boards");
int 마지막페이지번호 = (int) request.getAttribute("lastPageNo");
int 현재페이지번호 = (int) request.getAttribute("pageNo");
int 블럭당페이지수=5;
int 블럭시작페이지번호=현재페이지번호-(현재페이지번호-1)%5;
int 예상블럭끝페이지번호=(블럭시작페이지번호+(블럭당페이지수-1));
int 블럭끝페이지번호= 예상블럭끝페이지번호<=마지막페이지번호? 예상블럭끝페이지번호:마지막페이지번호;

%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>게시물목록창</title>
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
.board_table{
	width:640px;
	margin:0px auto 10px auto;
	border-bottom:1px solid #d3d3d3;
	border-top:1px solid #d3d3d3;
	cursor:pointer;
}

.board_table:hover{
	box-shadow:2px 2px 2px 2px gray;
}

.board_table td{
	padding: 5px 10px;
}

.board_title_td{
	font-weight:bold;
}

.board_writer_td{
	color:#848484;
}

.board_views_span{
	float:right;
}

#writeBtn_div{
	width:640px;
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
	<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section>
		<div class="my_container">
			<div class="content_div">
				<!--  여기부터 작성하시면 될듯 -->
				<div id="boards_div">
				<%	if(마지막페이지번호 > 0){
					for(int 일련번호=0;일련번호<boards.size();일련번호++){ 
						Board 게시물 =boards.get(일련번호);//zero base
					%>	
					<table class="board_table" onclick="location.href='/board_detail/<%=게시물.getBno()%>?pageno=<%=현재페이지번호%>'">
						<tr><td class="board_title_td"><%=게시물.getTitle() %></td></tr>
						<tr><td class="board_writer_td"><%=게시물.getWriter().getName() %></td></tr>
						<tr><td class="board_date_views_td"><span class="board_date_span"><%=게시물.getDate_str() %></span><span class="board_views_span">조회수 <%=게시물.getViews() %></span></td></tr>						
					</table>
				<%}}else{ %>	
					<h3 class="nohasProduct_message">게시글이 없습니다.</h3>	
				<%} %>
				</div>				
				<div id="pages_div">
				<%if(마지막페이지번호>0){ %>
						<%if(마지막페이지번호 >0){ %>
					<table class="page_table"><tr><th>
				<%
					if (블럭시작페이지번호 > 블럭당페이지수) {
				%>
				<a href="boards?pageno=<%=블럭시작페이지번호 - 1%>" class="page_move_text">[이전]</a>
				<%
					}
				%>

				<%
					for (int 페이지번호 = 블럭시작페이지번호; 페이지번호 <= 블럭끝페이지번호; 페이지번호++) {
						if(페이지번호 == 현재페이지번호){
				%>
					<a href="boards?pageno=<%=페이지번호%>" class="page_a" id="current_page_a"><%=페이지번호%></a>
					<%
						}else{	
					%>
					<a href="boards?pageno=<%=페이지번호%>" class="page_a"><%=페이지번호%></a>
				<%}
						} %>

				<%
					if (블럭끝페이지번호 < 마지막페이지번호) {
				%>
				<a href="boards?pageno=<%=블럭끝페이지번호 + 1%>" class="page_move_text">[다음]</a>
				<%
					}
				%>
				</th></tr></table>
				<%} %>
				<%} %>		
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


</script>
</html>