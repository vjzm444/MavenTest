package com.nemew.blog.service;

import java.util.List;

import com.nemew.blog.model.BoardModel;
import com.nemew.blog.model.Search;

public interface BoardService {
	
	//ajax버젼 다중건 조회
	public List<BoardModel> BoardList() throws Exception;
	//1개 게시물 조회
	public BoardModel boardDatail(Search search) throws Exception;
	//다중건 조회
	public List<BoardModel> printBoardList() throws Exception;
	
}