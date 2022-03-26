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
    <title>exchangeRefund</title>
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    
    <style>

        @font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'S-CoreDream-4Regular';
        }

        .container {
            min-width: 1200px;
            margin-top: 100px;
        }

        .ex-img {
        	
            min-width: 100px;
            width: 100px;
            
        }

        .ex-title {
            margin: 50px 0 30px 0;
            font-size: 34px;
            font-weight: bold;
        }

        .ex-guide {
            margin: 10px 0;
            width: 550px;
            font-size: 13px;
            line-height: 20px;
            color: #555555;
        }

        hr {
            border-top: 1px solid #bbb;
            border-bottom: 1px solid #fff;
        }
		.container > .row > .col-xs-12 > .table > tbody > tr > td{
			vertical-align: baseline;
		}
		
        .btn-guide-text {
            font-size: 20px;
            margin: 50px 0;
        }

        .checkbox-ex {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .checkbox-ref {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .checkbox-ex + div,
        .checkbox-ref +div {
            display: inline-block;
            font-size: 17px;
            margin-left: 7px;
            box-sizing: border-box;
        }

        .checkbox-ex + div {
            margin-right: 10px;
        }

        /* 테이블 */

        .info-table {
            margin: 30px 0;
        }

        .ex-apply {
            width: 160px;
            padding: 15px;
            margin: 20px 0 30px 400px;
            background: #BFBFBF;
            color: #fff;
        }

        .pre-page {
            width: 160px;
            padding: 15px;
            margin: 20px 0 30px 0;
            background: #000;
            color: #fff;
        }

        .detail-reason,
        .input-account,
        .input-addr {
            border: 1px solid #ddd;
            padding: 0 5px;
            width: 160px;
        }

        .btn-addr {
            margin-left: 4px;
            padding: 3px 10px;
            background: #BFBFBF;
            color: #fff;
        }

        .ex-table {
            display: none;
        }

        .ref-table {
            display: none;
        }

        .all-select {
            margin-left: 21px;
        }

        @font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
		.btn-addr{
			position:absolute;
			right: 295px;
			bottom: 260px;
			background: black;
			color:white;
			border:none;
		}
		input:read-only{
			background: #dfdfdf;
			border : 1px solid rgb(118, 118, 118);
		}
		input[type='text']{
			width: 250px;
			border : 1px solid #ddd;
		}
		input[type='tel']{
			border : 1px solid #ddd;
		}
		select{
			border : 1px solid #ddd;
		}
		#exApply{
			background: white;
			color:black;
			border: 1px solid black;
		}
		
    </style>
</head>
<body>
 
 	<%@ include file="../include/header.jsp" %>
            
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <p class="ex-title">교환/환불</p>
                <ul class="ex-guide">
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 교환/환불은 제품 수령일로부터 7일 이내에 신청 가능합니다.
                    </li>
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 고객님의 단순 변심에 의한 교환/환불 배송료는 고객님 부담입니다.
                    </li>
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 상품 초기 불량은 무상수리 또는 교환해 드립니다.
                    </li>
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 소비자 부주의에 의한 제품 손상 및 세탁 부주의로 인한 변형, 파손된 제품은<br>교환 / 환불의 사유가 되지 않습니다
                    </li>
                    <li>
                        <i class="fa-solid fa-angle-right"></i> 특별한 이유 없이 이미 사용한 상품에 대해서는 변덕으로 인한 사유로 교환/ 환불이 불가하오니 주의 바랍니다.
                    </li>
                </ul>

                <hr>

                <p class="btn-guide-text">
                    교환 또는 반품을 선택하시고 그에 맞는 양식을 작성하여 신청해주세요.
                </p>
                <input type="checkbox" id="exCheck" class="checkbox-ex"><div>교환</div>

                <input type="checkbox" id="refCheck" class="checkbox-ref"><div>반품</div>

                <table class="info-table table text-center align-middle">
                    <thead>
                        <tr>
                            <td class="col-md-2">
                                주문일자
                                [주문번호]
                            </td>
                            <td class="col-md-1"></td>
                            <td class="col-md-4">상품정보</td>
                            <td class="col-md-1">수량</td>
                            <td class="col-md-2">상품구매금액</td>
                        </tr>
                    </thead>
                    <tbody id="infoTbody">
                    	<c:forEach var="cart" items="${cartList}" varStatus="status">
	                        <tr>
	                            <td class="col-md-2">
	                            	<fmt:formatDate value="${order.orderdate}" pattern="YYYY-MM-dd" />
	                                <br>
	                                [${order.ordernum}]
	                            </td>
	                            <td class="col-md-1">
	                                <img src="<c:url value='/loadimg/display/${cart.filenum}/1'/>" class="ex-img" alt="상품이미지">
	                            </td>
	                            <td class="col-md-4">${cart.proname}</td>
	                            <td class="col-md-1">${cart.cartamount}</td>
	                            <td class="col-md-2">${cart.carttotalprice}</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>


                <!-- 사용자가 교환을 체크했을 경우 -->
                <table id="exTable" class="ex-table table text-left align-middle">
                    <caption>교환사유</caption>
                    <tbody class="text-center w-auto align-middle">
                    	<tr>
                            <td></td>
                            <td>
                            <i class="fa-solid fa-angle-right"></i>교환 요청시 아래 입력하시는 수취인 정보로 새로운 주문으로 접수됩니다.<br>
                            	<i class="fa-solid fa-angle-right"></i>주문시 입력하셨던 수취인 정보로 대한통운으로 자동 반품신청됩니다.<br>
                            	<i class="fa-solid fa-angle-right"></i>아래 계좌로 배송비 3천원을 입금해주시면 교환건의 배송이 시작됩니다.<br>
                            	하나은행 : 748-910999-66507 / 예금주 : 카페앨리
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="col-xs-2">*사유선택</td>
                            <td class="col-xs-10">
                                <select id="exSelReason" name="refundreason1">
                                    <option value="select-option">선택해주세요</option>
                                    <option value="wrong-sending">오배송</option>
                                    <option value="different-info">상품정보 상이</option>
                                    <option value="missing-prize">상품 누락</option>
                                    <option value="change-mind">단순변심</option>
                                </select>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>상세사유</td>
                            <td>
                                <input class="detail-reason" type="text" name="refunddetailreason1">
                            </td>
                            
                        </tr>
                        <tr>
                            <td>*받으시는 분</td>
                            <td>
                                <input id="exInputName" class="input-addr" type="text" placeholder="이름을 입력하세요." name="deliveryname">
                            </td>
                            
                        </tr>
                        <tr>
                            <td>*우편주소</td>
                            <td>
                                <input id="exInputPost" class="input-addr" type="text" name="deliverypostnum" placeholder="우편번호 검색을 이용해주세요" readonly>
                                <button class="btn-addr" onclick="searchAddress()"><span>우편번호검색</span></button>
                            </td>
                        </tr>
                        <tr>
                            <td>*기본주소</td>
                            <td>
                                <input id="exInputAddr" class="input-addr" type="text" name="deliverybasicaddr" readonly>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>상세주소</td>
                            <td>
                                <input id="exInputDetailAddr" class="input-addr" type="text" name="deliverydetailaddr" readonly>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td><select class="phone" name="deliveryphone1">
									<option>010</option>
									<option>011</option>
									<option>018</option>
							</select> - <input type="tel" name="deliveryphone2" style="width:50px">
								- <input type="tel" name="deliveryphone3" style="width:50px"></td>
                            
                        </tr>
                    </tbody>
                </table>
				
                <!-- 사용자가 반품을 체크했을 경우 -->
                <table id="refTable" class="ref-table table text-center align-middle">
                    <caption>반품사유</caption>
                    <tbody>
                    	<tr>
                            <td></td>
                            <td>
                            <i class="fa-solid fa-angle-right"></i>반품 요청시 아래 입력하시는 계좌정보로 3일이내로 환불됩니다.<br>
                            <i class="fa-solid fa-angle-right"></i>주문시 입력하셨던 수취인 정보로 대한통운으로 자동 반품수거신청됩니다.<br>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="col-md-2">사유선택</td>
                            <td class="col-md-10">
                                <select id="refSelReason" name="refundreason">
                                    <option value="none">선택해주세요</option>
                                    <option value="wrong-sending">오배송</option>
                                    <option value="different-info">상품정보 상이</option>
                                    <option value="missing-prize">상품 누락</option>
                                    <option value="change-mind">단순변심</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>상세사유</td>
                            <td>
                                <input class="detail-reason" type="text" name="refunddetailreason">
                            </td>
                        </tr>
                        <tr>
                            <td>은행명</td>
                            <td>
                                <select id="refSelBank" name="refundbankname">
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
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>환불계좌</td>
                            <td>
                                <input id="refInputAcnt" class="input-account" type="text" placeholder="하이픈(-) 없이 입력" name="refundbank">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn-wrap">
                    <button id="exApply" class="ex-apply" >신청하기</button>&nbsp;&nbsp;<button class="pre-page" type="button" onclick="history.back()">이전페이지</button>
                	</div>
             
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>

        $(function(){

            const getNumCheck = RegExp(/[0-9]/); // 숫자 

            
            // 전체선택 클릭 이벤트
            $('#select_all').click(function() {
                // console.log('전체 선택이 클릭됨!');
                if($('#select_all').is(':checked')) {
                    $('input[id=input-cbox]').prop('checked', true);
                } else {
                    $('input[id=input-cbox]').prop('checked', false);
                }
            }); // 전체 선택 클릭 시 발동 이벤트 끝

            // checkbox들이 전부 선택되면 전체선택박스가 checked되는 이벤트
            $('input[id=input-cbox]').click(function() {
                const total = $('input[id=input-cbox]').length;
                const checked = $('input[id=input-cbox]:checked').length;
                // console.log('total: ' + total);
                // console.log('checked: ' + checked);

                if(total != checked) {
                    $('#select_all').prop('checked', false);
                } else {
                    $('#select_all').prop('checked', true);
                }
            });// 전체선택박스 checked 이벤트 끝

            //교환을 체크할 시 교환 테이블만 보여주기
            $('#exCheck').click(function(){
                if($('input[id=exCheck]').is(':checked')) {
                    $('table[id=exTable]').css('display', 'block');
                    $('table[id=exTable]').css('width', '1000px');
                    $('table[id=exTable]').css('margin', '50px 0 30px 320px');
                    
                    $('table[id=refTable]').css('display', 'none');
                    $('input[id=refCheck]').prop('checked', false);
                } else {
                    $('table[id=exTable]').css('display', 'none');
                }
            });//교환 체크 이벤트 끝

            //반품을 체크할 시 반품 테이블만 보여주기
            $('#refCheck').click(function(){
                if($('input[id=refCheck]').is(':checked')) {
                    $('table[id=refTable]').css('display', 'block');
                    $('table[id=refTable]').css('width', '1000px');
                    $('table[id=refTable]').css('margin', '50px 0 30px 350px');

                    $('input[id=exCheck]').prop('checked', false);
                    $('table[id=exTable]').css('display', 'none');
                } else {
                    $('table[id=refTable]').css('display', 'none');
                }
            });//반품 체크 이벤트 끝

            //신청하기 버튼 유효성 검사
            $('#exApply').click(function(){
               if(!$('#exCheck').is(':checked')&&!$('#refCheck').is(':checked')) {
                    alert('교환/반품 양식을 작성해 주세요.');

                } else if($('#exCheck').is(':checked')) {//교환을 선택할 경우
                    if ($('#exSelReason').val() === 'none'|| $('#exInputAddr').val() === '' || $('#exInputName').val() === '') {
                        alert('정보를 빠짐없이 기입해 주세요.');
                        return;
                    } else if (!getNumCheck.test($('input[name="deliveryphone2"]').val()) || !getNumCheck.test($('input[name="deliveryphone3"]').val()) ) {
                        alert('휴대폰 번호는 숫자로만 입력해 주세요.');
                        return;
                    }
                	
                	$.ajax({
                		type : 'post',
                		url : '<c:url value="/ordering/exchangeRefund"/>',
                		contentType : 'application/json',
                		data : JSON.stringify({
                			'ordernum' : ${order.ordernum},
                			'refundreason' : $('select[name="refundreason1"]').val(),
                			'refunddetailreason' : $('input[name="refunddetailreason1"]').val(),
                			'deliveryname' : $('input[name="deliveryname"]').val(),
                			'deliverypostnum' : $('input[name=deliverypostnum]').val(),
                			'deliverybasicaddr' : $('input[name="deliverybasicaddr"]').val(),
                			'deliverydetailaddr' : $('input[name="deliverydetailaddr"]').val(),
                			'deliveryphone1' : $('select[name="deliveryphone1"]').val(),
                			'deliveryphone2' : $('input[name="deliveryphone2"]').val(),
                			'deliveryphone3' : $('input[name="deliveryphone3"]').val()
                		}),
                		success : function(result){
                			if(result === 'exrfSuccess'){
                				alert('교환이 요청되었습니다.');
                				location.href='<c:url value="/user/orderDelHistory"/>'
                			}
                		},
                		error : function(){
                			alert('교환요청을 할 수 없습니다. 관리자에게 문의해주세요')	
                		}
                	});
                } else if($('#refCheck').is(':checked')) {//반품을 선택할 경우
                    if ($('#refSelReason').val() === 'none' || $('#refSelBank').val() === 'none' || $('#refInputAcnt').val() === '') {
                        alert('정보를 빠짐없이 기입해 주세요.');
                        return;
                    } else if(!getNumCheck.test($('#refInputAcnt').val())) {
                        alert('운송장 번호와 계좌번호는 숫자로만 입력해 주세요.');
                        return;
                    }
                
                    $.ajax({
                		type : 'post',
                		url : '<c:url value="/ordering/exchangeRefund"/>',
                		contentType : 'application/json',
                		data : JSON.stringify({
                			'ordernum' : ${order.ordernum},
                			'refundreason' : $('select[name="refundreason"]').val(),
                			'refunddetailreason' : $('input[name="refunddetailreason"]').val(),
							'refundbankname' : $('select[name="refundbankname"]').val(),
							'refundbank' : $('input[name="refundbank"]').val()
                		}),
                		success : function(result){
                			if(result === 'exrfSuccess'){
                				alert('환불이 요청되었습니다.');
                				location.href='<c:url value="/user/orderDelHistory"/>'
                			}
                		},
                		error : function(){
                			alert('환불요청을 할 수 없습니다. 관리자에게 문의해주세요')	
                		}
                	});
                
                
                }
            });

        });//end jQuery
        
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