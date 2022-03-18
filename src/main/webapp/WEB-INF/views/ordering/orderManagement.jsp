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
    <title>orderManagement</title>
    
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    
    

    <style>
        @font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

         body {
            width: 100%;
            font-family: 'S-CoreDream-4Regular';
        }
        section {
            display: block;
            width: 90%;
            margin: 160px auto;
        }
        .container{
            min-width: 1100px;
        }

        .ord-mgmt-title {
            font-size: 29px;
            font-weight: bold;
        }

        .ord-mgmt-table {
            margin: 30px 0;
        }
        a{
        	font-weight: 700;
        }
    </style>
</head>
<body>
    
    <%@ include file="../include/header.jsp" %>
    
    <section>
        <div class="container">
            
                
                    <p class="ord-mgmt-title">주문 관리</p>
                    <table class="table ord-mgmt-table w-auto text-center align-middle" style="min-width: 800px; max-width: 1000px; min-height: 400px;">
                        <thead>
                            <tr>
                                <td>주문번호</td>
                                <td>주문자아이디</td>
                                <td>총 주문 가격</td>
                                <td>주문 정보</td>
                                <td>주문 날짜</td>
                                <td>주문 상태</td>                                
								<td> </td>
                                
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${orderList}">
                            <tr>
                                <td>${order.ordernum}</td>
                                <td>${order.userid}</td>
                                <td>${order.ordertotalprice}</td>
                                <td><a href="#">상품번호 :
                                	<c:forEach var="cart" items="${order.ordercart}">
                                		${cart.prono},
                                	</c:forEach> 
                                </a></td>
                                <!-- 
                                <td><a href="#">xxxx 외 x개</a></td>
                                 -->
                                <td> <fmt:formatDate value="${order.orderdate}" pattern="YY/MM/dd hh:mm" /> </td>
                                <td>
                                    <select>
                                        <option value="waitdeposit" ${order.orderstatus == 'waitdeposit' ? 'selected' : '' } >입금대기중</option>
                                        <option value="completedeposit" ${order.orderstatus == 'completedeposit' ? 'selected' : ''}>입금완료</option>
                                        <option value="waitdelivery" ${order.orderstatus == 'waitdelivery' ? 'selected' : ''} >배송준비중</option>
                                        <option value="ontheboard">${order.orderstatus == 'ontheboard' ? 'selected' : '' }</option>
                                    </select>
                                </td>
                                <td>
                                	<c:if test="${order.orderstatus == 'ontheboard' || order.orderstatus == 'completedelivery' }">
                                    <button id="btn-del-info">배송정보보기</button>
                                    </c:if>
                                </td>
                                <td>
                                	<button class="btn-modify" type="button" onclick="location.href='<c:url value="/ordering/orderModify"/>">수정하기</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                
            
        </div>
    </section>

    <%@ include file="../include/footer.jsp" %>
        
    <script>
    
        $(function(){
            $('#btn-del-info').click(function(){
                window.open('http://127.0.0.1:5500/orderManagement.html', '사용자 배송정보', 'width=500, height=700, scrollbars=yes, resizable=no')
            });//배송정보보기 버튼 이벤트 끝
        }); //end jQuery
        
        
		const $table = document.querySelector('.table');
    	$table.addEventListener('click', e=>{
    		// 수정버튼만 통과
    		if(!e.target.matches('.btn-modify')){
    			return;
    		}
    		
    		
    	});
    </script>

</body>
</html>