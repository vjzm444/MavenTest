<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
 <!-- Navigation -->
  <%@ include file="/WEB-INF/views/common/cssCommon.jsp" %>
  
  <title>SongHJ Blog - Post Upload</title>

</head>

<body>

 <!-- Contact Form JavaScript -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>
  
  <!-- Navigation -->
  <%@ include file="/WEB-INF/views/common/navigation.jsp" %>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Upload Post!</h1>
            <span class="subheading">글쓰기 페이지입니다.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
       <h1>글쓰기</h1>

        <form action="uploadProcess.do" method="post" name="contactForm" id="contactForm" novalidate>
             
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>아이디</label>
              <input type="text" class="form-control" placeholder="아이디" id="name" name="name"  pattern="[A-Za-z0-9]*" required data-validation-required-message="아이디를 입력해주십시오">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>Phone Number</label>
              <input type="tel" class="form-control" placeholder="핸드폰번호" id="phone" name="phone" pattern="[0-9]*" required data-validation-required-message="번호를 입력해주십시오">
              <p class="help-block text-danger"></p>
            </div>
          </div>

          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>제목</label>
              <input type="title" class="form-control" placeholder="제목" id="title" name="title" required data-validation-required-message="제목을 입력해주십시오">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          
          
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>내용</label>
              <textarea rows="5" class="form-control" placeholder="내용" id="message" name="message" required data-validation-required-message="내용을 입력해주십시오"></textarea>
              <p class="help-block text-danger"></p>
            </div>
          </div>
          
          
          
          <!-- multiple --- -->
           <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>이미지</label>
              <input type="file"  class="form-control" name="fileup" id="fileup" accept="image/*"/>
              
              <div id="file_view_list" name="file_view_list"></div>
              
              <p class="help-block text-danger"></p>
            </div>
            
            
          <br>
          <div id="success"></div>
          
          <div class="form-group">
            <button type="submit" class="btn btn-primary" id="sendMessageButton">등록</button>
             <a class="btn btn-primary float-right" href="list.do">목록 &rarr;</a>
          </div>
          
          
          
      
        
          
        </form>
      </div>
    </div>
  </div>

  <hr>

   <!-- Footer -->
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>


</body>

</html>
