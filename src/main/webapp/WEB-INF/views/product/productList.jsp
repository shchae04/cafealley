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

*,
*:focus,{
outline:none;
}




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
.table > thead > tr > td,
.table > tbody > tr > td, 
.table > tfoot > tr > td{
	border-top: none !important;
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

.cart-table tr td .chk-shop-regist{
	margin-top: 45px;
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

.select-category,
.btn-regist,
.btn-shop-regist {
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

.btn-regist,
.btn-shop-regist {
	background: black;
	color: white;
	font-size: 18px;
}

.btn-regist:hover,
.btn-shop-regist:hover {
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
.prod-info a{
	font-weight: 700;
}
.prod-info a:hover{
	font-style: italic;
	font-weight: bolder;
}
.prod-info a:focus{
	color:black;
}
.prod-detail{
	width: 100%;
}
.prod-detail>textarea{
	resize: none;
	width: 1000px;
	height: 250px;
	border: 1px solid #ddd;
	
	padding: 15px;
}
.disnone{
	display:none;
}
tbody> tr> td> .topmargin{
	margin-top:45px;
	height: 25px;
}
tbody> tr> td> input{
	max-width: 70px;
	text-align: center;
	border: 1px solid #ddd;
}
tbody> tr> td> select{
	border: 1px solid #ddd;
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
				게시글부터 삭제해주셔야 합니다.<br>
				<strong style="color: red;">*</strong> 상품 판매글에 등록할 수 있는 최대 상품수는 4개입니다.
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
						<button class="btn-shop-regist">선택상품 판매글에 등록하기</button>
						<div class="divforright">
							<form action="#">
								<input type="text" placeholder="상품명 검색">
								<button class="btn-search" type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</form>
							<button class="btn-regist" onclick="location.href='${pageContext.request.contextPath}/product/productWrite'">상품 등록하기</button>
						</div>
					</div>


					<table class="table w-auto text-center align-middle cart-table" id="proContent">
						<thead>				
							<tr>
								<td>선택</td>
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
								let krprocat;
								switch(productList[i].procategory){
								case 'beans':
									krprocat = '원두';
									break;
								case 'tea' :
									krprocat = '티/액상차';
									break;
								case 'milk' :
									krprocat = '유제품';
									break;
								case 'syrup' :
									krprocat = '시럽/소스';
									break;
								case 'powder' :
									krprocat = '파우더/농축액';
									break;
								case 'coffeemachine' :
									krprocat = '커피용품, 머신'
									break;
								}
								
								str+="<tr id='form"+ productList[i].prono +"'>";
								str+="<td>";
								str+="<input type='checkbox' class='chk-shop-regist' id='"+ productList[i].prono +"'/>";
								str+="</td>";
								str+="<td class='prod-category' id='cat" + productList[i].prono + "''>";
								str+="<p>" + krprocat + "</p>";
								str+="</td>";
								str+="<td class='prod-img'><img src='${pageContext.request.contextPath}/loadimg/display/"+ productList[i].filenum+ "/1'";
								str+="alt='상품이미지'" + " width='100px'" + " height='100px'"+ "></td>";
								str+="<td class='prod-number'>";
								str+="<p>"+productList[i].prono+"</p>";
								str+="</td>";
								str+="<td class='prod-info' id='info"+ productList[i].prono + "'>";
								str+="<p><a href='"+productList[i].prono+"'>"+productList[i].proname+"</a></p>";
								str+="</td>";
								str+="<td class='prod-qty' id='stock" + productList[i].prono + "'>";
								str+="<p>"+productList[i].prostock+"</p>";
								str+="</td>";
								str+="<td class='prod-normal-price' id='np"+productList[i].prono + "'>";
								str+="<p>"+productList[i].proprice+"</p>";
								str+="</td>";
								str+="<td class='prod-discount-price' id='sp"+productList[i].prono + "'>";
								str+="<p>"+productList[i].prosellprice+"</p>";
								str+="</td>";
								str+="<td class=link-inner>";
								str+="<p style='width: fit-content; height: fit-content;'>";
								str+="<span class='glyphicon glyphicon-erase btn-modify' href='"+productList[i].prono+"'>수정</span>";
								str+="</p>";
								str+="<p style='width: fit-content; height: fit-content;'>";
								str+="<span class='glyphicon glyphicon-remove btn-remove' href='"+productList[i].prono + "'>삭제</span>";
								str+="</p>";
								str+="</td>";
								str+="</tr>";
								str+="<tr id='detail" + productList[i].prono + "' class='disnone'>";
								str+="<td class='prod-detail' colspan='9'>";
								str+= "<textarea id='txt"+productList[i].prono + "' disabled>";
								str+= productList[i].prodetail ;
								str+= "</textarea>"
								str+="</td>";
								str+="</tr>";
								
								$('tbody').html(str);
							}
	        			}// end getJSON function
				); // end get JSON
        	}// end getList()
        	
        	
        	
        	
        	
        	// 상품 등록
        	$('.btn-shop-regist').on('click', function(e){
        		let str =''; // 체크된거 url의 매개변수로 담아주기위해 저장.
        		let count = 0;
        		for(let checkbox of $('.chk-shop-regist')){
        			console.log(checkbox);
        			
	        		if(checkbox.checked){
	        			count = count + 1;
	        			let namecheck = (count==1? "":count); // 1은 db에 숫자가 기입되어있지 않아서.. 매개변수에 안붙여야함.
	        			let ampersand = (count==1? "":"&");
	        			str+= ampersand + "prono"+ namecheck  + "=" + checkbox.getAttribute('id');
	        		}
	        	}
        		if(count==0){ // 선택된거 하나도 없으면
        			alert('판매게시글로 등록할 상품을 하나 이상 선택해주세요.');
        			return;
        		}
        		if(count>4){ // 선택된거 4개 넘으면 거름
        			alert('판매게시글로 등록할 상품은 4개 이하로만 등록할 수 있습니다.');
        			return;
        		}
        		
        		// 남은 url 완성시키기.
        		// 선택된게 2개라 하더라도 url을 넘겨줄때 prono3, prono4는 0으로 기입해줘야한다.
        		for(let num = count+1; num<=4; num++){
        			str+= "&prono"+ num + "=" + 0;
        		}
        		
        		location.href="${pageContext.request.contextPath}/shop/shopWrite?" + str;
        		
        	});
        	
        	

        	// 상품이름 클릭시 상품의 detail 보여주기 
        	$('tbody').on('click', '.prod-info > p > a', function(e){
        		e.preventDefault();
        		const prono = $(this).attr('href');
        		$('#detail'+prono).toggleClass('disnone');
        	});
        	
        	
        	
        	
        	
        	// 수정버튼 누르면 
        	$('tbody').on('click', '.link-inner p >.btn-modify', function(e) {
        		e.preventDefault();
        		const prono = $(this).attr('href');
        		
        		
        		//input으로 모두 바꿔주는 처리 
        		if(! $('#form'+prono).hasClass('form-enabled') ){	        		
	        		let catvalue = $('#cat'+prono).children().first().text();
	        		$('#cat'+prono).html(`<select name="procategory" id="category" class="topmargin">
							<option value="non-selected">-</option>
							<option value="beans">원두</option>
							<option value="tea">티/액상차</option>
							<option value="milk">유제품</option>
							<option value="syrup">시럽/소스</option>
							<option value="powder">파우더/농축액</option>
							<option value="coffeemachine">커피용품, 머신</option>`);
	        		console.log(catvalue);
	        		for(let el of $('#cat'+prono).children().get(0)){
	        			if(el.textContent === catvalue)
	        				el.setAttribute('selected', 'true');
	        		}
	        		 
	        		
	        		
	        		let infovalue = $('#info'+prono).children().first().children().first().text();
	        		let stockvalue = $('#stock'+prono).children().first().text();
	        		let npvalue = $('#np'+prono).children().first().text();
	        		let spvalue = $('#sp'+prono).children().first().text();
	        		
	        		$('#info'+prono).html(`<input type="text" class="topmargin" name="proname" value=`+infovalue +`>`);
	        		$('#stock'+prono).html(`<input type="number" class="topmargin" name="prostock"
					min="1" max="99999" value=`+stockvalue +`>`);
	        		$('#np'+prono).html(`<input name="proprice" class="topmargin" type="text"
					onkeyup="regex(this)" value=`+ npvalue +`> 원`);
	        		$('#sp'+prono).html(`<input name="prosellprice" class="topmargin" type="text"
							onkeyup="regex(this)" value=`+ spvalue +`>원`);
	        		
	        		// textarea지금 안펼쳐진 상태면 펼쳐주기
	        		if($('#detail'+prono).hasClass('disnone')){
	        			$('#detail'+prono).toggleClass('disnone');
	        		}
	        		$('#txt'+prono).prop("disabled", false);
					e.target.textContent = '수정완료';
					e.target.classList.remove('glyphicon-erase');
					e.target.classList.add('glyphicon-ok');
					
					$('#form'+prono).toggleClass('form-enabled')
        		}else{
        			let proname = $('#info'+prono).children().first().val();
        			let proprice = $('#np'+prono).children().first().val();
        			let prosellprice = $('#sp'+prono).children().first().val();
        			let procategory = $('#cat'+prono).children().first().val();
        			let prodetail = $('#txt'+prono).val();
        			let prostock = $('#stock'+prono).children().first().val();
        			
        			$.ajax({
        				type: "post",
        				url: "<c:url value='/product/productModify' />",
        				data : JSON.stringify({
        					'prono' : prono,
        					'proname' : proname,
        					'proprice' : proprice,
        					'prosellprice' : prosellprice,
        					'procategory' : procategory,
        					'prodetail' : prodetail,
      						'prostock' : prostock	
        				}),
        				contentType: 'application/json',
        				success: function(result) {
        					if(result === 'modSuccess') {
        						alert('상품이 정상적으로 수정되었습니다.');
        						getList(true); //삭제가 반영된 글 목록을 새롭게 보여줘야 하기 때문에 str을 초기화. 
        						//자동으로 목록으로 가지는 않음,
        					}
        				},
        				error: function() {
        					alert('수정에 실패했습니다. 다시 시도하세요.');
        				}
        			});
        		}
        		
        	});
	
        	
            //삭제 처리
    		$('tbody').on('click', '.link-inner p >.btn-remove', function(e) {
    			e.preventDefault();
    			const prono = $(this).attr('href');
    			
    			$.ajax({
    				type: "post",
    				url: "<c:url value='/product/productDelete' />",
    				data: prono,
    				contentType: 'application/json',
    				success: function(result) {
    					if(result === 'delSuccess') {
    						alert('상품이 정상적으로 삭제되었습니다.');
    						getList(true); //삭제가 반영된 글 목록을 새롭게 보여줘야 하기 때문에 str을 초기화. 
    						//자동으로 목록으로 가지는 않음,
    					}
    				},
    				error: function() {
    					alert('삭제에 실패했습니다. 다시 시도하세요.');
    				}
    			});
    		});
            
        });
     	// 숫자 정규식
        function regex(input){
            input.value = input.value.replace(/[^0-9]{1,10}/g,"");
            if(parseInt(input.value)>999999999){
                input.value="";
            }
        }
        
        //상품등록하기 페이지이동.
        $('.btn-all-order').click(function(){
        	location.href= "<c:url value='/product/productWrite'/>";
        });

        
        
        

    </script>


</body>

</html>