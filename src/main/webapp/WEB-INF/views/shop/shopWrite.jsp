<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>shopDetail</title>

<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">

 <style>
        body {
            width: 100%;
        }

        section {
            display: block;
            width: 90%;
            margin: 50px auto;
            padding-left: 120px;
            min-height: 2900px;
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
            margin-left: -80px;
        }

        .prod-img {
            margin-top: 30px;
            width: 450px;
        }

        .container img {
            max-width: 600px;
            display: block;
            margin: 0 auto;
        }

        .detail-info .title {
            font-size: 20px;
            font-weight: 900;
        }

        .detail-info .price {
            border-top: 1px solid black;
        }

        .detail-info input[type="text"] {
            border: 1px solid #ddd;
            width: 40px;
            position: relative;
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
        

        .prod-sel .prod-text{
            margin: 30px 0;
        }

        /* shopwrite */
        .detail-info input[type="text"]{
            margin: 5px 5px;
            width: 100px;
        }
        .detail-info input[type="text"].title{
            width: 500px;
            height: 50px;
            text-indent: 10px;
        }

        .prod-detail {
            border-top: 2px solid black;
            margin: 50px 0;
            padding-top: 50px;
            min-height: 2000px;
        }

        .product {
            width: 600px;
        }

        .product tr td img {
            display: inline;
        }

        .product tr th,
        .product tr td {
            border-bottom: 1px solid black;
            text-align: center;
            margin-bottom: 20px;
            height: 60px;
            line-height: 60px;
            padding: 0 10px;
            font-size: 12px;
        }

        .product tr th {
            font-weight: 700;
            font-size: 14px;
        }

        .product tr td.large-cell {
            width: 150px;
        }

        .prod-img input[type="file"],
        .prod-detail input[type="file"] {
            width: 420px;
            height: 420px;
            position: absolute;
            background: transparent;
            color: transparent;
            z-index: 999;
            outline: none;

        }

        .prod-img input[type="file"]::-webkit-file-upload-button,
        .prod-detail input[type="file"]::-webkit-file-upload-button {
            display: none;
        }

        .prod-img label,
        .prod-detail label {
            width: 420px;
            height: 420px;
            border: 1px solid #ddd;
            float: right;
            z-index: 1;
            font-size: 10px;
            text-align: center;
            pointer-events: none;
            padding-top: 50px;
            font-size: 50px;
            margin-right:100px;

        }

        .prod-detail input[type="file"]{
            position: absolute;
            width: 600px;
            height: 600px;
        }
        .prod-detail #img2{
            top: 50px;
            left: 250px;
        }
        .prod-detail #img3{
            top: 700px;
            left: 250px;
        }

        .prod-detail label {
            position: absolute;
            width: 600px;
            height: 600px;
            padding-top: 200px;
        }
        .prod-detail label[for="img2"]{
            top: 50px;
            left: 250px;
        }
        .prod-detail label[for="img3"]{
            top: 700px;
            left: 250px;
        }
        .prod-detail .prod-detail-textarea{
            border: 1px solid black;
            resize: none;
            position: absolute;
            top: 1350px;
            left: 150px;
            width: 800px;
            height: 600px;
        }

        .upper-bar,
        .lower-bar {
            display: block;
            width: 100%;
            height: 70px;
            border-bottom: 2px solid white;
            background-color: black;
        }
        .lower-bar {
            position: absolute;
            width: 1100px;
            top: 2950px;
        }

        .divforright {
            width: fit-content;
            height: fit-content;
            text-align: center;
            display: block;
            float: right;
            background-color: black;
        }

        .btn-regist,
        .btn-cancel {
            width: fit-content;
            height: 50px;
            margin: 0 0 10px 10px;
            padding: 15px;
            display: inline-block;
            background-color: black;
            color:white;
            font-size: 20px;
        }
        .btn-regist,
        .btn-cancel {
            background: black;
            color: white;
            font-size: 18px;
        }

        .btn-regist:hover,
        .btn-cancel:hover {
            font-style: italic;
        }
        
        .largefont{
            font-weight: 900;
            font-size: 25px;
        }    
        
		.center{
		margin-left: -100px;
		}
        /* --------------------------------- */
    </style>

</head>

