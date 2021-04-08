<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

//$(function() {
	
	//외부 날씨api를 통하여 날씨정보를 가져온다.
	var city ="Korea";

	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"66c826612d6d725d049ec394b11ea2e9";
	var tempChek;
	$.ajax({
	  url: apiURI,
	  dataType: "json",
	  type: "GET",
	  async: "false",

	  success: function(resp) {

	      console.log(resp);
	      
	      console.log("현재온도 : "+ (resp.main.temp- 273.15) );
	      console.log("현재습도 : "+ resp.main.humidity);
	      console.log("날씨 : "+ resp.weather[0].main );
	      console.log("상세날씨설명 : "+ resp.weather[0].description );
	      console.log("날씨 이미지 : "+ resp.weather[0].icon );
	      console.log("바람   : "+ resp.wind.speed );
	      console.log("나라   : "+ resp.sys.country );
	      console.log("도시이름  : "+ resp.name );
	      console.log("구름  : "+ (resp.clouds.all) +"%" );                 
	      
	      $('#temp').val((resp.main.temp- 273.15).toPrecision(2)); //form에 실시간온도 값을 셋팅한다 (소숫점제거)
	      $('#state').val(resp.weather[0].main); //날씨
	      $('#cloud').val((resp.clouds.all) +"%"); //구름
	      

	    //실시간 날씨를 화면에다 뿌려준다
		$('#tempreal').append("현시각 온도 = "+(resp.main.temp- 273.15).toPrecision(2)+"<br>");	
		$('#tempreal').append("날씨상태 = "+(resp.weather[0].main)+"<br>");	
		$('#tempreal').append("구름상태 = "+(resp.clouds.all) +"%");	
	     // alert('end');
	  }, error: function(error){

	      alert('error!');

	  }, complete : function() {

		//alert('완료1');
		selectDbWeatherInfo(); //그다음 ajax 시작
	}
	});
	
	
//db에있는 과거 날씨 정보를 가져온다
function selectDbWeatherInfo(){
	$.ajax({
		url : "http://localhost:8081/getList/boardList3.do",
		method: "GET",
		type:"json",
		//data : params,
		async:false,
		success : function(result) {

			for(var i in JSON.parse(result)) {
				/*
				console.log(JSON.parse(result)[i].id);
				console.log(JSON.parse(result)[i].temp);
				console.log(JSON.parse(result)[i].state);
				console.log(JSON.parse(result)[i].cloud);
				console.log(JSON.parse(result)[i].dataYmd);
				*/
				//화면에 보기좋게 찍는다
				$('#tempfate').append(JSON.parse(result)[i].dataYmd+" 날짜 : 온도="+JSON.parse(result)[i].temp+", 상태="
						+JSON.parse(result)[i].state+", 구름="+JSON.parse(result)[i].cloud+"<br>");	
				
			}
		},
		error : function(msg){
			console.log(msg)
			alert('내부 db에서 날씨정보를 가지고 오는것에 실패했습니다.');
		}, complete : function() {
			//alert('완료2');
			insertWeather(); //실시간 날씨정보 db등록
		}
		
	});
}


//날씨외부api를 통해 가져온 데이터를 db에 저장
function insertWeather(){
   
	var queryString = { temp:  $('#temp').val(), state:  $('#state').val(), cloud:  $('#cloud').val() };
   
	$.ajax({
	    url: 'http://localhost:8081/formInsert.do',
	    type: 'post',
	    dataType: "json",
	    data:  queryString,
	    success: function (data) {
	    	console.log(data.result);
	    	
	    	if(data.result == "ok")
	    	console.log("데이터 전송이 성공적으로 끝났을 때 실행");
	    	else
	    	alert('등록 중 에러가 발생하였습니다!');
	    	
	    }, error: function(error){
	        alert('insert server error!');

	    }, complete : function() {  
			//alert('insert 최종완료3');
		}
	});



	
}


</script>

</script>
    
    
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>날씨 알아보기</title>

        
</head>

<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0 >

<form name="form_name">

	<input type="hidden" id="temp" name="temp"/>  <!-- 실시간 온도셋팅 -->
	<input type="hidden" id="state" name="state"/>  <!-- 실시간 상태 -->
	<input type="hidden" id="cloud" name="cloud"/>  <!-- 실시간 흐림여부 -->
	
</form>


	<div id="tempreal" name="tempreal"></div> <!-- 현재날씨 -->	
	<br><br>
	<p>과거의 날씨정보</p>
	<div id="tempfate" name="tempfate"></div> <!-- 과거날씨 -->

</body>




</html>