package com.nemew.blog.post.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nemew.blog.post.dao.BoardDao;
import com.nemew.blog.post.model.BoardModel;
import com.nemew.blog.post.model.Search;
import com.nemew.blog.post.service.BoardService;

import java.io.*;
import java.text.SimpleDateFormat;

@Controller("BoardController")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	//전역변수 
	String urlPass = "hyeonjoo/post/";	//jsp폴더경로
	String filePass = "C:/dev/SpringWorkspace/MavenTest/src/main/resources/static/";	//물리적파일 저장경로
	//String filePass = "C:/dev/cssWorkspace/";
	
	
	
	// @GetMapping으로 해야지 jsp로 감....
	/*
	@ResponseBody    
	@RequestMapping("/test") // test용 
	public String test(Model model) {
		return "Hellow World!"; // 글씨가 리턴된다
	}
	*/
	
	 //외부이미지 서버 테스트
	@GetMapping("/test")// URL 주소
	public String test(HttpServletRequest request,HttpServletResponse response) throws Throwable {
		
		return urlPass+"test2"; 
	}
	
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
		return urlPass+"main"; 
	}
	
	
	 //게시물 상세 1건 정보조회
	@GetMapping("/post.do")// URL 주소
	public String post(HttpServletRequest request, HttpServletResponse response, Model model) throws Throwable {
		
		String id       = request.getParameter("id");   
		Search search = new Search();
		search.setKeyword(id);
		
		BoardModel board = boardService.boardDatail(search);
		
		String count = "6";	//textarea에 표시할 defalut row
		
		String contentChk = board.getContent();
		int lngChk = contentChk.length();
		
		//내용 글씨수 체크 후 row크기 조절
		if(lngChk >= 160 && lngChk <= 200) {
			System.out.println("160~200글자수");
			count = "15";
		}else if(lngChk >= 210 && lngChk <= 250) {
			System.out.println("210~250글자수");
			count = "21";
		}
		
		int mobileUrl = 0;
		int degree = 0 ;	//사진이 없을 시 결과 디폴트 셋팅
/*
		//사진이 없을경우
		if(board.getImg_url() == null || board.getImg_url().equals("")) {	
			
		}else {	//사진이 있을경우(모바일 혹은 pc에서 업로드함을 구분하기 위해 만듬)
			String realUrl = filePass+board.getImg_url();
			
			int orientation = ImageUtil.getOrientation(realUrl);
			degree = ImageUtil.getDegreeForOrientation(orientation);
		}
	*/	
		if(degree != 0){
			mobileUrl = 1024;	//모바일에서 업로드한 사진이 있을 시 값
		}else {
			mobileUrl = 1022;	//사진이 아예없음 OR 모바일에서 업로드 안했을때 이미지였을 경우
		}
		
		//System.out.println("in java mobileUrl======"+mobileUrl);
		
		model.addAttribute("id", board.getId());
		model.addAttribute("user_id", board.getUser_id());
		model.addAttribute("title", board.getTitle());
		model.addAttribute("content", board.getContent());
		model.addAttribute("phone", board.getPhone());
		model.addAttribute("regDate", board.getReg_date());
		model.addAttribute("img_url", board.getImg_url());
		model.addAttribute("count", count);
		
		request.setAttribute("mobileUrl", mobileUrl);
		
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
	
	//사용자 글쓰기 화면 이동
	@GetMapping("/uploadPage.do")
	public String uploadPage(HttpServletRequest request,HttpServletResponse response) throws Throwable {			
		
		return urlPass+"uploadPost"; 
		//return urlPass+"fileUpTest"; //파일업로드 테스트화면
	}
	
	
	//Admin 글쓰기 화면 이동
	@GetMapping("/uploadPageAdmin.do")
	public String uploadPageAdmin(HttpServletRequest request,HttpServletResponse response) throws Throwable {			
		return urlPass+"uploadPostAdmin"; 
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
		
		String user_id = request.getParameter("user_id");
		String phone = request.getParameter("phone");
		String title = request.getParameter("title");
		String message = request.getParameter("message");
		String img_url = request.getParameter("img_url");
		
		
		System.out.println("img_url================ "+img_url);
		
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		
		if(user_id.equals("") || user_id == null) {
			result = false;
		}
		
		int maxid = idNum();
		System.out.println("select max id = "+maxid);
		
		BoardModel vo = new BoardModel();
		vo.setId(maxid);
		vo.setUser_id(user_id);
		vo.setTitle(title);
		vo.setContent(message);
		vo.setPhone(phone);
		vo.setImg_url(img_url);
		vo.setReg_date(time1);
		
		boolean res = boardService.boardInsertPost(vo);
		
		return result;
	}
	
	
	
	
	//물리적 파일등록 처리 
	//20119-12-30 송현주 : 외부이미지서버를 연동했기에 물리적 파일등록은 이제 안씀
	@ResponseBody
	@RequestMapping(value = "/test/fileSave.do") 
	public Object fileSave(MultipartHttpServletRequest multipartRequest) {
	 
	    List<HashMap> fileArrayList = new ArrayList<HashMap>();
	    HashMap fileHashMap;

	    String filePath = filePass+"saveImg"; //파일 저장 경로, 설정파일로 따로 관리한다.
		 
	    File dir = new File(filePath); //파일 저장 경로 확인, 없으면 만든다.
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
	 
	    Iterator<String> itr =  multipartRequest.getFileNames(); //파일들을 Iterator 에 넣는다.
	    System.out.println("getFileNames ="+itr);
	    
	    
	    while (itr.hasNext()) { //파일을 하나씩 불러온다.
	 
	        MultipartFile mpf = multipartRequest.getFile(itr.next());
	        fileHashMap = new HashMap();
	        String originalFilename = mpf.getOriginalFilename(); //파일명
	        System.out.println("originalFilename check======>"+originalFilename);
	        
	        String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
	        
	 
	        try {
	            //파일 저장
	            mpf.transferTo(new File(fileFullPath)); //파일저장
	 
	            fileHashMap.put("originalFilename", originalFilename);
	            fileHashMap.put("fileFullPath", fileFullPath);
	 
	            fileArrayList.add(fileHashMap);
	 
	        } catch (Exception e) {
	            System.out.println("postTempFile_ERROR======>"+fileFullPath);
	            e.printStackTrace();
	        } 
	    }
	
	    Map<String, Object> retVal = new HashMap<String, Object>(); //응답값 셋팅
	 
	    try{
	        retVal.put("fileInfoList", fileArrayList);  
	        retVal.put("code", "OK");
	    }catch(Exception e){
	        retVal.put("code", "FAIL");
	    }
	    return retVal;
	}
	
	
	
	// 유튜브 리스트 메뉴이동
	@GetMapping("/youtube.do")// URL 주소
	public String youtube(HttpServletRequest request,HttpServletResponse response) throws Throwable {
	
		return urlPass+"youTubeList"; 
	}

	
	
	
	
	
	
}