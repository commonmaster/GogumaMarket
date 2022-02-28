package com.stone.goguma.product.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.One;
import com.stone.goguma.product.common.Product;

@Mapper
public interface I물품Mapper {
				  
	@Insert("insert into product(title,price,contents,picture,mno,latitude,longitude,address) "
			+ "values(#{title},#{price},#{contents},#{picture},#{user.mno},#{latitude},#{longitude},#{address})")
	void save(Product product);

	//내가 좋아요한 물품 목록 수집
	@Select("select * from product where pno in (select pno from heart where mno=#{mno}) order by modifyDate desc limit #{startRow}, #{productPerPage}")
	@Results(value= {
			@Result(property="pno", column="pno"),
			@Result(property="title", column="title"),
			@Result(property="price", column="price"),
			@Result(property="contents", column="contents"),
			@Result(property="pstate", column="pstate"),
			@Result(property="views", column="views"),
			@Result(property="date", column="date"),
			@Result(property="modifyDate", column="modifyDate"),
			@Result(property="picture", column="picture"),
			@Result(property="likecnt", column="likecnt"),
			@Result(property="user", column="mno", one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo"))
			
	})List<Product> selectHeartedProduct( @Param("mno")int 로그인한회원번호, @Param("startRow")int startRow, @Param("productPerPage")int productPerPage);
	// 내가 좋아요한 물품 개수
	@Select("select count(*) as count from heart where mno=#{mno}")
	int 내가좋아요한물품갯수를찾다(@Param("mno") int 로그인한회원번호);
	
	
	//사진 찾기
	@Select("select * from product where pno=#{pno}")
	@Results(value= {
			@Result(property="pno", column="pno"),
			@Result(property="title", column="title"),
			@Result(property="price", column="price"),
			@Result(property="contents", column="contents"),
			@Result(property="pstate", column="pstate"),
			@Result(property="views", column="views"),
			@Result(property="date", column="date"),
			@Result(property="picture", column="picture"),
			@Result(property="likecnt", column="likecnt"),
			@Result(property="user", column="mno", one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo"))
					
	})
	Product findPicture(int pno);
	
		
	// 전체물품목록 가져오기
	@Select("select * from product where pstate=1 order by modifyDate desc limit #{startRow}, #{productPerPage}")
	@Results(value= {
			@Result(property="pno", column="pno"),
			@Result(property="title", column="title"),
			@Result(property="price", column="price"),
			@Result(property="contents", column="contents"),
			@Result(property="state", column="state"),
			@Result(property="views", column="views"),
			@Result(property="date", column="date"),
			@Result(property="modifyDate", column="modifyDate"),
			@Result(property="picture", column="picture"),
			@Result(property="likecnt", column="likecnt"),
			@Result(property="user", column="mno", one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo"))
					
	})
	List<Product> 전체중고물품을찾다(@Param("startRow")int startRow, @Param("productPerPage")int productPerPage);
	
	// 전체물품목록 개수
	@Select("select count(*) as count from product where pstate=1")
	int 전체중고물품갯수를찾다();
	
	
	// 검색한 물품목록 찾기
	@Select("select * from product where pstate=1 and title like concat('%',#{search_word},'%') order by modifyDate desc limit #{startRow}, #{productPerPage}")
	@Results(value= {
			@Result(property="pno", column="pno"),
			@Result(property="title", column="title"),
			@Result(property="price", column="price"),
			@Result(property="contents", column="contents"),
			@Result(property="state", column="state"),
			@Result(property="views", column="views"),
			@Result(property="date", column="date"),
			@Result(property="modifyDate", column="modifyDate"),
			@Result(property="picture", column="picture"),
			@Result(property="likecnt", column="likecnt"),
			@Result(property="user", column="mno", one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo"))
					
	})
	List<Product> 검색한중고물품을찾다(@Param("startRow")int startRow, @Param("productPerPage")int productPerPage, @Param("search_word")String search_word);
	
	// 검색한 물품목록 찾기
	@Select("select count(*) as count from product where pstate=1 and title like concat('%',#{search_word},'%') order by modifyDate")
	int 검색한중고물품갯수를찾다(@Param("search_word")String search_word);
	
			
	//내 물품 목록 수집
	@Select("select * from product  where mno=#{mno} and pstate=#{pstate} order by modifyDate desc limit #{startRow}, #{productPerPage}")
	@Results(value= {
				@Result(property="pno", column="pno"),
				@Result(property="title", column="title"),
				@Result(property="price", column="price"),
				@Result(property="contents", column="contents"),
				@Result(property="pstate", column="pstate"),
				@Result(property="views", column="views"),
				@Result(property="date", column="date"),
				@Result(property="modifyDate", column="modifyDate"),
				@Result(property="picture", column="picture"),
				@Result(property="likecnt", column="likecnt"),
				@Result(property="user", column="mno", one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo"))
				
	})List<Product> myselectAll(@Param("mno") int mno,@Param("pstate") int pstate ,@Param("startRow")int startRow, @Param("productPerPage")int productPerPage);
	
	// 내물품갯수가져오기
	@Select("select count(*) as count from product where mno=#{mno} and pstate=#{pstate}")
	int 내물품갯수를검색하다(@Param("mno") int mno,@Param("pstate") int pstate );
	
	//product 상세정보 가져옴
	@Select("select * from product where pno=#{pno}")
	@Results(value= {
					@Result(property="pno", column="pno"),
					@Result(property="title", column="title"),
					@Result(property="price", column="price"),
					@Result(property="contents", column="contents"),
					@Result(property="state", column="state"),
					@Result(property="views", column="views"),
					@Result(property="date", column="date"),
					@Result(property="modifyDate", column="modifyDate"),
					@Result(property="picture", column="picture"),
					@Result(property="likecnt", column="likecnt"),
					@Result(property="user", column="mno", one=@One(select="com.stone.goguma.member.dataservice.I회원Mapper.get회원ByNo"))
					
	})
	Product product_detail(int pno);
	
	//물품 정보 변경(글씨만)
	@Update("update product set title=#{title}, price=#{price}, contents=#{contents}, latitude=#{latitude}, longitude=#{longitude}, address=#{address}, modifyDate=now() where pno=#{pno}")
	int updateProduct_t(Product product);
		
	//물품 정보 변경(글씨+이미지)
	@Update("update product set title=#{title}, price=#{price}, contents=#{contents}, latitude=#{latitude}, longitude=#{longitude}, address=#{address}, picture=#{picture}, modifyDate=now() where pno=#{pno}")
	int updateProduct_t_i(Product product);
		
	//물품 거래 상태 변경
	@Update("update product set pstate=#{newPstate}, modifyDate=now() where pno=#{pno}")
	int 물품상태를변경하다(@Param("pno")int pno, @Param("newPstate")int newPstate);
		
	//조회수 증가 업데이트
	@Update("update product set views=views+1 where pno=#{pno}")
	void views(int pno);
		
	//좋아요 개수
	@Update("update product set likecnt=(select count(pno) from heart where pno=#{pno}) where pno=#{pno}")
	void heartCount(int pno);
	
	//물품삭제
	@Update("update product set pstate = -1 where pno=#{pno}")
	void 물품을삭제하다(@Param("pno")int pno);
}
