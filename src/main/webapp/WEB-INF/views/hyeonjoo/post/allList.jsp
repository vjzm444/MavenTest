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
  <header class="masthead" style="background-image: url('img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h2 align ="center">- Post Page -</h2>
            <span class="subheading">자유롭게 글을 써보세요</span>
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
        
        
           <div>
                    <c:if test="${pagination.curRange ne 1 }">
                        <a href="#" onClick="fn_paging(1)">[처음]</a> 
                    </c:if>
                    <c:if test="${pagination.curPage ne 1}">
                     <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
                    </c:if>
                    
                    
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음] </a> 
                    </c:if>
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
                    </c:if>
                </div>
                
                <div>
                    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } 
                  <!--   / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }--> 
                </div>
        
        
        
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


function fn_paging(curPage) {
	location.href = "/list.do?curPage=" + curPage;
	}
	

</script>
</body>

</html>
