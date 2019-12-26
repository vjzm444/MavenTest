<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>

<html>
	<head>
		<title>Urban by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

h1{
     font-family: 'Nanum Gothic', sans-serif;
}
h2{
     font-family: 'Nanum Gothic', sans-serif;
} 
h3{
     font-family: 'Nanum Gothic', sans-serif;
}
p{
     font-family: 'Nanum Gothic', sans-serif;
}
</style>


	</head>
	<body>

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="/">SongHJ <span>developer</span></a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="/">Home</a></li>
					<li><a href="list.do">게시판</a></li>
					<li><a href="elements.html">Elements</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>HyeonJoo Blog</h1>
						<p>Welcome! HyeonJoo Blog</p>
					</header>
				</div>
			</section>


        
        
<div id="main">
<section class="wrapper style1">
	<div class="inner">

					<header class="align-center">
							<h2>- My Post -</h2>
							<p>제목을 눌러 게시물내용을 확인하세요</p>
					</header>	

        <div class="row">
		
        <c:forEach var="list" items="${data}">				
				<!-- Break -->
				<div class="4u 12u$(medium)">
					<a href="javascript:click(${list.id});">
						<h3>${list.title}</h3>
					</a>
					<p>Posted by ${list.user_id} on ${list.reg_date}</p>
				</div>
				
         </c:forEach>
		</div>
	</div>
</section>
</div>
						
		<!-- Main -->
			<div id="main">

				<!-- Section -->
					<section class="wrapper style1">
						<div class="inner">
							<!-- 2 Columns -->
								<div class="flex flex-2">
									<div class="col col1">
										<div class="image round fit">
											<a href="generic.html" class="link"><img src="img/main/pic01.jpg" alt="" /></a>
										</div>
									</div>
									<div class="col col2">
										<h3>This is my info! everybody Look me!</h3>
										<p>하단에 버튼을 눌러 제 게시물을 더욱더 구경하시고 자유롭게 글도 남기세요. 하단에 버튼을 눌러 제 게시물을 더욱더 구경하시고 자유롭게 글도 남기세요. 하단에 버튼을 눌러 제 게시물을 더욱더 구경하시고 자유롭게 글도 남기세요. 하단에 버튼을 눌러 제 게시물을 더욱더 구경하시고 자유롭게 글도 남기세요</p>
										<a href="/list.do" class="button">More Look</a>
									</div>
								</div>
						</div>
					</section>

				<!-- Section -->
					<section class="wrapper style2">
						<div class="inner">
							<div class="flex flex-2">
								<div class="col col2">
									<h3>Suspendisse quis massa vel justo</h3>
									<p>나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.나의경력에 대해서 씁니다.</p>
									<p>나의 소개에 대해서 씁니다. 나의 소개에 대해서 씁니다.나의 소개에 대해서 씁니다.나의 소개에 대해서 씁니다.나의 소개에 대해서 씁니다.나의 소개에 대해서 씁니다.나의 소개에 대해서 씁니다.나의 소개에 대해서 씁니다.</p>
									<a href="#" class="button">Learn More</a>
								</div>
								<div class="col col1 first">
									<div class="image round fit">
										<a href="generic.html" class="link"><img src="img/main/pic02.jpg" alt="" /></a>
									</div>
								</div>
							</div>
						</div>
					</section>

				<!-- Section -->
					<section class="wrapper style1">
						<div class="inner">
							<header class="align-center">
								<h2>My Travel</h2>
								<p>This is my Travel picture</p>
							</header>
							<div class="flex flex-3">
								<div class="col align-center">
									<div class="image round fit">
										<img src="img/main/pic03.jpg" alt="" />
									</div>
									<p>삶의 여유를같자삶의 여유를같자삶의 여유를같자삶의 여유를같자삶의 여유를같자</p>
									
								</div>
								<div class="col align-center">
									<div class="image round fit">
										<img src="img/main/pic05.jpg" alt="" />
									</div>
									<p>삶의 여유를같자삶의 여유를같자삶의 여유를같자삶의 여유를같자삶의 여유를같자</p>
									
								</div>
								<div class="col align-center">
									<div class="image round fit">
										<img src="img/main/pic04.jpg" alt="" />
									</div>
									<p>여기는 일본입니다. 재밌게 놀았습니다. 삿뽀로 여행가고싶다</p>
									
								</div>
							</div>
						</div>
					</section>

			</div>

		<!-- Footer -->
			<footer id="footer">
				<div class="copyright">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-youtube"><span class="label">Snapchat</span></a></li>
					</ul>
					<p>&copy; Untitled. All rights reserved. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.</p>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

<script>
	function click(id){
		location.href ="post.do?id="+id;	
	}
</script>

	</body>
</html>