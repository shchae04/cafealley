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
                        <td>배송지</td>
                        <td>${lastOredered.deliverybasicaddr} ${lastOrdered.deliverydetailaddr}</td>
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
                        <td>
                        	<c:choose>
                        		<c:when test="${lastOrdered.paybank =='hana' ? true : false}">KEB하나은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='jeil' ? true : false} ">SC제일은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='kyungnam' ? true : false} ">경남은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='kwangju' ? true : false} ">광주은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='kookmin' ? true : false} ">국민은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='kiup' ? true : false} ">기업은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='konghyup' ? true : false} ">농협</c:when>
                        		<c:when test="${lastOrdered.paybank =='daegu' ? true : false} ">대구은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='busan' ? true : false} ">부산은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='sanup' ? true : false} ">산업은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='saemaeul' ? true : false} ">새마을금고</c:when>
                        		<c:when test="${lastOrdered.paybank =='suhyup' ? true : false} ">수협</c:when>
                        		<c:when test="${lastOrdered.paybank =='sinhan' ? true : false} ">신한은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='sinhyup' ? true : false} ">신협</c:when>
                        		<c:when test="${lastOrdered.paybank =='city' ? true : false} ">씨티은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='woori' ? true : false} ">우리은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='wooche' ? true : false} ">우체국</c:when>
                        		<c:when test="${lastOrdered.paybank =='jeju' ? true : false} ">제주은행</c:when>
                        		<c:when test="${lastOrdered.paybank =='kakao' ? true : false} ">카카오뱅크</c:when>
                        		<c:when test="${lastOrdered.paybank =='kbank' ? true : false}">케이뱅크</c:when>
                        	</c:choose>
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
    
    </script>
    
    
    
    
    
    
    
    
</body>

</html>