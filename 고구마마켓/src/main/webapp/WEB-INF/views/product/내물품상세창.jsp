<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.stone.goguma.product.common.Product"%>	
<%@ page import="java.util.List" %>
<%@page import="com.stone.goguma.product.common.*"%>	
<%
	request.setCharacterEncoding("utf-8");
	Product product = (Product) request.getAttribute("product");
	Boolean isWriter = (Boolean) request.getAttribute("isWriter");
	Integer loginMno = (Integer)request.getAttribute("loginMno");
	Boolean	눌렀었다= (Boolean)request.getAttribute("눌렀었다");
	List<Reply> reply = (List<Reply>)request.getAttribute("reply");
	String currentPstate = new String();
	if(product.getPstate()== (int) 1){
		currentPstate = "거래중";
	}else if(product.getPstate()== (int) 0){
		currentPstate = "거래완료";
	}else{
		currentPstate = "물품상태 오류";
	}
	System.out.println(product.getPstate() + currentPstate);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>내물품상세창</title>
<meta content="" name="description">
<meta content="" name="keywords">


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
	padding: 0px 40px;
	margin: 60px auto;
}
#picture {
	
	padding: 5px;
	width: 450px;
	height: 450px;
	margin-bottom:25px;
}

table{
	margin:0px auto;
	width:450px;
}

#writer_td, #title_td, #price_td, #contents_td, #views_date_td, #like_td, #btn_td{
	padding:10px;
}

.table_space_line {
	border-top: 0.5px solid #D3D3D3;
}

#view_span{
	float:left;
}

#date_span{
	float:right;
}

#btn_td{
	text-align:right;
}
.product-btn{
	padding:10px;
	background:#EC9D75;
	color:white;
	font-weight:bold;
	border:0;
	margin-left:5px;
}
.product-btn:hover{
	background:orange;
}

#col-sm-10_add{
	width:720px;
}

#contents{
	width:640px;
	display:inline-block;
	text-align:left;
	
}
#btnReplySave{
	margin-bottom:30px;
	padding:10px;
	background:#EC9D75;
	border:0;
	font-weight:bold;
	
}
#btnReplySave:hover{
	background:orange;
}
#reply_div{
	margin-top:80px;
}

#reply_input_div, #replyList_divbox{
	width:725px;
	margin:0px auto;
	
	
}
</style>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=541b3e72137e8f8597b81e63cc7e6f2f&libraries=services"></script>
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
				<table>
						<tr>
							
						</tr>
						<tr>
							<th><img src="/picture/${product.pno }" id="picture" alt="물품사진"></th>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>	
						<tr>
							<td id="title_td">${product.title}</td>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td id="price_td">￦ ${product.price }</td>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td id="contents_td">${product.contents }</td>
						</tr>
						<tr>
							<td id="views_date_td"><span id="view_span">조회수 : ${product.views}</span><span id="date_span">작성일 : ${product.date}</span></td>
						</tr>
						<tr><td class="table_space_line"></td></tr>
						<tr>
							<td id="like_td"><a class="heart" style="text-decoration-line: none;">
						        <%if(눌렀었다==null || 눌렀었다==false){ %>
						        	<img id="heart" src="/img/icon/heart.svg" style="cursor: -webkit-grab; cursor: grab;">
						        <%}else{ %>
						            <img id="heart" src="/img/icon/heart-fill.svg" style="cursor: -webkit-grab; cursor: grab;" >
						        <%} %>
						                좋아요  ${product.likecnt}
						    </a></td>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td>${product.address}</td>
						</tr>
						<tr><td>
							<div id="map" style="width:450px;height:400px;margin-top:10px;"></div>
							</td>
						</tr>
						<tr>
							<td class="table_space_line"></td>
						</tr>
						<tr>
							<td id="btn_td"><!-- 글쓴이와 로그인한 회원이 동일 인 일때 -->
						<%
							if (isWriter != null && isWriter == true) {
						%>
						<button class="product-btn" onclick="pstate_update_confirm()"><%=currentPstate %></button>
						<button class="product-btn"	onclick="location.href='/product_update?pno=<%=product.getPno()%>'">변경</button>
						<button class="product-btn"	onclick="delete_confirm()">삭제</button>
						<%
							}else{
						%>
						<button class="product-btn" onclick="location.href='구매창.jsp'">구매하기</button>
						<%
						}
						%>
						<c:set var="pstate" value="${empty param.pstate? '1':param.pageno}"/>
						<button class="product-btn" onclick="location.href='/mproducts?pstate=${pstate}'">목록</button></td>
						</tr>
					</table>
					
					<div id="reply_div">
						<div class="my-3 p-3 bg-white rounded shadow-sm" id="reply_input_div" style="padding-top: 10px">
							<form>	
								<input type="hidden" name="pno"  value="${product.pno}" />
								<input type="hidden" name="mno"  value="${sessionScope.mno}" id="mno" />
						<div>
							<div class="col-sm-10" id="col-sm-10_add">
								<textarea class="form-control" id="contents" rows="3" placeholder="구매자에게 보낼 메세지를 작성하세요(100자)"  maxlength="100"></textarea>
								<button type="button" class="btn btn-sm btn-primary" id="btnReplySave">등 록</button>
							</div>
						</div>
						</form>
					</div>
						<div class="my-3 p-3 bg-white rounded shadow-sm" id="replyList_divbox" style="padding-top: 10px">
							<h6 class="border-bottom pb-2 mb-0">구매 요청</h6>
							<div id="replyList"></div>
						</div> 
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
$(document).ready(function () {
    let b눌렀냐 =<%=눌렀었다%>;
	$(".heart").on("click", function () {
	    <%if(눌렀었다==null){%>
    	alert("로그인 하십시오.");
    <%}else{%>
		 b눌렀냐=!b눌렀냐;   
	     $.ajax({
	         url :'/heart',
	         type :'POST',
	         contentType:"application/json",
	         data : JSON.stringify({pno:${product.pno},press:b눌렀냐}),
	         dataType:"text",
	         success : function(data){
	             if(b눌렀냐) {
	                 $('#heart').prop("src","/img/icon/heart-fill.svg");
	             } else {
	                 $('#heart').prop("src","/img/icon/heart.svg");
	             }
	             location.reload();
	         }
	     });
	 <% } %>
	});
		
	showReplyList();	
	
	$(document).on('click', '#btnReplySave', function(){
		
		$.ajax({
			url: '/reply_save',	
			type : 'POST',
			contentType:"application/json",
			data : JSON.stringify({pno:${product.pno},mno:$('#mno').val(),contents:$('#contents').val()}),
			dataType : 'text',
			success: function(data){		
				showReplyList();
				$('#contents').val('');			
			}
			, error: function(error){
				alert("에러");

			}
		});	
	});

});

