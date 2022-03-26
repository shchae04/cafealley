<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>orderDeliveryChk</title>

    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    

    <style>
    	.container{
    		min-height:440px;
    	}
    
        .clearfix::after {
            content: '';
            display: block;
            clear: both;
        }

        .titlefoot {
            float: right
        }

        .form-control {
            display: inline-block;
            width: 200px;
        }

        .container {
            min-width: 1200px;
            margin-top: 150px;
            margin-bottom: 50px;
        }

        .top {
            padding: 12px;
            border: 1px solid gray;
            position: relative;
        }

        .search-input.form-control {
            position: absolute;
            right: 70px;
            bottom: 5px;
            width: 300px;
        }

        .search-btn {
            position: absolute;
            right: 13px;
            bottom: 5px;
        }
        
		.pagination > li > a {
        background-color: black !important;
        border : 1px solid black !important;
        color: white !important;
    	}
		.pagination > li > a:hover {
        background-color: gray !important;
        color: white !important;
        border : 1px solid white !important;
        cursor: pointer !important;
    	}
    		
		
	    .order-img{
			width: 25px;
			height: 25px;
		}
		.btn-xs{
			color:white !important;
			background : black !important;
			border: 1px solid black !important;
			width: 70px;
			
		}

		
    </style>

</head>

