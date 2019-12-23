package com.nemew.blog.post.service.impl;

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
	public List<BoardModel> BoardList(Search search) throws Exception{
		return dao.BoardList(search);
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
	

	
	
	
}