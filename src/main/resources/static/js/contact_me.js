

$(function() {

  $("#contactForm input,#contactForm textarea").jqBootstrapValidation({
    preventSubmit: true,
    submitError: function($form, event, errors) {
      // additional error messages or events
    },
    submitSuccess: function($form, event) {
      event.preventDefault(); // prevent default submit behaviour
      // get values from FORM
      var name = $("input#name").val();
      var email = $("input#email").val();
      var phone = $("input#phone").val();
      var message = $("textarea#message").val();
      var firstName = name; // For Success/Failure Message
      // Check for white space in name for Success/Fail message
      if (firstName.indexOf(' ') >= 0) {
        firstName = name.split(' ').slice(0, -1).join(' ');
      }
      $this = $("#sendMessageButton");
      $this.prop("disabled", true); // Disable submit button until AJAX call is complete to prevent duplicate messages


      
    var user_id = document.contactForm.name.value;
    var title = document.contactForm.title.value;
    
    var img_url;
    
    //파일처리 결과변수
    var result = "Y";
    var suc = "Y";


    var fileListView = "";
    var formData = new FormData(); //ajax로 넘길 data
    var fileInput = document.getElementById("fileup"); //id로 파일 태그를 호출
    var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
    
    
    for (var i = 0; i < files.length; i++) {
        formData.append('file-'+i, files[i]); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
    }
    
    //물리적경로는 java에서 설정
    var filePath = "saveImg/"; //파일 저장 경로
    var fileValue = $("#fileup").val().split("\\");
    var fileName = fileValue[fileValue.length-1]; // 파일명
    
    var strSplit = fileName.split('.');
    var resultSplit = strSplit[1];
    var statement = 'jpg/gif/png/jpeg/bmp';
    
    filePath = filePath+fileName;
    
    if (statement.indexOf(resultSplit) != -1) {
    	console.log(resultSplit);
    }else if (resultSplit == undefined) {
    	console.log('파일첨부x');
    	filePath = "";
    }else{
    	alert(resultSplit+'확장자는 파일을 첨부할수없습니다.');
    	location.reload();
    	return
    }
    
    
    //파일 먼저 저장~~~~~~~~~
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
                //$("#file_view_list").html(fileListView); //리스트를 화면에 보여줌
              
                
            }else{
            	result = "N";
                alert("파일 등록에 실패하였습니다.");
            }
        },
        error: function(xhr,textStatus,error){
        	result = "N";
            console.log("textStatus: "+xhr.status+", error: "+error);
            alert("예상치 못한 오류가 발생했습니다.");
            return false
        }
    });
    
    
    if(suc == result){
    	console.log('성공');
    }else if(suc != result){
    	alert('파일등록에 실패');
    	location.reload();
    	return
    }else{
    	alert('뭔가이상함????????');
    }

    
      //게시물 글짜 등록 시작~~~~~~~~~~~~~~~~
      $.ajax({
        url: "/uploadProcess.do",
        dataType: 'json',
        type: "POST",
        data: {
          user_id: user_id,
          phone: phone,
          title: title,
          message: message,
          img_url: filePath
        },
        cache: false,
        success: function() {
          // Success message
          $('#success').html("<div class='alert alert-success'>");
          $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
            .append("</button>");
          $('#success > .alert-success')
            .append("<strong>글 등록에 성공하였습니다. </strong>");
          $('#success > .alert-success')
            .append('</div>');
          //clear all fields
          $('#contactForm').trigger("reset");
        },
        error: function() {
          // Fail message
          $('#success').html("<div class='alert alert-danger'>");
          $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
            .append("</button>");
          $('#success > .alert-danger').append($("<strong>").text("Sorry " + firstName + ", it seems that my mail server is not responding. Please try again later!"));
          $('#success > .alert-danger').append('</div>');
          //clear all fields
          $('#contactForm').trigger("reset");
        },
        complete: function() {
          setTimeout(function() {
            $this.prop("disabled", false); // Re-enable submit button when AJAX call is complete
          }, 1000);
        }
      });

    },
    
    filter: function() {
      return $(this).is(":visible");
    },
    
    
    
    
  });

  $("a[data-toggle=\"tab\"]").click(function(e) {
    e.preventDefault();
    $(this).tab("show");
  });
});

/*When clicking on Full hide fail/success boxes */
$('#name').focus(function() {
  $('#success').html('');
});
