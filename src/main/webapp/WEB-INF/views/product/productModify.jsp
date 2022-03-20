<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cafe Alley | 관리자페이지(상품 등록)</title>

<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">

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

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
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

.cart-table>thead>tr>td, .cart-table>tbody>tr>td, .cart-table>tfoot>tr>td
	{
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

.prod-normal-price>input, .prod-discount-price>input {
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
</style>
</head>

<body>

	<%@ include file="../include/header.jsp"%>

	<section>
	<form action="productModi" method="post" enctype="mulitpart/form-data">
		<div class="container">
			<p class="page-title">상품 수정</p>
			<p class="page-desc">
				<strong style="color: red;">*</strong> 상품 카테고리를 먼저 선택해주세요.
			</p>
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
								<td class="prod-category"><select name="procategory" id="category">
										<option value="non-selected">-</option>
										<option value="beans">원두</option>
										<option value="tea">티/액상차</option>
										<option value="milk">유제품</option>
										<option value="syrup">시럽/소스</option>
										<option value="powder">파우더/농축액</option>
										<option value="coffemachine">커피용품, 머신</option>
								</select></td>
								<td class="prod-img"><label for="img">클릭하거나<br>드래그
										드롭하여<br>이미지를<br>업로드하세요
								</label> <input type="file" name="filename" id="img" disabled></td>
								<td class="prod-info">옵션 존재시 상품명과 함께 괄호내에 옵션명 기재<br>
									ex) 상품명(옵션명)<br> <input type="text" name="proname" placeholder=""
									disabled>
								</td>
								<td class="prod-qty numeric"><input type="number" name="prostock"
									min="1" max="99999" disabled></td>
								<td class="prod-normal-price numeric"><input type="text" name="proprice"
									onkeyup="regex(this)" disabled> 원</td>
								<td class="prod-discount-price numeric"><input type="text" name="prosellprice"
									onkeyup="regex(this)" disabled>원</td>
							</tr>
							<tr>
								<td class="prod-desc" colspan="7">
									<p>상품 상세설명</p> <textarea name="prodetail" id="" disabled></textarea>
								</td>
							</tr>

						</tbody>

						<tfoot>

						</tfoot>
					</table>
					<br>
					<div class="lower-bar clearfix">
						<div class="divforright">
							<button class="btn-all-order">
								<span class="glyphicon glyphicon-ok"></span> 상품 수정완료
							</button>
						</div>
					</div>

				</div>
			</div>

		</div>


	</form>
	</section>

	<%@ include file="../include/footer.jsp" %>


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