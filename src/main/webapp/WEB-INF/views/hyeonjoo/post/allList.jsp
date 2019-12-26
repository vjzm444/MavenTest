<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
  <!-- Navigation -->
 
  <%@ include file="/WEB-INF/views/common/cssCommon.jsp" %>
  
  <title>SongHJ Blog - main Theme</title>

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
            <h1 align ="center">Post Page</h1>
            <span class="subheading"></span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        
        
        <c:forEach var="list" items="${data}">
        
        <div class="post-preview">
          <a href="javascript:click(${list.id});">
            <h3>
             ${list.title}
            </h3>
          </a>
          <p class="post-meta">Posted by
            <a href="#">${list.user_id}</a>
            on ${list.reg_date}</p>
        </div>
        <hr>
         </c:forEach>
        
        
        <!-- Pager -->
        <div class="clearfix">
          <a class="btn btn-primary float-right" href="uploadPage.do">글쓰기 &rarr;</a>
        </div>

      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  


<script>

function click(id){

	location.href ="post.do?id="+id;
	
}

</script>
</body>

</html>
