package com.stone.goguma.product.dataservice;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.stone.goguma.product.common.Heart;

@Mapper
public interface I하트Mapper {
	@Delete("delete from heart where pno=#{pno} and mno=#{mno}")
	void 삭제하다(@Param("pno") int 제품번호,@Param("mno") int 회원번호);

	@Select("select if(count(*)=1,1,0) from heart where pno=#{pno} and mno=#{mno}")
	boolean 눌렀냐(@Param("pno") int 제품번호, @Param("mno") int 회원번호);

	@Insert("insert into heart(pno,mno) values(#{product.pno},#{member.mno})")
	int 저장하다(Heart 추가하트);
	
	
}
