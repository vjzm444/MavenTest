package com.nemew.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemew.blog.dao.BoardDao;
import com.nemew.blog.model.BoardModel;
import com.nemew.blog.model.Search;
import com.nemew.blog.service.BoardService;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired BoardDao dao;
	
	//ajax버젼 다중건 조회
	@Override
	public List<BoardModel> BoardList() throws Exception{
		return dao.BoardList();
	}
	
	//다중건 조회
	@Override
	public List<BoardModel> printBoardList() throws Exception{
		return dao.BoardList();
	}
	
	//상세게시물 1건
	@Override
	public BoardModel boardDatail(Search search) throws Exception {
		BoardModel board = dao.boardDatail(search);
		return board;
	}

	
	
	
}