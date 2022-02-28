<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.stone.goguma.board.common.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    	Board 게시물=(Board)request.getAttribute("board");
        Boolean isWriter=(Boolean)request.getAttribute("isWriter");
        Integer loginMno = (Integer)request.getAttribute("loginMno");
    %>  
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>게시물상세창</title>
<meta content="" name="description">
<meta content="" name="keywords">

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

#board_detail_table{
	margin:0px auto;
}
.table_space_line{
	border:0.5px solid #d3d3d3;
}
#title_td{
	padding:10px;
	font-weight:bold;
}

#writer_td, #date_views_td{
	padding:0px 10px;
	font-size:0.9em;
	color:#848484;
}
#contents_td{
	width:640px;
	padding:10px;
}

#views_span{
	float:right;
}

#btn_td{
	padding:10px;
	text-align:right;
}

.board_btn1{
	padding:10px;
	background:#EC9D75;
	color:white;
	font-weight:bold;
	border:0;
	margin-left:5px;
}
.board_btn1:hover{
	background:orange;
}
#profile{
	width:25px;
	height:25px;
	border-radius:50%;
	vertical-align: bottom;
}
#date_span{
	float:right;
}	

#col-sm-10_add{
	width:720px;
}

#contents{
	width:640px;
	display:inline-block;
	padding:5px;
	
}
#btnReplySave{
	
	padding:10px;
	background:#EC9D75;
	border:0;
	font-weight:bold;
	float:right;
	margin-top:30px;
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
#board_modify_btn, #board_delete_btn, #board_modify_btn2, #board_modify_cancel_btn{
	color:orange;
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
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section>
		<div class="my_container">
			<div class="content_div">
				<!--  여기부터 작성하시면 될듯 -->
				
					<table id="board_detail_table">
						<tr><td id="btn_td">
							<%
							if (isWriter != null && isWriter == true) {
							%>
							<button class="board_btn1" onclick="location.href='/board_update?bno=<%=게시물.getBno()%>'">변경</button>
							<button class="board_btn1" onclick="delete_confirm()">삭제</button>
							<%} %>
							<c:set var="pageno" value="${empty param.pageno ? '1':param.pageno}"/>
							<button class="board_btn1" onclick="location.href='/boards?pageno=${pageno}'">목록</button>
						</td>
						<tr><td class="table_space_line"></td>
						<tr><td id="title_td"><%=게시물.getTitle() %></td><tr>
						<tr><td id="writer_td"><c:if test="${!profileSetting}">
									<img src="/img/member/member_basic_profile.png" id="profile" alt="기본프로필">
								</c:if>
								<c:if test="${profileSetting}">
									<img src="/profile/${product.user.mno}" id="profile"  alt="프로필사진">
								</c:if><%=게시물.getWriter().getName() %><span id="date_span">작성일:<%=게시물.getDate_str() %></span></td><tr>
						<tr><td id="date_views_td"><span id="views_span">조회수: <%=게시물.getViews() %></span></td></tr> 
						<tr><td class="table_space_line"></td></tr>
						
						<tr><td><p></p></td></tr>
						<tr><td id="contents_td"><%=게시물.getContents() %></td></tr>						
						
					</table>
					<div id="reply_div">
						<div class="my-3 p-3 bg-white rounded shadow-sm" id="reply_input_div" style="padding-top: 10px">
							<form>	
								<input type="hidden" name="bno"  value="${board.bno}" />
								<input type="hidden" name="mno"  value="${sessionScope.mno}" id="mno" />
						<div>
							<div class="col-sm-10" id="col-sm-10_add">
								<textarea class="" id="contents" rows="3" placeholder="댓글을 작성하세요(100자)"  maxlength="100"></textarea>	
								<button type="button" class="btn btn-sm btn-primary" id="btnReplySave">등 록</button>
							</div>
						</div>
						</form>
					</div>
						<div class="my-3 p-3 bg-white rounded shadow-sm" id="replyList_divbox" style="padding-top: 10px">
							<h6 class="border-bottom pb-2 mb-0">댓글</h6>
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
<script>
	function delete_confirm(){
		
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="/board_delete?bno=<%=게시물.getBno()%>";
		}
		else{
			
		}
	}
	
	$(document).ready(function () {
	   			
		showReplyList();	
		
		$(document).on('click', '#btnReplySave', function(){
			
			$.ajax({
				url: '/boardReply_save',	
				type : 'POST',
				contentType:"application/json",
				data : JSON.stringify({bno:${board.bno},mno:$('#mno').val(),contents:$('#contents').val()}),
				dataType : 'text',
				success: function(data){		
					showReplyList();
					$('#contents').val('');			
				}
				, error: function(error){
					alert("로그인하세요");

				}
			});	
		});

	});

	function showReplyList(){
		$.ajax({
			type: 'POST',
			url: '/getBoardReplyList',
			data: {bno : ${board.bno}},
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
	             // 게시글의 작성자가이 댓글의 작성자라면
	             if(this.bno.writer.mno == this.mno.mno){
	             	htmls += '<strong class="text-gray-dark">★★글쓴이★★</strong>';
	             }
	             else{
	            	 htmls += '<strong class="text-gray-dark">' + this.mno.name + '(' + this.mno.id + ')</strong>';
	             }
	             htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	          
	             var loginMno = <%=loginMno%>;  
	             
	             // 로그인한 유저가 작성자라면
	             if(loginMno == this.mno.mno){
	            	 htmls += '<a href="javascript:void(0)" onclick="editReply(' + this.rno + ', \'' + this.bno.writer.mno + '\', \'' + this.mno.id + '\', \'' + this.mno.mno + '\', \'' + this.mno.name + '\', \'' + this.contents + '\', \'' + this.cdate_str + '\' )" style="padding-right:5px" id="board_modify_btn">수정</a>';
	             	htmls += '<a href="javascript:void(0)" onclick="deleteReply(' + this.rno + ', \'' + this.mno.mno + '\' )" id="board_delete_btn">삭제</a>';
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
	function editReply(rno, bmno, id, mno, name, contents, cdate){
		
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="rno' + rno + '">';
		htmls += '<title>Placeholder</title>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		var loginMno = <%=loginMno%>;  
		if(bmno == loginMno){
          	htmls += '<strong class="text-gray-dark">★★글쓴이★★</strong>';
          }
          else{
         	 htmls += '<strong class="text-gray-dark">' + name + '(' + id + ')</strong>';
          }
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="updateReply(' + rno + ', \'' + mno + '\')" style="padding-right:5px"  id="board_modify_btn2">변경</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()"  id="board_modify_cancel_btn">취소</a>';
		htmls += '</span>';
		htmls += '</span>';

		htmls += '<textarea name="contents" id="contents' + rno+ '" class="form-control" rows="3"  maxlength="100" placeholder="댓글을 작성하세요(100자)">';
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
			url: '/boardReply_update'
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
				url: '/boardReply_delete'
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

	
</script>
</html>