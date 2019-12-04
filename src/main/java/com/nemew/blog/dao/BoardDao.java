package com.nemew.blog.dao;

import java.util.List;

import com.nemew.blog.model.BoardModel;
import com.nemew.blog.service.*;

public interface BoardDao {
	
	List<BoardModel> BoardList();
	
	BoardModel printBoard();
	
	List<BoardModel> printBoardList();
}