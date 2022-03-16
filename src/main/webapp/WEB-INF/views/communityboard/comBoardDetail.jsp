<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/shstyle.css">
    <link rel="stylesheet" href="../css/style.css">
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>

   


</head>

<body>


    
<header>

    <div class="header" style="font-family: alice;">
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


    

    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    상세보기
                    <div class="titlebox" style="text-align: center; border-bottom: 3px solid black;">
                        
                        
                    </div>

                    <form action="#" class="detailform clearfix" method="post">
                        <div style="border-bottom: 3px solid black;">
                            <label class="regdate">작성일</label>
                            <label class="modifycheck">수정됨 ( o , x)</label>
                            <p>2022-01-06</p>
                        </div>
                        <div class="form-group" style="margin-top: 30px;">
                            <img src="../img/prod1.jpg" style="float: right; height: 200px; width: 200px; border-radius: 5px; position: relative; bottom: 15px; " alt="내용1">
                            <label for="bId">글번호</label>
                            <input type="text" id="bId" class="form-control" style="border-color: transparent; cursor: auto;width: 5%;  background: white;" readonly value="3">
                        </div>
                        <div class="form-group">
                            <label for="writer">작성자</label>
                            <input type="text" id="writer" style="border-color: transparent;cursor: auto; width: 20%;background: white;" class="form-control" readonly value="admin" >
                        </div>
                        <div class="form-group">
                            <label for="title"> 제목&nbsp;&nbsp;</label>
                            <input type="text" id="title" style="cursor: auto; width: 20%;background: white;" class="form-control" readonly >
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div>
                                    <!-- DB에서 이미지가 없다면 기본이미지 -> 텍스트 에리어만 출력 -->
                                    <!-- img 파일이 여러개 있다면  -->
                                    <label for="content">내용</label>
                                    <textarea id="content" style=" cursor: auto; background: white;" class="form-control" rows="8" readonly ></textarea>
                                </div>
                            </div>
                        </div>
                       
                        
                        
                    </form>
                    <!-- 이전글 다음글 버튼 배치 -->
                    <br><br><br>
                    <br>
                    <!-- 작성한 회원만 수정 삭제가능 -->
                    <button class="detailbtn btn btn-info" id="delbtn">삭제</button>
                    <button class="detailbtn btn btn-dark" id="modbtn">수정</button>
                    <button class="detailbtn btn btn-dark" id="listbtn">목록</button>
                    <div class="col-xs-3">
                        <input id="prev" type="button" class="btn" value="이전글"> 
                        <input id="next" type="button" class="btn btn" value="다음글">
                    </div>
                    <br><br><br><br>
                </div>
            </div>
        </div>

    </section>

    <!-- 공지사항 같은 경우 -> 댓글 작성공간을 날려버리면 된다. -->
    <section class="reply" style="margin-bottom: 100px;">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <!-- 댓글 작성 공간 -->
                    <div class="reply-wrap">
                        <!-- 현재 로그인 한 사용자의 정보를 토대로 댓글 -->
                        <div class="reply-content" style="margin-top: 20px;">
                           
                                <textarea class="form-control" rows="3" placeholder="댓글을 입력해주세요"></textarea>
                            <div class="reply-group clearfix">
                                <div class="reply-input">
                                    
                                </div>
                                <br>
                                <button id="registbtn" class="submitbtn btn btn-info">등록하기</button>
                            </div>
                        </div>
                    </div>

                    <!-- 댓글이 달릴 공간 비동기. -->
                    <div class="reply-wrap">
                        
                        <div class="reply-content">
                            <hr>
                            <div class="reply-group">
                                <!-- 댓글이 반복적으로 달릴 공간! -->
                                <div style="padding: 20px 50px; border-bottom: 2px solid black; border-top: 2px solid black;">
                                    <strong class="left">커피사조!</strong>
                                    <small class="left">2022/01/06</small>
                                    <!-- 수정이 한번이라도 일어났으면 수정됨! -->
                                    <small class="left">수정됨</small>
                                    <!-- 댓글을 작성한 회원에게만 보여짐. -->
                                    <a id="replymodbtn" class="modify" href="#"><span class="glyphicon glyphicon-pencil"></span>수정</a>
                                    <a id="replydelbtn" class="delete" href="#"><span class="glyphicon glyphicon-remove"></span>삭제</a>
                                    <p>여기는 댓글</p>
                                </div> 

                        
                            </div>
                            
                        </div>

                    </div>
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
        //이전버튼
        const prev = document.querySelector('#prev')
        //다음버튼
        const next = document.querySelector('#next')
        //수정버튼
        const modbtn = document.querySelector('#modbtn')
        //목록버튼
        const listbtn = document.querySelector('#listbtn')
        //삭제버튼
        const delbtn = document.querySelector('#delbtn')





        //ajax 비동기식 등록!
        //댓글 등록하기 버튼
        const replyregist = document.querySelector('#registbtn')

        //댓글 수정버튼
        const remodbtn = document.querySelector('#replymodbtn')

        //댓글 삭제버튼
        const redelbtn = document.querySelector('#replydelbtn')
        

    </script>




</body>

</html>