function showReplyList(){
	$.ajax({
		type: 'POST',
		url: '/getReplyList',
		data: {pno : ${product.pno}},
		dataType: 'json',
		success: function(result) {
   		var htmls = "";
		if(result.length < 1){
			htmls.push("등록된 댓글이 없습니다.");
		} else {
            $(result).each(function(){
             htmls += '<div class="media text-muted pt-3" id="rno' + this.rno + '">';
             htmls += '<title>Placeholder</title>';
             htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
             htmls += '<span class="d-block">';
             // 판매 물품의 주인이 댓글의 작성자라면
             if(this.pno.user.mno == this.mno.mno){
             	htmls += '<strong class="text-gray-dark">★★판매자★★</strong>';
             }
             else{
            	 htmls += '<strong class="text-gray-dark">' + this.mno.name + '(' + this.mno.id + ')</strong>';
             }
             htmls += '<span style="padding-left: 7px; font-size: 9pt">';
          
             var loginMno = <%=loginMno%>;     
             // 로그인한 유저가 작성자라면
             if(loginMno == this.mno.mno){
            	htmls += '<a href="javascript:void(0)" onclick="editReply(' + this.rno + ', \'' + this.pno.user.mno + '\', \'' + this.mno.id + '\', \'' + this.mno.mno + '\', \'' + this.mno.name + '\', \'' + this.contents + '\', \'' + this.cdate_str + '\' )" style="padding-right:5px">수정</a>';
             	htmls += '<a href="javascript:void(0)" onclick="deleteReply(' + this.rno + ', \'' + this.mno.mno + '\' )" >삭제</a>';
             }
             htmls += '<br><a>'+this.cdate_str+'</a>';
             htmls += '</span>';
             htmls += '</span>';
             htmls += this.contents;
             htmls += '</p>';
             htmls += '</div>';
        	});	//each end
		}
		
		$("#replyList").html(htmls);
		}	   // Ajax success end
	});	// Ajax end
}


//수정폼
function editReply(rno, id, mno, name, contents, cdate){
	
	var htmls = "";
	htmls += '<div class="media text-muted pt-3" id="rno' + rno + '">';
	htmls += '<title>Placeholder</title>';
	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	htmls += '<span class="d-block">';
	htmls += '<strong class="text-gray-dark">★★판매자★★</strong>';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="updateReply(' + rno + ', \'' + mno + '\')" style="padding-right:5px">변경</a>';
	htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소</a>';
	htmls += '</span>';
	htmls += '</span>';

	htmls += '<textarea name="contents" id="contents' + rno+ '" class="form-control" rows="3" maxlength="100" placeholder="변경할 메시지를 입력하세요(100자)">';
	htmls += contents;
	htmls += '</textarea>';
	htmls += '</p>';
	htmls += '</div>';

	$('#rno' + rno).replaceWith(htmls);
	$('#rno' + rno + ' #contents').focus();
}

function updateReply(rno, mno){

	var id = "#contents"+rno;
	var replyEditContents = $(id).val();


	var paramData = JSON.stringify({"contents": replyEditContents, "rno": rno});
	var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};

	$.ajax({
		url: '/reply_update'
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
    		console.log(result);
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}

function deleteReply(rno, mno){

	if(confirm("댓글을 삭제하시겠습니까?")){
		var paramData = JSON.stringify({"rno": rno, "mno": mno});
		var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};

		$.ajax({
			url: '/reply_delete'
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
   				console.log(result);
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
}


function pstate_update_confirm(){
	
	var state = <%=product.getPstate()%>;
	var message = "";
	
	if(state == 1){
		message = "거래완료로 바꾸시겠습니까?";
	}
	else{
		message = "거래중으로 바꾸시겠습니까?";
	}
	
	
	if(confirm(message)){
		location.href="/product_state_update?pno=<%=product.getPno()%>&pstate=<%=product.getPstate()%>";
	}
}

function delete_confirm(){
	
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="/product_delete?pno=<%=product.getPno()%>";
	}
}
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(<%=product.getLatitude()%>, <%=product.getLongitude()%>), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(<%=product.getLatitude()%>, <%=product.getLongitude()%>); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});
//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>

</html>