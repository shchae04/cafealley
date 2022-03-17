<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제</title>

<link rel="stylesheet" href="<c:url value='/css/kwstyle.css'/>">

</head>

<body>

	<%@ include file="../include/header.jsp"%>

	<div class="finor-container"
		style="width: 1200px; margin: 200px auto 100px">
		<div class="finor-wrapper2" style="margin: 40px; text-align: center;">
			<h3>주문 결제</h3>
		</div>
		<div class="finor-wrapper2"">
			<h4 style="text-align: left;">주문 상세 내역</h4>
		</div>
		<div class="finor-wrapper2">
			<table class="finor-infota">
				<thead>
					<tr class="finor-infoth">
						<th></th>
						<th>상품명</th>
						<th>판매가</th>
						<th>수량</th>
						<th>합계</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr class="finor-infobo">
						<td><img src="../img/prod1.jpg" alt=""></td>
						<td>베트남 커피</td>
						<td><span class="itemprice">30000</span>원</td>
						<td><input class="countnum" type="number" min="1"
							style="width: 40px; border: 1px solid gray;" value="1">개

						</td>
						<td class="totalprice" style="font-size: 16px; font-weight: 900;"></td>
						<td><a class="deletebtn">삭제</a></td>
					</tr>
					<tr class="finor-infobo">
						<td><img src="../img/prod1.jpg" alt=""></td>
						<td>베트남 커피</td>
						<td><span class="itemprice">30000</span>원</td>
						<td><input class="countnum" type="number" min="1"
							style="width: 40px; border: 1px solid gray;" value="1">개

						</td>
						<td class="totalprice" style="font-size: 16px; font-weight: 900;"></td>
						<td><a class="deletebtn">삭제</a></td>
					</tr>
					<tr class="finor-infobo">
						<td><img src="../img/prod1.jpg" alt=""></td>
						<td>베트남 커피</td>
						<td><span class="itemprice">30000</span>원</td>
						<td><input class="countnum" type="number" min="1"
							style="width: 40px; border: 1px solid gray;" value="1">개

						</td>
						<td class="totalprice" style="font-size: 16px; font-weight: 900;"></td>
						<td><a class="deletebtn">삭제</a></td>
					</tr>

				</tbody>
			</table>
			<table class="finor-infota">
				<tbody>
					<tr class="finor-infolo">
						<td style="padding-top: 20px; padding-bottom: 20px;"><span>상품구매금액
								<strong id="product-total-price">0</strong> 원 + 배송비 3,000 =
						</span> <span style="font-size: 20px; color: orange;">TOTAL : ₩ <strong
								id="total-price">0</strong>원 <!-- js에서 계산됨. --> <input
								type="hidden" name="ordertotalprice" value="">
						</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<form action="#">
			<div class="finor-wrapper2" style="margin-top: 40px;">
				<h4 style="margin-bottom: 15px; display: inline-block;">주문자정보</h4>
				&nbsp; <input type="checkbox"><span>회원 정보와 동일</span>
			</div>
			<!-- 일단 임시로. -->
			<input type="hidden" name="userid" value="abc1234">
			<div class="finor-wrapper2">
				<table class="finor-infota ">
					<tbody class="finor-transinfota orderinfo-input"
						style="text-align: left;">
						<tr>
							<td style="width: 200px;">이름</td>
							<td><input type="text" id="" name="orderusername"
								style="line-height: normal; width: 250px;"
								placeholder="이름을 입력하세요"></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><select class="phone" name="orderuserphone1">
									<option>010</option>
									<option>011</option>
									<option>018</option>
							</select> - <input type="text" name="orderuserphone2" class="phone2">
								- <input type="text" name="orderuserphone3" class="phone3"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" id="" name="orderuseremail"
								style="line-height: normal; width: 250px;"
								placeholder="cofeelover@gmail.com"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="finor-wrapper2" style="margin-top: 40px;">
				<h4 style="margin-bottom: 15px; display: inline-block;">배송정보</h4>
				&nbsp; <input type="checkbox"><span>회원 정보와 동일</span>
			</div>
			<div class="finor-wrapper2">
				<table class="finor-infota ">
					<tbody class="finor-transinfota orderinfo-input"
						style="text-align: left;">
						<tr>
							<td style="width: 200px;">받으시는 분</td>
							<td><input type="text" id="" name="deliveryname"
								style="line-height: normal; width: 250px;"
								placeholder="이름을 입력하세요"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" id="" name="deliverypostnum"
								style="line-height: normal; width: 250px;">
								<button style="line-height: normal;">
									<span>우편번호 찾기</span>
								</button></td>
						</tr>
						<tr>
							<td>기본 주소</td>
							<td><input type="text" id="" name="deliverybasicaddr"
								style="line-height: normal; width: 250px;"></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" id="" name="deliverydetailaddr"
								style="line-height: normal; width: 250px;"
								placeholder="상세주소를 입력하세요"></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><select class="phone" name="deliveryphone1">
									<option>010</option>
									<option>011</option>
									<option>018</option>
							</select> - <input type="text" name="deliveryphone2" class="phone2">
								- <input type="text" name="deliveryphone3" class="phone3"></td>
						</tr>
						<tr>
							<td>배송 메세지</td>
							<td><input type="text" id="" name="deliverymemo"
								style="line-height: normal; width: 250px;"
								placeholder="배송 기사님에게 전달됩니다."></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="finor-wrapper2" style="margin-top: 40px;">
				<h4 style="margin-bottom: 15px; display: inline-block;">결제수단 선택</h4>
			</div>
			<div class="finor-wrapper2">
				<table class="finor-infota ">
					<tbody class="finor-transinfota orderinfo-input"
						style="text-align: left;">
						<tr>
							<td style="width: 200px;">결제수단</td>
							<td><input type="radio" id="r1" name="paymethod"
								value="무통장입금" checked /> <label for="r1"><span>무통장입금</span></label>
							</td>
						</tr>
						<tr>
							<td>입금자명</td>
							<td><input type="text" id="" name="paybankname"
								style="line-height: normal; width: 250px;"></td>
						</tr>
						<tr>
							<td>입금 은행</td>
							<td><select name="paybank">
									<option value="hana">KEB하나은행</option>
									<option value="jeil">SC제일은행</option>
									<option value="kyungnam">경남은행</option>
									<option value="kwangju">광주은행</option>
									<option value="kookmin">국민은행</option>
									<option value="kiup">기업은행</option>
									<option value="nonghyup">농협</option>
									<option value="daegu">대구은행</option>
									<option value="busan">부산은행</option>
									<option value="sanup">산업은행</option>
									<option value="saemaeul">새마을금고</option>
									<option value="suhyup">수협</option>
									<option value="sinhan">신한은행</option>
									<option value="sinhyup">신협</option>
									<option value="city">씨티은행</option>
									<option value="woori">우리은행</option>
									<option value="wooche">우체국</option>
									<option value="jeju">제주은행</option>
									<option value="kakao">카카오뱅크</option>
									<option value="kbank">케이뱅크</option>
							</select></td>

						</tr>
					</tbody>
				</table>
			</div>

			<div class="finor-wrapper2">
				<div style="text-align: center; margin-top: 40px;">
					<input type="checkbox" id="r4"/> <label for="r4"
						style="cursor: pointer;"><span>상기 결제 정보를 확인 하였으며,
							구매 진행에 동의 합니다.</span></label>
				</div>
				<div class="" style="text-align: center; margin-top: 30px;">
					<button class="btn btn-lg"
						style="background-color: black; color: white;" type="submit">결제하기</button>
				</div>

			</div>
		</form>
	</div>


	<%@ include file="../include/footer.jsp"%>

	<script>

        
        


        /*금액 카운트 기능*/
        const $table = document.querySelector('.finor-infota');
        $table.addEventListener('change', e=>{
            if(!e.target.matches('.countnum')){
                return;
            }
            open();

        });

        /*리스트 삭제 기능*/
        $table.addEventListener('click', e=> {
            if(!e.target.matches('.deletebtn')) {
                return;
            }
            console.log(e.target.parentNode.parentNode);
            e.target.parentNode.parentNode.remove();
            open();

            

        });





        window.onload = open();


        function open() {
            let productTotalPrice = 0;
            let totalPrice = 0;
            const $inputnumbers = document.querySelectorAll('input[type="number"]');
            const $productprices = document.querySelectorAll('.itemprice');
            const $totalprices = document.querySelectorAll('.totalprice');
            for(let i =0; i<$inputnumbers.length; i++){
                $totalprices[i].textContent = $inputnumbers[i].value * $productprices[i].innerHTML;
                productTotalPrice +=$inputnumbers[i].value * $productprices[i].innerHTML;
            }
            totalPrice = productTotalPrice + 3000;
			document.querySelector('input[name="ordertotalprice"]').value = totalPrice;
			document.querySelector('#product-total-price').innerHTML = productTotalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            document.querySelector('#total-price').innerHTML = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") ;

        }





        

    </script>

</body>

</html>