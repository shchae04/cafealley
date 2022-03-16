<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/shstyle.css">
    <script src="../js/style.js" defer></script>
    <script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/style.css">
    
</head>

<body>

   
<header>

  <div class="header">
      <nav class="header-container">
          <div class="header-logo">
              <a href="#"><img width="150px" src="../img/logo.png" alt="logo"></a>
          </div>


          <ul class="header-nav header-nav-upper clearfix">
              <li><a data-toggle="modal" href="#myModal">로그인</a></li>
              <li><a href="#">#님<span class="caret"></span></a></li>
              <li><a href="#">마이페이지</a></li>
              <li><a href="#">회원가입</a></li>
          </ul>

          <ul class="header-nav header-nav-dropdown clearfix">
              <li><a href="#">사이트 소개</a></li>
              <li><a href="#">Alley 위치</a></li>
              <li><a href="#">공지사항</a></li>
              <li><a href="#">Coffee Talk</a></li>
              <li><a href="#">카페 게시판</a></li>
              <li class="dropdown">
                  <a href="#">이벤트</a>
                  <ul class="dropdown-menu">
                      <li><a href="#">이벤트 요약</a></li>
                      <li><a href="#">이벤트 공지</a></li>
                  </ul>
              </li>
              <li class="dropdown">
                  <a href="#">Owner Mall </span></a>
                  <ul class="dropdown-menu">
                      <li><a href="#">원두</a></li>
                      <li><a href="#">티 / 액상차</a></li>
                      <li><a href="#">유제품</a></li>
                      <li><a href="#">시럽 / 소스</a></li>
                      <li><a href="#">파우더 / 농축액</a></li>
                      <li><a href="#">커피용품, 머신</a></li>
                  </ul>
              </li>
          </ul>

      </nav>

  </div>

</header>


<!----------------------------------------------------------로그인  Modal ---------------------------------------------------------->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">

      <!-- Modal Content -->
      <div class="modal-content">
          <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">로그인</h4>
          </div>
          <div class="modal-body">
              <form action="#">
                  <h5>아이디</h5>
                  <input type="text" class="form-control" placeholder="Text input">
                  <h5>비밀번호</h5>
                  <input type="password" class="form-control" placeholder="password input">
                  <label>
                      <input type="checkbox">
                      <small>로그인 유지</small>
                  </label>
                  <div class="login-center">
                      <button type="button" class="btn btn-primary btn-block">Log In</button>
                      <div class="login-center2 clearfix">
                          <div style="float:left;">
                              아직 회원이 아니신가요?
                          </div>
                          <div style="float: right;">
                              <a href="#">일반회원 가입</a><br>
                              <a href="#">카페회원 가입</a>
                          </div>
                      </div>

                      <div class="login-p-center">또는</div>
                      <button type="button" class="btn btn-block"
                          style="background-color: #04cf5c; color: white;"><strong>N</strong></strong></button>
                  </div>
              </form>
              <br>
              <div class="login-p-center">네이버 가입은 일반 회원만 가능합니다.</div>
          </div>
          <div class="modal-footer">
          </div>
      </div>
  </div>
</div>




      <script src="../js/jquery-3.6.0.min.js"></script>
      <script src="../js/bootstrap.js"></script>


    <section>
        <div class="container" style="margin-top: 200px;">
            <div class="row">
                <div class="col-xs-12">
                    <div class="row">
                      
                        <div class="col-xs-12">
                            <h3 class="write-service">
                                글 작성
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
                        
                        
                        
                       
                        
                     
                          
                          <button class="detailbtn btn btn-dark" id="listbtn" style="float: left;">목록</button>

                            
                            <div class="write">
                                 <!-- 취소버튼 -> 목록으로. -->
                                <button id="stopbtn" type="button" class="btn btn-primary">
                                    취소
                                </button>
                                <button id="regbtn" type="button" class="btn btn-info">
                                    등록
                                </button>
                            </div>
                            
                        </div>
                    </form>
                    
                      
                        
                             
                        
                    
                </div>
            </div>
        </div>
    </section>



      

<footer>

  <div class="footer-container clearfix">

      <div class="footer-left">
          <div class="footer-logo">
              <a href="#"><img width="150px" src="../img/logo2.png" alt="logo"></a>
              <span class="footer-name">Cafe Alley</span><br><br>
              <span class="footer-desc">논 브랜디드 카페의 활성화, 커피 문화를 선도합니다.</span>
          </div>
          <hr>
          <p class="footer-business">
              대표자 : 김골목 | E-MAIL : info@info.com<br>
              사업자번호 : 123-45-67890 | 개인정보보호책임자 : 김골목 | 통신판매업 : 2019-서울마포-0001<br>
              주소 : 서울특별시 마포구 대흥동
          </p>
          <p class="footer-copyright">
              Copyright © 2022 COFFEE ALLEY (c). All Rights Reserved E-mail : <a
                  href="mailto:coffeealley.gmail.com">coffeealley.gmail.com</a>
          </p>
      </div>

      <div class="footer-right clearfix">
          <ul class="footer-nav clearfix">
              <li><a href="#">사이트 소개</a></li>
              <li><a href="#">이용약관</a></li>
              <li><a href="#">개인정보 처리방침</a></li>
          </ul>
          <div class="footer-sns">
              <a href="#"><span class="fa-brands fa-facebook-square"></span></a>

              <a href="#"><span class="fa fa-instagram"></span></a>

              <a href="#"><span class="fa-brands fa-youtube"></span></a>
          </div>



      </div>

  </div>

</footer>

    
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