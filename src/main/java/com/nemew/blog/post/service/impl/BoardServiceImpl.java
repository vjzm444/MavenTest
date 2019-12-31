package com.nemew.blog.post.service.impl;
/**
 * @FileName : BoardServiceImpl.java
 * @Project : MavenTest
 * @Date : 2019. 12. 24. 
 * @작성자 : song
 * @변경이력 : 
 * @프로그램 설명 : 스프링의 서비스임풀 기반
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.nemew.blog.post.dao.BoardDao;
import com.nemew.blog.post.model.BoardModel;
import com.nemew.blog.post.model.Search;
import com.nemew.blog.post.service.BoardService;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired 
	BoardDao dao;

	//다중건 조회
	@Override
	public List<BoardModel> BoardList(BoardModel boardVO) throws Exception{
		return dao.BoardList(boardVO);
	}
	
	//메인페이지 3건
	@Override
	public List<BoardModel> BoardListAdmin(BoardModel boardVO) throws Exception{
		return dao.BoardListAdmin(boardVO);
	}
	
	//상세게시물 1건
	@Override
	public BoardModel boardDatail(Search search) throws Exception {
		BoardModel board = dao.boardDatail(search);
		return board;
	}
	
	//게시물 등록
	@Override
	public boolean boardInsertPost(BoardModel vo) throws Exception {		
		boolean result = true;

		try {
			dao.boardInsertPost(vo);
		}catch (Exception e) {
			result = false;
		}
		return result; 
	}
	
	//등록을 위한 max key번호 조회
	@Override
	public int maxIdNum() {
		int result = dao.maxIdNum();
		
		return result;
	}
	
	//전체게시물 갯수
	@Override
	public int BoardListCnt() {
		int result = dao.BoardListCnt();
		
		return result;
	}
	

	
	
}