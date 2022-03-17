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
		style="margin-top: 200px; margin-left: 200px; margin-bottom: 100px;">
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
						<td><img src="<c:url value='/img/prod1.jpg'/>" alt=""></td>
						<td>베트남 커피</td>
						<td><span class="itemprice">30000</span>원</td>
						<td><input class="countnum" type="number" min="1"
							style="width: 40px; border: 1px solid gray;" value="1">개

						</td>
						<td class="totalprice" style="font-size: 16px; font-weight: 900;"></td>
						<td><a class="deletebtn">삭제</a></td>
					</tr>
					<tr class="finor-infobo">
						<td><img src="<c:url value='/img/prod1.jpg'/>" alt=""></td>
						<td>베트남 커피</td>
						<td><span class="itemprice">30000</span>원</td>
						<td><input class="countnum" type="number" min="1"
							style="width: 40px; border: 1px solid gray;" value="1">개

						</td>
						<td class="totalprice" style="font-size: 16px; font-weight: 900;"></td>
						<td><a class="deletebtn">삭제</a></td>
					</tr>
					<tr class="finor-infobo">
						<td><img src="<c:url value='/img/prod1.jpg'/>" alt=""></td>
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
								<strong id="product-total-price">0</strong>원 + 배송비 3,000 =
						</span> <span style="font-size: 20px; color: orange;">TOTAL : ₩ <strong
								id="total-price">0</strong></span></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="finor-wrapper2" style="margin-top: 40px;">
			<h4 style="margin-bottom: 15px; display: inline-block;">주문자정보</h4>
			&nbsp; <input type="checkbox"><span>회원 정보와 동일</span>
		</div>
		<div class="finor-wrapper2">
			<table class="finor-infota ">
				<tbody class="finor-transinfota orderinfo-input"
					style="text-align: left;">
					<tr>
						<td style="width: 200px;">이름</td>
						<td><input type="text" id=""
							style="line-height: normal; width: 250px;"
							placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" id=""
							style="line-height: normal; width: 250px;"
							placeholder="연락처를 입력하세요"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" id=""
							style="line-height: normal; width: 250px;"
							placeholder="이메일를 입력하세요"></td>
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
						<td><input type="text" id=""
							style="line-height: normal; width: 250px;"
							placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td>배송지</td>
						<div class="">
							<td><input type="text" id=""
								style="line-height: normal; width: 250px;"
								placeholder="주소를 입력하세요">
								<button style="line-height: normal;">
									<span>우편번호 찾기</span>
								</button></td>
						</div>
					</tr>
					<tr>
						<td>핸드폰 번호</td>
						<td><input type="text" id=""
							style="line-height: normal; width: 250px;"
							placeholder="이메일를 입력하세요"></td>
					</tr>
					<tr>
						<td>배송 메모</td>
						<td><input type="text" id=""
							style="line-height: normal; width: 250px;"
							placeholder="이메일를 입력하세요"></td>
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
						<td><input type="radio" id="r1" name="rr" checked /> <label
							for="r1"><span>무통장입금</span></label> <input type="radio" id="r2"
							name="rr" disabled /> <label for="r2"><span>신용카드</span></label>
							<input type="radio" id="r3" name="rr" disabled /> <label for="r3"><span>가상계좌</span></label>
						</td>
					</tr>
					<tr>
						<td>입금자명</td>
						<td><input type="text" id=""
							style="line-height: normal; width: 250px;"
							placeholder="이메일를 입력하세요"></td>
					</tr>
					<tr>
						<td>입금 은행</td>
						<td><input type="text" id=""
							style="line-height: normal; width: 250px;"
							placeholder="이메일를 입력하세요"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="finor-wrapper2">
			<div style="text-align: center; margin-top: 40px;">
				<input type="checkbox" id="r4" name="rr" /> <label for="r4"
					style="cursor: pointer;"><span>상기 결제 정보를 확인 하였으며, 구매
						진행에 동의 합니다.</span></label>
			</div>
			<div class="" style="text-align: center; margin-top: 30px;">
				<button class="btn btn-lg"
					style="background-color: black; color: white;" type="submit">결제하기</button>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>

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

            document.querySelector('#product-total-price').textContent = productTotalPrice;
            document.querySelector('#total-price').textContent =  totalPrice;

        }





        

    </script>
	

</body>

</html>