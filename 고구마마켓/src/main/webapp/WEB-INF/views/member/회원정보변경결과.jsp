<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isSuccess = (boolean)request.getAttribute("isSuccess");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경 결과창</title>
<style>
	
	table{
		margin:40px auto;
		padding:10px;
	}
	
	#ok_btn{
 		padding:10px;
 		color:white;
 		border-radius:5px;
 		font-weight:bold;
 		background:#EC9D75;
 		border:0;
 		
 	}
 	
 	#ok_btn:hover{
 		background:orange;
 	}
</style>
</head>
<body>
<table>
	
	<tr><th><%if(isSuccess){ %>
				<img src="/img/member/member_change_success.jpg" width="300px"><br>
				<b>회원정보 변경 완료</b>
			<%}else{ %>
			<img src="/img/member/member_change_error.png" width="300px"><br>
				<b>회원정보 변경 실패</b><br>
				(비밀번호 불일치)
			<%} %>
		</th></tr>
	<tr><th><button id="ok_btn" onclick="location.href='/member'">확인</button></th></tr>	

</table>

</body>
</html>