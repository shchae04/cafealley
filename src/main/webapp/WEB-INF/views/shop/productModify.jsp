<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cafe Alley | 관리자페이지(상품 등록)</title>
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
            text-align: left;
        }

        .row {
            display: block;
            width: 100%;
            margin: 30px auto;
            padding-left: 85px;
        }

        .lower-bar {
            display: block;
            width: 100%;
            height: 70px;
            border-bottom: 2px solid white;
        }

        .divforright {
            width: fit-content;
            height: fit-content;
            text-align: center;
            display: block;
            float: right;
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

        body>section>div>div>div>table>tbody>tr:nth-child(1)>td.prod-info {
            padding-bottom: 50px;
        }

        input {
            border: 1px solid #ddd;
        }

        .prod-info input {
            height: 25px;
            width: 100%;
            margin-top: 10px;
        }

        .prod-info input::placeholder {
            text-align: center;
        }


        .prod-price {
            padding-top: 30px;
        }

        .prod-category {
            font-weight: 700;
        }

        .prod-category select {
            border: 1px solid #ddd;
        }

        .prod-qty input[type="number"] {
            width: 70px;
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

        .cart-table tbody .prod-qty .btn-qty-update {
            width: 80px;
        }

        .prod-normal-price>input,
        .prod-discount-price>input {
            width: 100px;
            text-align: right;
        }

        .btn-all-order {
            width: fit-content;
            height: 50px;
            margin: 0 0 10px 10px;
            padding: 15px;
            display: inline-block;
        }

        .prod-desc>p {
            font-size: 14px;
            font-weight: 700;
        }

        .prod-desc>textarea {
            width: 100%;
            resize: none;
            border: 1px solid #ddd;
            height: 500px;
        }

        .btn-all-order {
            background: black;
            color: white;
            font-size: 18px;
        }

        .btn-all-order:hover {
            font-style: italic;
        }

        /*  */

        .prod-img input[type="file"] {
            width: 100px;
            height: 100px;
            margin-right: -20px;
            background: transparent;
            color: transparent;
            z-index: 999;

        }

        .prod-img input[type="file"]::-webkit-file-upload-button {
            display: none;
        }

        .prod-img label {
            width: 100px;
            height: 100px;
            float: right;
            margin-left: -100px;
            z-index: 1;
            font-size: 10px;
            text-align: center;
            pointer-events: none;
            padding-top: 20px;
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
            <p class="page-title">상품 수정</p>
            <p class="page-desc"><strong style="color:red;">*</strong> 상품 카테고리를 먼저 선택해주세요.</p>
            <div class="row">
                <div class="col-xs-12 cart-list clearfix">
                    <table class="table w-auto text-center align-middle cart-table">
                        <thead>
                            <tr>
                                <td>상품 카테고리</td>
                                <td>상품 이미지</td>
                                <td>상품명</td>
                                <td>재고</td>
                                <td>상품정상가격</td>
                                <td>상품판매가격</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="prod-category">
                                    <select name="" id="category">
                                        <option value="non-selected">-</option>
                                        <option value="">원두</option>
                                        <option value="">티/액상차</option>
                                        <option value="">유제품</option>
                                        <option value="">시럽/소스</option>
                                        <option value="">파우더/농축액</option>
                                        <option value="">커피용품, 머신</option>
                                    </select>
                                </td>
                                <td class="prod-img">
                                    <label for="img">클릭하거나<br>드래그 드롭하여<br>이미지를<br>업로드하세요</label>
                                    <input type="file" name="" id="img" disabled>
                                </td>
                                <td class="prod-info">
                                    옵션 존재시 상품명과 함께 괄호내에 옵션명 기재<br>
                                    ex) 상품명(옵션명)<br>
                                    <input type="text" name="" placeholder="" disabled>
                                </td>
                                <td class="prod-qty numeric">
                                    <input type="number" name="" min="1" max="99999" disabled>
                                </td>
                                <td class="prod-normal-price numeric" >
                                    <input type="text" onkeyup="regex(this)" disabled> 원
                                </td>
                                <td class="prod-discount-price numeric" >
                                    <input type="text" onkeyup="regex(this)" disabled>원
                                </td>
                            </tr>
                            <tr>
                                <td class="prod-desc" colspan="7">
                                    <p>상품 상세설명</p>
                                    <textarea name="" id="" disabled></textarea>
                                </td>
                            </tr>

                        </tbody>

                        <tfoot>

                        </tfoot>
                    </table>
                    <br>
                    <div class="lower-bar clearfix">
                        <div class="divforright">
                            <button class="btn-all-order"> <span class="glyphicon glyphicon-ok"></span> 상품 수정완료</button>
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

        const $tableinputs = document.querySelectorAll('.table input'); // 테이블 내의 인풋
        const $tabletextarea = document.querySelector('.table textarea'); // 테이블 내의 텍스트에리어

        // 카테고리 선택해야 diabled 풀리게끔하기.
        $table.addEventListener('change', e => {
            if (!e.target.matches('#category')) {
                return;
            }
            if (e.target.value === 'non-selected') {
                for (let $input of $tableinputs) {
                    $input.setAttribute('disabled', true);
                }
                $tabletextarea.setAttribute('disabled', true);
            } else {
                for (let $input of $tableinputs) {
                    $input.removeAttribute('disabled');
                }
                $tabletextarea.removeAttribute('disabled');
            }
        });

        // 유효성검사
        const $confirmbtn = document.querySelector('.btn-all-order');
        $confirmbtn.addEventListener('click', e => {
            // 카테고리 미선택시 돌려보냄
            if (document.querySelector('#category').value === 'non-selected') {
                alert('카테고리를 선택해주세요.');
                return;
            }
                                
            // 인풋 하나라도 입력안하면 돌려보냄
            for (let $input of $tableinputs) {
                if ($input.value.trim() === '') {
                    alert('모든 입력에대해 기재해주세요.');
                    return;
                }
            }
            if ($tabletextarea.value.trim() === '') {
                alert('모든 입력에대해 기재해주세요.');
                return;
            }
        });
        function regex(input){
            input.value = input.value.replace(/[^0-9]{1,10}/g,"");
            if(parseInt(input.value)>999999999){
                input.value="";
            }
        }


        // 이미지 파일 업로드시 이미지 파일 띄우게끔
        const $imgfile = document.querySelector('#img');
        $imgfile.addEventListener('change', e=>{
            readURL(e.target);
        });
        
        function readURL(input){
            var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
                //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
                reader.readAsDataURL(input.files[0]);
                console.log()
                // fileDiv내의 img태그 아이디 가져오기
                // FileReader 객체가 생성되서 동작을 한다면,
                reader.onload = function (event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                    // 위에서 얻어온 img태그 아이디를 통해 img src 바꿔줌.
                    $('label[for="img"]').html('<img id="fileImg" src="'+ event.target.result + '" alt="upload" style="width:100px; height:100px;"/>');
                    $('#fileImg').css('margin-top', '-20px');
                }
        }





    </script>


</body>

</html>