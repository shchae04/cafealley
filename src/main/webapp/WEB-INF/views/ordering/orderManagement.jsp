<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff')
		format('woff');
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

.container {
	min-width: 1100px;
}

.ord-mgmt-title {
	font-size: 29px;
	font-weight: bold;
}

.ord-mgmt-table {
	margin: 30px 0;
}

a {
	font-weight: 700;
}
.order-img{
	width: 25px;
	height: 25px;
}
.container{
	min-width:1100px;
	min-height: 500px;
}
input:read-only{
	background: #dfdfdf;
	border : 1px solid rgb(118, 118, 118);
}
input[type='text'],
select{
	border: 1px solid #ddd;
	text-align : center;
	float:left;
	width: 200px;
}
select{
	width: 100px;
}
button:disabled {
	background: #dfdfdf;
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


</style>
</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<section>
		<div class="container">
			<p class="ord-mgmt-title">주문 관리</p>
			<table class="table ord-mgmt-table w-auto text-center align-middle"
				style="min-width: 1200px; ">
				<thead>
					<tr>
						<td>주문번호</td>
						<td>주문자아이디</td>
						<td>총 주문 가격</td>
						<td>주문 정보</td>
						<td>주문 날짜</td>
						<td>주문 상태</td>
						<td>배송 정보</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orderList}">
						<tr>
							<form action="#" method="post" name="${order.ordernum}">
								<td>${order.ordernum}</td>
								<td id="id${order.ordernum}">${order.userid}</td>
								<td class="order-ttp">${order.ordertotalprice}</td>
								<td>
									<a href="${order.ordernum}" class="btn-detail">
										<img class="order-img"alt="주문이미지" src="<c:url value='/loadimg/display/${order.ordercart[0].filenum}/1'/>"> 
										${order.ordercart[0].proname}
										<c:if test="${fn:length(order.ordercart) >1}">
										 	외 ${fn:length(order.ordercart)-1}개의 상품
										 </c:if>
									</a>
								</td>
								<td>
									<fmt:formatDate value="${order.orderdate}" pattern="YY/MM/dd hh:mm" />
								</td>
								<td>
									<select id="status${order.ordernum}"  ${order.orderstatus == 'completedelivery' || order.orderstatus=='ordercancel' || order.orderstatus=='exchange' || order.orderstatus=='refund' ? 'disabled' : '' }>
										<c:if test="${order.orderstatus == 'waitdeposit' ? true : false}">
											<option value="completedeposit" ${order.orderstatus == 'waitdeposit' ? 'selected' : ''}>입금대기</option>
										</c:if>
										<c:if test="${order.orderstatus == 'waitdeposit' || order.orderstatus == 'completedeposit' ? true : false}">
											<option value="completedeposit" ${order.orderstatus == 'completedeposit' ? 'selected' : ''}>입금완료</option>
										</c:if>
										<c:if test="${order.orderstatus == 'completedeposit' || order.orderstatus == 'waitdelivery' ? true : false}">
											<option value="waitdelivery" ${order.orderstatus == 'waitdelivery' ? 'selected' : ''}>출고준비중</option>
										</c:if>
										<c:if test="${order.orderstatus == 'waitdelivery' || order.orderstatus == 'ontheboard' ? true : false}">
											<option value="ontheboard" ${order.orderstatus == 'ontheboard' ? 'selected' : '' }>배송중</option>
										</c:if>
										<c:if test="${order.orderstatus == 'ontheboard' || order.orderstatus == 'completedelivery' ? true : false }">
											<option value="completedelivery" ${order.orderstatus == 'completedelivery' ? 'selected' : '' }>배송완료</option>
										</c:if>
										<c:if test="${order.orderstatus == 'ordercancel' ? true : false }">
											<option value="completedelivery" ${order.orderstatus == 'ordercancel' ? 'selected' : '' }>주문취소</option>
										</c:if>
										<c:if test="${order.orderstatus == 'exchange' ? true : false }">
											<option value="completedelivery" ${order.orderstatus == 'exchange' ? 'selected' : '' }>교환요청</option>
										</c:if>
										<c:if test="${order.orderstatus == 'refund' ? true : false }">
											<option value="completedelivery" ${order.orderstatus == 'refund' ? 'selected' : '' }>환불요청</option>
										</c:if>
									</select>
								</td>
								<td>
									<input type="text" id="track${order.ordernum}" placeholder="현재는 입력할 수 없습니다." value="${order.deliverytracknum}" readonly>
									<c:if test="${order.orderstatus == 'ontheboard' || order.orderstatus == 'completedelivery' || order.orderstatus == 'refund' || order.orderstatus == 'exchange' }">
										<button type="button" id="btn-del-info" class="${order.ordernum}">배송정보보기</button>
									</c:if>
								</td>
									<td>
										<button ${ (order.orderstatus == 'completedelivery' || order.orderstatus == 'refund' || order.orderstatus =='ordercancel' || order.orderstatus == 'exchange') ? 'disabled' : ''} id="${order.ordernum}" type="button" onclick="updateOrder(this)">${ (order.orderstatus == 'completedelivery' || order.orderstatus == 'refund' || order.orderstatus =='ordercancel' || order.orderstatus == 'exchange') ? '수정불가' : '수정하기'}</button>
									</td>
							</form>
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
                      <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
                      <input type="hidden" name="keyword" value="${pc.paging.keyword}">
                      <input type="hidden" name="condition" value="${pc.paging.condition}">
    			</form>
				<!-- 페이징 처리 끝 -->
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17136e4884602adf06d712c2e104879b&libraries=services"></script>
	<script>
    
        $(function(){
        	
        	// 배송 정보보기 대한통운 띄우기
            $('#btn-del-info').click(function(){
            	let ordernum = $('#btn-del-info').attr('class');
                window.open('http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=' + $('#track'+ordernum).val(), '사용자 배송정보', 'width=600, height=700, scrollbars=yes, resizable=no')
            });
        	
        	
            // 상품 가격 이쁘게 띄우기
            for(let ttp of $('.order-ttp')){
            	ttp.textContent = ttp.textContent.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
            }
            console.log($('input[name="deliverytracknum"]').length);
            
            
            // 배송중으로 변경하려면 운송장 번호 띄울 것.
            $('.table').on('change', 'select', function(e){
            	if(e.target.value === 'ontheboard'){
            		ordernum = e.target.getAttribute('id').replace('status', '');
            		$('#track'+ordernum).attr('readonly', false);
            		$('#track'+ordernum).attr('placeholder', '대한통운 운송장번호 입력');
            		$('#track'+ordernum).focus();
            	}
            });
            
            
            // 상세보기 클릭시 상세보기 팝업 띄움 
            $('.table').on('click', '.btn-detail', function(e){
            	e.preventDefault();
            	ordernum = e.target.getAttribute('href');
            	userid = $('#id'+ordernum).text(); 
            	window.open('<c:url value="/ordering/orderDetail/' + ordernum + '/'+ userid +'"/>', '주문 상세보기', 'width=1000, height=700, scrollbars=yes, resizable=no');
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
          
            
            
            
            
        }); //end jQuery
        
        
        // 주문 상태 수정 클릭 함수
        function updateOrder($input){
        	if(confirm('한번 주문상태를 수정하면 이전의 주문상태로 돌릴수 없습니다.\n수정하는 정보가 확실하십니까?')){
	        	let ordernum = $input.getAttribute('id');
	        	let orderstatus = document.querySelector('#status' + ordernum).value;
	        	const $form = document.querySelector('form[name="'+ordernum+'"]');
	        	if($('#track'+ordernum).attr('readonly')){
	        		$form.setAttribute('action','<c:url value="/ordering/orderModify/' + ordernum + '/' + orderstatus + '/' + 0 + '"/>');
	        	}else{
	        		// 숫자와 하이픈만 입력 가능케하는 정규식
	        		
	        		if(/[^0123456789-]/g.test( $('#track'+ordernum).val() ) ){
	        			alert('\"숫자\" 또는 \"숫자 + 하이픈\" 으로 입력 해주세요.');
	        			$('#track'+ordernum).focus();
	        			return;
	        		}else if($('#track'+ordernum).val()===''){
	        			alert('운송장번호를 입력해주세요.');
	        			$('#track'+ordernum).focus();
	        			return;
	        		}
	        		tracknum = $('#track'+ordernum).val().replaceAll('-','');
	        		$form.setAttribute('action','<c:url value="/ordering/orderModify/' + ordernum + '/' + orderstatus + '/' + tracknum + '"/>');
	        	}
	        	$form.submit();
        	}
        }
        
        
		
    </script>

</body>
</html>