package com.stone.goguma.product.dataservice;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.stone.goguma.product.common.Heart;
import com.stone.goguma.product.common.Product;
import com.stone.goguma.product.common.Reply;


@Repository
public class 물품DAO implements I물품DAO {
	
	@Autowired I물품Mapper 물품Mapper;
	@Autowired I하트Mapper 하트Mapper;
	@Autowired IProduct댓글Mapper 댓글Mapper;
	
	@Transactional
	@Override
	public void 저장하다(Product product) {
		물품Mapper.save(product);
	}
	
	// 내 물품 목록 찾기	
	@Override
	public Object[] 내물품을수집하다(int 멤버번호, int 물품상태,int 시작일련번호, int 페이지당게시물수) {
						
		// zero base
		List<Product> 내물품리스트 = 물품Mapper.myselectAll(멤버번호, 물품상태, 시작일련번호-1, 페이지당게시물수);
		int 물품개수 = 물품Mapper.내물품갯수를검색하다(멤버번호, 물품상태);
					
		Object[] obj = {내물품리스트, 물품개수 ,멤버번호,물품상태};
		System.out.println("물품개수:" + 물품개수);
					
		return obj;		
	}	
	
	// 전체 물품 목록 찾기
	@Override
	public Object[] 중고물품과물품수를수집하다(int 시작일련번호, int 페이지당게시물수) {
		
		// zero base
		List<Product> 물품리스트 = 물품Mapper.전체중고물품을찾다(시작일련번호-1, 페이지당게시물수);
		int 물품개수 = 물품Mapper.전체중고물품갯수를찾다();
		
		Object[] obj = {물품리스트, 물품개수};
		System.out.println("물품개수:" + 물품개수);
		
		return obj;
	}
	
	// 검색한 물품 목록 찾기
	@Transactional
	@Override
	public Object[] 검색한중고물품과물품수를수집하다(int 시작일련번호, int 페이지당게시물수, String 검색어) {
		
		List<Product> 검색한물품리스트 = 물품Mapper.검색한중고물품을찾다(시작일련번호-1, 페이지당게시물수, 검색어);
		int 검색한물품개수 = 물품Mapper.검색한중고물품갯수를찾다(검색어);
		
		Object[] obj = {검색한물품리스트, 검색한물품개수};
		System.out.println("물품개수:" + 검색한물품개수);
		
		return obj;
	}
	
	//내가 좋아요한 물품 목록 찾기
	@Transactional
	@Override
	public Object[] 좋아요한물품을수집하다(int 로그인한회원번호, int 시작일련번호, int 페이지당게시물수) {
		
		List<Product> 좋아요한물품리스트 = 물품Mapper.selectHeartedProduct(로그인한회원번호, 시작일련번호-1, 페이지당게시물수);
		int 좋아요한물품개수 = 물품Mapper.내가좋아요한물품갯수를찾다(로그인한회원번호);
		
		Object[] obj = {좋아요한물품리스트, 좋아요한물품개수};
		System.out.println("좋아요한물품개수:" + 좋아요한물품개수);
		
		return obj;
	}	
	
	//물품 상세조회
	@Transactional
	@Override
	public Product 물품상세보다(int pno) {
		물품Mapper.views(pno); // 조회수 업데이트
		물품Mapper.heartCount(pno); //likecnt 업데이트
		Product product =물품Mapper.product_detail(pno);
		return product;
	}
	
	@Transactional
	@Override
	public Product 사진찾다(int pno) {
		Product product =물품Mapper.findPicture(pno);
		return product;
	}
	
	@Transactional
	@Override
	public void 삭제하다(int 삭제할물품번호) {
		물품Mapper.물품을삭제하다(삭제할물품번호);
		
	}
	@Transactional
	@Override
	public void 변경하다(Product 변경할물품, int 이미지변경여부) {
		if(이미지변경여부 == 1) {
			물품Mapper.updateProduct_t_i(변경할물품);
		}
		else {
			물품Mapper.updateProduct_t(변경할물품);
		}
	}
	
	@Transactional
	@Override
	public int 물품상태를변경하다(int 물품번호, int 상태) {
		return 물품Mapper.물품상태를변경하다(물품번호, 상태);
	}
	

	
	/// 하트 부분 시작
	
	//좋아요
	@Transactional
	@Override
	public boolean 눌렀냐(int 제품번호, int 회원번호) {		
		return 하트Mapper.눌렀냐( 제품번호,  회원번호);
	}
	
	@Transactional
	@Override
	public void deleteHeartM(int 제품번호, int 회원번호) {
		하트Mapper.삭제하다( 제품번호,  회원번호);
	}
	
	@Transactional
	@Override
	public int insertHeartM(Heart 추가하트) {
		return 하트Mapper.저장하다(추가하트);
		
	}
	

	@Transactional
	@Override
	public List<Reply> 댓글목록수집하다(int 물품번호) {
		return 댓글Mapper.댓글목록수집하다(물품번호);
		
	}

	@Transactional
	@Override
	public void 댓글저장하다(Reply 댓글) {
		댓글Mapper.댓글저장하다(댓글);
	}

	@Transactional
	@Override
	public void 댓글수정하다(Reply 댓글) {
		댓글Mapper.댓글수정하다(댓글);
	}	

	@Transactional
	@Override
	public void 댓글삭제하다(int 댓글번호, int 로그인한회원의번호) {
		댓글Mapper.댓글삭제하다(댓글번호, 로그인한회원의번호);
		
	}
	
}
