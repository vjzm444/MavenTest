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
import com.nemew.blog.model.Search;
import com.nemew.blog.service.BoardService;

import java.io.*;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	// @GetMapping으로 해야지 jsp로 감....
	@ResponseBody    
	@RequestMapping("/test") // test용 
	public String test(Model model) {
		return "Hellow World!"; // 글씨가 리턴된다
	}
	
	
	//ajax 버젼 다중건 조회
	@ResponseBody    
	@RequestMapping(value="/getList/boardList.do", method = RequestMethod.GET ) // URL 주소
	public List<BoardModel> selectBoardList() throws Throwable {
		return boardService.BoardList();
	}
	

	 //다중건 조회 jstl로 리스트 출력
	@GetMapping("/")// URL 주소
	public String main(HttpServletRequest request,HttpServletResponse response) throws Throwable {
		
		List<BoardModel> board = boardService.printBoardList();
		System.out.println("result size==== "+board.size());
		
		request.setAttribute("data", board);
		//return "list"; //이건테스트용 
		return "info"; 
	}
	
	
	 //게시물 상세 1건 정보조회
	@GetMapping("/post.do")// URL 주소
	public String post(HttpServletRequest request, HttpServletResponse response, Model model) throws Throwable {
		
		String id       = request.getParameter("id");   
		System.out.println("id는 ==== "+id);
		
		Search search = new Search();
		search.setKeyword(id);
		
		BoardModel board = boardService.boardDatail(search);
		
		model.addAttribute("id", board.getId());
		model.addAttribute("title", board.getTitle());
		model.addAttribute("content", board.getContent());
		model.addAttribute("phone", board.getPhone());
		model.addAttribute("regDate", board.getReg_date());
		
		return "post"; 
	}
	
	
	
	
	
}