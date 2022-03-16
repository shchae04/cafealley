<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap css -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>">
<!-- header와 footer, 폰트에대한 css -->
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>
<!-- jquery와 bootstrapjs 순서는 중요합니다. 항상 jquery가 bootstrap.js보다 먼저 와야합니다.
그렇지 않으면 bootstrap.js에서 동작하는 modal이나 dropdown등이 동작되지 않을 수 있습니다. -->
<!-- jquery -->
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<!-- bootstrap js -->
<script src="<c:url value='/js/bootstrap.js' />"></script>  


</head>
<body>


    <header>
        <div class="header">
            <nav class="header-container">
                <div class="header-logo">
                    <a href="#"><img width="150px" src="<c:url value='/img/logo.png'/>" alt="logo"></a>
                </div>


                <ul class="header-nav header-nav-upper clearfix">
                    <li><a data-toggle="modal" href="#myModal">로그인</a></li>
                    <li class="dropdown">
                        <a href="#">#님<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li id="header-name">#님(일반회원)</li>
                            <li>cafealley123@gmail.com</li>
                            <li>마이페이지</li>
                            <li id="header-barcode">barcode here</li>
                        </ul>
                    </li>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">고객문의</a></li>
                </ul>

                <ul class="header-nav header-nav-dropdown clearfix">
                    <li><a href="#">사이트 소개</a></li>
                    <li><a href="#">Alley 위치</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">Coffee Talk</a></li>
                    <li><a href="#">카페 게시판</a></li>
                    <li><a href="#">이벤트</a></li>
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


</body>
</html>