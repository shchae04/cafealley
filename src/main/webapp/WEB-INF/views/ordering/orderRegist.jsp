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


</head>

<body>

	<%@ include file="../include/header.jsp"%>

	<div class="finor-container"
		style="width: 1200px; margin: 200px auto 100px">
		<div class="finor-wrapper2" style="margin: 40px; text-align: center;">
			<h3>주문 결제</h3>
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
		<form action="<c:url value='/ordering/orderRegist'/>" method="post" id="form">
			<!-- 일단 임시로. -->
			<input type="hidden" name="carttype" value="${cartList[0].carttype}">
			<!-- js에서 계산됨. -->
			<input type="hidden" name="ordertotalprice">
			<div class="finor-wrapper2" style="margin-top: 40px;">
				<h4 style="margin-bottom: 15px; display: inline-block;">주문자정보</h4>
				&nbsp; <input type="checkbox" id="chk-orderuser"><span>회원 정보와 동일</span>
			</div>

			<input type="hidden" name="userid" value="${login.userid}">
			<div class="finor-wrapper2">
				<table class="finor-infota ">
					<tbody class="finor-transinfota orderinfo-input"
						style="text-align: left;">
						<tr>
							<td style="width: 200px;">*이름</td>
							<td><input type="text" name="orderusername"
								style="line-height: normal; width: 250px;"
								placeholder="이름을 입력하세요"></td>
						</tr>
						<tr>
							<td>*연락처</td>
							<td><select class="phone" name="orderuserphone1">
									<option>010</option>
									<option>011</option>
									<option>018</option>
							</select> - <input type="text" name="orderuserphone2" class="phone2">
								- <input type="text" name="orderuserphone3" class="phone3"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="orderuseremail"
								style="line-height: normal; width: 250px;"
								placeholder="cofeelover@gmail.com"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="finor-wrapper2" style="margin-top: 40px;">
				<h4 style="margin-bottom: 15px; display: inline-block;">배송정보</h4>
				&nbsp; <input type="checkbox" id="chk-deluser"><span>회원 정보와 동일</span>
			</div>
			<div class="finor-wrapper2">
				<table class="finor-infota ">
					<tbody class="finor-transinfota orderinfo-input"
						style="text-align: left;">
						<tr>
							<td style="width: 200px;">*받으시는 분</td>
							<td><input type="text" name="deliveryname"
								style="line-height: normal; width: 250px;"
								placeholder="이름을 입력하세요"></td>
						</tr>
						<tr>
							<td>*우편번호</td>
							<td><input type="text" name="deliverypostnum" readonly placeholder="우편번호 검색을 이용해주세요."
								style="line-height: normal; width: 250px;">
								<button style="line-height: normal;" onclick="searchAddress()" type="button">
									<span>우편번호검색</span>
								</button></td>
						</tr>
						<tr>
							<td>*기본 주소</td>
							<td><input type="text" name="deliverybasicaddr" readonly
								style="line-height: normal; width: 250px;"></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="deliverydetailaddr" readonly
								style="line-height: normal; width: 250px;"
								placeholder="상세주소를 입력하세요"></td>
						</tr>
						<tr>
							<td>*연락처</td>
							<td><select class="phone" name="deliveryphone1">
									<option>010</option>
									<option>011</option>
									<option>018</option>
							</select> - <input type="text" name="deliveryphone2" class="phone2">
								- <input type="text" name="deliveryphone3" class="phone3"></td>
						</tr>
						<tr>
							<td>배송 메세지</td>
							<td><input type="text" name="deliverymemo"
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
							<td style="width: 200px;">*결제수단</td>
							<td><input type="radio" name="paymethod"
								value="무통장입금" checked /> <label for="r1"><span>무통장입금</span></label>
							</td>
						</tr>
						<tr>
							<td>*입금자명</td>
							<td><input type="text" name="paybankname"
								style="line-height: normal; width: 250px;"></td>
						</tr>
						<tr>
							<td>*입금 은행</td>
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
					<input type="checkbox" id="r4" /> <label for="r4"
						style="cursor: pointer;"><span>상기 결제 정보를 확인 하였으며,
							구매 진행에 동의 합니다.</span></label>
				</div>
				<div style="text-align: center; margin-top: 30px;">
					<button class="btn btn-lg"
						style="background-color: black; color: white;" id="btn-submit" type="button">결제하기</button>
				</div>

			</div>
		</form>
	</div>


	<%@ include file="../include/footer.jsp"%>
	
	<!-- 카카오 api를 이용하기 위한 코드 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		// ordertotalprice value 바꿔주기
		$('input[name="ordertotalprice"]').val(sumoftotal+3000);
		// 컴마 및 원 찍어주기  
		for(let i = 0 ;i< document.querySelectorAll('.itemprice').length; i++){
			itp = $('.itemprice').get(i);
			ttp = $('.totalprice').get(i);
			ctn = $('.countnum').get(i);
		
			itp.textContent = itp.textContent.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
			ttp.textContent = ttp.textContent.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
			ctn.textContent = ctn.textContent.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "개"
		}
		
		// 결제버튼클릭시 유효성검사 후 보내줌 
		$('#btn-submit').on('click',function(e){
			if($('input[name="orderusername"]').val() === ''){
                alert('주문자 이름을 입력해 주세요.');
                $('input[name="orderusername"]').focus();
                return;
			}else if($('input[name="orderuserphone1"]').val() === '' || $('input[name="orderuserphone2"]').val() === '' || $('input[name="orderuserphone3"]').val() === ''){
				alert('주문자 전화번호를 입력해 주세요.');
				$('input[name="orderuserphone1"]').focus();
				return;
			}else if($('input[name="deliveryname"]').val()===''){
				alert('배송수령인 이름을 입력해주세요.');
				$('input[name="deliveryname"]').focus();
				return;
			}else if($('input[name="deliverypostnum"]').val()===''){
				alert('우편번호 검색을 통해 배송주소를 입력해주세요.');
				$('button[onclick="searchAddress()"]').focus();
				return;
			}else if($('input[name="deliveryphone1"]').val() === '' ||$('input[name="deliveryphone2"]').val() === '' || $('input[name="deliveryphone3"]').val() === ''){
				alert('배송수령인 연락처를 입력해주세요');
				$('input[name="deliveryphone1"]').focus();
				return;
			}else if($('input[name="paybankname"]').val() === ''){
				alert('입금자명을 입력해주세요.');
				$('input[name="paybankname"]').focus();
				return;
			}else if(!($('#r4').is(':checked'))){
				alert('구매 진행에 동의를 해주세요.');
				$('#r4').focus();
				return;
			}
			
			$('#form').submit();
			
		});
		
		// 주문자정보 회원자정보와 같음 체크표시 로직
		$('#chk-orderuser').on('change', function(e){
			$('#chk-orderuser').toggleClass('checked');
			if($('#chk-orderuser').hasClass('checked')){
				username = '${login.username}';
				userphone1 = '${login.userphone1}';
				userphone2 = '${login.userphone2}';
				userphone3 = '${login.userphone3}';
				useremail = '${login.useremail}';
				$('input[name="orderusername"]').val(username);
				$('input[name="orderuserphone1"]').val(userphone1);
				$('input[name="orderuserphone2"]').val(userphone2);
				$('input[name="orderuserphone3"]').val(userphone3);
				$('input[name="orderuseremail"]').val(useremail);
			}else{
				$('input[name="orderusername"]').val('');
				$('input[name="orderuserphone1"]').val('');
				$('input[name="orderuserphone2"]').val('');
				$('input[name="orderuserphone3"]').val('');
				$('input[name="orderuseremail"]').val('');
			}
		});
		// 배송정보 회원자정보와 같음 체크표시 로직
		$('#chk-deluser').on('change', function(e){
			$('#chk-deluser').toggleClass('checked');
			if($('#chk-deluser').hasClass('checked')){
				username = '${login.username}';
				userphone1 = '${login.userphone1}';
				userphone2 = '${login.userphone2}';
				userphone3 = '${login.userphone3}';
				zipcode = '${login.zipcode}';
				addrbasic = '${login.addrbasic}'; 
				addrdetail = '${login.addrdetail}';
				$('input[name="deliveryname"]').val(username);
				$('input[name="deliveryphone1"]').val(userphone1);
				$('input[name="deliveryphone2"]').val(userphone2);
				$('input[name="deliveryphone3"]').val(userphone3);
				$('input[name="deliverypostnum"]').val(zipcode);
				$('input[name="deliverybasicaddr"]').val(addrbasic);
				$('input[name="deliverydetailaddr"]').val(addrdetail);
			}else{
				$('input[name="deliveryname"]').val('');
				$('input[name="deliveryphone1"]').val('');
				$('input[name="deliveryphone2"]').val('');
				$('input[name="deliveryphone3"]').val('');
				$('input[name="deliverypostnum"]').val('');
				$('input[name="deliverybasiraddr"]').val('');
				$('input[name="deliverydetailaddr"]').val('');
			}
		});
		
		
	});
	
	function searchAddress() {
		
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("input[name='deliverypostnum']").value = data.zonecode;
                document.querySelector("input[name='deliverybasicaddr']").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name='deliverydetailaddr']").focus();
                document.querySelector("input[name='deliverydetailaddr']").removeAttribute('readonly');
            }
        }).open();
    }

    </script>

</body>

</html>