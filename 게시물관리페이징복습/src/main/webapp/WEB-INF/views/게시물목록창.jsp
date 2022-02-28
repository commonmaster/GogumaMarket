<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="com.stone.springmvc.common.Board" %>    

<% List<Board> boards = (List<Board>)request.getAttribute("boards");
	int 현재페이지번호 = (int)request.getAttribute("pageNo");
	int 마지막페이지번호 = (int)request.getAttribute("lastPageNo");
	
	int 블럭당페이지수 = 5;
	int 블럭시작페이지번호 = 현재페이지번호 - ((현재페이지번호-1) % 블럭당페이지수);
	int 예상블럭끝페이지번호 = 블럭시작페이지번호 + 블럭당페이지수 -1; 
	int 블럭끝페이지번호 = (마지막페이지번호 >= 예상블럭끝페이지번호)? 예상블럭끝페이지번호:마지막페이지번호;
	
	System.out.println("예상끝:" + 예상블럭끝페이지번호);
    System.out.println("블럭끝:" + 블럭끝페이지번호);
    System.out.println("마지막페이지번호:" + 마지막페이지번호);
    
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>게시물 목록창</h1>
   <ul>
   <%
       for(int i=1; i<= boards.size(); i++){
    	   Board board=boards.get(i-1);
   %>
   		<li><%=i%> 
   		    <a href="detail?no=<%= board.getNo()%>">
   		       <%=board.getTitle()%>
   		    </a>
   		</li>	 	   
   <%
       }
   
   %>
    </ul>
    <%if(블럭시작페이지번호 > 블럭당페이지수){ %>
    <a href="list?pageno=<%=블럭시작페이지번호-1 %>">이전</a>
    <%
    }
    %>
    
   <%
   for(int 페이지번호 = 블럭시작페이지번호; 페이지번호 <= 블럭끝페이지번호; 페이지번호++){
  %>
  	<a href="list?pageno=<%=페이지번호 %>"><%=페이지번호 %></a>
  <%  
   }
   %>
   
   <%if(블럭끝페이지번호 < 마지막페이지번호) {%>
  <a href="list?pageno=<%=블럭끝페이지번호+1 %>">다음</a>
  <%} %>
</body>
</html>