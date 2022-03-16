<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cafe Alley | 관리자페이지(상품 목록)</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/style.css">

    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>

    <style>
        body {
            width: 100%;
            height: 100%;
        }

        section {
            margin-top: 150px;
            min-height: 488px;
        }

        .container {
            min-width: 1200px;
            height: 100%;
        }

        .page-title {
            text-align: center;
            font-size: 25px;
            font-weight: 900;
        }

        .page-desc {
            margin-top: 20px;
            text-align: right;
        }

        .row {
            display: block;
            width: 100%;
            margin: 30px auto;
            padding-left: 85px;
        }

        .upper-bar {
            display: block;
            width: 100%;
            height: 70px;
            border-bottom: 2px solid white;
        }

        .divforleft {
            width: fit-content;
            height: fit-content;
            text-align: center;
            display: block;
            float: left;
            margin-left: -200px;
        }

        .divforleft>ul>li {
            padding: 10px;
            border-top: 2px solid black;
        }

        .divforleft p {
            display: block;
            width: fit-content;
            margin: 0 auto 10px;
            font-size: 20px;
            font-weight: 900;
        }

        .select-category a {
            color: black;
        }
        .divforright {
            width: fit-content;
            height: fit-content;
            text-align: center;
            display: block;
            float: right;
        }
        .divforright form{
            display: inline-block;
        }
        .divforright input[type="text"]{
            height: 25px;
            outline: none;
        }
        .divforright input[type="text"]::placeholder{
            color: black;
            text-align: center;
        }
        .divforright input[type="text"]:focus .divforright>input[type="text"]::placeholder{
            display: none;
        }

        .divforright .btn-search{
            width: 25px;
            height: 25px;
            background-color: black;
            color: white;
        }
        .glyphicon-search{
            transition: all 0.5s linear;
        }
        .divforright .btn-search:hover .glyphicon-search{
            transform: scale( 1.2 );
            transform: rotate(360deg);
        }

        .cart-list {
            background: black;
            width: 90%;
            padding: 0 !important;
        }

        .cart-table {
            margin-top: 15px;
            background: #fff;
        }

        .cart-table>thead {
            font-weight: bold;
        }

        .cart-table>tbody {
            font-size: 12px;
            line-height: 1px;
        }

        .cart-table>tbody>tr>td>p {
            margin: 0;
        }

        input[type="number"] {
            border: 1px solid #ddd;
            width: 40px;
            text-align: center;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            opacity: 1;

        }

        .prod-number,
        .prod-price {
            padding-top: 30px;
        }

        .prod-category {
            font-weight: 700;
        }

        .prod-qty input[type="text"] {
            width: 42px;
            height: 20px;
            padding: 5px;
            border: 1px solid #ddd;
            display: inline-block;
            position: relative;
        }

        .cart-table>thead>tr>td,
        .cart-table>tbody>tr>td,
        .cart-table>tfoot>tr>td {
            margin: 0;
            vertical-align: middle;
        }

        .cart-table .prod-qty img {
            width: 13px;
            height: 9px;
            margin-left: 2px;
            cursor: pointer;
            display: block;
        }

        .qty-up-down {
            position: absolute;
        }

        .cart-table button {
            width: auto;
            height: 20px;
        }


        .cart-table tr {
            border-top: 1px solid #ddd;
        }

        tfoot tr td {
            border-top: none;
        }

        .cart-table .btn-direct-order .btn-remove {
            margin: 7px;
        }

        .btn-remove,
        .btn-modify {
            display: block;
            padding: 5px;
            cursor: pointer;
        }

        .btn-remove:hover,
        .btn-modify:hover {
            font-weight: bolder;
        }

        .cart-table tbody .prod-qty .btn-qty-update {
            width: 80px;
        }



        .cart-table tfoot {
            text-align: right;
            background: white;
        }

        .cart-table tfoot p {
            margin: 0;
            padding: 10px 0;
        }

        .select-category,
        .btn-all-order {
            width: fit-content;
            height: 50px;
            margin: 0 0 10px 10px;
            padding: 15px;
            display: inline-block;
        }

        .btn-keepShopping {
            background: black;
            color: white;
            font-size: 18px;
        }

        .btn-keepShopping:hover {
            font-style: italic;
        }

        .btn-sel-order {
            background: black;
            color: white;
            font-size: 18px;
        }

        .btn-sel-order:hover {
            font-style: italic;
        }

        .btn-all-order {
            background: black;
            color: white;
            font-size: 18px;
        }

        .btn-all-order:hover {
            font-style: italic;

        }


        .all-select,
        input[type="checkbox"] {
            margin: -30px 0 0 20px;
        }

        .all-select-text {
            font-size: 12px;
            margin-left: 20px;
        }



        .clearfix::after {
            content: '';
            display: block;
            clear: both;
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
            <p class="page-title">상품 관리</p>
            <p class="page-desc"><strong style="color:red;">*</strong> 상품을 삭제하시려면 상품페이지에 등록되어있는 판매 게시글부터 삭제해주셔야 합니다.</p>
            <div class="row">
                <div class="col-xs-12 cart-list clearfix">
                    <div class="upper-bar clearfix">
                        <div class="divforleft">
                            <p>종류</p>
                            <ul class="select-category">
                                <li><a href="#">전체</a></li>
                                <li><a href="#">원두</a></li>
                                <li><a href="#">티/액상차</a></li>
                                <li><a href="#">유제품</a></li>
                                <li><a href="#">시럽/소스</a></li>
                                <li><a href="#">파우더/농축액</a></li>
                                <li><a href="#">커피용품, 머신</a></li>
                            </ul>
                        </div>
                        <div class="divforright">
                            <form action="#">
                            <input type="text" placeholder="상품명 검색"><button class="btn-search" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                            </form>
                            <button class="btn-all-order">상품 등록하기</button>
                        </div>
                    </div>


                    <table class="table w-auto text-center align-middle cart-table">
                        <thead>
                            <tr>
                                <td>상품 카테고리</td>
                                <td>상품 이미지</td>
                                <td>상품번호</td>
                                <td>상품명</td>
                                <td>재고</td>
                                <td>상품정상가격</td>
                                <td>상품판매가격</td>
                                <td>상품 관리</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="prod-category">
                                    <p>원두</p>
                                </td>
                                <td class="prod-img">
                                    <img src="../img/paul bassett.jpg" alt="" width="100px" height="100px">
                                </td>
                                <td class="prod-number">
                                    <p>1</p>
                                </td>
                                <td class="prod-info">
                                    <p>폴 바셋 시그니처 블렌드 풀 포텐셜</p>
                                    <p>(에스프레소 분쇄)</p>
                                    <!--  이 부분은 우리가 옵션컬럼이 없으니, 작성페이지에서 옵션이 있으면 어떤 옵션인지 상품명에 함께 () 내에 적으라고 할 것임. 
                                                                  사실 관리자가 적는 것이니 트롤링하지 않는다는 전제로 어떤 로직을 짜서 강제하지는 않을 것.
                                                                  그럼 이 페이지에서 가져올 때는 나중에 JS로직으로 만약 상품명 가져와서 안에 괄호 있는지 확인 들어감. 있으면 이 p태그에 띄우는 것. -->
                                </td>
                                <td class="prod-qty">
                                    <p>52</p>
                                </td>
                                <td class="prod-normal-price">
                                    <p>27,000원</p>
                                </td>
                                <td class="prod-discount-price">
                                    <p>15,902원</p>
                                </td>
                                <td>
                                    <p class="btn-modify">수정<span class="glyphicon glyphicon-erase"></span></p>
                                    <p class="btn-remove">삭제<span class="glyphicon glyphicon-remove">
                                        </span></p>
                                </td>
                            </tr>
                            <tr>
                                <td class="prod-category">
                                    <p>원두</p>
                                </td>
                                <td class="prod-img">
                                    <img src="../img/paul bassett.jpg" alt="" width="100px" height="100px">
                                </td>
                                <td class="prod-number">
                                    <p>1</p>
                                </td>
                                <td class="prod-info">
                                    <p>폴 바셋 시그니처 블렌드 풀 포텐셜</p>
                                    <p>(에스프레소 분쇄)</p>
                                    <!--  이 부분은 우리가 옵션컬럼이 없으니, 작성페이지에서 옵션이 있으면 어떤 옵션인지 상품명에 함께 () 내에 적으라고 할 것임. 
                                                                  사실 관리자가 적는 것이니 트롤링하지 않는다는 전제로 어떤 로직을 짜서 강제하지는 않을 것.
                                                                  그럼 이 페이지에서 가져올 때는 나중에 JS로직으로 만약 상품명 가져와서 안에 괄호 있는지 확인 들어감. 있으면 이 p태그에 띄우는 것. -->
                                </td>
                                <td class="prod-qty">
                                    <p>52</p>
                                </td>
                                <td class="prod-normal-price">
                                    <p>27,000원</p>
                                </td>
                                <td class="prod-discount-price">
                                    <p>15,902원</p>
                                </td>
                                <td>
                                    <p class="btn-modify">수정<span class="glyphicon glyphicon-erase"></span></p>
                                    <p class="btn-remove">삭제<span class="glyphicon glyphicon-remove">
                                        </span></p>
                                </td>
                            </tr>
                            <tr>
                                <td class="prod-category">
                                    <p>원두</p>
                                </td>
                                <td class="prod-img">
                                    <img src="../img/paul bassett.jpg" alt="" width="100px" height="100px">
                                </td>
                                <td class="prod-number">
                                    <p>1</p>
                                </td>
                                <td class="prod-info">
                                    <p>폴 바셋 시그니처 블렌드 풀 포텐셜</p>
                                    <p>(에스프레소 분쇄)</p>
                                    <!--  이 부분은 우리가 옵션컬럼이 없으니, 작성페이지에서 옵션이 있으면 어떤 옵션인지 상품명에 함께 () 내에 적으라고 할 것임. 
                                                                  사실 관리자가 적는 것이니 트롤링하지 않는다는 전제로 어떤 로직을 짜서 강제하지는 않을 것.
                                                                  그럼 이 페이지에서 가져올 때는 나중에 JS로직으로 만약 상품명 가져와서 안에 괄호 있는지 확인 들어감. 있으면 이 p태그에 띄우는 것. -->
                                </td>
                                <td class="prod-qty">
                                    <p>52</p>
                                </td>
                                <td class="prod-normal-price">
                                    <p>27,000원</p>
                                </td>
                                <td class="prod-discount-price">
                                    <p>15,902원</p>
                                </td>
                                <td>
                                    <p class="btn-modify">수정<span class="glyphicon glyphicon-erase"></span></p>
                                    <p class="btn-remove">삭제<span class="glyphicon glyphicon-remove">
                                        </span></p>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot>

                        </tfoot>
                    </table>
                    <br>

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
        const $table = document.querySelector('.table');

        // 삭제버튼 누르면 tr삭제하는 로직
        $table.addEventListener('click', e => {
            if (!(e.target.matches('.btn-remove') || e.target.matches('.glyphicon-remove'))) {
                return;
            }

            // 여기에 상품이 등록된 판매게시글이 있는지 여부 확인해서 돌려보내거나
            // 아니면 삭제를 진행하고 아래의 tr삭제를 진행하도록 하자.


            // 해당 tr삭제
            if (e.target.matches('.btn-remove')) {
                e.preventDefault();
                e.target.parentNode.parentNode.remove();
            } else {
                e.target.parentNode.parentNode.parentNode.remove();
            }
        })
    </script>


</body>

</html>