<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제</title>

<link rel="stylesheet" href="<c:url value='/css/kwstyle.css'/>">

<style>
input:read-only {
	background: #dfdfdf;
	border : 1px solid rgb(118, 118, 118);
}

</style>
<!-- bootstrap css -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>">
<!-- header와 footer, 폰트에대한 css -->
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/6bdfd4f896.js"
	crossorigin="anonymous"></script>
<!-- jquery와 bootstrapjs 순서는 중요합니다. 항상 jquery가 bootstrap.js보다 먼저 와야합니다.
그렇지 않으면 bootstrap.js에서 동작하는 modal이나 dropdown등이 동작되지 않을 수 있습니다. -->
<!-- jquery -->
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<!-- bootstrap js -->
<script src="<c:url value='/js/bootstrap.js' />"></script>

</head>

<body>
	<div class="finor-container"
		style="width: 1200px; margin: 100px auto ">
		<div class="finor-wrapper2" style="margin: 40px; text-align: center;">
			<h3>주문정보 상세보기</h3>
		</div>
		<div class="finor-wrapper2">
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
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "cart" items="${cartList}" varStatus="status">
						<tr class="finor-infobo">
							<td><img src="<c:url value='/loadimg/display/${cart.filenum}/1'/>" style="margin-left: 50px;"></td>
							<td>${cart.proname}</td>
							<td><span class="itemprice"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${cart.carttotalprice / cart.cartamount}" /></span></td>
							<td><p class="countnum">${cart.cartamount}</p></td>
							<td class="totalprice" style="font-size: 16px; font-weight: 900;">${cart.carttotalprice}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="finor-infota">
				<tbody>
					<tr class="finor-infolo">
						<td style="padding-top: 20px; padding-bottom: 20px;">
							<span>상품구매금액 <strong id="product-total-price">0</strong> 원 + 배송비 3,000 =</span>
						 	<span style="font-size: 20px; color: orange;">TOTAL : ₩ 
						 		<strong id="total-price">0</strong>원
							</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
			<div class="finor-wrapper2" style="margin-top: 40px;">
				<h4 style="margin-bottom: 15px; display: inline-block;">주문자정보</h4>
				&nbsp; 
			</div>
			<div class="finor-wrapper2">
				<table class="finor-infota ">
					<tbody class="finor-transinfota orderinfo-input"
						style="text-align: left;">
						<tr>
							<td style="width: 200px;">이름</td>
							<td><span name="orderusername" style="line-height: normal; width: 250px;">${order.orderusername}</span></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><span class="phone">${order.orderuserphone1}</span>
							 - <span class="phone2">${order.orderuserphone2}</span>
								- <span class="phone3">${order.orderuserphone3}</span></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><span style="line-height: normal; width: 250px;">${order.orderuseremail}</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="finor-wrapper2" style="margin-top: 40px;">
				<h4 style="margin-bottom: 15px; display: inline-block;">배송정보</h4>
				&nbsp; 
			</div>
			<div class="finor-wrapper2">
				<table class="finor-infota ">
					<tbody class="finor-transinfota orderinfo-input"
						style="text-align: left;">
						<tr>
							<td style="width: 200px;">받으시는 분</td>
							<td><span style="line-height: normal; width: 250px;">${order.deliveryname}</span></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td>
								<span style="line-height: normal; width: 250px;">${order.deliverypostnum}</span>
							</td>
						</tr>
						<tr>
							<td>기본 주소</td>
							<td>
								<span style="line-height: normal; width: 250px;">${order.deliverybasicaddr}</span>
							</td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td>
								<span style="line-height: normal; width: 250px;">${order.deliverydetailaddr}</span>
							</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><span class="phone">${order.deliveryphone1}</span>-
								<span class="phone2">${order.deliveryphone2}</span>-
								<span class="phone3">${order.deliveryphone3}</span></td>
						</tr>
						<tr>
							<td>배송 메세지</td>
							<td>
								<span style="line-height: normal; width: 250px;">${order.deliverymemo}</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="finor-wrapper2" style="margin-top: 40px;">
				<h4 style="margin-bottom: 15px; display: inline-block;">결제수단</h4>
			</div>
			<div class="finor-wrapper2">
				<table class="finor-infota ">
					<tbody class="finor-transinfota orderinfo-input"
						style="text-align: left;">
						<tr>
							<td style="width: 200px;">결제수단</td>
							<td><input type="radio" name="paymethod"
								value="무통장입금" checked /> <label for="r1"><span>무통장입금</span></label>
							</td>
						</tr>
						<tr>
							<td>입금자명</td>
							<td><span 
								style="line-height: normal; width: 250px;">${order.paybankname}</span></td>
						</tr>
						<tr>
							<td>입금 은행</td>
							<td>
								<span>
									<c:if test="${order.paybank == 'hana' ? true: false}">KEB하나은행</c:if>
									<c:if test="${order.paybank == 'jeil' ? true: false}">SC제일은행</c:if>
									<c:if test="${order.paybank == 'kyungnam' ? true: false}">경남은행</c:if>
									<c:if test="${order.paybank == 'kwangju' ? true: false}">광주은행</c:if>
									<c:if test="${order.paybank == 'kookmin' ? true: false}">국민은행</c:if>
									<c:if test="${order.paybank == 'kiup' ? true: false}">기업은행</c:if>
									<c:if test="${order.paybank == 'nonghyup' ? true: false}">농협</c:if>
									<c:if test="${order.paybank == 'daegu' ? true: false}">대구은행</c:if>
									<c:if test="${order.paybank == 'busan' ? true: false}">부산은행</c:if>
									<c:if test="${order.paybank == 'sanup' ? true: false}">산업은행</c:if>
									<c:if test="${order.paybank == 'saemaeul' ? true: false}">새마을금고</c:if>
									<c:if test="${order.paybank == 'suhyup' ? true: false}">수협</c:if>
									<c:if test="${order.paybank == 'sinhan' ? true: false}">신한은행</c:if>
									<c:if test="${order.paybank == 'sinhyup' ? true: false}">신협</c:if>
									<c:if test="${order.paybank == 'city' ? true: false}">씨티은행</c:if>
									<c:if test="${order.paybank == 'woori' ? true: false}">우리은행</c:if>
									<c:if test="${order.paybank == 'wooche' ? true: false}">우체국</c:if>
									<c:if test="${order.paybank == 'jeju' ? true: false}">제주은행</c:if>
									<c:if test="${order.paybank == 'kbank' ? true: false}">케이뱅크</c:if>
									<c:if test="${order.paybank == 'kakao' ? true: false}">카카오뱅크</c:if>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	<script>
	
	$(function(){
		
		// 합계 계산
		let sumoftotal = 0;
		for(let price of $('.totalprice')){
			sumoftotal = sumoftotal + parseInt(price.textContent);
		}
		console.log(sumoftotal);
		
		$('#product-total-price').text(sumoftotal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
		$('#total-price').text((sumoftotal + 3000).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
		
		// 컴마 및 원 찍어주기  
		for(let i = 0 ;i< document.querySelectorAll('.itemprice').length; i++){
			itp = $('.itemprice').get(i);
			ttp = $('.totalprice').get(i);
			ctn = $('.countnum').get(i);
		
			itp.textContent = itp.textContent.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
			ttp.textContent = ttp.textContent.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
			ctn.textContent = ctn.textContent.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "개"
		}
		
		
		
	
	});

    </script>

</body>

</html>