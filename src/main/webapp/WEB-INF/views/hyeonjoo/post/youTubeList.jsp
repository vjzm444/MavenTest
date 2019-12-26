<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String youTubeLink =  "JsWuSMo8mTA"; 
String youTubeLink1 =  "v2HN4gd66nM"; 
String youTubeLink2 =  "JifPfJweX_Q"; 

%>


<!DOCTYPE html>
<html>
<head>
  <!-- Navigation -->
  <%@ include file="/WEB-INF/views/common/cssCommon.jsp" %>  
  <title>SongHJ Blog - main Theme</title>

<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

 .g { 
 font-family: 'Nanum Pen Script', cursive;
 }

h1{
     font-family: 'Nanum Pen Script', cursive;
}

</style>


</head>

<body>



  <!-- Navigation -->
  <%@ include file="/WEB-INF/views/common/navigation.jsp" %>
			

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/about-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h2 align ="center">- YouTube Page -</h2>
            <span class="subheading">관리자의 추천 유투브동영상이 한가득!</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        
        
        <div class="post-preview">
        <h1>프래질 (フラジール) arrange ver.／다즈비 COVER</h1>
	     <iframe width="100%" height="315" src="https://www.youtube.com/embed/<%=youTubeLink%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	     <p class="g">신나는게 아주 흥이 납니당</p>
	     <br>
        <h1>ワタシノテンシ  HoneyWorks</h1>
	     <iframe width="100%" height="315" src="https://www.youtube.com/embed/<%=youTubeLink1%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	     <p class="g">자매노래라 겨울왕국 생각남..그림도 이쁘궁 허니워크짱</p>
	     <br>
	     
        <h1>히로인 (ヒロイン; back number) Piano Arrange ver.／다즈비 COVER</h1>
	     <iframe width="100%" height="315" src="https://www.youtube.com/embed/<%=youTubeLink2%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          <p class="g">다즈비는 유튜브와서부터 좋아하기 시작했음...</p>
        </div>
        <hr>
        
       

      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  


<script>



</script>
</body>

</html>
