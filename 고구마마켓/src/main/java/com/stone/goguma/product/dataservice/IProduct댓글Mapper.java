package com.stone.goguma.product.dataservice;

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

import com.stone.goguma.product.common.Reply;

@Mapper
public interface IProduct댓글Mapper {
	
	@Select("select rno, pno, mno, contents, DATE_ADD(cdate, INTERVAL 9 HOUR) as cdate from productReply where pno=#{pno} order by cdate desc")
	@Results(value= {
			@Result(property="rno", column="rno"),
			@Result(property="pno", column="pno", one=@One(select="com.stone.goguma.product.dataservice.I물품Mapper.product_detail")),
			@Result(property="mno", column="mno", one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo")),
			@Result(property="contents", column="contents"),
			@Result(property="cdate", column="cdate")		
	})List<Reply> 댓글목록수집하다(@Param("pno")int pno);
	
	@Insert("insert into productReply(pno,mno,contents) values(#{pno.pno},#{mno.mno},#{contents})")
	void 댓글저장하다(Reply reply);

	@Update("update productReply set contents=#{contents}, cdate=now() where rno=#{rno} and mno=#{mno.mno}")
	int 댓글수정하다(Reply reply);
	
	@Delete("delete from productReply where rno=#{rno} and mno=#{mno}")
	void 댓글삭제하다(@Param("rno") int rno, @Param("mno") int mno);

}
