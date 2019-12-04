<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

//ajax 버젼
$(function() {
	$.ajax({
		url : '/getgile/boardList.do',
		type: 'GET',
		//data : params,
		success : function(result) {

			for(var i in result) {
				console.log(result[i].id);
				console.log(result[i].title);
				console.log(result[i].content);
				console.log(result[i].phone);
			}

		},
		error : function(msg){
			console.log(msg)
			alert('실패했습니다.');
		}
		
	});
});

</script>
    
    
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>현주 블로그</title>
</head>

<body>
<table border="1">


	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일</th>
	</tr>
		
	<c:forEach var="list" items="${data}">
		<tr>
			<td>${list.id}</td>
            <td>${list.title}</td>
            <td>${list.content}</td>
            <td>${list.phone}</td>
		</tr>
    </c:forEach>

</table>





</body>

</html>