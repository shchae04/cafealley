<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>evboardmodi</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/style.css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>


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
                                <strong>이벤트 게시글 수정하기</strong>
                            </h3>
                            
                        </div>
                            
                    </div>
                    <form name="modifyform" action="<c:url value='/evBoard/modify'/>" method="post">
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
						  
						  	<div class="form-group">
                            <label>글번호</label>
                            <span style="font-size: 18px; font-weight: bold;">${article.bno}</span>
                            <input type="hidden" style="background: none; border: none;" class="form-control" name='bno' value="${article.bno}" readonly>
                        </div>
                        <div class="form-group" 
                        style="border-top:3px solid black; border-bottom:3px solid black; padding-bottom: 20px; padding-top: 20px;">

                            <label for="writer">
                                작성자
                            </label>
                            <span style="display: block;">${article.writer}</span>
                            <input type="hidden" class="form-control" id="writer" name="writer" value="${article.writer}" readonly
                                style="cursor: auto; border-color: transparent; background-color: transparent; width: 180px;">
                        </div>
                        
                        <div class="form-group">                

                            <label for="title">
                                제목
                            </label>
                            <input type="text" class="form-control" id="title" name="title" value="${article.title }"
                                style="width: 300px; background-color: transparent;" />
                        </div>

							
						<div class="form-group">
							<label for="content" class="col-sm-14">
								내용
		                        <textarea name="content" id="content" class="" style="width:100%; resize:none;" rows="7" cols="180"></textarea>
							</label>
                        </div>
						
                        <button type="button" class="detailbtn btn btn-dark" id="listbtn"
                            style="float: left; background-color: #000; color: #fff; border-color: #000;">목록</button>


                        <div class="write" style="float: right; margin-bottom: 40px;">
                            <!-- 취소버튼 -> 목록으로. -->
                            <button id="delbtn" type="button"
                                style="background-color: #fff; border-color: #000; color:#000" class="btn btn-primary">
                                삭제
                            </button>
                            <button id="modbtn" type="button" style="background-color: #000; color: #fff; border-color: #000;"
                                class="btn btn-info">
                                수정
                            </button>
                        </div>

                	</form>
                </div>

            </div>
        </div>
       
    </section>


<%@ include file="../include/footer.jsp" %>


  	

    <script>
    
		$('#delbtn').click(function() {
			if(confirm('정말 삭제하시겠습니까?')) {
				$('form[name=modifyform]').attr('action', '<c:url value="/evBoard/delete" />');
				$('form[name=modifyform]').submit();
			} else return;
		});
	
    
    
    
    
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

            document.modifyform.submit();


        });

        //목록 버튼
        const list = document.getElementById('listbtn');
        list.addEventListener('click',function(){
       	location.href = "<c:url value= '/evBoard/evList' />" 
        });
     




    </script>
    




</body>

</html>