package com.nemew.blog.service;

import java.util.List;

import com.nemew.blog.model.BoardModel;

public interface BoardService {
	
	public List<BoardModel> BoardList() throws Exception;
	
	BoardModel printBoard();
	

	public List<BoardModel> printBoardList() throws Exception;
	
}