package com.nemew.blog.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpRequest;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nemew.blog.dao.BoardDao;
import com.nemew.blog.model.BoardModel;
import com.nemew.blog.service.BoardService;

import java.io.*;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	
	//ajax 버젼
	@ResponseBody    
	@RequestMapping(value="/getgile/boardList.do", method = RequestMethod.GET ) // URL 주소
	public List<BoardModel> selectBoardList() throws Throwable {

		return boardService.BoardList();
	}
	
	
	//단일건 조회
	@GetMapping("/list") // URL 주소
	public String list(Model model) {

		BoardModel board = boardService.printBoard();
		
		model.addAttribute("id", board.getId());
		model.addAttribute("subject", board.getTitle());
		model.addAttribute("content", board.getContent());
		model.addAttribute("regDate", board.getPhone());
		
		return "list"; // JSP 파일명
	}

	 //다중건 조회
	@GetMapping("/list2")// URL 주소
	public String list2(HttpServletRequest request,HttpServletResponse response) throws Throwable {
		
		List<BoardModel> board = boardService.printBoardList();
		System.out.println("result size==== "+board.size());
		
		request.setAttribute("data", board);
		return "list"; // JSP 파일명
	}
	
	// @GetMapping으로 해야지 jsp로 감....
	@ResponseBody    
	@RequestMapping("/test") // tes
	public String test(Model model) {
		return "Hellow world"; // JSP 파일명
	}
	  
	@GetMapping("/") // tes
	public String info(Model model) {
		//페이지이동
		return "info"; // JSP 파일명
	}
	
	
	
}