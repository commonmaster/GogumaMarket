<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	//Integer mno = (Integer)session.getAttribute("mno");
	//boolean isLogin = false;
	//System.out.println("mno: " + mno);
	//if(mno != null){
	//	isLogin = true;
	//}
%>	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<style>
	header{
	
}  
#main_search_input{
	width:400px;
	height:40px;
	border:1px solid #BDBDBD;
	border-radius:5px;
	padding:0px 10px;
}

#sub_search_input{
	width:400px;
	height:40px;
	border:1px solid #BDBDBD;
	margin-left:15px;
	border-radius:5px;
	display:none;
	padding:0px 10px;
}

#search_btn{
	position:relative;
	right:40px;
	top:8px;
	width:30px;
	padding:5px;
	height:30px;
	background-repeat: no-repeat;
	border:0;
	
}

#sub_search_btn{
	position:relative;
	right:40px;
	top:8px;
	width:30px;
	padding:5px;
	height:30px;
	background-repeat: no-repeat;
	border:0;
	display:none;
}

.logo{
	display:inline-block;
}
#logo_img{
	width:150px;
	cursor:pointer;
}

form{
	display:inline-block;
}
@media screen and (max-width: 990px) { #search_btn, #search_input, #main_search_form { display: none; }
#sub_search_btn, #sub_search_input, #sub_search_form { display: inline-block; } }



</style>
</head>
<body>
<!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-between">

      
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
		<div id="searchbar">
		<img src="/img/goguma_logo2.png" id="logo_img" onclick="location.href='/main'">
		<form id="main_search_form" action="/products">
		<input type="text" name="search" id="main_search_input" value="${search}"></form><input type="image" src="/img/search.png" id="search_btn" onclick="main_search_submit_check()">
		
		</div>
      <nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown"><a href="#"><span>Product</span> <i class="bi bi-chevron-down"></i></a>
            	<ul>              
             	 <li><a href="/products">물품리스트</a></li>
             	 <li><a href="/product">물품 등록</a></li>
             	</ul>
          	</li>
          <li class="dropdown"><a href="#"><span>Board</span> <i class="bi bi-chevron-down"></i></a>
            	<ul>              
             	 <li><a href="/boards">게시판리스트</a></li>
             	 <li><a href="/board">내 글 등록</a></li>
             	</ul>
          	</li>         
          <c:if test="${!empty sessionScope.mno}">
         	 <li class="dropdown"><a href="#"><span>MY</span> <i class="bi bi-chevron-down"></i></a>
            	<ul>              
             	 <li><a href="/member">회원정보</a></li>             	 
             	 <li><a href="/mproducts">MY물품목록</a></li>  
             	  <li><a href="/hearted_products">MY찜목록</a></li>  
            	</ul>
          	</li>
          </c:if>
          <c:if test="${empty sessionScope.mno}">
          	<li><a class="getstarted scrollto" href="/login">Login</a></li>
          </c:if>
          <c:if test="${!empty sessionScope.mno}">
          	<li><a class="getstarted scrollto" href="/logout">Logout</a></li>
          </c:if>
          <li><form action="/products" id="sub_search_form"><input type="text" id="sub_search_input" name="search" value="${search}"></form><input type="image" src="/img/search.png" id="sub_search_btn" onclick="sub_search_submit_check()"></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
</body>
<script>
function main_search_submit_check(){
	var form_ele = document.getElementById("main_search_form");
	var ele = document.getElementById("main_search_input");
	var value = ele.value.trim();
	if(value.length == 0){
		alert("검색어를 입력해주세요");
		return;
	}	
	form_ele.submit();
}

function sub_search_submit_check(){
	var form_ele = document.getElementById("sub_search_form");
	var ele = document.getElementById("sub_search_input");
	var value = ele.value.trim();
	if(value.length == 0){
		alert("검색어를 입력해주세요");
		return;
	}	
	form_ele.submit();
}
</script>
</html>