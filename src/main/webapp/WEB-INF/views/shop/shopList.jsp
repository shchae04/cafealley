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

.row li {
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

.divforleft {
	width: fit-content;
	height: fit-content;
	text-align: center;
	display: block;
	float: left;
	margin-left: -200px;
}

.divforleft>ul>li {
	padding: 10px;
	border-top: 2px solid black;
}

.divforleft p {
	display: block;
	width: fit-content;
	margin: 0 auto 10px;
	font-size: 20px;
	font-weight: 900;
}

.select-category a {
	color: black;
}

</style>

</head>
<body>

	<%@ include file="../include/header.jsp" %>

	<section class="container">
		<ul class="row">
			<span>
				<a href="<c:url value='/'/>">Home</a> &#707; 
				<a href="<c:url value='/shop/shopList'/>">Owner Mall</a>&#707; 
				<a href="#" class="crt-page">원두</a>
			</span>
			<hr>
			<div class="divforleft">
				<p>종류</p>
				<ul class="select-category">
					<li><a href="all">전체</a></li>
					<li><a href="beans">원두</a></li>
					<li><a href="tea">티/액상차</a></li>
					<li><a href="milk">유제품</a></li>
					<li><a href="syrup">시럽/소스</a></li>
					<li><a href="powder">파우더/농축액</a></li>
					<li><a href="coffeemachine">커피용품, 머신</a></li>
				</ul>
			</div>
			<c:forEach var="shop" items="${shopList}" varStatus="status">				
				<li class="col-xs-3">
					<div class="prod-list-inner">
						<a href="<c:url value='/shop/shopDetail/${shop.bno}'/>"><img src="${pageContext.request.contextPath}/loadimg/display/${shop.filenum}/1" alt="상품 게시글 이미지"></a>
						<div class="prod-content clearfix">
							<div class="info">
								<span>${shop.title}</span>
							</div>
							<div class="price">
								<strong>${sellPriceList[status.index]}</strong>
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
	
	window.onload = function(){
		for(let div of document.querySelectorAll('.price')){
			console.log(div);
			div.children[0].textContent = div.children[0].textContent.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '원';
		}
	};
	
	
	</script>
	
	
</body>
</html>