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
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>현주 블로그</title>


<style>
            <!--
            body,p,ol,ul,td
            {
                font-family: 굴림;
                font-size: 12px;
            }

            a:link { size:9px;color:#000000;text-decoration: none; line-height: 12px}
            a:visited { size:9px;color:#555555;text-decoration: none; line-height: 12px}
            a:hover { color:#ff9900;text-decoration: none; line-height: 12px}

            .style1 {
                color: #6b902a;
                font-weight: bold;
            }
            .style2 {
                color: #666666
            }
            .style3 {
                color: #3b5d00;
                font-weight: bold;
            }
            -->
</style>
        
</head>

<body  bgcolor="#FFFFFF" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<table  cellpadding=1 cellspacing=1 >


	<tr>
		<th align=center>글번호</th>
		<th align=center>제목</th>
		<th align=center>내용</th>
		<th align=center>작성일</th>
	</tr>
		
	<c:forEach var="list" items="${data}">
		<tr>
			<td align=left>${list.id}</td>
            <td align=left>${list.title}</td>
            <td align=left>${list.content}</td>
            <td align=left>${list.phone}</td>
		</tr>
    </c:forEach>
	
	
</table>
<br>
	<tr>
		<td><input type="text" style="ime-mode: active;">한글디폴트<br></td>
	</tr>
	

</body>




</html>