<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cafe Alley | 장바구니</title>

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

.row {
	display: block;
	width: 100%;
	margin: 30px auto;
	padding-left: 85px;
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
}

.cart-table>tbody>tr>td>p {
	margin: 0;
}

input[type="number"] {
	border: 1px solid #ddd;
	width: 50px;
	text-align: center;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	opacity: 1;
}

.prod-checkbox>input, .prod-number, .prod-price {
	padding-top: 30px;
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
.cart-list .cart-table>thead>tr>td{
	line-height: 15px;
	font-size: 1.2em;
}
.cart-list .cart-table>thead>tr>td:first-child{
	line-height: 28px;
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

.cart-table .btn-direct-order .btn-remove {
	margin: 7px;
}

.btn-remove {
	cursor: pointer;
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

.btn-keepShopping, .btn-sel-order, .btn-all-order {
	width: 180px;
	height: 50px;
	margin: 0 0 10px 10px;
	padding: 15px;
	float: right;
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

.btn-sel-remove {
	float: left;
	width: 150px;
	padding: 0 10px;
	margin: 10px 10px 0;
	background: black;
	color: white;
	font-size: 15px;
}

.btn-sel-remove:hover {
	font-style: italic;
}

.all-select, input[type="checkbox"] {
	margin: -30px 0 0 20px;
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
			<div class="row">
				<div class="col-xs-12 cart-list clearfix">
					<table class="table w-auto text-center align-middle cart-table">
						<thead>
							<tr>
								<td><span class="all-select-text">전체선택</span><br> <input
									type="checkbox" class="all-select"></td>
								<td><br>상품번호</td>
								<td><br>상품명</td>
								<td><br>수량</td>
								<td><br>상품가격</td>
								<td></td>
							</tr>
						</thead>
						<tbody>

						</tbody>
						<tfoot>
							<tr>
								<td colspan="6">
									<p>
										상품 합계금액 <strong id="product-total-price">47700</strong>원 + 배송비
										<strong>3,000</strong>원 = 총 합계 <strong id="total-price">47700</strong>원
									</p>
								</td>
							</tr>
						</tfoot>
					</table>
					<br>
					<button class="btn-sel-remove">선택상품삭제</button>
					<button class="btn-all-order">전체상품 주문하기</button>
					<button class="btn-sel-order">선택상품 주문하기</button>
					<button class="btn-keepShopping" onclick="location.href='<c:url value="/shop/shopList"/>'">계속쇼핑하기</button>
				</div>
			</div>

		</div>



	</section>


	<%@ include file="../include/footer.jsp" %>

	<script>    
        
        $(function(){

        	let str = '';	
        	getList(true); 
        	function getList(reset){
	        	if(reset === true){
	        		str = '';
	        	}
	        	$.getJSON(
        			'<c:url value="/cart/getList/0"/>',
        			function(cartList){
        				for(let i = 0; i<cartList.length; i++){
        					
        					totalpricewon = cartList[i].carttotalprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
        					
        					priceperitem = cartList[i].carttotalprice / cartList[i].cartamount;
        					
	        				str+='<tr>';
	        				str+='<td class="prod-checkbox"><input id="chk'+ cartList[i].cartno + '" type="checkbox"></td>';
	        				str+='<td class="prod-number">';
	        				str+='<p>'+cartList[i].prono + '</p>';
	        				str+='</td>';
	        				str+='<td class="prod-info">';
	        				str+='<p>'+cartList[i].proname + '</p>';
	        				str+='</td>';
	        				str+='<td class="prod-qty"><input type="number" name="" id="a'+cartList[i].cartno+'" value="'+ cartList[i].cartamount + '" min="1"><br></td>';
	        				str+='<td class="prod-price">';
	        				str+='<p class=' + priceperitem + ' id="b'+ cartList[i].cartno +'"" >'+ totalpricewon +'</p>';
	        				str+='</td>';
	        				str+='<td>';
	        				str+='<p class="btn-remove" id="rm'+ cartList[i].cartno +'">';
	        				str+='삭제<span class="glyphicon glyphicon-remove"> </span>';
	        				str+='</p>';
	        				str+='</td>';
	        				str+='</tr>';
        				}// end for
						$('tbody').html(str);
						isTbodyEmpty();
						priceload();
        			}// end function(cartList)
				);// end getJSON
        	}// end getList
        	
        	function isTbodyEmpty(){
        		if($('tbody').html() === ''){
        			$('tbody').html(`<tr><td colspan='9'><p style='font-weight: 700; textalign: center; font-size:25px;'> 해당하는 결과가<br> 없습니다.</p></td></tr>`);
        		}
        	}
        	

        	function priceload(){
                let productTotalPrice = 0;
                let totalPrice = 0;
				
                const inputnums = document.querySelectorAll('input[type="number"]');
                const productprices = document.querySelectorAll('.prod-price>p');
                console.log(inputnums);
                console.log(productprices);
                for (let i = 0; i < productprices.length; i++) {
                    productTotalPrice += parseInt(productprices[i].innerHTML.replace('원', '').replaceAll(',',''));
                }
                totalPrice = productTotalPrice + 3000;
                document.querySelector('#product-total-price').innerHTML = productTotalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                document.querySelector('#total-price').innerHTML = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") ;
        	}
        	
        	$('.table').on('change', 'input[type="number"]' ,function(e){
        		let cartno = e.target.getAttribute('id').replace('a','');
                let cartamount = e.target.value;
                let carttotalprice = $('#b'+cartno).attr('class') * parseInt(cartamount);
                console.log(carttotalprice);
                let vo = {
                	'cartno' : cartno,
                	'cartamount' : cartamount,
                	'carttotalprice' : carttotalprice
                }
                
                $.ajax({
                	type: 'post',
                	url: '<c:url value="/cart/cartModify" />',
                	data : JSON.stringify(vo),
                	contentType : 'application/json',
                	success : function(result){
                		if(result === 'modifySuccess'){
                			getList(true);
                		}
                	},
                	error : function(){
                		alert('수량을 수정할 수 없습니다. 관리자에게 문의하세요.');
                	}
                }); // end ajax
    			
    		}); // end number change
        	
    		

            // 삭제버튼 누르면 tr삭제하는 로직 일단은 백 로직 구현할때 실제 삭제와 함께 같이 되어야 하기 때문에 이 페이지에서는 잠시 보류
            $('.table').on('click', '.btn-remove', function(e){
            	e.preventDefault();
            	if(confirm('정말로 해당 상품을 삭제하시겠습니까?')){
	            	let cartno = e.target.getAttribute('id').replace('rm','');
	            	console.log(cartno);
	            	$.ajax({
	            		type: 'post',
	            		url : '<c:url value ="/cart/cartDelete"/>',
	            		contentType : 'application/json',
	            		data : cartno,
	            		success: function(result){
	            			if(result == "delSuccess"){
	            				alert('삭제되었습니다.');
	            				getList(true);
	            			}
	            		},
	            		error : function(){
	            			alert('삭제에 실패했습니다. 관리자에게 문의하세요.');
	            		}
	            	});// end ajax
            	}
            }); // end 삭제버튼 클릭이벤트
            
            // 선택상품 삭제 로직
            $('body').on('click', '.btn-sel-remove', function(e){
            	if(confirm('선택한 상품을 모두 삭제하시겠습니까?')){
	            	arr=[];
	            	for(let input of $('.prod-checkbox input[type="checkbox"]')){
	            		if(input.checked){
	            			arr.push(parseInt(input.getAttribute('id').replace('chk','')));
	            		}
	            	}
	            	
	            	$.ajax({
	            		type : 'post',
	            		url : '<c:url value="/cart/cartSelDelete"/>',
	            		contentType : 'application/json',
	            		data: JSON.stringify(arr),
	            		success:function(result){
	            			if(result==='delSuccess'){
	            				alert('삭제되었습니다.');
	            				getList(true);
	            			}
	            		},
	            		error : function(){
	            			alert('삭제에 실패했습니다. 관리자에게 문의하세요.');
	            		}
	            	});
            	}
            });
            
            // 전체 선택 로직
            $('.all-select').on('change', function(e){
            	$('.all-select').toggleClass('on');
            	if($('.all-select').hasClass('on')){
            		$('.prod-checkbox input[type="checkbox"]').prop("checked",true);
            	}else{
            		$('.prod-checkbox input[type="checkbox"]').prop("checked",false);
            	}
            });
            
   	
        }); // end $(function(){});
        
        
    </script>


</body>

</html>