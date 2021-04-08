<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

//ajax 버젼
$(function() {
	$.ajax({
		url : '/getList/boardList3.do',
		type: 'GET',
		//data : params,
		success : function(result) {
			
			for(var i in result.univ) {
				console.log('weather = '+result.univ[i].weather);
				console.log('date = '+result.univ[i].date);


		        $("#fate").append(result.univ[i].date+"의 날씨입니다 : "+result.univ[i].weather+"<br>");
			}

		},
		error : function(msg){
			console.log(msg)
			alert('실패했습니다.');
		}
		
	});
});


//현제의 날씨를 api를 써서 가져온다.
var city ="Korea";
var imgURL ="";
var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Korea&appid=66c826612d6d725d049ec394b11ea2e9";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        console.log(resp);
        console.log("현재온도 : "+ (resp.main.temp- 15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" ); 

        $("#result1").text("오늘의 구름 퍼센트입니다 : "+(resp.clouds.all) +"%");
                        
    }, error: function(error){
		alert('error!');
    }
})

</script>
    
    
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>현주 </title>


        
</head>

<body  bgcolor="#FFFFFF" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>

 <div id="fate" name="fate"></div>
 <br>
 <div id="result1" name="result1"></div>


	
</body>




</html>