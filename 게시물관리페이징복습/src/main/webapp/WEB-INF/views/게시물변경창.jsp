<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시물 변경</h1>
<form  action="update" method="post">
 <input type="hidden" name="no" value="${board.no}" />
  제목<input type="text" name="title" value="${board.title}" /><br>
  내용<textarea cols="25" rows="5" name="contents">${board.contents}</textarea><br>
 <input type="submit" value="변경" />
</form>
</body>
</html>