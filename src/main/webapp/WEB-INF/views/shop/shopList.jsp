<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>shopList</title>

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

.container {
	min-width: 1200px;
	margin-top: 170px;
}

section {
	display: block;
	width: 90%;
	margin: 50px auto;
	min-height: 800px;
}

.row>span, .row>span>a {
	color: #555555;
	font-size: 13px;
}

.row>span>a.crt-page {
	font-weight: bold;
}

.prod-list-inner img {
	width: 270px;
	height: 300px;
}

li {
	margin: 20px 0;
}

/* li:hover {
        } */
.prod-content {
	padding: 15px 0;
}

.prod-content .info span {
	display: block;
}

.prod-content .info, .prod-content .price {
	text-align: center;
	margin-top: 15px;
}

.clearfix::after {
	content: '';
	display: block;
	clear: both;
}
</style>

</head>
<body>

	<%@ include file="../include/header.jsp" %>

	<section class="container">
		<ul class="row">
			<span>
				<a href="#">Home</a> &#707; 
				<a href="#">쇼핑몰(사업자전용)</a>&#707; 
				<a href="#" class="crt-page">원두</a>
			</span>
			<hr>
			<c:forEach var="shop" items="${shopList}" varStatus="status">				
				<li class="col-xs-3">
					<div class="prod-list-inner">
						<a href="<c:url value='/shop/shopDetail/${shop.bno}'/>"><img src="${pageContext.request.contextPath}/loadimg/display/${shop.filenum}/1" alt="상품 게시글 이미지"></a>
						<div class="prod-content clearfix">
							<div class="info">
								<span>${shop.title}</span>
							</div>
							<div class="price">
								<strong>${sellPriceList[status.index]}원</strong>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>				
		</ul>
	</section>
	
	<%@ include file="../include/footer.jsp" %>
	
	<script>
	let msg = '${msg}';
	if(msg !== ''){
		alert(msg);
	}
	
	</script>
	
	
</body>
</html>