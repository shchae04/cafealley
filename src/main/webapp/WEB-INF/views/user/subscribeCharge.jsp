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
    <script src="../js/style.js"></script>
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
    


    <div class="container bbb clearfix" style="margin-top: 200px; margin-bottom: 80px;">
        <form action="" method="post" name="chargeform">
            <div class="row">
                <!-- 제목 -->
                <div class="col-xs-12" style="border-bottom: 3px solid black; margin-bottom: 50px;">
                    <h3>구독 서비스 결제 정보</h3>
                    
                </div>
                <div class="col-xs-3" style="font-weight: bold;">구독 서비스 정보</div>
                <div class="col-xs-3">
                    <select class="form-control submonth">
                        <option value="1" selected>1개월</option>
                        <option value="3">3개월</option>
                        <option value="6">6개월</option>
                        <option value="12">12개월</option>
                    </select>
                </div>
                <div class="col-xs-3" style="position: absolute; top: 350px; min-width: 240px;"> 
                    6개월 : 10%,12개월 : 20% 
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="col-xs-3" hidden>
                            결제 금액
                        </div>

                        <!-- select 값에따라 구독 금액이 달라짐 -->
                        <div class="col-xs-3" hidden>
                            <select class="form-control" name="" id="">
                                <option value="4000">4000원</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12" style="border-top: 3px solid black; margin-top: 30px; border-bottom: 3px solid black;">

                    <h3>결제 수단 선택</h3>
                    <br>

                    <div style="margin-bottom: 10px;">
                        <label class="checkbox-inline">
                            <input type="radio" name="" id="" value="option1"> 무통장입금
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="" id="" value="option2"> 신용카드
                        </label>
                    </div>

                </div>
                <div class="col-xs-8">
                    <p style="text-align: center; margin: 20px 0;">[ 무통장 입금의 경우 입금 확인 후 멤버쉽이 등록됩니다. ]</p>
                </div>

            </div>
            <div class="col-xs-4">

                <label for="">
                    입금자명 :
                </label>
            </div>
            <div class="col-xs-8 col-xs-pull-3">

                <input class="form-control" id="depositname" type="text" placeholder="입금자명을 입력하세요">

                <br>


            </div>

            <div class="col-xs-4">

                <label for="">
                    입금은행 :
                </label>
            </div>

            <div class="col-xs-8 col-xs-pull-3">
                <select class="form-control" name="bank" id="bank">
                    <option value="">국민은행</option>
                    <option value="">카카오뱅크</option>
                    <option value="">신한은행</option>
                    <option value="">...</option>
                </select>
            </div>
            <hr>




            <div class="row">
                <div class="subscribeprice">
                    <br>
                    <div class="col-xs-12">
                        <p>총 결제금액 <strong>4000</strong>원 </p>
                    </div>
                    <br>
                </div>
            </div>
        </form>

        <div class="col-xs-12">

            <hr>
            <a href="#" class="chargedetailinfo" style="text-decoration: underline;">
                결제 유의사항 자세히 보기
            </a>

            <div class="checkcharge">
                동의<input type="checkbox" id="agree" value="동의" name="agree">
            </div>
            <hr>

        </div>

        <div style="text-align: center;">
            <button class="btn active" type="button" id="charge" style="width: 800px; font-size: 30px; color: black; background-color: whitesmoke;">결제</button>
        </div>
    </div>



          

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
            document.querySelector('#agree').disabled = true;

            const chcek = document.querySelector('#chargedetailinfo')
            if(check.addEventListener){
                document.querySelector('#agree').disabled = false;

            }

            //구독서비스 정보 가져오기
            let submonth = document.querySelector('.submonth')
            console.log(submonth)

            let subprice = document.querySelector('.subscribeprice > div > p')
            console.log(subprice)

            submonth.addEventListener('change', function () {
                if(submonth.value == 12){
                    subprice.innerHTML = '총 결제금액 <strong>' + submonth.value * 4000 * 0.8 + '</strong>원';
                    
                } else if(submonth.value == 6){
                    subprice.innerHTML = '총 결제금액 <strong>' + submonth.value * 4000 * 0.9 + '</strong>원';

                }
                 else{

                    subprice.innerHTML = '총 결제금액 <strong>' + submonth.value * 4000 + '</strong>원';
                }
            })

            // 결제 유의사항 동의여부
            let agreebtn = document.querySelector('.checkcharge > input')
            console.log(agreebtn)

            //결제 버튼 유효성 검사
            document.querySelector('#charge').addEventListener('click',function(e){
                
                if(!agreebtn.checked){
                    e.preventDefault();
                    alert('결제유의사항을 확인해주세요')
                    return;
                }

                console.log(e.target)
                //구독개월정보
                submonth
                //결제금액
                charge = submonth.value * 4000;
                //입금자명
                depositname = document.querySelector('#depositname');
                //입금은행
                bank = document.querySelector('#bank').value;

                //구독개월정보,결제금액,입금자명,입금은행 배열로전달 객체로 전달해도 될듯.''''
                
                let arr = [submonth,charge,depositname,bank]; 
                
                //데이터 전송
                document.chargeform.submit();
            })
        </script>





</body>

</html>