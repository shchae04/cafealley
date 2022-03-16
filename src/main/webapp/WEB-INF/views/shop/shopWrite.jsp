<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>shopDetail</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/style.css">
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>
    <link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">



    <style>
        body {
            width: 100%;
        }

        section {
            display: block;
            width: 90%;
            margin: 50px auto;
            padding-left: 120px;
        }

        .container {
            min-width: 1200px;
            margin-top: 200px;
        }

        .row {
            border-top: 2px solid black;
            min-width: 1100px;
            max-width: 1100px;

        }

        .detail-info {
            margin: 30px 0 30px 0;
        }

        .prod-img {
            margin-top: 30px;
            width: 450px;
        }

        .container img {
            max-width: 350px;
            display: block;
            margin: 0 auto;
        }

        input[type="number"] {
            border: 1px solid #ddd;
            width: 40px;
            text-align: center;
            color: black;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            opacity: 1;
        }

        .detail-info .title {
            font-size: 20px;
            font-weight: bold;
        }

        .detail-info .price {
            border-top: 1px solid #ddd;
        }

        .detail-info input[type="text"] {
            border: 1px solid #ddd;
            width: 40px;
            position: relative;
        }

        .detail-info .btn-num-up,
        .detail-info .btn-num-down {
            width: 13px;
            height: 9px;
            display: block;
        }

        .qty-up-down {
            position: absolute;
            margin-left: 2px;
        }

        .org-price,
        .sell-price,
        .quantity {
            margin-top: 30px;
        }

        .quantity {
            margin-bottom: 20px;
        }

        .detail-info .delivery {
            display: inline;
        }

        .detail-info .prod-text {
            color: gray;
            font-size: 13px;
            display: inline-block;
            width: 100px;
        }

        .detail-info input[type="text"] {
            cursor: default;
        }

        .detail-control .left {
            /* .btn-cart .btn-order */
            float: left;
        }

        .detail-control .right {
            float: right;
        }

        .detail-control .price .left {
            font-size: 18px;
            line-height: 45px;
        }

        .detail-control .price .right {
            font-size: 24px;
        }

        button.btn-cart,
        button.btn-order {
            width: 48%;
            height: 50px;
        }

        .btn-cart {
            background: black;
            color: white;
            border: 1px solid black;
            margin-right: 10px;
        }

        .btn-order {
            background: white;
            color: black;
            border: 1px solid black;

        }

        .prod-sel .prod-text,
        .prod-sel select {
            margin: 30px 0;
            
        }
    

        .prod-sel select {
            width: 140px;
            outline: none;
            border: 1px solid #ddd;
        }

        /* 간편선택 바구니 */
        .easy-cart>div {
            width: 100%;
        }

        .easy-text {
            width: 440px;
            height: 39px;
            background: white;
            padding: 20px 20px;
            border-bottom: 1px solid black;
            border-top: 2px solid black;
        }

        .easy-text>p {
            display: inline-block;
            margin: 0 7px;
            color: black;
            font-size: 12px;
        }

        .select-list {
            width: 440px;
            height: 51px;
            font-size: 12px;
            padding: 0 30px;
            border-bottom: 1px solid black;

        }

        .select-list>.selected-prod {
            width: 176px;
            height: 50px;
            padding: 15px 0;
            display: inline-block
        }

        .selected-qty {
            position: relative;
        }

        .selected-qty>input[type="text"] {
            width: 40px;
            height: 22px;
        }

        /* 간편선택 바구니 */

        .easy-cart {
            display: none;
            cursor: default;
        }

        .easy-cart .select-list .qty-up-down {
            padding: 15px 0;
            position: absolute;
            bottom: 16px;
        }



        .select-list .selected-qty {
            width: 100px;
            height: 50px;
            display: inline-block;
        }


        .select-list .selected-price {
            width: 70px;
            height: 50px;
            display: inline-block;
        }

        .select-list .btn-remove .fa-xmark {
            width: 13px;
            height: 13px;
            background: black;
            color: #fff;
            padding-left: 3px;
            padding-top: 1px;
        }

        .total-price {
            width: 440px;
            height: 49px;
            display: inline-block;
            padding: 15px 20px;
            background: #E9E9E9;
        }

        .total-price .sp-total-text,
        .total-price .sp-total-price {
            font-weight: 900;
            font-size: 13px;
        }

        .total-price .sp-total-text {
            margin-left: 230px;
        }

        .total-price .sp-total-price {
            margin-left: 15px;
        }



        /* 상세 설명, 이미지 부분 */

        .prod-detail {
            border-top: 2px solid black;
            margin: 50px 0;
            padding-top: 50px;
        }

        .prod-detail>img {
            min-width: 80%;
        }

        /* --------------------------------- */
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
            <div class="row">
                <div class="col-xs-6 prod-img">
                    <img src="../img/paul bassett.jpg" alt="paul bassett coffee">
                </div>
                <div class="col-xs-6">
                    <div class="detail-info">
                        <p class="title">폴 바셋 시그니처 블렌드 풀 포텐셜 1.01kg</p>
                        <p class="price">
                            <p class="org-price">
                                <span class="prod-text">정가</span> <s>45,000원</s>
                            </p>
                            <p class="sell-price">
                                <span class="prod-text">판매가</span> <strong>24,700원</strong>
                            </p>
                        </p>
                        <p class="quantity">
                            <!-- <span class="prod-text">주문수량</span><input type="number" name="" id="" value="1" min="1"><br> -->
                        </p>
                        <p class="delivery">
                            <span class="prod-text">배송비</span> <strong>3000원</strong>
                        </p>
                        <p class="prod-sel">
                            <span class="prod-text">옵션선택</span>
                            <select id="sel-option">
                                <option value="not-selected">선택</option>
                                <option value="whole-beans">원두상태</option>
                                <option value="prench">프렌치분쇄</option>
                                <option value="drip">드립분쇄</option>
                                <option value="espresso">에스프레소분쇄</option>
                            </select>

                            <!-- 간편선택 바구니 -->
                            <div id="easyCart" class="easy-cart">
                                <div class="easy-text">
                                    <i class="fa-solid fa-check"></i>
                                    <p>다른옵션도 구매하시려면 옵션을 반복하여 선택해 주세요.</p>
                                </div>
                                <div class="total-price">
                                    <span class="sp-total-text">상품 금액 합계</span> <span
                                        class="sp-total-price">00,000원</span>
                                </div>
                            </div>
                        </p>
                    </div>

                    <div class="detail-control">
                        <div class="order clearfix">
                            <button class="left btn-cart">장바구니</button>
                            <button class="left btn-order">구매하기</button>
                        </div>
                    </div><!-- end 'detail-control' -->
                </div>

                <div class="col-xs-12 prod-detail">
                    <img src="../img/paul_bassett_detail.jpg" alt="prod-detail">
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
        const $seloption = document.querySelector('#sel-option');
        const $easycart = document.querySelector('.easy-cart');

        // 옵션선택하면 easycart에 해당 옵션 띄우게~
        $seloption.addEventListener('change', e => {
            // "선택" 옵션 선택하면 암것두 안해용~
            if (e.target.value === 'not-selected')
                return;

            // 옵션들 선택하면 easycart보이게. 
            if ($easycart.style.display === '')
                $easycart.style.display = 'block';

            // 선택한 옵션 이름 가져오기.
            let optiontext = '';
            for (let $option of e.target.children) {
                if ($option.value === e.target.value) {
                    optiontext = $option.textContent;
                }
            }

            // 가져온 선택한 옵션 이름을 이용해서 판별 시작.

            // 1. 만약 선택한 옵션이 이미 easycart에 존재한다면 수량만 하나 증가시켜버리기~
            for ($list of $easycart.children) {
                // easycart내에 이미 존재하는 select-list들중
                if ($list.classList.contains('select-list')) {
                    // 옵션 이름이 선택한 옵션이름과 같은게 존재한다면 
                    if ($list.children[0].textContent === optiontext) {
                        console.log('cc');
                        $list.children[1].children[0].value = parseInt($list.children[1].children[0].value) + 1;
                        // 윗줄처럼 인위적으로 증가시키면 change이벤트가 아니기때문에 상품합계가 바뀌지않아요.
                        // 그래서 상품합계갱신하는 함수를 다시 불러요.
                        productTotalLoad($list.children[1].children[0]);
                        totalLoad()
                        // 옵션을 "선택"으로 바꿔놓아요~
                        e.target.value = 'not-selected';
                        return;
                    }
                }
            }
            //******** 이 부분은 innerHTML에 들어가는 selected-price가 나중에 상품판매게시핀DB에서 가격을 가져오기때문에 
            //******** 기능구현때 확실히 다시 손보아야해요~
            // 2. 선택한 옵션이 없으면 만들어서 easycart에 쑤셔넣어버리기~
            const $selectList = document.createElement('div');
            $selectList.classList.add('select-list');
            $selectList.innerHTML = `<span class="selected-prod">${optiontext}</span>
                                    <span class="selected-qty">
                                        <input type="number" name="" id="" value="1" min="1"><br>
                                    </span>
                                    <span class="selected-price">24,700원</span>
                                    <span class="btn-remove">
                                        <i class="fa-solid fa-xmark"></i>
                                    </span>`;
            $easycart.insertBefore($selectList, document.querySelector('.total-price'));
            e.target.value = 'not-selected';
            totalLoad()
        });



        //******** 이 부분은 innerHTML에 들어가는 selected-price가 나중에 상품판매게시핀DB에서 가격을 가져오기때문에 
        //******** 기능구현때 확실히 손보아야해요
        // easycart에 있는 수량 바꾸면 옆에 뜨는 가격이랑 합계도 다시 갱신되게~
        $easycart.addEventListener('change', e => {
            productTotalLoad(e.target);
            totalLoad();
        });
        // 수량 바뀔때 상품 합계 갱신
        function productTotalLoad($input) {
            console.log('change 이벤트 발생!');
            // type이 number input의 수량이 바뀔때만 적용시켜요~
            if (!$input.matches('.selected-qty input[type="number"]')) {
                return;
            }
            console.log('input의 type이 number임');
            $selectprice = $input.parentNode.nextElementSibling;

            let pricePerEach = 24700; //*************** 여기 우항이 페이지에 뿌려지는거 가져와야해서 EL태그로 아마 가져올거에요.
            let quantity = parseInt($input.value);
            let productPriceTotal = pricePerEach * quantity;
            // 정규표현식으로 컴마 붙여주고 원도 친절히 붙여줌.
            productPriceTotal = productPriceTotal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            productPriceTotal = productPriceTotal + '원';
            $input.parentNode.nextElementSibling.textContent = productPriceTotal;
        }

        // 최종합계 갱신
        function totalLoad() {
            const $selectedprices = document.querySelectorAll('.selected-price');
            let total = 0;
            for ($price of $selectedprices) {
                total += parseInt($price.textContent.replace(',', '').replace('원', ''));
            }
            total = total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '원';
            document.querySelector('.sp-total-price').textContent = total;
        }


        $easycart.addEventListener('click', e => {
            if (!(e.target.matches('.btn-remove') || e.target.matches('.fa-xmark')))
                return;


            if (e.target.matches('.btn-remove'))
                e.target.parentNode.remove();
            else
                e.target.parentNode.parentNode.remove();


            totalLoad();
        })
    </script>
</body>

</html>