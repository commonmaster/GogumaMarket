<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Integer incorrect = (Integer)request.getAttribute("incorrect");
	if(incorrect == null){
		incorrect = 0;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 확인창</title>
<style>
	table{
		position: absolute;
   		top: 25%;
    	left: 50%;
    	transform: translate(-50%, -25%);
		text-align: center;
		
	}
	
	.ok_btn{
		padding:10px;
		border-radius:5px;
		color:white;
		font-weight:bold;
		background:#EC9D75;
		border:1px solid #EC9D75;
		font-size:1em;
		cursor:pointer;
	}
	
	.ok_btn:hover{
		background:orange;
	}
		
	td{
		padding:5px;
	}
	
	#member_n_i{
		font-size:1.2em;
		font-weight:bold;	
	}
</style>
</head>
<body>
	<form action="/withdraw" method="post">
	<table>
		<tr><th><img src="/img/member/member_withdraw.jpg" width="300px"></th></tr>
		<tr><td><span id="member_n_i">${member.name}(${member.id})</span>님 정말로 탈퇴하시겠습니까?</td><tr>
		<tr><td><input type="password" id="password" name="password" placeholder="비밀번호 입력" maxlength="14">
		<tr><td align="center"><input type="submit" class="ok_btn" value="YES">&nbsp;&nbsp;&nbsp;<input type="reset" class="ok_btn" value="N O" onclick="location.href='/main'"></td></tr>
			
	</table>
	</form>
</body>
<script>
	window.onload = function(){
			var incorrect = <%=incorrect%>
			if(incorrect == 1){
				alert("비밀번호 오류");
			}
		
	}
</script>
</html>