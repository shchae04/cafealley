<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bsuserInfo</title>
    <!--부트스트랩-->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>

    <style>
        .clearfix::after {
            content: '';
            display: block;
            clear: both;
        }

        .titlefoot {
            float: right;
        }

        .form-control {
            display: inline-block;
        }

        .container {
            min-width: 1200px;
            margin-top: 150px;
            margin-bottom: 80px;
        }
    </style>
``
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

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!--카테고리 메뉴-->
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#">회원정보</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티게시판<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">작성글보기</a></li>
                                <li><a href="#">작성댓글보기</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티게시판<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">작성글보기</a></li>
                                <li><a href="#">작성댓글보기</a></li>
                            </ul>
                        </li>
                        <li><a href="#">주문내역/배송조회</a></li>
                    </ul>

                    <br>
                    <h3>
                        <strong>사장님 회원 정보</strong>
                    </h3>

                    <div class="tab-content">
                        <div id="info" class="tab-pane fade in active">

                            <br>
                            <p>*표시는 필수 입력 표시입니다</p>

                            <form action="#">
                                <table class="table">
                                    <tbody class="m-control">
                                        <tr>
                                            <td class="col-sm-2">*ID</td>
                                            <td class="col-sm-8"><input style="width: 180px; cursor: auto;"
                                                    class="form-control input-sm" name="userid" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>*카페이름</td>
                                            <td><input style="width: 180px; cursor: auto;" class="form-control input-sm"
                                                    name="cafename" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>*비밀번호</td>
                                            <td>
                                                <input style="width: 180px;" type="password"
                                                    class="form-control input-sm" id="usePw" name="userPw"
                                                    placeholder="영문(대/소),숫자 포함 8~16자">
                                                <span id="pwChk"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>*비밀번호확인</td>
                                            <td>
                                                <input style="width: 180px;" type="password"
                                                    class="form-control input-sm" id="userPwChk" name="userPwChk">
                                                <span id="pwChk2"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>E-mail</td>
                                            <td>
                                                <input style="width: 180px;" class="form-control input-sm"
                                                    name="useremail1">@
                                                <select style="width: 180px;" class="form-control input-sm sel"
                                                    name="useremail2">
                                                    <option>naver.com</option>
                                                    <option>gmail.com</option>
                                                    <option>daum.net</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>휴대폰</td>
                                            <td>
                                                <select style="width: 70px;" class="form-control input-sm sel"
                                                    name="userphone1">
                                                    <option>010</option>
                                                    <option>011</option>
                                                    <option>017</option>
                                                    <option>018</option>
                                                </select>
                                                <input style="width: 120px;" class="form-control input-sm"
                                                    id="userphone2" name="userphone2" maxlength="8"
                                                    placeholder="숫자 8자리 입력">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>*우편번호</td>
                                            <td><input style="width: 180px; cursor: auto;" class="form-control input-sm"
                                                    id="addrzipnum" name="addrzipnum" readonly>
                                                <button type="button" class="btn btn-primary" id="addrBtn">주소찾기</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>*카페주소</td>
                                            <td><input style="width: 500px; cursor: auto;"
                                                    class="form-control input-sm add" id="addrbasic" name="addrbasic"
                                                    readonly></td>
                                        </tr>
                                        <tr>
                                            <td>*상세주소</td>
                                            <td><input style="width: 500px; cursor: auto;"
                                                    class="form-control input-sm add" id="addrdetail" name="addrdetail"
                                                    readonly></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>

                            <div class="titlefoot">
                                <button type="button" class="btn" id="updateBtn">수정</button>
                                <button type="button" class="btn">탈퇴</button>
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

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/bootstrap.js"></script>

    <script>
        $(function () {

            //비밀번호 유효성 검증 정규표현식
            const getPwCheck = RegExp(/^.*(?=.*\d)(?=.*[a-zA-Z])/);

            //수정버튼 클릭 시 사용자의 입력값 검증!
            $('#updateBtn').click(function () {

                //비밀번호란 입력값 검증
                //비밀번호란 공백 확인
                if ($('#usePw').val() === '') {
                    $('#usePw').css('background-color', 'pink');
                    $('#pwChk').html('<b style="font-size: 12px; color: red;">[비밀번호는 필수 정보입니다!]</b>');
                    $('#usePw').focus();
                }
                //비밀번호 유효성 검사
                else if (!getPwCheck.test($('#usePw').val())) {
                    $('#usePw').css('background-color', 'pink');
                    $('#pwChk').html(
                        '<b style="font-size: 12px; color: red;">[영문(대/소문자), 숫자 포함 8 ~ 16자로 작성해 주세요.]</b>'
                        );
                    $('#usePw').focus();
                } else { //통과
                    $('#usePw').css('background-color', 'skyblue');
                    $('#pwChk').html('');
                }

                //비밀번호 확인란 입력 검증
                //비밀번호 확인란 공백 검증
                if ($('#userPwChk').val() === '') {
                    $('#userPwChk').css('background-color', 'pink');
                    $('#userPwChk').html(
                        '<b style="font-size: 12px; color: red;">[비밀번호 확인은 필수 정보입니다!]</b>');
                    $('#userPwChk').focus();
                } else if ($('#userPwChk').val() !== $('#usePw').val()) { //비밀번호 확인란 유효성 검사
                    $('#userPwChk').css('background-color', 'pink');
                    $('#pwChk2').html(
                        '<b style="font-size: 12px; color: red;">[작성하신 비밀번호와 일치하지 않습니다.]</b>');
                } else { //통과
                    $('#userPwChk').css('background-color', 'skyblue');
                    $('#pwChk2').html('');
                }

            }); //비밀번호 확인 검증 끝

        }); //수정버튼 클릭 유효성 검증 끝
    </script>

    <!--전화번호 숫자 외 문자 입력시 다른 커서 누를 경우 문자 자동 삭제-->
    <script>
        $(document).ready(function () {
            $("input#userphone2").blur(function () {
                var num = $("#userphone2").val();
                blur(num)
            });

            $("input#userphone2").click(function () {
                var num = $("#userphone2").val();
                focus(num);
            });
        });

        function focus(num) {
            num = num.replace(/[^0-9]/g, '');
            $("#userphone2").val(num);
        }

        function blur(num) {
            num = num.replace(/[^0-9]/g, '');
            $("#userphone2").val(num);
        }
    </script>
</body>

</html>