<body>


	<%@ include file="../include/header.jsp" %>
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!--카테고리 메뉴-->
                    <ul class="nav nav-tabs">
                        <li><a href="<c:url value='/user/userInfo' />">회원정보</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티게시판<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
								<li><a href="<c:url value='/user/cmnBoardChk' />">작성글보기</a></li>
								<li><a href="<c:url value='/user/cmnReplyChk' />">작성댓글보기</a></li>
                            </ul>
                        </li>
                        
                        <c:if test="${not empty login.businessnum}">
	                        <li class="dropdown">
	                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">홍보게시판<span
	                                    class="caret"></span></a>
	                            <ul class="dropdown-menu">
									<li><a href="<c:url value='/user/promoBoardChk' />">작성글보기</a></li>
									<li><a href="<c:url value='/user/promoReplyChk' />">작성댓글보기</a></li>
	                            </ul>
	                        </li>
	                        <li class="active">
	                        	<a href="<c:url value='/user/orderDelHistory' />">주문내역/배송조회</a>
	                        </li>
                        </c:if>
                    </ul>

                    <br>
                    <h3>
                        <strong>주문내역/배송조회</strong>
                    </h3>

                    <div>
                        <div class="top">
                            <!--클릭하면 해당 기간의 주문내역을 조회합니다-->
                            <strong>조회기간</strong>
                            <button type="button" class="btn-xs">15일</button>
                            <button type="button" class="btn-xs">1개월</button>
                            <button type="button" class="btn-xs">3개월</button>
                            <button type="button" class="btn-xs">6개월</button>
                        </div>
                    </div>

                        <!--테이블 자동 크기 조절-->
                        <table class="table table-hover w-auto">
                            <thead>
                            	<tr>
	                                <th>주문번호</th>
	                                <th>주문일자</th>
	                                <th>주문상품</th>
	                                <th>총 구매금액</th>
	                                <th>주문상태</th>
	                                <th>배송 정보</th>
	                                <th>환불/반품</th>
	                             <tr>
                            </thead>

                            <tbody>
                            	<c:forEach var="order" items="${orderList}">
	                                <tr>
	                                	<form action="#" method="post" name="${order.ordernum}"></form>
	                                    <td>${order.ordernum}</td>
	                                    <td><fmt:formatDate value="${order.orderdate}" pattern="YYYY-MM-dd hh:mm"/> 2022-03-08</td>
	                                    <td>
	                                    	<a href="${order.ordernum}" class="btn-detail">
												<img class="order-img"alt="주문이미지" src="<c:url value='/loadimg/display/${order.ordercart[0].filenum}/1'/>">
												${order.ordercart[0].proname}
												<c:if test="${fn:length(order.ordercart) >1}">외 ${fn:length(order.ordercart)-1}개의 상품 </c:if>
											</a>
										</td>
	                                    <td class="order-ttp">${order.ordertotalprice}</td>
	                                    <td>
											<c:if test="${order.orderstatus == 'waitdeposit' ? true : false}">
												입금대기
											</c:if>
											<c:if test="${order.orderstatus == 'completedeposit' ? true : false}">
												입금완료
											</c:if>
											<c:if test="${order.orderstatus == 'waitdelivery' ? true : false}">
												출고준비중
											</c:if>
											<c:if test="${order.orderstatus == 'ontheboard' ? true : false}">
												배송중
											</c:if>
											<c:if test="${order.orderstatus == 'completedelivery' ? true : false }">
												배송완료
											</c:if>
											<c:if test="${order.orderstatus == 'ordercancel' ? true : false }">
												주문취소
											</c:if>
											<c:if test="${order.orderstatus == 'exchange' ? true : false }">
												교환요청
											</c:if>
											<c:if test="${order.orderstatus == 'refund' ? true : false }">
												환불요청
											</c:if>
										</td>
										<td>
											<p id="track${order.ordernum}" style="display:none;">${order.deliverytracknum}</p>
											<c:if test="${order.orderstatus == 'ontheboard' || order.orderstatus == 'completedelivery' || order.orderstatus == 'refund'|| order.orderstatus == 'exchange'  }">
											<button type="button" id="${order.ordernum}" class="btn-del-info">배송정보보기</button>
											</c:if>
										</td>
	                                    <td>
	                                    	<c:if test="${order.orderstatus == 'completedelivery' ? true : false }">
												<button type="button" class="btn-xs btn-orderexrefund" id="r${order.ordernum}" onclick="location.href='<c:url value="/ordering/exchangeRefund/${order.ordernum}"/>'">환불/반품</button>
											</c:if>
											<c:if test="${order.orderstatus == 'waitdeposit' || order.orderstatus == 'completedeposit' ? true : false }">
												<button type="button" class="btn-xs btn-ordercancel" id="d${order.ordernum}" onclick="cancelOrder(this)">주문취소</button>
											</c:if>
                                    	</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="text-center">
                            <!-- 페이징 처리 부분  -->
                            
                            
                            <form action="<c:url value='/user/orderDelHistory'/>" name="pageForm">
								<ul class="pagination" id="pagination">
	                            	<c:if test="${pc.prev}">
	                                	<li><a href="#" data-pageNum="${pc.beginPage-1}">이전</a></li>
	                                </c:if>
	                                <c:forEach var="curPage" begin="${pc.beginPage}" end="${pc.endPage}">
	                                	<li class="${pc.paging.pageNum == curPage ? 'active' : ''}">
	                                		<a href="#" data-pageNum="${curPage}">${curPage}</a>
	                                	</li>
	                                </c:forEach>
	                                
	                                <c:if test="${pc.next}">
	                               		<li><a href="#" data-pageNum="${pc.endPage+1}">다음</a></li>
	                                </c:if>
	                            </ul>
	                            <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
	                            <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
	                            <c:if test="${pc.paging.condition}">
	                            	<input type="hidden" name="condition" value="${pc.paging.condition}">
	                            </c:if>
						    </form>
							<!-- 페이징 처리 끝 -->
							
                        </div>
                </div>
            </div>
        </div>

    </section>

	<%@ include file="../include/footer.jsp" %>

    </body>
    
    <script>
    
    let msg = '${msg}';
    if(msg !== ''){
    	alert(msg);
    }
    

    
    $(function() {
    	
   		// 배송 정보보기 대한통운 팝업 띄우기
   		$('.table').on('click', '.btn-del-info', function(e){
   			let ordernum = e.target.getAttribute('id');
   			console.log(ordernum);
	        window.open('http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=' + $('#track'+ordernum).text() , '사용자 배송정보', 'width=600, height=700, scrollbars=yes, resizable=no')
   		});
	    
   		
        // 상세보기 클릭시 상세보기 팝업 띄움 
        $('.table').on('click', '.btn-detail', function(e){
        	e.preventDefault();
        	ordernum = e.target.getAttribute('href');
        	userid = $('#id'+ordernum).text(); 
        	window.open('<c:url value="/ordering/orderDetail/' + ordernum + '/'+ 0 +'"/>', '주문 상세보기', 'width=1000, height=700, scrollbars=yes, resizable=no');
        });
   		
   		
   
	 	// 페이징
		$('#pagination').on('click', 'a', function(e) {
    			e.preventDefault();
    			console.log($(this));
    			const value = $(this).data('pagenum');
    			console.log(value);
    			document.pageForm.pageNum.value = value;
    			document.pageForm.submit();
    		});
		
		for(let ttp of $('.order-ttp')){
	    	ttp.textContent = ttp.textContent.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	    }				
		
	});

    
    function cancelOrder($input){
    	if(confirm('정말로 주문을 취소하시겠습니까?\n 입금완료 상태에서 주문 취소시 \n관리자가 3일이내로 확인 후 환불이 됩니다.')){
    		let ordernum = $input.getAttribute('id').replace('d','');
    		let orderstatus = 'ordercancel';
    		const $form = document.querySelector('form[name="'+ordernum+'"]');
    		console.log($form);
    		$form.setAttribute('action','<c:url value="/ordering/orderModify/' + ordernum + '/' + orderstatus + '/' + 0 + '"/>');
    		$form.submit();
    	}
    }
    
    
	    
    </script>

</html>