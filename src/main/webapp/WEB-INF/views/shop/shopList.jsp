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
			<span> <a href="#">Home</a> &#707; <a href="#">쇼핑몰(사업자전용)</a>
				&#707; <a href="#" class="crt-page">원두</a>
			</span>
			<hr>
			<li class="col-xs-3">
				<div class="prod-list-inner">
					<img src="../img/coffee1.jpg" alt="일리 미디움 원두 클래식 로스트">
					<div class="prod-content clearfix">
						<div class="info">
							<span>일리 원두 클래식 로스트</span>
						</div>
						<div class="price">
							<strong>199,000원</strong>
						</div>
					</div>
				</div>
			</li>
			<li class="col-xs-3">
				<div class="prod-list-inner">
					<img src="../img/coffee1.jpg" alt="일리 미디움 원두 클래식 로스트">
					<div class="prod-content clearfix">
						<div class="info">
							<span>일리 원두 클래식 로스트</span>
						</div>
						<div class="price">
							<strong>199,000원</strong>
						</div>
					</div>
				</div>
			</li>
			<li class="col-xs-3">
				<div class="prod-list-inner">
					<img src="../img/coffee1.jpg" alt="일리 미디움 원두 클래식 로스트">
					<div class="prod-content clearfix">
						<div class="info">
							<span>일리 원두 클래식 로스트</span>
						</div>
						<div class="price">
							<strong>199,000원</strong>
						</div>
					</div>
				</div>
			</li>
			<li class="col-xs-3">
				<div class="prod-list-inner">
					<img src="../img/coffee1.jpg" alt="일리 미디움 원두 클래식 로스트">
					<div class="prod-content clearfix">
						<div class="info">
							<span>일리 원두 클래식 로스트</span>
						</div>
						<div class="price">
							<strong>199,000원</strong>
						</div>
					</div>
				</div>
			</li>
			<!-- 그리드 한줄 끝-->
			<li class="col-xs-3">
				<div class="prod-list-inner">
					<img src="../img/coffee1.jpg" alt="일리 미디움 원두 클래식 로스트">
					<div class="prod-content clearfix">
						<div class="info">
							<span>일리 원두 클래식 로스트</span>
						</div>
						<div class="price">
							<strong>199,000원</strong>
						</div>
					</div>
				</div>
			</li>
			<li class="col-xs-3">
				<div class="prod-list-inner">
					<img src="../img/coffee1.jpg" alt="일리 미디움 원두 클래식 로스트">
					<div class="prod-content clearfix">
						<div class="info">
							<span>일리 원두 클래식 로스트</span>
						</div>
						<div class="price">
							<strong>199,000원</strong>
						</div>
					</div>
				</div>
			</li>
			<li class="col-xs-3">
				<div class="prod-list-inner">
					<img src="../img/coffee1.jpg" alt="일리 미디움 원두 클래식 로스트">
					<div class="prod-content clearfix">
						<div class="info">
							<span>일리 원두 클래식 로스트</span>
						</div>
						<div class="price">
							<strong>199,000원</strong>
						</div>
					</div>
				</div>
			</li>
			<li class="col-xs-3">
				<div class="prod-list-inner">
					<img src="../img/coffee1.jpg" alt="일리 미디움 원두 클래식 로스트">
					<div class="prod-content clearfix">
						<div class="info">
							<span>일리 원두 클래식 로스트</span>
						</div>
						<div class="price">
							<strong>199,000원</strong>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</section>
	
	<%@ include file="../include/footer.jsp" %>
	
	<script>
	let msg = '${msg}';
	if(msg !== null){
		alert(msg);
	}
	
	</script>
	
	
</body>
</html>