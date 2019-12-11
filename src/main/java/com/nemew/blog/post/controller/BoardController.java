package com.nemew.blog.post.controller;

/**
 * @FileName : BoardController.java
 * @Project : MavenTest
 * @Date : 2019. 12. 10. 
 * @작성자 : 송현주
 * @변경이력 :
 * @프로그램 설명 :
 */

import java.util.ArrayList;
import java.util.Date;
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

import com.nemew.blog.post.dao.BoardDao;
import com.nemew.blog.post.model.BoardModel;
import com.nemew.blog.post.model.Search;
import com.nemew.blog.post.service.BoardService;

import java.io.*;
import java.text.SimpleDateFormat;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	//전역변수 폴더경로
	String urlPass = "hyeonjoo/post/";

	// @GetMapping으로 해야지 jsp로 감....
	/*
	@ResponseBody    
	@RequestMapping("/test") // test용 
	public String test(Model model) {
		return "Hellow World!"; // 글씨가 리턴된다
	}
	*/
	
	//ajax 버젼 다중건 데이터 리턴용
	@ResponseBody    
	@RequestMapping(value="/getList/boardList.do", method = RequestMethod.GET ) // URL 주소
	public List<BoardModel> selectBoardList() throws Throwable {
		String allList	= "";
		Search search = new Search();
		search.setKeyword(allList);
		return boardService.BoardList(search);
	}
	

	 //메인화면 게시물을3개만 출력
	@GetMapping("/")// URL 주소
	public String main(HttpServletRequest request,HttpServletResponse response) throws Throwable {
		
		//데이터 3개만 조회
		Search search = new Search();
		search.setKeyword("Y");
		List<BoardModel> board = boardService.BoardList(search);
		System.out.println("result size==== "+board.size());
		
		request.setAttribute("data", board);
		return urlPass+"info"; 
	}
	
	
	 //게시물 상세 1건 정보조회
	@GetMapping("/post.do")// URL 주소
	public String post(HttpServletRequest request, HttpServletResponse response, Model model) throws Throwable {
		
		String id       = request.getParameter("id");   
		Search search = new Search();
		search.setKeyword(id);
		
		BoardModel board = boardService.boardDatail(search);
		
		model.addAttribute("id", board.getId());
		model.addAttribute("title", board.getTitle());
		model.addAttribute("content", board.getContent());
		model.addAttribute("phone", board.getPhone());
		model.addAttribute("regDate", board.getReg_date());
		
		return urlPass+"post"; 
	}
	
	//게시판 클릭시 전체리스트 출력
	@GetMapping("/list.do")// URL 주소
	public String list(HttpServletRequest request,HttpServletResponse response) throws Throwable {
	
		String allList	= "";
		Search search = new Search();
		search.setKeyword(allList);
		
		List<BoardModel> board = boardService.BoardList(search);
			
		request.setAttribute("data", board);
		return urlPass+"allList"; 
	}
	
	//글쓰기 화면 이동
	@GetMapping("/uploadPage.do")// URL 주소
	public String uploadPage(HttpServletRequest request,HttpServletResponse response) throws Throwable {			
		return urlPass+"uploadPost"; 
	}
	
	
	 //id값 가져오기
	public int idNum() {
		int maxNum = boardService.maxIdNum();
		return maxNum;
	}
		
	//글쓰기 등록 처리 ajax
	@ResponseBody    
	@RequestMapping(value="/uploadProcess.do", method = RequestMethod.POST ) // URL 주소
	public boolean uploadProcess(HttpServletRequest request,HttpServletResponse response) throws Throwable {	

		boolean result = true;
		
		String userId = request.getParameter("name");
		String phone = request.getParameter("phone");
		String title = request.getParameter("title");
		String message = request.getParameter("message");
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		
		if(userId.equals("") || userId == null) {
			result = false;
		}
		
		int maxid = idNum();
		
		System.out.println("maxid = "+maxid);
		BoardModel vo = new BoardModel();
		vo.setId(maxid);
		vo.setContent(message);
		vo.setPhone(phone);
		vo.setTitle(title);
		vo.setReg_date(time1);
		
		boolean res = boardService.boardInsertPost(vo);
		
		return result;
	}
	
	
	
	
	
	
}