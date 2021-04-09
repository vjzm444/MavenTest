package com.nemew.blog.post.service;
/**
 * @FileName : BoardService.java
 * @Project : MavenTest
 * @Date : 2019. 12. 24. 
 * @작성자 : song
 * @변경이력 : 
 * @프로그램 설명 : 스프링의 서비스 기반
 */
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.nemew.blog.post.model.BoardModel;
import com.nemew.blog.post.model.Search;

public interface BoardService {
	
	//다중건 조회
	public List<BoardModel> BoardList(BoardModel boardVO) throws Exception;
	
	//날씨조회
	public List<BoardModel> WeatherList(BoardModel boardVO) throws Exception;
	
	//날씨를 등록
	public boolean method(Map<String, Object> map);

	//메인페이지 3건
	public List<BoardModel> BoardListAdmin(BoardModel boardVO) throws Exception;
		
	//1개 게시물 조회
	public BoardModel boardDatail(Search search) throws Exception;

	//게시물 업데이트
	public boolean boardInsertPost(BoardModel vo) throws Exception;
	
	//최고수 구하기
	public int maxIdNum();
	
	//전체게시물 갯수
	public int BoardListCnt();
	
}