<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시물등록창</h1>
<form  action="add" method="post">
  제목<input type="text" name="title" /><br>
  내용<textarea cols="25" rows="5" name="contents"></textarea><br>
 <input type="submit" value="등록" />
</form>
</body>
</html>