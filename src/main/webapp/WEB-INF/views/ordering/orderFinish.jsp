<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
    <div class="finor-container" style="margin-top: 200px; margin-left: 250px;">
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
                                <h5>주문정보 <span style="font-size: 24px; font-weight: 900; color: red;">12345-67890</span>
                                    </h4>
                                    <h5>주문일자 &nbsp;<span style="font-size: 15px; color: gray;">2022-03-07 17:06</span>
                                    </h5>
                                </div>


                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="inner-finor" style="text-align: center; margin-top: 30px; width: 100%;">
                <button class="btn btn-lg">마이페이지</button>&emsp;&emsp;
                <button class="btn btn-lg">홈으로</button>
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
                        <th>주문상태</th>
                        <th>합계</th>
                        </tr>
                </thead>
                <tbody>
                    <tr class="finor-infobo">
                        <td><img src="<c:url value='/img/prod1.jpg'/>" alt=""></td>
                        <td>베트남 커피</td>
                        <td>30,000원</td>
                        <td>2개</td>
                        <td>입금대기</td>
                        <td style="font-size: 16px; font-weight: 900;">60,000원</td>
                </tbody>
            </table>
            <table class="finor-infota">
                <tbody>
                    <tr class="finor-infolo">
                        <td>
                            <span>상품구매금액 <strong>60,000원</strong> + 배송비 3,000 =</span>
                            <span style="font-size: 20px; color: orange;">TOTAL : ₩ 63,000</span>
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
                        <td>홍길동</td>
                    </tr>
                    <tr>
                        <td>배송지</td>
                        <td>사랑시 고백구 행복동</td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td>010-1234-5678</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <br>
        </div>
    </div>

	<%@ include file="../include/footer.jsp" %>
    
</body>

</html>