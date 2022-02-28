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

import com.stone.goguma.board.common.Reply;

@Mapper
public interface IBoard댓글Mapper {
	
	@Select("select rno, bno, mno, contents, DATE_ADD(cdate, INTERVAL 9 HOUR) as cdate from boardReply where bno=#{bno} order by cdate desc")
	@Results(value= {
			@Result(property="rno", column="rno"),
			@Result(property="bno", column="bno", one=@One(select="com.stone.goguma.board.dataservice.I게시물Mapper.게시물번호를찾다")),
			@Result(property="mno", column="mno", one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo")),
			@Result(property="contents", column="contents"),
			@Result(property="cdate", column="cdate")		
	})List<Reply> 댓글목록수집하다(@Param("bno")int bno);
	
	@Insert("insert into boardReply(bno,mno,contents) values(#{bno.bno},#{mno.mno},#{contents})")
	void 댓글저장하다(Reply reply);

	@Update("update boardReply set contents=#{contents}, cdate=now() where rno=#{rno} and mno=#{mno.mno}")
	int 댓글수정하다(Reply reply);
	
	@Delete("delete from boardReply where rno=#{rno} and mno=#{mno}")
	void 댓글삭제하다(@Param("rno") int rno, @Param("mno") int mno);

}
