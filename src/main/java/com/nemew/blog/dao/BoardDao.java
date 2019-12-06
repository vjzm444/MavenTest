package com.nemew.blog.dao;

import java.util.List;

import com.nemew.blog.model.BoardModel;
import com.nemew.blog.model.Search;
import com.nemew.blog.service.*;

public interface BoardDao {
	
	//ajax버젼 다중건 조회
	List<BoardModel> BoardList();
	
	//1개 게시물 조회
	public BoardModel boardDatail(Search search) throws Exception;

	//다중건 조회
	List<BoardModel> printBoardList();
}