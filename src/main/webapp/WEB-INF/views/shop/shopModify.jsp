<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>shopDetail</title>

<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">

 <style>
 		*,
 		*:focus{
 			outline:none;
 		}
        body {
            width: 100%;
        }

        section {
            display: block;
            width: 90%;
            margin: 50px auto;
            padding-left: 120px;
            min-height: 3100px;
        }

        .container {
            min-width: 1200px;
            margin-top: 200px;
        }

        .row {
            border-top: 2px solid black;
            min-width: 1100px;
            max-width: 1100px;

        }

        .detail-info {
            margin: 30px 0 30px 0;
            margin-left: -80px;
        }

        .prod-img {
            margin-top: 30px;
            width: 450px;
        }
        .prod-img img{
            max-width: 420px;
            min-width: 420px;
        }

        .prod-detail img {
            max-width: 600px;
            min-width: 600px;
            display: block;
            margin: 0 auto;
        }

        .detail-info .title {
            font-size: 20px;
            font-weight: 900;
        }

        .detail-info .price {
            border-top: 1px solid black;
        }

        .detail-info input[type="text"] {
            border: 1px solid #ddd;
            width: 40px;
            position: relative;
        }

        .org-price,
        .sell-price,
        .quantity {
            margin-top: 30px;
        }

        .quantity {
            margin-bottom: 20px;
        }

        .detail-info .delivery {
            display: inline;
        }

        .detail-info .prod-text {
            color: gray;
            font-size: 13px;
            display: inline-block;
            width: 100px;
        }

        .detail-info input[type="text"] {
            cursor: default;
        }
        

        .prod-sel .prod-text{
            margin: 30px 0;
        }

        /* shopwrite */
        .detail-info input[type="text"]{
            margin: 5px 5px;
            width: 100px;
        }
        .detail-info input[type="text"].title{
            width: 500px;
            height: 50px;
            text-indent: 10px;
        }

        .prod-detail {
            border-top: 2px solid black;
            margin: 50px 0;
            padding-top: 50px;
            min-height: 2300px;
        }

        .product {
            width: 600px;
        }
        

        .product tr td img {
            display: inline;
        }

        .product tr th,
        .product tr td {
            border-bottom: 1px solid black;
            text-align: center;
            margin-bottom: 20px;
            line-height: 60px;
            min-height: 61px;
        	max-height: 61px !important;
            padding: 0 10px;
            font-size: 12px;
        }

        .product tr th {
            font-weight: 700;
            font-size: 14px;
        }

        .product tr td.large-cell {
            width: 150px;
        }

        .prod-img input[type="file"],
        .prod-detail input[type="file"] {
            width: 420px;
            height: 420px;
            position: absolute;
            background: transparent;
            color: transparent;
            z-index: 999;
            outline: none;
        }

        .prod-img input[type="file"]::-webkit-file-upload-button,
        .prod-detail input[type="file"]::-webkit-file-upload-button {
            display: none;
        }

        .prod-img label,
        .prod-detail label {
            width: 420px;
            height: 420px;
            border: 1px solid #ddd;
            float: right;
            z-index: 1;
            font-size: 10px;
            text-align: center;
            pointer-events: none;
            padding-top: 100px;
            font-size: 30px;
            margin-right:100px;
			outline: none;
        }
        .prod-img input[type="file"]:focus,
        .prod-detail input[type="file"]:focus,
        .prod-img label:focus,
        .prod-detail label:focus{
        	outline: none;
        }

        .prod-detail input[type="file"]{
            position: absolute;
            width: 600px;
            height: 600px;
        }
        .prod-detail #img2{
            top: 50px;
            left: 250px;
        }
        .prod-detail #img3{
            top: 700px;
            left: 250px;
        }

        .prod-detail label {
            position: absolute;
            width: 600px;
            height: 600px;
            padding-top: 200px;
        }
        .prod-detail label[for="img2"]{
            top: 50px;
            left: 250px;
        }
        .prod-detail label[for="img3"]{
            top: 700px;
            left: 250px;
        }
        .prod-detail .prod-detail-textarea{
            border: 1px solid black;
            resize: none;
            position: absolute;
            top: 1350px;
            left: 150px;
            width: 800px;
            height: 600px;
            padding: 10px;
        }

        .upper-bar,
        .lower-bar {
            display: block;
            width: 100%;
            height: 70px;
            border-bottom: 2px solid white;
            background-color: black;
        }
        .lower-bar {
            position: absolute;
            width: 1100px;
            top: 3150px;
        }

        .divforright {
            width: fit-content;
            height: fit-content;
            text-align: center;
            display: block;
            float: right;
            background-color: black;
        }

        .btn-regist,
        .btn-cancel,
        .btn-remove {
            width: fit-content;
            height: 50px;
            margin: 0 0 10px 10px;
            padding: 15px;
            display: inline-block;
            background-color: black;
            color:white;
            font-size: 20px;
        }
        .btn-regist,
        .btn-cancel,
        .btn-remove {
            background: black;
            color: white;
            font-size: 18px;
        }

        .btn-regist:hover,
        .btn-cancel:hover,
        .btn-remove:hover {
            font-style: italic;
        }
        .btn-cancel{
        	position:relative;
        	right:830px;
        }
        .largefont{
            font-weight: 900;
            font-size: 20px;
        }    
        
		.center{
			margin-left: -100px;
		}
		.div-min-height{
			min-height:825px;
			max-height:825px;
		}
		.title::placeholder{
			
		}
		
        /* --------------------------------- */
    </style>

