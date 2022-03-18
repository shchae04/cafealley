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

.cart-table>tbody>tr>td>img{
	margin-top: 20px;
}


.cart-table>tbody>tr>td>p {
	display: block;
	padding: 5px;
	margin-top: 50px;
	padding: 5px;
	width: auto;
	height: 20px;
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

.cart-table>thead>tr>td, 
.cart-table>tbody>tr>td, 
.cart-table>tfoot>tr>td
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

.cart-table tr {
	border-top: 1px solid #ddd;
	
}

tfoot tr td {
	border-top: none;
}


.cart-table tr td p > .btn-remove,
.cart-table tr td p > .btn-modify {
	display: block;
	cursor: pointer;
	margin-left: 70px;
}
.cart-table>tbody>tr>td:last-child>p:first-child{
	margin-top: 40px;
}
.cart-table>tbody>tr>td:last-child>p:last-child{
	margin-top: 0;
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
								<li><a href="<c:url value='product/productList'/>">전체</a></li>
								<li><a href="<c:url value='product/productList/beans'/>">원두</a></li>
								<li><a href="<c:url value='product/productList/tea'/>">티/액상차</a></li>
								<li><a href="<c:url value='product/productList/milk'/>">유제품</a></li>
								<li><a href="<c:url value='product/productList/syrup'/>">시럽/소스</a></li>
								<li><a href="<c:url value='product/productList/powder'/>">파우더/농축액</a></li>
								<li><a href="<c:url value='product/productList/coffeemachine'/>">커피용품, 머신</a></li>
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

        
        $(function(){
            let str = '';
            // let page = 1; 나중에 페이지 적용되면..
            getList(true);

        	// 목록을 불러오는 함수
        	function getList(reset){
        		if(reset===true){
        			str='';
        		}
        	
	        	$.getJSON(
	        			'<c:url value="/product/getList"/>',
	        			function(productList){
	        				console.log(productList);
							for(let i=0; i<productList.length; i++){
								str+="<tr>";
								str+="<td class='+ prod-category'>";
								str+="<p>" + productList[i].procategory + "</p>";
								str+="</td>";
								str+="<td class='prod-img'><img src='/cafealley/loadimg/display/"+ productList[i].filenum+ "/1'";
								str+="alt='상품이미지'" + " width='100px'" + " height='100px'"+ "></td>";
								str+="<td class='prod-number'>";
								str+="<p>"+productList[i].prono+"</p>";
								str+="</td>";
								str+="<td class='prod-info'>";
								str+="<p>"+productList[i].proname+"</p>";
								str+="</td>";
								str+="<td class='prod-qty'>";
								str+="<p>"+productList[i].prostock+"</p>";
								str+="</td>";
								str+="<td class='prod-normal-price'>";
								str+="<p>"+productList[i].proprice+"</p>";
								str+="</td>";
								str+="<td class='prod-discount-price'>";
								str+="<p>"+productList[i].prosellprice+"</p>";
								str+="</td>";
								str+="<td>";
								str+="<p style='width: fit-content; height: fit-content;'>";
								str+="<span class='glyphicon glyphicon-erase btn-modify' id='"+productList[i].prono+"'>수정</span>";
								str+="</p>";
								str+="<p style='width: fit-content; height: fit-content;'>";
								str+="<span class='glyphicon glyphicon-remove btn-remove' id='"+productList[i].prono + "'>삭제</span>";
								str+="</p>";
								str+="</td>";
								str+="</tr>";
								
								$('tbody').html(str);
							}
	        			}// end function
				); // end get JSON
        	}
        	
        });
        
        

    </script>


</body>

</html>