<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   byte[] 프로필사진 =(byte[]) request.getAttribute("PictureData");
   //html 아니라 이미지 데이터를 보낼것이라 응답 객체에 설정
   response.setContentType("image/png");
   ServletOutputStream 응답데이터적재자 =response.getOutputStream();
      응답데이터적재자.write(프로필사진);
%>