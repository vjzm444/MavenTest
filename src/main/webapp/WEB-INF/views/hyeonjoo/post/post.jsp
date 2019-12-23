<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

  <!-- Navigation -->
  <%@ include file="/WEB-INF/views/common/cssCommon.jsp" %>
  
  <title>SongHJ Blog - Post Theme</title>

</head>

<body>

  <!-- Navigation -->
  <%@ include file="/WEB-INF/views/common/navigation.jsp" %>
  

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/post-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="post-heading">
            <h1>${title}</h1>
            <h2 class="subheading">Phone : ${phone}</h2>
            <span class="meta">Posted by
              <a href="#">${user_id}</a>
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
        
          <h2 class="section-heading">${title}</h2>

          <a href="#">
            <img class="img-fluid" src="${img_url}" alt="">
          </a>
          
          <p>${content}</p>
          
          <p>Placeholder text by
            <a href="http://spaceipsum.com/">${user_id}</a>
          </p>
        </div>
      </div>
    </div>
  </article>

  <hr>

  <!-- Footer -->
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>

  

</body>

</html>
