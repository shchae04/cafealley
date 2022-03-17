<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="<c:url value='/css/shstyle.css'/>">
    <script src="<c:url value='/js/style.js'/>" defer></script>
    
    
</head>

<body>

	<%@ include file="../include/header.jsp" %>   

    <section>
        <div class="container" style="margin-top: 200px;">
            <div class="row">
                <div class="col-xs-12">
                    <div class="row">
                      
                        <div class="col-xs-12">
                            <h3 class="write-service">
                                수정페이지
                            </h3>
                        </div>
                    </div>
                    <form name="writeform" style="border-top: 3px solid black; padding: 30px;" >
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
                        <div class="form-group" style="border-bottom: 3px solid black; padding-bottom: 20px;">
                             
                            <label for="writer" >
                                작성자
                            </label>
                            <input type="text" class="form-control" id="writer" name="writer" value="writer" readonly style="cursor: auto; border-color: transparent; background-color: transparent; width: 8%;">
                        </div>
                        <div class="form-group"  style="border-bottom: 3px solid black; padding-bottom: 20px;">
                             
                            <label for="title">
                                제목
                            </label>
                            <input type="text" class="form-control" id="title" name="title" style="width: 20%; background-color: transparent;"/>
                        </div>

                        <div id='image_preview'>
                            
                            <input type='file' name="file" id='btnAtt' multiple='multiple'/>
                            <div id='att_zone' 
                            data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
                        </div>

                        <div class="form-group"  style="border-top: 3px solid black; padding-top: 20px; margin-top: 20px;" >
                            <label for="exampletextarea">
                                내용
                            </label>
                           
                            <textarea class="form-control" name="content" id="content" rows="9"></textarea>
                        </div>
                        
                        
                        
                       
                        
                        <div class="form-group">
                          <!-- 작성과 수정 같은 페이지 -->
                          <div class="clerafix">
                            <button class="detailbtn btn btn-delete" id="delbtn">삭제</button>
                            <button class="detailbtn btn btn-primary" id="modbtn">수정</button>
                            <button class="detailbtn btn btn-dark" id="listbtn">목록</button>
                          </div>


                            
                          
                            
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

  // 등록버튼
  document.querySelector('#regbtn').addEventListener('click',function(){

    if(title.value === '' || content.value === '') {
      event.preventDefault();
      alert('제목과 내용을 확인해주세요.')
      return; 
    }

    document.writeform.submit();
    

  });

  //취소버튼 
  document.querySelector('#stopbtn').addEventListener('click',function(e){
    if(confirm('작성하신 내용은 사라집니다 이동하시겠습니까?')){

      location.href = 'https://www.google.com';
    }
    return;
  });

 
 

</script>


   

</body>

</html>