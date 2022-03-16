<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>exchangeRefund</title>
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/style.css">
    <!-- 폰트어썸 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <style>

        @font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'S-CoreDream-4Regular';
        }

        .container {
            min-width: 1200px;
            margin-top: 100px;
        }

        .ex-img {
            min-width: 100px;
            width: 100px;
        }

        .ex-title {
            margin: 50px 0 30px 0;
            font-size: 34px;
            font-weight: bold;
        }

        .ex-guide {
            margin: 10px 0;
            width: 550px;
            font-size: 13px;
            line-height: 20px;
            color: #555555;
        }

        hr {
            border-top: 1px solid #bbb;
            border-bottom: 1px solid #fff;
        }

        .btn-guide-text {
            font-size: 20px;
            margin: 50px 0;
        }

        .checkbox-ex {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .checkbox-ref {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .checkbox-ex + div,
        .checkbox-ref +div {
            display: inline-block;
            font-size: 17px;
            margin-left: 7px;
            box-sizing: border-box;
        }

        .checkbox-ex + div {
            margin-right: 10px;
        }

        /* 테이블 */

        .info-table {
            margin: 30px 0;
        }

        .ex-apply {
            width: 160px;
            padding: 15px;
            margin: 20px 0 30px 400px;
            background: #BFBFBF;
            color: #fff;
        }

        .pre-page {
            width: 160px;
            padding: 15px;
            margin: 20px 0 30px 0;
            background: #000;
            color: #fff;
        }

        .detail-reason,
        .input-account,
        .input-addr {
            border: 1px solid #ddd;
            padding: 0 5px;
            width: 160px;
        }

        .btn-addr {
            margin-left: 4px;
            padding: 3px 10px;
            background: #BFBFBF;
            color: #fff;
        }

        .ex-table {
            display: none;
        }

        .ref-table {
            display: none;
        }

        .all-select {
            margin-left: 21px;
        }

        @font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }


    </style>
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
            
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <p class="ex-title">교환/환불</p>
                <ul class="ex-guide">
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 교환/환불은 제품 수령일로부터 7일 이내에 신청 가능합니다.
                    </li>
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 고객님의 단순 변심에 의한 교환/환불 배송료는 고객님 부담입니다.
                    </li>
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 원단, 주자재, 봉제 불량은 무상수리 또는 교환해 드립니다.
                    </li>
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 소비자 부주의에 의한 제품 손상 및 세탁 부주의로 인한 이염, 변형, 파손된 제품은<br>교환 / 환불의 사유가 되지 않습니다
                    </li>
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 사용감이 있거나 상품 택 제거 후에는 교환/ 환불이 불가하오니 주의 바랍니다.
                    </li>
                </ul>

                <hr>

                <p class="btn-guide-text">
                    교환 또는 반품을 선택하시고 그에 맞는 양식을 작성하여 신청해주세요.
                </p>
                <input type="checkbox" id="exCheck" class="checkbox-ex"><div>교환</div>

                <input type="checkbox" id="refCheck" class="checkbox-ref"><div>반품</div>

                <table class="info-table table text-center align-middle">
                    <thead>
                        <tr>
                            <td class="col-md-1">
                                전체선택<br><input id="select_all" class="all-select" type="checkbox">
                            </td>
                            <td class="col-md-2">
                                주문일자
                                [주문번호]
                            </td>
                            <td class="col-md-5">상품정보</td>
                            <td class="col-md-1">수량</td>
                            <td class="col-md-2">상품구매금액</td>
                        </tr>
                    </thead>
                    <tbody id="infoTbody">
                        <tr>
                            <td class="col-md-1"><input id="input-cbox" type="checkbox"></td>
                            <td class="col-md-2">
                                2022-03-07<br>
                                [20220307-000001]
                            </td>
                            <td class="col-md-5">
                                <img src="../img/paul bassett.jpg" class="ex-img" alt="paul_bassett">
                                폴 바셋 시그니처 블렌드 풀 포텐셜 1.01kg
                            </td>
                            <td class="col-md-1">1</td>
                            <td class="col-md-2">24,700원</td>
                        </tr>

                        <tr>
                            <td class="col-md-1"><input id="input-cbox" type="checkbox"></td>
                            <td class="col-md-2">
                                2022-03-07<br>
                                [20220307-000001]
                            </td>
                            <td class="col-md-5">
                                <img src="../img/paul bassett.jpg" class="ex-img" alt="paul_bassett">
                                폴 바셋 시그니처 블렌드 풀 포텐셜 1.01kg
                            </td>
                            <td class="col-md-1">1</td>
                            <td class="col-md-2">24,700원</td>
                        </tr>
                        <tr>
                            <td class="col-md-1"><input id="input-cbox" type="checkbox"></td>
                            <td class="col-md-2">
                                2022-03-07<br>
                                [20220307-000001]
                            </td>
                            <td class="col-md-5">
                                <img src="../img/paul bassett.jpg" class="ex-img" alt="paul_bassett">
                                폴 바셋 시그니처 블렌드 풀 포텐셜 1.01kg
                            </td>
                            <td class="col-md-1">1</td>
                            <td class="col-md-2">24,700원</td>
                        </tr>
                    </tbody>
                </table>


                <!-- 사용자가 교환을 체크했을 경우 -->
                <table id="exTable" class="ex-table table text-center align-middle">
                    <caption>교환사유</caption>
                    <tbody class="text-center w-auto align-middle">
                        <tr>
                            <td class="col-xs-3">사유선택</td>
                            <td class="col-xs-6">
                                <select id="exSelReason">
                                    <option value="select-option">선택해주세요</option>
                                    <option value="wrong-sending">오배송</option>
                                    <option value="different-info">상품정보 상이</option>
                                    <option value="missing-prize">상품 누락</option>
                                    <option value="change-mind">단순변심</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>상세사유</td>
                            <td>
                                <input class="detail-reason" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td>은행명</td>
                            <td>
                                <select id="exSelBank">
                                    <option value="nh">농협</option>
                                    <option value="kb">국민</option>
                                    <option value="sh">신한</option>
                                    <option value="wr">우리</option>
                                    <option value="hn">하나</option>
                                    <option value="kko">카카오뱅크</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>환불계좌</td>
                            <td>
                                <input id="exInputAcnt" class="input-account" type="text" placeholder="하이픈(-) 없이 입력">
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <input id="exInputAddr" class="input-addr" type="text" placeholder="동,호수를 정확히 입력">
                                <button class="btn-addr">주소찾기</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- 사용자가 반품을 체크했을 경우 -->
                <table id="refTable" class="ref-table table text-center align-middle">
                    <caption>반품사유</caption>
                    <tbody>
                        <tr>
                            <td class="col-md-2">사유선택</td>
                            <td class="col-md-4">
                                <select id="refSelReason">
                                    <option value="none">선택해주세요</option>
                                    <option value="wrong-sending">오배송</option>
                                    <option value="different-info">상품정보 상이</option>
                                    <option value="missing-prize">상품 누락</option>
                                    <option value="change-mind">단순변심</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>상세사유</td>
                            <td>
                                <input class="detail-reason" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td>은행명</td>
                            <td>
                                <select id="refSelBank">
                                    <option value="none">선택</option>
                                    <option value="nh">농협</option>
                                    <option value="kb">국민</option>
                                    <option value="sh">신한</option>
                                    <option value="wr">우리</option>
                                    <option value="hn">하나</option>
                                    <option value="kko">카카오뱅크</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>환불계좌</td>
                            <td>
                                <input id="refInputAcnt" class="input-account" type="text" placeholder="하이픈(-) 없이 입력">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn-wrap">
                    <button id="exApply" class="ex-apply">신청하기</button>&nbsp;&nbsp;<button class="pre-page">이전페이지</button>
                </div>
            </div>
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

        $(function(){
            
            // 전체선택 클릭 이벤트
            $('#select_all').click(function() {
                // console.log('전체 선택이 클릭됨!');
                if($('#select_all').is(':checked')) {
                    $('input[id=input-cbox]').prop('checked', true);
                } else {
                    $('input[id=input-cbox]').prop('checked', false);
                }
            }); // 전체 선택 클릭 시 발동 이벤트 끝

            // checkbox들이 전부 선택되면 전체선택박스가 checked되는 이벤트
            $('input[id=input-cbox]').click(function() {
                const total = $('input[id=input-cbox]').length;
                const checked = $('input[id=input-cbox]:checked').length;
                // console.log('total: ' + total);
                // console.log('checked: ' + checked);

                if(total != checked) {
                    $('#select_all').prop('checked', false);
                } else {
                    $('#select_all').prop('checked', true);
                }
            });// 전체선택박스 checked 이벤트 끝

            //교환을 체크할 시 교환 테이블만 보여주기
            $('#exCheck').click(function(){
                if($('input[id=exCheck]').is(':checked')) {
                    $('table[id=exTable]').css('display', 'block');
                    $('table[id=exTable]').css('width', '1000px');
                    $('table[id=exTable]').css('margin', '50px 0 30px 320px');
                    
                    $('table[id=refTable]').css('display', 'none');
                    $('input[id=refCheck]').prop('checked', false);
                } else {
                    $('table[id=exTable]').css('display', 'none');
                }
            });//교환 체크 이벤트 끝

            //반품을 체크할 시 반품 테이블만 보여주기
            $('#refCheck').click(function(){
                if($('input[id=refCheck]').is(':checked')) {
                    $('table[id=refTable]').css('display', 'block');
                    $('table[id=refTable]').css('width', '1000px');
                    $('table[id=refTable]').css('margin', '50px 0 30px 320px');

                    $('input[id=exCheck]').prop('checked', false);
                    $('table[id=exTable]').css('display', 'none');
                } else {
                    $('table[id=refTable]').css('display', 'none');
                }
            });//반품 체크 이벤트 끝


            //신청하기 버튼 유효성 검사
            $('#exApply').click(function(){
               if(!$('#exCheck').is(':checked')&&!$('#refCheck').is(':checked')) {
                    $('#exApply').attr('type', 'button');
                    alert('교환/반품 양식을 작성해 주세요.');

                } else if($('#exCheck').is(':checked')) {//교환을 선택할 경우
                    if ($('#exSelReason').val() === 'none' || $('#exSelBank').val() === 'none' || $('#exInputAcnt').val() === '' || $('#exInputAddr').val() === '') {
                        $('#exApply').attr('type', 'button');
                        alert('정보를 빠짐없이 기입해주세요.');
                    }
                } else if($('#refCheck').is(':checked')) {//반품을 선택할 경우
                    if ($('#refSelReason').val() === 'none' || $('#refSelBank').val() === 'none' || $('#refInputAcnt').val() === '') {
                        $('#exApply').attr('type', 'button');
                        alert('정보를 빠짐없이 기입해주세요.');
                    }
                }
            });
            


        });//end jQuery


    </script>
    


</body>
</html>