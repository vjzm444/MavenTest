<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
//현재 도메인url을 부름
//String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String mobileImg =  (String) request.getAttribute("mobileUrl"); 

if(mobileImg.equals("1024"))
	System.out.println("jsp 내 모바일용사진=============");

%>
<!DOCTYPE html>
<html>

<head>
	<style type="text/css">
        #testimg {
            transform-origin: top left; /* IE 10+, Firefox, etc. */
            -webkit-transform-origin: top left; /* Chrome */
            -ms-transform-origin: top left; /* IE 9 */
        }
        .rotate90 {
            transform: rotate(90deg) translateY(-100%);
            -webkit-transform: rotate(90deg) translateY(-100%);
            -ms-transform: rotate(90deg) translateY(-100%);
        }
	</style>
        
  <!-- Navigation -->
  <%@ include file="/WEB-INF/views/common/cssCommon.jsp" %>
  <script src="js/jquery.exif.js"></script>
  <title>SongHJ Blog - Post Theme</title>

</head>

<body>

  <!-- Navigation -->
  <%@ include file="/WEB-INF/views/common/navigation.jsp" %>
  

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
        
          <div class="post-heading">
            <h2 class="subheading">${title}</h2>
            <span class="meta">Phone : ${phone} Posted by
              ${user_id}
              on ${regDate}</span>
          </div>
          
        </div>
      </div>
    </div>
  </header>

  <!-- Post Content -->
  <article>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
        
          <h4 class="section-heading">${title}</h4> 
          
          
  <!-- mobile 사진회전 exit 이슈처리 -->  
<c:set var="iNum1" value="<%= mobileImg %>"/>
    <c:choose>
       <c:when test="${iNum1 ==  1024 }">
       
	     <a href="${img_url}"  target="_blank">
			<img class="img-fluid" id="testimg" exif="true" src="${img_url}" style="display:none;" alt="" />
         </a>
	     <br>
	     <br>
	     <br>
	     <br>
	     <br>
	     <br>
	     <br>
       </c:when>
       <c:otherwise>
	       <a href="${img_url}"  target="_blank">
				<img class="img-fluid" src="${img_url}"  alt="" />
	       </a>
       </c:otherwise>
   </c:choose>


		<!-- 게시글 내용 -->
		 <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>내용</label>
              <textarea rows="${count}" class="form-control" style="background-color: #ffffff" readonly><c:out value="${content}" /></textarea>
              <p class="help-block text-danger"></p>
            </div>
          </div>
          
          <p>Placeholder text by
            <a href="http://spaceipsum.com/">${user_id}</a>
          </p>
          
          <div class="form-group">
          	<a class="btn btn-primary" href="list.do">목록 &rarr;</a>
          </div>
          
        </div>
      </div>      
    </div>
    
  </article>

  <hr>

  <!-- Footer -->
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	//이미지 자동회전 이슈 해결용
	$("#testimg").load(function(){

		setTimeout(function(){
		var testimg = $("#testimg");
			if (testimg.exif("Orientation") == 6) {
				
            	testimg.addClass("rotate90");
			}
			testimg.show();
            }, 500);
	});    
</script>

</body>

</html>
