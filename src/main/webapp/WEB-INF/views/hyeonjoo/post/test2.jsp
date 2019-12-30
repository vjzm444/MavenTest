<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<body>
    <button id="upload">upload image</button>
    <input name="img" type="file"/>

    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript">
 



    function uploadImageByImgur(file, callback) {           
        form = new FormData();
        form.append('image', file);
        $.ajax({                   
            xhr: function(){
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt){// 업로드상태이벤트리스너등록
                    if (evt.lengthComputable) {              
                        console.log("업로드진행률:"+parseInt( (evt.loaded / evt.total * 100), 10)+"%");
                    }
                }, false);
                return xhr;
            },                     
            url: 'https://api.imgur.com/3/image',// 업로드요청주소             
            headers: { Authorization: 'Client-ID eb57c1503c7b7c0' },               
            type: 'POST',               
            data: form,               
            cache: false,                   
            contentType: false,                    
            processData: false                   
        }).always(callback).done(function (response) {



            }
        
    }





    
    $(document).ready(function(){ // document가 모두 로드되면 실행됨

    	$("input[name=img]").change(function(){// 사용자가 파일을 변경했을때 발생됨

    	var file = this.files[0];



		console.log('파일은?'+file);
    	uploadImageByImgur(file, function(result){

    	console.log(result);

    	console.log('업로드결과:'+result.status);

    	if(result.status!=200){

    	result = $.parseJSON(result.responseText);

    	}

    	if(result.data.error){

    	console.log('지원하지않는 파일형식..');

    	}else{

    	console.log('업로드된 파일경로:'+result.data.link);

    	}

    	});

    	});

    	});


        
 

        
    </script>
</body>
</html>
