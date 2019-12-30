<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>demo</title>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <script>
    $(document).ready( function() {
		alert('1');
         
        $("input[type=file]").change(function () {

			alert('2');
            
            var fileListView = "";
            var formData = new FormData(); //ajax로 넘길 data
            var fileInput = document.getElementById("test_file"); //id로 파일 태그를 호출
            var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
             
            for (var i = 0; i < files.length; i++) {
                formData.append('file-'+i, files[i]); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
            }
             
            $.ajax({
                url: "/test/fileSave.do",
                data: formData,
                processData: false,
                contentType: false,
                type: 'POST',
                success: function(data){
                     
                    if(data.code == "OK"){ //응답결과
                         
                        fileInfoList = data.fileInfoList; //응답 결과 데이터 fileInfoList
                        $.each(fileInfoList, function( index, fileInfo ) {
                             
                            console.log("Path: "+fileInfo.fileFullPath); //전체경로
                            console.log("FileName: "+fileInfo.originalFilename); //파일명
                            
                            fileListView += "<p>"+fileInfo.originalFilename+"</p>"; //루프를 돌려서 화면에 보여줄 리스트 작성
                        });
                         
                        $("#file_view_list").html(fileListView); //리스트를 화면에 보여줌
                         
                    }else{
                        alert("파일 등록에 실패하였습니다.");
                    }
                     
                },
                error: function(xhr,textStatus,error){
                    console.log("textStatus: "+xhr.status+", error: "+error);
                    alert("예상치 못한 오류가 발생했습니다.");
                     
                }
            });
 
             
        });
         
    });
  </script>
</head>
<body>
    <br>
    <br>
    <input type="file" id="test_file" multiple><!-- 복수개의 파일을 선택 -->
    <br>
    <h3>파일 리스트</h3>
    <br>
    <div id="file_view_list" value=""></div><!-- 파일 리스트를 보여줄 div -->
</body>
</html>