package com.stone.goguma.board.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.stone.goguma.board.common.Board;

@Mapper
public interface I게시물Mapper {
	@Insert("insert into board(title,contents,writer) values(#{title},#{contents},#{writer.mno})")
	void 게시물을저장하다(Board 새게시물);
	
	
	@Select("select count(*) from board")

	int 수집된게시물수();
	
	@Select("select bno, title, contents, writer, views, DATE_ADD(date, INTERVAL 9 HOUR) as date from board order by bno desc limit #{startBno},#{maximumBno}")
	@Results(value= {
			@Result(property="bno",column="bno"),
			@Result(property="title", column="title"),
			@Result(property="contents", column="contents"),
            @Result(property="writer", column="writer",one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo")),
			@Result(property="views", column="views"),
			@Result(property="date", column="date")})
	List<Board> 모든게시물을수집하다(@Param("startBno")int startBno, @Param("maximumBno")int maximumBno);
	
		
	@Select("select bno, title, contents, writer, views, DATE_ADD(date, INTERVAL 9 HOUR) as date from board where bno=#{bno}")
	@Results(value= {
			@Result(property="bno",column="bno"),
			@Result(property="title",column="title"),
			@Result(property="contents",column="contents"),
            @Result(property="writer", column="writer",one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo")),
			@Result(property="views",column="views"),
			@Result(property="date", column="date")})
	Board 게시물번호를찾다(int bno);

	@Update("update board set views=views+1 where bno=#{bno}")
	void 게시물조회수증가하다(int bno);
	
	
	@Update("update board set title=#{title}, contents=#{contents} where bno=#{bno}")
	void 게시물변경하다(Board 변경할게시물);
	
	@Delete("delete from board where bno=#{bno}")
	void 게시물삭제하다(int bno);
}
