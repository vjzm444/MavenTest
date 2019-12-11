package com.nemew.blog.post.service.impl;
/**
 * @FileName : BoardServiceImpl.java
 * @Project : MavenTest
 * @Date : 2019. 12. 10. 
 * @작성자 : 송현주
 * @변경이력 :
 * @프로그램 설명 :
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

	@Autowired BoardDao dao;

	//다중건 조회
	@Override
	public List<BoardModel> BoardList(Search search) throws Exception{
		return dao.BoardList(search);
	}
	
	//상세게시물 1건
	@Override
	public BoardModel boardDatail(Search search) throws Exception {
		BoardModel board = dao.boardDatail(search);
		return board;
	}
	
	
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
	
	@Override
	public int maxIdNum() {
		int result = dao.maxIdNum();
		return result;
	}
	

	
	
	
}