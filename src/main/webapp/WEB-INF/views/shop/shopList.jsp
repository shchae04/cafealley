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
	min-width: 1000px;
	max-width: 1000px;
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
#order{
float: right;
}

</style>

</head>
<body>

	<%@ include file="../include/header.jsp" %>

	<section class="container">
		<ul class="row">
			<span>
				<a href="<c:url value='/'/>">Home</a> &#707; 
				<a href="<c:url value='/shop/shopList'/>">Owner Mall</a>
				<c:if test = "${pc.paging.condition != '' }">&#707; 
				<a href="<c:url value='/shop/shopList?condition=${pc.paging.condition}'/>" class="crt-page">
				${pc.paging.condition =='beans' ?'원두' :
				  pc.paging.condition == 'tea' ? '티/액상차' :
				  pc.paging.condition == 'milk' ? '유제품' : 
				  pc.paging.condition == 'syrup' ? '시럽/소스':
				  pc.paging.condition == 'powder' ? '파우더/농축액' : '커피용품, 머신'}
				</a>
				</c:if>
			</span>
			<span>
				<select id="order">
					<option selected value="latest" ${pc.paging.keyword == 'lastest' ? 'selected' : '' } >최신순</option>
					<option value="oldest" ${pc.paging.keyword == 'oldest' ? 'selected' : '' } >오래된 순</option>
					<option value="hit" ${pc.paging.keyword == 'hit' ? 'selected' : '' }>조회수 순</option>
					<option value="pricelow" ${pc.paging.keyword == 'pricelow' ? 'selected' : '' }>가격 낮은 순</option>
					<option value="pricehigh" ${pc.paging.keyword == 'pricehigh' ? 'selected' : '' }>가격 높은 순</option>
				</select>
			</span>
			<hr>
			
			<div class="divforleft">
				<form action="<c:url value='/shop/shopList'/>" method="get" name="catForm">
				<p>종류</p>
				<ul class="select-category">
					<li><a href="" style="${pc.paging.condition == '' ? 'font-weight: 700;' : '' }">전체</a></li>
					<li><a href="beans" style="${pc.paging.condition == 'beans' ? 'font-weight: 700;' : '' }">원두</a></li>
					<li><a href="tea" style="${pc.paging.condition == 'tea' ? 'font-weight: 700;' : '' }">티/액상차</a></li>
					<li><a href="milk" style="${pc.paging.condition == 'milk' ? 'font-weight: 700;' : '' }">유제품</a></li>
					<li><a href="syrup" style="${pc.paging.condition == 'syrup' ? 'font-weight: 700;' : '' }">시럽/소스</a></li>
					<li><a href="powder" style="${pc.paging.condition == 'powder' ? 'font-weight: 700;' : '' }">파우더/농축액</a></li>
					<li><a href="coffeemachine" style="${pc.paging.condition == 'cofeemachine' ? 'font-weight: 700;' : '' }">커피용품, 머신</a></li>
				</ul>
					<input type="hidden" name="condition" id="cfcondition" value="">
					<input type="hidden" name="keyword" id="cfkeyword" value="">
				</form>
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
		<div class="text-center">
				<!-- 페이징 처리 부분  -->
               	<form action="<c:url value='/shop/shopList'/>" name="pageForm">
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
	
	$(function(){
		// 페이징
		$('#pagination').on('click', 'a', function(e) {
    			e.preventDefault();
    			console.log($(this));
    			const value = $(this).data('pagenum');
    			console.log(value);
    			document.pageForm.pageNum.value = value;
    			document.pageForm.submit();
    		});
      
		// 카테고리 클릭하면
		$('.select-category').on('click', 'li>a', function(e){
			e.preventDefault();
			let condition = e.target.getAttribute('href');
			let keyword = $('#order').val()
			console.log('카테 바꿔서 정해진 condition : ' + condition);
			console.log('카테 바꿔서 정해진 keyword : ' + keyword);
			$('#cfcondition').val(condition);
			$('#cfkeyword').val(keyword);
			document.catForm.submit();
		});
		
		// 정렬 바꾸면
		$('#order').on('change', function(e){
			let condition;
			for(let a of document.querySelectorAll('.select-category > li > a')){
				console.log(a.style.fontWeight);
				if(a.style.fontWeight === 700){
					condition = a.getAttribute('href');
				}
			}
			let keyword = $('#order').val();
			console.log('정렬 바꿔서 정해진 condition : ' + condition);
			console.log('정렬 바꿔서 정해진 keyword : ' + keyword);
			$('#cfcondition').val(condition);
			$('#cfkeyword').val(keyword);
			document.catForm.submit();		 
		});
	});
	
	
	</script>
	
	
</body>
</html>