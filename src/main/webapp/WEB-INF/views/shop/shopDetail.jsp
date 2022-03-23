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

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
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

.detail-info .btn-num-up, .detail-info .btn-num-down {
	width: 13px;
	height: 9px;
	display: block;
}

.qty-up-down {
	position: absolute;
	margin-left: 2px;
}

.org-price, .sell-price, .quantity {
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

button.btn-cart, button.btn-order {
	width: 48%;
	height: 50px;
}

.btn-cart,
.btn-list {
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

.prod-sel .prod-text, .prod-sel select {
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
	width: 100px;
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

.total-price .sp-total-text, .total-price .sp-total-price {
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
.shop-modify{
	position:absolute;
	top:15px;
	right:25px;
}

/* --------------------------------- */
</style>

</head>

<body>

	<%@ include file="../include/header.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-xs-6 prod-img">
					<img src="${pageContext.request.contextPath}/loadimg/display/${shop.filenum}/1" alt="prod-detail" onerror="deleteimg(this)">
				</div>
				<div class="col-xs-6">
					<div class="detail-info">
						<p class="title">${shop.title}</p>
						<a class = "shop-modify" href="<c:url value='/shop/shopModify/${shop.bno}'/>"><span class="glyphicon glyphicon-erase">수정</span></a>
						
						<p class="price">
						<p class="org-price">
							<span class="prod-text">정가</span> <s>${leastPro.proprice}</s>원
						</p>
						<p class="sell-price">
							<span class="prod-text">판매가</span> <strong>${leastPro.prosellprice}</strong>원
						</p>
						</p>
						<p class="quantity">
							<!-- <span class="prod-text">주문수량</span><input type="number" name="" id="" value="1" min="1"><br> -->
						</p>
						<p class="delivery">
							<span class="prod-text">배송비</span> <strong>3000원</strong>
						</p>
						<p class="prod-sel">
							<span class="prod-text">옵션선택</span> <select id="sel-option">
								<option value="not-selected">선택</option>
								<c:forEach var="pro" items="${shop.proList}" varStatus="status">
									<option value="${pro.prono}" id="a${pro.prosellprice}" >${pro.proname}</option>
								</c:forEach>
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
					</div>
					<!-- end 'detail-control' -->
				</div>

				<div class="col-xs-12 prod-detail">
					<img src="${pageContext.request.contextPath}/loadimg/display/${shop.filenum}/2" alt="prod-detail" onerror="deleteimg(this)">
					<img src="${pageContext.request.contextPath}/loadimg/display/${shop.filenum}/3" alt="prod-detail" onerror="deleteimg(this)">					
					<p style="text-align: center; margin-top: 50px;">${shop.content}</p>
				</div>

			</div>
		</div>
	</section>

	
	<%@ include file="../include/footer.jsp" %>

	<script>
        const $seloption = document.querySelector('#sel-option');
        const $easycart = document.querySelector('.easy-cart');

        // 이미지 로드 실패시 이미지태그 삭제
		function deleteimg($input){
			$input.remove();
		}
        
        
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
            let sellprice = '';
            for (let $option of e.target.children) {
            	console.log('option의 밸류'+$option.value);
            	console.log('e.target 즉 select의 밸류'+ e.target.value);
            	console.log('option의 textContent' + $option.textContent);
                if ($option.value === e.target.value) {
                    optiontext = $option.textContent;
                    sellprice = $option.getAttribute('id').replace('a','');
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
            
            // 가격 이쁘게 표시
            let sellprice2 = sellprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
            
            $selectList.innerHTML = `<span class="selected-prod">`+ optiontext +`</span>
                                    <span class="selected-qty">
                                        <input type="number" name="" id=`+'b'+ sellprice +` value="1" min="1"><br>
                                    </span>
                                    <span class="selected-price">`+ sellprice2 +`</span>
                                    <span class="btn-remove">
                                        <i class="fa-solid fa-xmark"></i>
                                    </span>`;
            $easycart.insertBefore($selectList, document.querySelector('.total-price'));
            e.target.value = 'not-selected';
			 
            
            totalLoad()
        });




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

            let pricePerEach = $input.getAttribute('id').replace('b','');
            let quantity = parseInt($input.value);
            let productPriceTotal = pricePerEach * quantity;
            // 정규표현식으로 컴마 붙여주고 원도 친절히 붙여줌.
            productPriceTotal = productPriceTotal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            productPriceTotal = productPriceTotal + '원';
            $selectprice.textContent = productPriceTotal;
        }

        // 최종합계 갱신
        function totalLoad() {
            const $selectedprices = document.querySelectorAll('.selected-price');
            let total = 0;
            for ($price of $selectedprices) {
                total += parseInt($price.textContent.replaceAll(',', '').replace('원', ''));
            }
            console.log('최종합계갱신시 정규표현식 적용안된 total' + total);
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
        
		$(function(){
			
			// 장바구니 클릭시 본인 실제장바구니에 db 넣어줘야함 
			$('.btn-cart').on('click', function(e){
				let arr = [];
				const inputnumbers = document.querySelectorAll('input[type="number"]');
				const selectedprices = document.querySelectorAll('.selected-price');
				for(let n = 0; n<inputnumbers.length; n++){
					let cartamount = inputnumbers[n].value; // 이게 cartamount
					let prono = $('#a'+inputnumbers[n].getAttribute('id').replace('b','')).val(); // 이게 prono 
					let carttotalprice = selectedprices[n].textContent.replaceAll(',','').replace('원',''); // 이게 cattotalprice
					arr.push({
						'prono' : prono,
						'cartamount' : cartamount,
						'carttotalprice' : carttotalprice
					});
				}
				
				$.ajax({
					type: "post",
					url: "<c:url value='/cart/cartRegist' />",
					data: JSON.stringify(arr),
					contentType : 'application/json',
					success: function(result){
						if(result === 'registSuccess'){
							if(confirm('장바구니에 성공적으로 등록되었습니다. 장바구니로 이동하시겠습니까?')){
								location.href='${pageContext.request.contextPath}/cart/cartList';
							}
						}else if(result === 'noLogin'){
							alert('로그인 후 시도해주세요'); // 근데 애초에 나중에 인터셉터에서.. 사장님 로그인한것만 들여보낼텐데..
							return;
						}
					},
					error : function(){
						alert('장바구니 등록에 실패했습니다. 다시 시도하세요.');
					}
				}); // end ajax

			});// end bt-ncart click
			
			
		});// end $(function(){});
    </script>
</body>

</html>