<body>

	<%@ include file="../include/header.jsp"%>

    <section>
        <div class="container">
            
            <div class="row">
                <div class="upper-bar clearfix">
                    <div class="divforright">
                        <button class="btn-cancel"> <span class="glyphicon glyphicon-remove"></span> 취소 </button>
                        <button class="btn-regist"> <span class="glyphicon glyphicon-ok"></span> 상품 등록완료</button>
                    </div>
                </div>
                <div class="col-xs-6 prod-img">

                    <label for="img">클릭하거나<br>드래그 드롭하여<br>이미지를<br>업로드하세요</label>
                    <input type="file" name="" class="img" id="img">

                </div>
                <div class="col-xs-6">
                    <div class="detail-info">
                        <p class="largefont">
                            판매 게시글 제목 입력<br>
                            <input type="text" class="title">
                        </p>
                        <p class="price">
                            <p class="org-price">
                                <span class="prod-text">정가</span> <span>0</span>원
                            </p>
                            <p class="sell-price">
                                <span class="prod-text">판매가</span> <strong><span>0</span>원</strong>
                            </p>
                        </p>
                        <p class="quantity">
                            <!-- <span class="prod-text">주문수량</span><input type="number" name="" id="" value="1" min="1"><br> -->
                        </p>
                        <p class="delivery">
                            <span class="prod-text">배송비</span> <strong>3000원</strong>
                        </p>
                        <p class="prod-sel">
                            <span class="prod-text">판매할 상품 목록</span>

                            <table class="product">
                                <thead>
                                    <tr>
                                        <th>이미지</th>
                                        <th>카테고리</th>
                                        <th>상품번호</th>
                                        <th class="large-cell">상품명</th>
                                        <th>정상가</th>
                                        <th>판매가</th>
                                        <th>재고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><img src="../img/blog1.png" alt="상품이미지" style="width: 50px; height: 50px;">
                                        </td>
                                        <td>카테고리1</td>
                                        <td>상품번호1</td>
                                        <td class="large-cell">상품명1</td>
                                        <td>정상가1</td>
                                        <td>판매가1</td>
                                        <td>재고1</td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="productList">

                            </div>

                        </p>
                    </div>

                    <p class="largefont center" style="margin-top: 100px;">판매 게시글 내용 입력</p>
                </div>

                <div class="col-xs-12 prod-detail">
                    <label for="img2">클릭하거나<br>드래그 드롭하여<br>이미지를<br>업로드하세요</label>
                    <input type="file" name="" class="img" id="img2">
                    <label for="img3">클릭하거나<br>드래그 드롭하여<br>이미지를<br>업로드하세요</label>
                    <input type="file" name="" class="img" id="img3">

                    <textarea name="" id="" class="prod-detail-textarea"></textarea>

                </div>
                <div class="lower-bar clearfix">
                    <div class="divforright">
                        <button class="btn-cancel"> <span class="glyphicon glyphicon-remove"></span> 취소 </button>
                        <button class="btn-regist"> <span class="glyphicon glyphicon-ok"></span> 상품 등록완료</button>
                    </div>
                </div>
            </div>
        </div>

        

    </section>


	<%@ include file="../include/footer.jsp" %>

	<script>
        // 이미지 파일 업로드시 이미지 파일 띄우게끔

        const $container = document.querySelector('.container');
        $container.addEventListener('change', e => {
            if (!e.target.matches('.img')) {
                return;
            }
            readURL(e.target);
        });

        function readURL(input) {
            var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
            //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
            reader.readAsDataURL(input.files[0]);
            console.log()

            let id = input.getAttribute('id');
            // FileReader 객체가 생성되서 동작을 한다면,
            reader.onload = function (event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                if (id === 'img') {
                    $('label[for="' + id + '"]').html('<img id="fileImg' + id + '" src="' + event.target.result +
                        '" alt="upload" style="width:420px; height:420px;"/>');
                    $('#fileImg' + id).css('margin-top', '0px');
                    $('label[for="' + id + '"').css('padding', '0px');
                } else {
                    $('label[for="' + id + '"]').html('<img id="fileImg' + id + '" src="' + event.target.result +
                        '" alt="upload" style="width:600px; height:600px;"/>');
                    $('#fileImg' + id).css('margin-top', '0px');
                    $('label[for="' + id + '"').css('padding', '0px');
                }

            }
        }
    </script>
</body>

</html>