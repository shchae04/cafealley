<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>boardwrite</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <!-- <link rel="stylesheet" href="../css/shstyle.css"> -->
    <script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/style.css">
    <!-- include libraries(jQuery, bootstrap) -->
    <!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css" rel="stylesheet"> -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

    <style>
        .container {
            min-width: 1200px;
            margin-top: 180px;
            margin-bottom: 80px;
        }
        .write-service{
            text-align: center;
        }
    </style>




</head>

<body>


  <%@ include file="../include/header.jsp" %>


    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div >
                            <h3 class="write-service">
                                <strong>글 작성하기</strong>
                            </h3>
                            
                        </div>
                            
                    </div>
                    <form name="writeform" method="post" action="write">
                        <!-- 

                        <div class="row col-xs-12">
                          <label for="">게시판 선택</label> 
                          <select style="width: 93%;" name="category" class="category" id="">
                            <option value="notice"  hidden>공지 게시판</option>
                            <option value="event" hidden>이벤트 게시판</option>
                            <option value="community" selected>커뮤니티 게시판</option>
                          </select>
                        </div>
                      -->
                        <div class="form-group" 
                        style="border-top:3px solid black; border-bottom:3px solid black; padding-bottom: 20px; padding-top: 20px;">

                            <label for="writer">
                                작성자
                            </label>
                            <input type="text" class="form-control" id="writer" name="writer" value="writer" readonly
                                style="cursor: auto; border-color: transparent; background-color: transparent; width: 180px;">
                        </div>
                        <div class="form-group">

                            <label for="title">
                                제목
                            </label>
                            <input type="text" class="form-control" id="title" name="title"
                                style="width: 300px; background-color: transparent;" />
                        </div>

                        <textarea name="content" id="summernote" class="summernote"></textarea>

                        <button type="button" class="detailbtn btn btn-dark" id="listbtn"
                            style="float: left; background-color: #000; color: #fff; border-color: #000;">목록</button>


                        <div class="write" style="float: right; margin-bottom: 40px;">
                            <!-- 취소버튼 -> 목록으로. -->
                            <button id="delbtn" type="button"
                                style="background-color: #fff; border-color: #000; color:#000" class="btn btn-primary">
                                취소
                            </button>
                            <button id="modbtn" type="button" style="background-color: #000; color: #fff; border-color: #000;"
                                class="btn btn-info">
                                등록
                            </button>
                        </div>

                </form>
                </div>

            </div>
        </div>
       
    </section>


<%@ include file="../include/footer.jsp" %>



    <script>
        // 제목 
        const title = document.getElementById('title')
        console.log(title)

        //내용
        const content = document.getElementById('content')
        console.log(content)

        // 수정버튼
        document.querySelector('#modbtn').addEventListener('click', function () {

            if (title.value === '' || content.value === '') {
                event.preventDefault();
                alert('제목과 내용을 확인해주세요.')
                return;
            }

            document.writeform.submit();


        });

        // 삭제버튼
        document.querySelector('#delbtn').addEventListener('click', function (e) {
            if (confirm('작성하신 내용은 사라집니다 이동하시겠습니까?')) {

                location.href = 'https://www.google.com';
            }
            return;
        });



        $(document).ready(function () {
        	
        	
            $(".summernote").on('drop',function(e){
                for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
                	sendFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
                }
               e.preventDefault();
          });
        
        $('.summernote').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true,
            lang: 'ko-KR',
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
            disableResizeEditor: true,
            callbacks: {
            	
            onImageUpload: function (files, editor, welEditable) {
                	for (var i = files.length - 1; i >= 0; i--){
                		sendFile(files[i], this);
                	}
	
    	        }
            }
        });
        
        });
        function sendFile(file, el) {
    		var form_data = new FormData();
          	form_data.append('file', file);
          	$.ajax({
            	data: form_data,
            	type: "POST",
            	url: '<c:url value="/noBoard/upload"/>',
            	cache: false,
            	contentType: false,
            	enctype: 'multipart/form-data',
            	processData: false,
            	success: function(img_name) {
              		$(el).summernote('editor.insertImage', img_name);
              		console.log(img_name);	
            	}
          	}); //end Ajax
        } //end sendFile
        
  
        
        
        
        $('.note-statusbar').hide();

        
        //작성자 지목
        var writer = $('#writer').val();
        console.log(writer);
        
        //서머놑 내
        var sHTML = $('#summernote').summernote('code');

        //제목
        var wtitle = $('#title').val();
        console.log(wtitle);
		
        //내용
        var contented = $('#summernote').val();
        console.log(sHTML);
        
        //file
    </script>
    




</body>

</html>