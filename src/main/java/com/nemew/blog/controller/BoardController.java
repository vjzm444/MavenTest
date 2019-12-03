package com.nemew.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nemew.blog.model.BoardModel;
import com.nemew.blog.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	
	

	@ResponseBody    
	@RequestMapping(value="/getgile/boardList.do", method = RequestMethod.GET ) // URL 주소
	public List<BoardModel> selectBoardList() throws Throwable {
		
		return boardService.BoardList();
		//return "test2"; // JSP 파일명
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/test") // URL 주소
	public String test() {
		return "test2"; // JSP 파일명
	}
	
}