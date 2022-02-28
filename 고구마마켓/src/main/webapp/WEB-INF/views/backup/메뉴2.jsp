<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<style>
body {
	padding: 0px 0px;
}

#nav1 {
	width: 1300px;
	height:30px;
	text-align: right;	
	margin: 10px auto 0px auto;
}

#pre_login_text_a, #after_login_text_a{
	margin:40px;
	text-decoration:none;
	color:#F7BE81;
	font-weight:bold;
}

#nav2 {
	width: 1300px;
	background: #F8ECE0;
	position: relative;
	background: #F8ECE0;
	margin: 0px auto;
	z-index: 7;
	
}

#img_div {
	display: inline-block;
	position: absolute;
	top: 0px;
	left: 10px;
}

#logo_img {
	
}

#menu {
	display: inline-block;
	margin-left: 150px;
	margin-top: 0px;
	margin-bottom: 0px;
}

.menu_tit {
	display: inline-block;
	list-style-type: none;
	padding: 20px 40px;
	position: relative;
	z-index: 1;
	cursor:pointer;
	
}

#menu li>ul {
	display: none;
	background: #FBF5EF;
	margin: 20px 0px 0px 0px;
	position: absolute;
	border-radius: 0px 0px 15px 15px;
	padding: 0px 29px;
	left: 0px;
}


.menu_tit {
	margin: 0px 40px;
}

.menu_tit>a {
	font-size: 1.5em;
	font-weight:bold;
	text-decoration:none;
	color:black;
}

.menu_tit:hover {
	background: #F5D0A9;
}
#menu ul li {
	display: block;
	list-style-type: none;
	float: none;
	padding: 10px 20px;
	cursor:pointer;
}
#menu_myaction_submenu li a{
	font-weight:bold;
	text-decoration:none;
	color:black;
}

#menu_myaction_submenu li a:hover {
	color: #F7BE81;
}

#user_name_span{
	font-size:1.2em;
	font-weight:bold;
}


</style>
</head>
<body>
	<div id="nav_content">
		<div id="nav1">
			<c:if test="${empty name}">
				<a href='/login' id="pre_login_text_a">로그인</a>			
			</c:if>
			
			<c:if test="${!empty name}">
				
									
			<span id="after_login_text_name"><span id="user_name_span">${name}</span> 님 환영합니다!</span>
			<span><a href="/logout" id="after_login_text_a">로그아웃</a></span>			
		</c:if>	
			
		</div>
		
		<div id="nav2">
			<div id="img_div" onclick="move_main()">
				<img src="img/goguma.png" width="166px"
					style="vertical-align: middle;">
			</div>
			<ul id="menu">
				<li class="menu_tit" onclick="myAction_submenu_close()"><a href="/main">Home</a></li>
				<li onclick="myAction_submenu_oc()" class="menu_tit"><a>MY활동</a>
					<ul id="menu_myaction_submenu">
						<li></li>
						<li><a href="/member">회원정보</a></li>
						<li><a href="/product">물품등록</a></li>
						<li><a href="/products">MY제품</a></li>
						<li><a>정보변경</a></li>
						<li><a>물품삭제</a></li>
					</ul></li>
				<li class="menu_tit" onclick="myAction_submenu_close()"><a href="/boards">자유게시판</a></li>
			</ul>
		</div>
	</div>
</body>

<script>
	
	var isSubmenuOpen = false;
	
	function myAction_submenu_oc() {
		var ele = document.getElementById("menu_myaction_submenu");
		if(!isSubmenuOpen){
			ele.style.display = "block";
			isSubmenuOpen = true;
		}
		else{
			ele.style.display = "none";
			isSubmenuOpen = false;
		}

	}

	function myAction_submenu_close() {
		var ele = document.getElementById("menu_myaction_submenu");
		ele.style.display = "none";
		isSubmenuOpen = false;
	}
	
</script>
</html>