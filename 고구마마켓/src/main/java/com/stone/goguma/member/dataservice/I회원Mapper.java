package com.stone.goguma.member.dataservice;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.stone.goguma.member.common.Member;

@Mapper
public interface I회원Mapper {

	
	@Insert("insert into member(profile, id, password, name, email, tel) values(#{profile},#{id},#{password},#{name},#{email},#{tel})")
	Integer insert회원(Member member);
	
	
	@Select("select * from member where mno = #{mno}")
	@Results(value= {
			@Result(property="mno", column="mno"),
			@Result(property="profile", column="profile"),
			@Result(property="id", column="id"),
			@Result(property="password", column="password"),
			@Result(property="email", column="email"),
			@Result(property="tel", column="tel"),
			@Result(property="mstate", column="mstate"),
			@Result(property="likeCount", column="likeCount"),
			@Result(property="regDate", column="regDate"),
			@Result(property="withdrawDate", column="withdrawDate")			
			})
	Member get회원ByNo(int mno);
	
	
	@Select("select * from member where id = #{id}")
	@Results(value= {
			@Result(property="id", column="id")})
	Member 아이디가있는가(String id);
	
	
	@Select("select * from member where id = #{id}  and mstate=1")
	@Results(value= {
			@Result(property="mno", column="mno"),
			@Result(property="profile", column="profile"),
			@Result(property="id", column="id"),
			@Result(property="password", column="password"),
			@Result(property="email", column="email"),
			@Result(property="tel", column="tel"),
			@Result(property="mstate", column="mstate"),
			@Result(property="likeCount", column="likeCount"),
			@Result(property="regDate", column="regDate"),
			@Result(property="withdrawDate", column="withdrawDate")			
			})
	Member get회원ById(String id);
	
	
	@Select("select password from member where mno = #{mno} and mstate=1")
	@Results(value= {
			@Result(property="password", column="password")})
	Member 비밀번호일치조회ByNo(int mno);
	
	@Update("update member set password = #{newPassword} where mno = #{mno}  and mstate=1")
	Integer update비밀번호(@Param("mno")int mno, @Param("newPassword")String newPassword);
	
	
	@Update("update member set name=#{name}, email=#{email}, tel=#{tel} where mno=#{mno}  and mstate=1")
	Integer update회원정보(Member member);
	
	@Update("update member set profile=#{profile}, name=#{name}, email=#{email}, tel=#{tel} where mno=#{mno}  and mstate=1")
	Integer update회원정보이미지포함(Member member);
	
	@Delete("delete from member where mno=#{mno}")
	Integer delete회원ByNo(int mno);
}

