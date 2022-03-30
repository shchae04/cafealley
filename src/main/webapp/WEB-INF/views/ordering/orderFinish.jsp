<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 완료</title>
    <link rel="stylesheet" href="<c:url value='/css/kwstyle.css'/>">
    
</head>
<body>

	<%@ include file="../include/header.jsp" %>
	
    <div class="finor-container" style="margin: 200px auto 0;">
        <div class="finor-wrapper">
            <div class="inner-finor">
                <table class="finor-table">
                    <tbody>
                        <tr>
                            <td>
                                <i class="fa-solid fa-truck fa-10x" style="fill: black;"></i>
                            </td>
                            <td style="text-align: justify;">
                                <h3>고객님의 주문이 완료되었습니다.</h3>
                                <div class="fixdivta">
	                                <h5>주문정보 <span style="font-size: 24px; font-weight: 900; color: red;">${lastOrdered.ordernum}</span></h5>
	                                <h5>주문일자 &nbsp;
	                                	<span style="font-size: 15px; color: gray;">
	                                		<fmt:formatDate value="${lastOrdered.orderdate}" pattern="YYYY-MM-dd hh:mm" />
	                                	</span>
	                                </h5>
                                </div>
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="inner-finor" style="text-align: center; margin-top: 30px; width: 100%;">
                <button class="btn btn-lg" onclick="location.href='${pageContext.request.contextPath}/user/userInfo'">마이페이지</button>&emsp;&emsp;
                <button class="btn btn-lg" onclick="location.href='${pageContext.request.contextPath}/'">홈으로</button>
            </div>
        </div>
        <div class="finor-wrapper2">
            <h4 style="margin-bottom: 15px;">주문 정보</h4>
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
                	<c:forEach var="cart" items="${cartList}" varStatus="status">
	                    <tr class="finor-infobo">
	                        <td><img src="<c:url value='/loadimg/display/${cart.filenum}/1'/>" alt="상품이미지"></td>
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
                        <td>
                            <span>상품구매금액 <strong id="product-total-price">0</strong> 원 + 배송비 3,000 =</span>
                            <span style="font-size: 20px; color: orange;">TOTAL : ₩ <strong id="total-price">0</strong>원</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="finor-wrapper2" style="margin-top: 40px;">
            <h4 style="margin-bottom: 15px;">배송지정보</h4>
        </div>
        <div class="finor-wrapper2">
            <table class="finor-infota">
                <tbody class="finor-transinfota" style="text-align: left;">
                    <tr>
                        <td style="width: 200px;">수취인</td>
                        <td>${lastOrdered.deliveryname}</td>
                    </tr>
                    <tr>
                        <td>기본주소</td>
                        <td>${lastOrdered.deliverybasicaddr}</td>
                    </tr>
                    <tr>
                    	<td>상세주소</td>
                    	<td>${lastOrdered.deliverydetailaddr}</td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td>${lastOrdered.deliveryphone1}-${lastOrdered.deliveryphone2}-${lastOrdered.deliveryphone3}</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <br>
        </div>
        <div class="finor-wrapper2" style="margin-top: 40px;">
            <h4 style="margin-bottom: 15px;">결제정보</h4>
        </div>
        <div class="finor-wrapper2">
            <table class="finor-infota">
                <tbody class="finor-transinfota" style="text-align: left;">
                    <tr>
                        <td style="width: 200px;">입금자명</td>
                        <td>${lastOrdered.paybankname} 님</td>
                    </tr>
                    <tr>
                        <td>입금은행</td>
                        <td id="paybank">
                        </td>
                    </tr>
                    <tr>
                        <td>입금하실 계좌</td>
                        <td>커피앨리</td>
                    </tr>
                    <tr>
                        <td>입금하실 계좌번호</td>
                        <td>하나은행 : 748-910999-66507</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <br>
        </div>
    </div>

	<%@ include file="../include/footer.jsp" %>
    
    <script>
    
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
	
	$(function(){
		let paybank = '${lastOrdered.paybank}';
		if(paybank === 'hana' )
			$('#paybank').text('KEB하나은행');
		else if(paybank ==='jeil')
			$('#paybank').text('제일은행');
		else if(paybank ==='kyungnam')
			$('#paybank').text('경남은행');
		else if(paybank ==='kwangju')
			$('#paybank').text('광주은행');
		else if(paybank ==='kookmin')
			$('#paybank').text('국민은행');
		else if(paybank ==='kiup')
			$('#paybank').text('기업은행');
		else if(paybank ==='nonghyup')
			$('#paybank').text('농협');
		else if(paybank ==='daegu')
			$('#paybank').text('대구은행');
		else if(paybank ==='busan')
			$('#paybank').text('부산은행');
		else if(paybank ==='sanup')
			$('#paybank').text('산업은행');
		else if(paybank ==='saemaeul')
			$('#paybank').text('새마을금고');
		else if(paybank ==='suhyup')
			$('#paybank').text('수협');
		else if(paybank ==='sinhan')
			$('#paybank').text('신한은행');
		else if(paybank ==='sinhyup')
			$('#paybank').text('신협');
		else if(paybank ==='city')
			$('#paybank').text('씨티은행');
		else if(paybank ==='woori')
			$('#paybank').text('우리은행');
		else if(paybank ==='wooche')
			$('#paybank').text('우체국');
		else if(paybank ==='jeju')
			$('#paybank').text('제주은행');
		else if(paybank ==='kakao')
			$('#paybank').text('카카오뱅크');
		else if(paybank ==='kbank')
			$('#paybank').text('케이뱅크');

	});
    
    </script>
    
    
    
    
    
    
    
    
</body>

</html>