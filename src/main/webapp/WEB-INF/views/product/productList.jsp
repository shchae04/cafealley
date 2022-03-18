<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cafe Alley | 관리자페이지(상품 목록)</title>
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

.divforright form {
	display: inline-block;
}

.divforright input[type="text"] {
	height: 25px;
	outline: none;
}

.divforright input[type="text"]::placeholder {
	color: black;
	text-align: center;
}

.divforright input[type="text"]:focus .divforright>input[type="text"]::placeholder
	{
	display: none;
}

.divforright .btn-search {
	width: 25px;
	height: 25px;
	background-color: black;
	color: white;
}

.glyphicon-search {
	transition: all 0.5s linear;
}

.divforright .btn-search:hover .glyphicon-search {
	transform: scale(1.2);
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

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	opacity: 1;
}

.prod-number, .prod-price {
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

tfoot tr td {
	border-top: none;
}

.cart-table .btn-direct-order .btn-remove {
	margin: 7px;
}

.btn-remove, .btn-modify {
	display: block;
	padding: 5px;
	cursor: pointer;
}

.btn-remove:hover, .btn-modify:hover {
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

.select-category, .btn-all-order {
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

.all-select, input[type="checkbox"] {
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

	<%@ include file="../include/header.jsp"%>

	<section>
		<div class="container">
			<p class="page-title">상품 관리</p>
			<p class="page-desc">
				<strong style="color: red;">*</strong> 상품을 삭제하시려면 상품페이지에 등록되어있는 판매
				게시글부터 삭제해주셔야 합니다.
			</p>
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
								<input type="text" placeholder="상품명 검색">
								<button class="btn-search" type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
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
								<td class="prod-img"><img src="<c:url value='/img/paul bassett.jpg'/>"
									alt="" width="100px" height="100px"></td>
								<td class="prod-number">
									<p>1</p>
								</td>
								<td class="prod-info">
									<p>폴 바셋 시그니처 블렌드 풀 포텐셜</p>
									<p>(에스프레소 분쇄)</p> <!--  이 부분은 우리가 옵션컬럼이 없으니, 작성페이지에서 옵션이 있으면 어떤 옵션인지 상품명에 함께 () 내에 적으라고 할 것임. 
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
									<p class="btn-modify">
										수정<span class="glyphicon glyphicon-erase"></span>
									</p>
									<p class="btn-remove">
										삭제<span class="glyphicon glyphicon-remove"> </span>
									</p>
								</td>
							</tr>
							<tr>
								<td class="prod-category">
									<p>원두</p>
								</td>
								<td class="prod-img"><img src="<c:url value='/img/paul bassett.jpg'/>"
									alt="" width="100px" height="100px"></td>
								<td class="prod-number">
									<p>1</p>
								</td>
								<td class="prod-info">
									<p>폴 바셋 시그니처 블렌드 풀 포텐셜</p>
									<p>(에스프레소 분쇄)</p> <!--  이 부분은 우리가 옵션컬럼이 없으니, 작성페이지에서 옵션이 있으면 어떤 옵션인지 상품명에 함께 () 내에 적으라고 할 것임. 
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
									<p class="btn-modify">
										수정<span class="glyphicon glyphicon-erase"></span>
									</p>
									<p class="btn-remove">
										삭제<span class="glyphicon glyphicon-remove"> </span>
									</p>
								</td>
							</tr>
							<tr>
								<td class="prod-category">
									<p>원두</p>
								</td>
								<td class="prod-img"><img src="<c:url value='/img/paul bassett.jpg'/>"
									alt="" width="100px" height="100px"></td>
								<td class="prod-number">
									<p>1</p>
								</td>
								<td class="prod-info">
									<p>폴 바셋 시그니처 블렌드 풀 포텐셜</p>
									<p>(에스프레소 분쇄)</p> <!--  이 부분은 우리가 옵션컬럼이 없으니, 작성페이지에서 옵션이 있으면 어떤 옵션인지 상품명에 함께 () 내에 적으라고 할 것임. 
                                                                  사실 관리자가 적는 것이니 트롤링하지 않는다는 전제로 어떤 로직을 짜서 강제하지는 않을 것.
                                                                  그럼 이 페이지에서 가져올 때는 나중에 JS로직으로 만약 상품명 가져와서 안에 괄호 있는지 확인 들어감. 있으면 이 p태그에 띄우는 것. -->
								</td>
								<td class="prod-qty">
								<!--추가  -->
									<p>52</p>
								</td>
								<td class="prod-normal-price">
									<p>27,000원</p>
								</td>
								<td class="prod-discount-price">
									<p>15,902원</p>
								</td>
								<td>
									<p class="btn-modify">
										수정<span class="glyphicon glyphicon-erase"></span>
									</p>
									<p class="btn-remove">
										삭제<span class="glyphicon glyphicon-remove"> </span>
									</p>
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
    </script>


</body>

</html>