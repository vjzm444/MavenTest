package com.nemew.blog.post.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nemew.blog.post.model.BoardModel;
import com.nemew.blog.post.model.Search;

public interface BoardService {
	
	//다중건 조회
	public List<BoardModel> BoardList(Search search) throws Exception;
	
	//1개 게시물 조회
	public BoardModel boardDatail(Search search) throws Exception;

	//게시물 업데이트
	public boolean boardInsertPost(BoardModel vo) throws Exception;
	
	public int maxIdNum();
	
}