package com.nemew.blog.post.service;
/**
 * @FileName : BoardService.java
 * @Project : MavenTest
 * @Date : 2019. 12. 10. 
 * @작성자 : 송현주
 * @변경이력 :
 * @프로그램 설명 :
 */
import java.util.List;

import com.nemew.blog.post.model.BoardModel;
import com.nemew.blog.post.model.Search;

public interface BoardService {
	
	//다중건 조회
	public List<BoardModel> BoardList(Search search) throws Exception;
	
	//1개 게시물 조회
	public BoardModel boardDatail(Search search) throws Exception;

	//게시물 업데이트
	public boolean boardInsertPost(BoardModel vo) throws Exception;
	
	public int maxIdNum();
	
}