</head>

<body>

	<%@ include file="../include/header.jsp"%>

    <section>
        <div class="container">
            
            <div class="row">
            	<form action="<c:url value='/shop/shopModify'/>" name="updateForm" method="post">
	                <div class="upper-bar clearfix">
	                    <div class="divforright">
	                        <button class="btn-cancel" onclick="history.back()">취소</button>
	                        <button class ="btn-remove" type="button"><span class="glyphicon glyphicon-remove"></span>삭제</button>
	                        <button class="btn-regist" type="button"> <span class="glyphicon glyphicon-ok"></span>수정</button>
	                    </div>
	                </div>
	                <input type="hidden" name="bno" value="${shop.bno}">
	                <div class="col-xs-6 prod-img">
	                    <img src="${pageContext.request.contextPath}/loadimg/display/${shop.filenum}/1" alt="prod-detail" onerror="deleteimg(this)">
	                </div>
	                <div class="col-xs-6 div-min-height">
	                    <div class="detail-info">
	                        <p style="font-weight: 700;">
	                            판매 게시글 제목<br>
	                            <input type="text" name="title" class="title" placeholder="150자 이내로 판매게시글의 제목을 입력해주세요." value="${shop.title}">
	                        </p>
	                        <p class="price">
	                            <p class="org-price">
	                                <span class="prod-text">정가</span> <span><s id="proprice">${leastPro.proprice}</s></span>원
	                            </p>
	                            <p class="sell-price">
	                                <span class="prod-text">판매가</span> <strong><span id="prosellprice">${leastPro.prosellprice}</span>원</strong>
	                            </p>
	                        </p>
	                        <p class="quantity">
	                            <!-- <span class="prod-text">주문수량</span><input type="number" name="" id="" value="1" min="1"><br> -->
	                        </p>
	                        <p class="delivery">
	                            <span class="prod-text">배송비</span> <strong>3,000원</strong>
	                        </p>
	                        <p class="prod-sel">
	                            <span class="prod-text">판매할 상품 목록</span>
							</p>
                            <table class="product">
                                <thead>
                                    <tr>
                                        <th>이미지</th>
                                        <th>카테고리</th>
                                        <th>상품번호</th>
                                        <th class="large-cell">상품명</th>
                                        <th>정상가</th>
                                        <th>판매가</th>
                                        <th>재고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="product" items="${proList}" varStatus="status">
	                                    <tr>
	                                        <td><img src="${pageContext.request.contextPath}/loadimg/display/${product.filenum}/1" alt="상품이미지" style="width: 50px; height: 50px;">
	                                        </td>
	                                        <td>${product.procategory}</td>
	                                        <td>${product.prono}</td>
	                                        <td class= "large-cell">${product.proname }</td>
	                                        <td class= "proprice reg">${product.proprice}</td>
	                                        <td class= "prosellprice reg">${product.prosellprice}</td>
	                                        <td class= "stock reg">${product.prostock}</td>
	                                    </tr>
	                                    <input type="hidden" name="prono${status.first?'':'status.count'}" value="${product.prono}" />
                                	</c:forEach>
                                </tbody>
                            </table>
	                    </div>
	
	                    <p class="largefont center" style="margin-top: 100px;">판매 게시글 내용 입력</p>
	                </div>
	
	                <div class="col-xs-12 prod-detail">
	                   <img src="${pageContext.request.contextPath}/loadimg/display/${shop.filenum}/2" alt="prod-detail" onerror="deleteimg(this)">
						<img src="${pageContext.request.contextPath}/loadimg/display/${shop.filenum}/3" alt="prod-detail" onerror="deleteimg(this)">
	
	                    <textarea name="content" class="prod-detail-textarea" placeholder="1000자 이내로 판매게시글 설명을 입력해주세요." >${shop.content}</textarea>
	
	                </div>
	                <div class="lower-bar clearfix">
	                    <div class="divforright">
	                        <button class="btn-regist" type="button"> <span class="glyphicon glyphicon-ok"></span>수정</button>
	                    </div>
	                </div>
                </form> <!-- end form  --> 
            </div>
        </div>

        

    </section>


	<%@ include file="../include/footer.jsp" %>

	<script>
		// 이미지 로드 실패시 이미지태그 삭제
		function deleteimg($input){
			$input.remove();
		}
		
		const $delBtn = document.querySelector('.btn-remove');
		
		$delBtn.onclick = function() {
				console.log('누름');
				document.updateForm.setAttribute('action', '<c:url value="/shop/shopDelete"/>');
				document.updateForm.submit();	
		};
		
		
		// jqeury start
        $(function(){
        	
        	// 등록 버튼 클릭시 유효성검사 후 submit해주기.
        	$('.btn-regist').on('click',function(e){
        		// 타이틀 필수
        		if($('input[name="title"]').val() == ''){
        			alert('상품 게시글의 제목은 필수입니다.');
        			$('input[name="title"]').focus();
        			return;
        		}
        		
        		document.updateForm.submit();
        	});
        	
			$('#proprice').text($('#proprice').text().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			$('#prosellprice').text($('#prosellprice').text().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			
			
			for(let n of document.querySelectorAll('.reg')){
        		n.textContent = n.textContent.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        		if(n.classList.contains('proprice') || n.classList.contains('prosellprice')){
        			n.textContent = n.textContent + '원'; 
        		}
        	}
			
			
        });
	
    
    </script>
</body>

</html>