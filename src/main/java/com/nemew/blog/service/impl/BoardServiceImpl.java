package com.nemew.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemew.blog.dao.BoardDao;
import com.nemew.blog.model.BoardModel;
import com.nemew.blog.service.BoardService;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired BoardDao dao;
	
	@Override
	public List<BoardModel> BoardList() throws Exception{
		return dao.BoardList();
	}
	
	

	@Override
	public BoardModel printBoard() {
		BoardModel board = dao.printBoard();
		
		return board;
	}
	
	@Override
	public List<BoardModel> printBoardList() throws Exception{
		return dao.BoardList();
	}
	
	
	
}