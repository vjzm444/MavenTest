package com.nemew.blog.post.dao;
/**
 * @FileName : BoardDao.java
 * @Project : MavenTest
 * @Date : 2019. 12. 24. 
 * @작성자 : song
 * @변경이력 : 
 * @프로그램 설명 : db에 매핑되는 dao
 */
import java.util.List;

import com.nemew.blog.post.model.BoardModel;
import com.nemew.blog.post.model.Search;
import com.nemew.blog.post.service.*;

public interface BoardDao {
	
	//게시판 조회
	List<BoardModel> BoardList(BoardModel boardVO);
	
	//메인페이지 3건 조회
	List<BoardModel> BoardListAdmin(BoardModel boardVO);
	
	//1개 게시물 조회
	public BoardModel boardDatail(Search search) throws Exception;
	
	//게시물 등록
	public boolean boardInsertPost(BoardModel vo) throws Exception;
	
	//게시물 큰수 체크
	public int maxIdNum();
	
	//전체 게시물 갯수
	public int BoardListCnt();

}