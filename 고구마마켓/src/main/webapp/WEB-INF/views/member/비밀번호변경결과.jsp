<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isSuccess = (boolean)request.getAttribute("isSuccess");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 결과창</title>
<style>
	
	#ok_btn{
 		padding:10px;
 		color:white;
 		border-radius:5px;
 		font-weight:bold;
 		background:#EC9D75;
 		border:0;
 		
 	}
 	
 	#ok_btn{
 		background:orange;
 	}
</style>
</head>
<body>
<table>
	<tr><th><%if(isSuccess){ %>
				<img src="/img/member/member_change_success.jpg" width="180px"><br>
				<b>비밀번호 변경 완료</b>
			<%}else{ %>
				<img src="/img/member/member_change_error.png" width="180px"><br>
				<b>기존 비밀번호 불일치</b>
			<%} %>
		</th></tr>
	<tr><th><button id="ok_btn" onclick="window.close()">확인</button></th></tr>	

</table>

</body>
</html>