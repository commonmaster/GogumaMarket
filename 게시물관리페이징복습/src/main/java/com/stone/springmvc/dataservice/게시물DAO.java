package com.stone.springmvc.dataservice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.stone.springmvc.common.Board;

@Repository
public class 게시물DAO {
	
	public void 저장하다(Board 새게시물) {
		Connection con = null;		 
	    try{
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con=DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/db1?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC", // DB URL
	                    "root", "1234");  // USER_NAME과 PASSWORD
	        
	        PreparedStatement 명령자=con.prepareStatement("insert into board(title,contents) values(?,?)"); 
	        명령자.setString(1, 새게시물.getTitle());
	        명령자.setString(2, 새게시물.getContents());
	        명령자.executeUpdate();
	        
	            //DB조작
	       con.close();
	   }
	   catch(Exception ex){ ex.printStackTrace(); }		
	}
	public Object[] 수집하다(int 시작일련번호, int 페이지당게시물수){
		
		List<Board> 게시물들 =new ArrayList<Board>();		
		int 게시물수 = 0;
		
		Connection con = null;		 
	    try{
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con=DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/db1?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC", // DB URL
	                    "root", "1234");  // USER_NAME과 PASSWORD	        
	       
	        PreparedStatement 명령자2=con.prepareStatement("select count(*) from board"); 
	        ResultSet 게시물수표 = 명령자2.executeQuery();
	        게시물수표.next();
	        게시물수 = 게시물수표.getInt(1);
	        게시물수표.close();
	        명령자2.close();	        
	        
	        
	        PreparedStatement 명령자=con.prepareStatement("select * from board order by no desc limit ?,?"); 
	        명령자.setInt(1, 시작일련번호-1);
	        명령자.setInt(2, 페이지당게시물수);
	        
	        
	        ResultSet 게시물표 =명령자.executeQuery();
	        while(게시물표.next()) {
	        	int 게시물번호 =게시물표.getInt("no");        	
	        	String 제목=게시물표.getString("title");
	        	String 내용=게시물표.getString("contents");	        	
	        	Board 게시물 = new Board();
	        	게시물.setNo(게시물번호);
	        	게시물.setTitle(제목);
	        	게시물.setContents(내용);
	        	게시물들.add(게시물);
	        } 
	       con.close();
	   }
	   catch(Exception ex){ ex.printStackTrace(); }	
	   
	   Object[] 게시물들과게시물수 = {게시물들, 게시물수};
	    
	   return 게시물들과게시물수;
	}
	
	public Board 찾는다By번호(int 번호) {		
		Board 찾은게시물=null;
		Connection con = null;		 
	    try{
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con=DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/db1?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC", // DB URL
	                    "root", "1234");  // USER_NAME과 PASSWORD	        
	        PreparedStatement 명령자=con.prepareStatement("select * from board where no=?");
	        명령자.setInt(1, 번호);
	        ResultSet 게시물표 =명령자.executeQuery();
	        if(게시물표.next()) {
	        	//int 게시물번호 =게시물표.getInt("no");        	
	        	String 제목=게시물표.getString("title");
	        	String 내용=게시물표.getString("contents");	        	
	        	찾은게시물 = new Board();
	        	찾은게시물.setNo(번호);
	        	찾은게시물.setTitle(제목);
	        	찾은게시물.setContents(내용);
	        } 
	       con.close();
	   }
	   catch(Exception ex){ ex.printStackTrace(); }
	   return 찾은게시물;
	}
	public void 변경하다(Board 변경할게시물) {
		Connection con = null;		 
	    try{
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con=DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/db1?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC", // DB URL
	                    "root", "1234");  // USER_NAME과 PASSWORD
	        
	        PreparedStatement 명령자=con.prepareStatement("update board set title=?,contents=? where no=?"); 
	        명령자.setString(1, 변경할게시물.getTitle());
	        명령자.setString(2, 변경할게시물.getContents());
	        명령자.setInt(3, 변경할게시물.getNo());
	        명령자.executeUpdate();
	        
	            //DB조작
	       con.close();
	   }
	   catch(Exception ex){ ex.printStackTrace(); }		
	}
	
	public void 삭제하다(int 번호) {
		Connection con = null;		 
	    try{
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con=DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/db1?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC", // DB URL
	                    "root", "1234");  // USER_NAME과 PASSWORD
	        
	        PreparedStatement 명령자=con.prepareStatement("delete from board where no=?"); 
	        명령자.setInt(1, 번호);
	        
	        명령자.executeUpdate();
	        
	            //DB조작
	       con.close();
	   }
	   catch(Exception ex){ ex.printStackTrace(); }		
	}
}
