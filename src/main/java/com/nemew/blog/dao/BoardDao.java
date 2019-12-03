package com.nemew.blog.dao;

import java.util.List;

import com.nemew.blog.model.BoardModel;

public interface BoardDao {
	List<BoardModel> getBoard();
}