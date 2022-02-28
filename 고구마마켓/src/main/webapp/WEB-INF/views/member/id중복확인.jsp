<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Boolean canUse = (Boolean) request.getAttribute("canUse");
	String id = (String) request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복검사</title>
<style>
table {
	marin: 20px;
}


#id {
	width: 200px;
	padding:10px;
}

td {
	padding: 10px;
}

#duple_btn {
	padding: 10px;
	color: white;
	border-radius: 5px;
	font-weight: bold;
	background: #EC9D75;
	border: 0;
}

#use_btn {
	width: 150px;
	padding: 10px;
	color: white;
	border-radius: 5px;
	font-weight: bold;
	background: #EC9D75;
	border: 0;
}

#use_btn:hover, #duple_btn:hover{
	background:orange;
}

.message {
	color: red;
	font-size: 0.8em;
}
</style>
</head>
<body>

	<form action="/duplication" method="post" onsubmit="return checkSubmit()">
		<table>
		
			<tr>
				<td><input type="text" maxlength="14" placeholder="3~14자의 아이디 입력" id="id" name="id" onblur="id_check()" value="${id}">
				<input type="submit" value="중복검사" id="duple_btn"><br>
				<span id="id_message" class="message"></span></td>
			</tr>
			<%if(canUse != null && canUse == true){ %>
			<tr>
				<td align="center"><button onclick="idSend()" id="use_btn">사용 하기</button></td>
			</tr>
			<%}%>
			
			<%if(canUse != null && canUse == false){ %>
			<tr>
				<td align="center">이미 사용 중인 아이디입니다.</td>
			</tr>
			<%} %>
		</table>
	</form>


</body>
<script>
	var correctInputID = false;

	function id_check() {

		var value = document.getElementById("id").value;
		var message_ele = document.getElementById("id_message");
		
		var pattern = /^[0-9a-z]{3}[0-9a-z]*$/;
		
		if (value.length == 0) {
			message_ele.innerHTML = "필수입력사항입니다.";
			return false;

		} else {
			if (pattern.test(value)) {
				message_ele.innerHTML = "";
				return true;
			} else {
				
				message_ele.innerHTML = "3~14자의 영문자, 숫자만 사용가능합니다.";
				return false;
			}
		}
	}

	function idSend() {
		var ele = document.getElementById("id");
		opener.idGet(ele.value);
		window.close();
	}
	
	function checkSubmit(){
		
		return id_check();
	}
	
</script>
</html>