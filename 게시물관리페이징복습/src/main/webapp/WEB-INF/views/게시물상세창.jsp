<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.stone.springmvc.common.Board" %>
<%  Board board = (Board)request.getAttribute("board");  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 상세</h1>
제목:<%= board.getTitle() %>	<br>
내용<textarea cols=25 rows=5 readonly ><%= board.getContents() %></textarea>

<a href="delete?no=<%=board.getNo()%>">삭제</a>
<a href="prepare_update?no=<%=board.getNo()%>">변경</a>
<a href="list">목록</a>
</body>
</html>