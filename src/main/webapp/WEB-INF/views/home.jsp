<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Cafe Alley</title>

<link rel="stylesheet" href="<c:url value='/css/mainstyle.css'/>">
<style>
		.carousel-inner > .item > a > img{
			min-width: 100%;
		}
		.clearfix::after {
            content: '';
            display: block;
            clear: both;
        }
    
        .container {
            min-width: 1200px;
            margin-top: 150px;
            margin-bottom: 50px;
        }
        
    	.blinking{ 
	    	-webkit-animation:blink 1.2s ease-in-out  alternate; 
	    	-moz-animation:blink 1.2s ease-in-out  alternate; 
	    	animation:blink 1.2s ease-in-out  alternate; 
    	}
    	@-webkit-keyframes blink{ 
    		0% {opacity:0;} 
    		100% {opacity:1;} 
    	} 
    	@-moz-keyframes blink{ 
    		0% {opacity:0;} 
    		100% {opacity:1;} 
    	} 
    	@keyframes blink{ 
    		0% {opacity:0;} 
    		100% {opacity:1;} 
    	}
    
    	.modal-content {
    		height: 680px;
    	}
        .promboard {
            display: block;
            margin-top: 150px;
            min-height: 5000px;
            min-width: 1200px;
        }
        a:focus{
            color:black;
        }
        li {
            list-style: none;
        }
        /* snsboard */
        
        .modalSection {
            position: relative;
            left: 300px;
            min-width: 900px;
            max-width: 900px;
            margin: 20px 0 0 0;
        }
                #contentDiv {
            margin: 0 0 0 calc(30vw - 300px);
            min-width: 940px;
            max-width: 940px;
            border-right: 1px solid #ddd;
            border-left: 1px solid #ddd;
            background-color: white;
            padding: 10px 20px;
            position: relative;
        }

        .cafeowner-menu {
            position: absolute;
            top: 15px;
            right: 15px;
        }

        .glyphicon-user {
            display: inline-block;
            height: 20px;
            padding-right: 15px;
            border-right: 1px solid black;
        }

        .glyphicon-pencil {
            display: inline-block;
            height: 20px;
            padding-left: 15px;
        }

        .content-wrapper {
            margin-top: 50px;
            width: 900px;
        }

        .title-inner {
            position: relative;
            padding: 15px 0;
            margin-top: 15px;
            border-top: 1px solid #ddd;
        }


        .title p,
        .profile p {
            font-weight: bolder;
        }

        .title-inner .profile {
            position: absolute;
            /*부모기준으로 위치지정 릴레이티브*/
            top: 15px;
            left: 0;
        }

        .title-inner .title {
            padding-left: 50px;
        }

        .image-inner {
            width: 900px;
        }

        .image-inner img {
            min-width: 900px;
            min-height: 600px;
            max-height: 600px;
        }

        .like-inner {
            position: relative;
            padding: 10px;
            margin-top: 10px;
            min-height: 40px;
            max-height: 40px;
            /* border-top: 1px solid #ddd; */
            border-bottom: 1px solid #ddd;

        }

        .like-inner img {
            width: 20px;
            height: 20px;
        }

        .like-inner .hashtag {
        	margin-top: 30px;
            position: absolute;
            top: 10px;
            right: 15px;
            padding: 0;
        }
        
        .like-inner .main {
        	margin-top: 5px;
            position: absolute;
            top: 0px;
            right: 15px;
            padding: 0;
        }

        .like-inner .hashtag li {
            float: left;
            padding-left: 5px;
            padding-right: 5px;
            font-size: 15px;
        }


        .like-inner .hashtag select {
            border-radius: 0;
            outline: none;
            border: 2px solid #000;
            font-size: 16px;
        }


        .link-inner {
            overflow: hidden;
            padding: 10px 0;
        }

        .link-inner a {
            float: left;
            width: 33.3333%;
            text-align: center;
            text-decoration: none;
            color: #333333;
        }

        .link-inner i {
            margin: 0 5px;
        }

        .link-inner img {
            width: 18px;
            height: 18px;
            margin-bottom: 3px;
        }

        /* 캐러셀 이동버튼 뒤에 그림자 없애기 */
        /* .carousel-control.left,
        .carousel-control.right {
            background-image: none;
        } */

        /* 모달 닫는 버튼 */
        .modal-dialog button[data-dismiss='modal'] {
            position: fixed;
            right: -100px;
            top: 0px;
            color: white;
            font-size: 50px;
            opacity: 1;
        }


        .modal-promimg {
            display: block;
            float: left;
            max-width: 800px;
            min-width: 800px;
        }

        .modal-promimg img {
            /* max-width: 630px;
            min-width: 630px; */
            min-height: 600px;
            max-height: 600px;
            margin: 0 auto;
        }

        .modal-promcontent {
            display: block;
            min-width: 350px;
            max-width: 350px;
            max-height: 600px;
            min-height: 600px;
            float: right;
        }

        .modal-promcontent .title-inner {
            margin: 0;
        }

        .modal-promcontent .content-inner {
            max-height: 95px;
            min-height: 95px;
            position: relative;
        }

        .modal-promcontent .content-inner textarea {
            display: inline-block;
            position: absolute;
            top: 15px;
            left: 0;
            border: none;
            resize: none;
            width: 90%;
            height: 80px;
            font-size: 15px;
            overflow: scroll;
            -ms-overflow-style: none;
            overflow-x: hidden;
            outline: none;
            border: 1px solid #ddd;
        }

        .modal-promcontent .content-inner textarea::-webkit-scrollbar {
            display: none;
        }

        .modal-promcontent .like-inner {
            padding-left: 5px;
            padding-right: 5px;
        }

        .modal-promcontent .reply-inner {
            padding-top: 30px;
            margin-top: 50px;
            border-bottom: 1px solid #ddd;
            min-height: 325px;
            max-height: 325px;
            overflow: scroll;
            overflow-x: hidden;
            -ms-overflow-style: none;
        }

        .modal-promcontent .reply-inner::-webkit-scrollbar {
            display: none;
        }

        .modal-promcontent .reply-inner .reply-content {
            padding: 5px 0;
        }

        .modal-promcontent .reply-inner .reply-content .profile img {
            width: 25px;
            height: 25px;
        }

        .modal-promcontent .reply-inner .reply-content .profile p,
        .modal-promcontent .reply-inner .reply-content .profile img {
            display: inline-block;
        }

        .modal-promcontent .reply-form {
            display: block;
            width: 100%;
            height: 50px;
            position: relative;
        }

        .modal-promcontent .reply-form textarea {
            display: inline-block;
            position: absolute;
            top: 15px;
            left: 0;
            border: none;
            resize: none;
            width: 75%;
            height: 25px;
            overflow: scroll;
            -ms-overflow-style: none;
            font-size: 15px;
        }

        .modal-promcontent .reply-form textarea::-webkit-scrollbar {
            display: none;
        }

        .reply-form textarea:focus {
            outline: none;
        }

        .reply-form textarea::placeholder {
            line-height: 25px;
            text-indent: 10px;
            font-size: 15px;
            color: black;
        }

        .modal-promcontent .reply-form input[type="button"] {
            display: inline-block;
            position: absolute;
            top: 5px;
            right: 0;
            border: none;
            width: 20%;
            height: 50px;
            background-color: white;
            color: cornflowerblue;
            font-weight: bolder;

        }

        #myModal3 .like-inner,
        #myModal4 .like-inner {
            min-height: 430px;
            max-height: 430px;
        }

        #myModal3 .like-inner .hashtag,
        #myModal4 .like-inner .hashtag {
            position: absolute;
            top: 10px;
            left: 15px;
            padding: 0;
        }

        #myModal3 .like-inner .hashtag p,
        #myModal3 .like-inner .hashtag span,
        #myModal4 .like-inner .hashtag p,
        #myModal4 .like-inner .hashtag span {
            font-size: 20px;
            font-weight: bolder;
        }

        #myModal3 .like-inner label:hover,
        #myModal4 .like-inner label:hover {
            cursor: pointer;
        }

        #myModal3 .like-inner ul,
        #myModal4 .like-inner ul {
            padding: 0;
        }

        #myModal3 .like-inner ul li,
        #myModal4 .like-inner ul li {
            float: none;
            font-size: 18px;
        }

        /* sns파일 업로드시 미리보기  */

        .fileDiv {
            width: 800px;
            box-sizing: border-box;
            border: 1px dashed #ffffff;
        }

        .fileDiv:hover {
            cursor: pointer;
            border: 1px dashed #555;
            opacity: 0.5;
        }

        .fileDiv img {
            display: block;
        }

        .fileDiv p {
            text-align: center;
            margin-top: 150px;
        }

        #myModal4 .modal-promimg img[alt="upload"] {
            width: 300px;
            min-height: 300px;
            margin: 0 250px 100px;
        }

        #myModal4 .like-inner .hashtag p.warn {
            font-size: 10px;
            width: 100%;
            position: absolute;
            bottom: -100px;
            color: red;
        }      
        
        #nomargin{
        	margin-top : 0px;
        }
        

</style>

</head>
<body>

	<%@ include file="./include/header.jsp"%>

	<section style="margin-top: 150px;">
		<!-- Carousel 구현 시작 -->
		<div class="container" style="width: auto;">
			<div class="row">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<a href="<c:url value='/promo/list'/>">
							<img src="<c:url value='/img/slide1.jpg'/>" alt="슬라이드1"></a>
						</div>
						<div class="item">
							<a href="<c:url value='/shop/shopList'/>">
							<img src="<c:url value='/img/slide2.jpg'/>" alt="슬라이드2"></a>
						</div>
						<div class="item">
							<a href="<c:url value='/cmBoard/cmList'/>">
							<img src="<c:url value='/img/slide3.jpg'/>" alt="슬라이드3"></a>
						</div>
					</div>

					<!-- carousel control  -->
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> 
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>

				</div>
			</div>
		</div>
	</section>

	<!-- map api -->
	<section>
		<div class="container" style="margin-top: 50px">
			<div class="row">
				<ul style="text-align: center;">
					<div id="map" style="width: 1100px; height: 300px;"></div>
				</ul>
			</div>
		</div>


		<!-- BEST CAFE -->
		<div class="container" style="margin-top: 50px">
			<div class="row">
				<ul class="col-xs-12">
					<li class="col-xs-6">
						<h3>
							<strong>CAFE BOARD</strong>
						</h3>
					</li>
				</ul>
				<ul class="col-xs-12" style="text-align: center;">
					<c:forEach var="c" items="${cntCafe}">
						<a onclick="modalContent(${c.bno})" style="cursor: pointer;">
							<img style="width: 224px; height: 200px;"
							 src="${pageContext.request.contextPath}/loadimg/display/${c.key}/1" alt="box"/>
						</a>
					</c:forEach>
						
				</ul>
			</div>
		</div>
		
		
		
		
		
	</section>

	<!--하단 배너 1-->
	<section>
		<div class="container" style="margin-top: 50px">
			<div class="row">
				<ul class="col-xs-12">
					<li class="col-xs-6">
						<h3>
							<strong>공지사항</strong>
						</h3>
						<table class="table table-hover w-auto">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>

							<!--작성글을 클릭하면 해당 게시물 상세 창으로 이동합니다-->
							<tbody>
								<c:forEach var="no" items="${noboard}">
									<tr>
										<td><a
											href="<c:url value='/noBoard/noDetail?bno=${no.bno}'/>">${no.title}</a>
										</td>
										<td><fmt:formatDate value="${no.regdate}" pattern="MM-dd" />
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</li>
					<li class="col-xs-6">
						<h3>
							<strong>커뮤니티</strong>
						</h3>
						<table class="table table-hover w-auto">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>

							<!--작성글을 클릭하면 해당 게시물 상세 창으로 이동합니다-->
							<tbody>
								<c:forEach var="cm" items="${cmboard}">
									<tr>
										<td><a
											href="<c:url value='/cmBoard/cmDetail?bno=${cm.bno}'/>">${cm.title}</a>
										</td>
										<td><fmt:formatDate value="${cm.regdate}" pattern="MM-dd" />
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</li>
				</ul>
			</div>
		</div>
	</section>
	
	<section id="modalSection">
		<!---------------------------------------------------------- 글 상세  Modal ---------------------------------------------------------->
	    <div class="modal fade" id="modalContent">
	        <div class="modal-dialog" style="width: 1200px;">
	
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	
	            <!-- Modal Content -->
	            <div class="modal-content">
	
	                <div class="modal-body clearfix">
	
	                    <div class="modal-promimg">
	                        <div id="myCarousel2" class="carousel" data-ride="carousel" data-interval="false">
								
								<!-- 비동기 방식으로 캐러셀 추가 -->
								
	                        </div> <!-- carousel-->
	                    </div> <!-- modal-promimg -->
	
	
	
	                    <div class="modal-promcontent">
	                        <div id="addProf" class="title-inner">
	
								<!-- 비동기 내에서 완성됨. -->
								
	                        </div>
	                        <!--내용영역 70자 내로 작성하게 할 것.-->
	                        <div class="content-inner">
	                            <p id="con-content"></p>
	                            <small id="con-regdate"></small>
	                        </div>
	
	                        <!-- 좋아요 및 해쉬태그 영역-->
	                        <div class="like-inner">
	                            <!--좋아요-->
	                            <img src="<c:url value='/img/like2.png'/>"> <span id="like-cnt">522</span>
	                            <!-- 해쉬태그 -->
	                            <ul class="hashtag clearfix">
	                                <li><a id="con-area" href="#">#서울</a></li>
	                                <li><a id="con-place" href="#">#Morden / Neat</a></li>
	                                <li><a id="con-limit" href="#">#No Kids</a></li>
	                            </ul>
	                        </div>
	
	                        <!-- 댓글 영역 -->
	                        <div id="replyContentDiv" class="reply-inner">
								
								<!-- 비동기 방식으로 불러오고 있습니다. -->
								
	                        </div>
	                        <div class="reply-form">
	                                <textarea name="content" id="modal-reply-content" placeholder="댓글 입력"></textarea>
	                                <input type="button" value="게시" id="replyRegBtn"></input>
	                        </div>
	
	
	
	                    </div> <!-- modal-promcontent-->
	
	                </div> <!-- modal-body-->
	
	            </div> <!-- modal-content -->
	        </div> <!-- modal-dialog -->
	    </div> <!-- modal-fade myModal2-->
	
		<div id="contentDiv">
	                
			<!-- getJSON이 영역을 채우고 있어용 -->
		            
		</div>
	</section>
	
	

	<!--하단 배너 2-->
	<section>
		<div class="container" id="nomargin" style="margin-bottom: 50px">
			<div class="row">
				<ul class="col-xs-12">
					<li class="col-xs-6">
						<h3>
							<strong>커피 종류</strong>
						</h3> <iframe width="560" height="315"
							src="https://www.youtube.com/embed/DPDH9lOs3QI"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</li>

					<li class="col-xs-6">
						<h3>
							<strong>원두 종류</strong>
						</h3> <iframe width="560" height="315"
							src="https://www.youtube.com/embed/OdWEovjCy1o"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</li>
				</ul>
			</div>
		</div>
	</section>


	<%@ include file="./include/footer.jsp"%>
	
	<!-- map appkey : 17136e4884602adf06d712c2e104879b -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17136e4884602adf06d712c2e104879b&libraries=services"></script>
	<script>
		$(function() {

			console.log('${boardList}');
			// 페이지 url 요청
			$('#pagination').on('click', 'a', function(e) {
				e.preventDefault();
				console.log($(this));
				const value = $(this).data('pagenum');
				console.log(value);
				document.pageForm.pageNum.value = value;
				document.pageForm.submit();
			});
		});// end jQuery
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		const addrList = new Array();
		
		<c:forEach items="${bsnsUserAddr}" var="addr">
			addrList.push('${addr}');
		</c:forEach>
		
		console.log(addrList);
		
		for(let address of addrList) {
			
			console.log(address);
			console.log(typeof(addr));
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + address + '</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		}
		
		function modalContent(bno) {
			console.log('모달 상세처리 진행.');
			let str = '';
			
			$.getJSON(
				'<c:url value="/promo/getContent/" />' + bno,
				function(data) {
					console.log(data);
					
					if(data.filenum != 0){
					
					str += '<ol class="carousel-indicators">';
	                str += '<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>';
	                if(data.filecnt === 2) {
	                	str += '<li data-target="#myCarousel2" data-slide-to="1"></li>';
	                } else if(data.filecnt === 3) {
	                	str += '<li data-target="#myCarousel2" data-slide-to="1"></li>';
	                	str += ' <li data-target="#myCarousel2" data-slide-to="2"></li>';
	                }
	                str += '</ol>';     
	                
	                str += '<div class="carousel-inner" role="listbox">';
	                str += `<div class="item active">
	                    <img src="<c:url value='/loadimg/display/` + data.key + `/1'/>" alt="슬라이드1">
	                	</div>`;
	               	if(data.filecnt === 2) {
	               		str += `<div class="item">
	                        <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
	                    	</div>`;
	               	} else if(data.filecnt === 3) {
	               		str += `<div class="item">
	                        <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
	                    	</div>`;
	               		str += `<div class="item">
	                        <img src="<c:url value='/loadimg/display/` + data.key + `/3'/>" alt="슬라이드3">
	                    	</div>`;
	               	}
	               	
	               	str += `<a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
	                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	                <span class="sr-only">Previous</span>
	            </a>
	            <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
	                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                <span class="sr-only">Next</span>
	            </a>`;
	            $('#myCarousel2').html(str);
	            
	            str = '';
	            
	            str += 
	            	
				`<input type="hidden" id="con-bno" name="bno" value="` + data.bno + `">

	            <div class="profile">
	                
	                
	                <img style="width:40px" src="<c:url value='/loadimg/display/` + data.filenum + `/1'/>">                   	
	                                	
	                
	            </div>
	            <div class="title">
	                <p id="con-writer">` + data.writer + `</p>
	            </div>`;
	            if(data.writer === '${login.username}') {
	            	str += `<div class="cafeowner-menu">
	                    <a id="removeModalBtn" href="` + data.bno + `"><span class="glyphicon glyphicon-remove"></span>&nbsp;Remove</a>
	                    <a id="modifyModalBtn" data-toggle="modal" href="` + data.bno + `"><span
	                            class="glyphicon glyphicon-erase"></span>&nbsp;Modify</a>
	                </div>;`
	        		    }
					//data.filenum 이 null 이 아닌경우.
					} else {
						
						
						
						
						str += '<ol class="carousel-indicators">';
	                    str += '<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>';
	                    if(data.filecnt === 2) {
	                    	str += '<li data-target="#myCarousel2" data-slide-to="1"></li>';
	                    } else if(data.filecnt === 3) {
	                    	str += '<li data-target="#myCarousel2" data-slide-to="1"></li>';
	                    	str += ' <li data-target="#myCarousel2" data-slide-to="2"></li>';
	                    }
	                    str += '</ol>';     
	                    
	                    str += '<div class="carousel-inner" role="listbox">';
	                    str += `<div class="item active">
	                        <img src="<c:url value='/loadimg/display/` + data.key + `/1'/>" alt="슬라이드1">
	                    	</div>`;
	                   	if(data.filecnt === 2) {
	                   		str += `<div class="item">
	                            <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
	                        	</div>`;
	                   	} else if(data.filecnt === 3) {
	                   		str += `<div class="item">
	                            <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
	                        	</div>`;
	                   		str += `<div class="item">
	                            <img src="<c:url value='/loadimg/display/` + data.key + `/3'/>" alt="슬라이드3">
	                        	</div>`;
	                   	}
	                   	
	                   	str += `<a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
	                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	                    <span class="sr-only">Previous</span>
	                </a>
	                <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
	                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                    <span class="sr-only">Next</span>
	                </a>`;
	                $('#myCarousel2').html(str);
	                
	                str = '';
	                
	                str += 
	                	
					`<input type="hidden" id="con-bno" name="bno" value="` + data.bno + `">

	                <div class="profile">
	                    
	                    
	                    <img src="<c:url value='/img/profile.png'/>">                   	
	                                    	
	                    
	                </div>
	                <div class="title">
	                    <p id="con-writer">` + data.writer + `</p>
	                </div>`;
	                if(data.writer === '${login.username}') {
	                	str += `<div class="cafeowner-menu">
	                        <a id="removeModalBtn" href="` + data.bno + `"><span class="glyphicon glyphicon-remove"></span>&nbsp;Remove</a>
	                        <a id="modifyModalBtn" data-toggle="modal" href="` + data.bno + `"><span
	                                class="glyphicon glyphicon-erase"></span>&nbsp;Modify</a>
	                    </div>;`
	            		    }
						
					}
	            $('#addProf').html(str);
	            
	            //$('#con-bno').val(data.bno);
	            //$('#con-writer').html(data.writer);
	            $('#like-cnt').html(data.likeCnt);
	            $('#con-content').html(data.content);
	            $('#con-regdate').html(timeStamp(data.regdate));
	            $('#con-area').html(data.area);
	            $('#con-place').html(data.place);
	            $('#con-limit').html(
	            	(data.limitation1 === 'true' ? '#No Kids' : '#Kids Free') + 
	            	(data.limitation2 === 'true' ? '#No Pets' : '#Pets Free') + 
	            	(data.limitation3 === 'true' ? '#No Study' : '#Study Free')
	            );
	            $('#modalContent').modal('show');
	                
				}
			); //end getJSON
		}	
		
		
		//모달이 열리는 순간 댓글 목록 불러오기
		$('#modalContent').on('shown.bs.modal', function(e) {
			const bno = $('#con-bno').val();
			modalReplyList(bno);
		});
		
		function modalReplyList(bno) {
			let str = '';
			
			$.getJSON(
				'<c:url value="/promoReply/replyList/" />' + bno,
				function(list) {
					console.log(list);
					for(let i=0; i<list.length; i++) {
						if(i === 0) {
							str += '<div class="reply-content blinking">';
						} else 	{
							str += '<div class="reply-content">';
						}
						///////수정한곳
						if(list[i].filenum !== 0){
							
	                    
							
							str += `<div class="profile">
	                            <img src="<c:url value='/loadimg/display/`+list[i].filenum+`/1'/>">
	                            <p>` + list[i].writer + `</p>
	                            
	                            <a href="`+list[i].rno+`" id="rnodelete"><span style="float:right;" class="glyphicon glyphicon-remove"></span></a>
		                        </div>
		                        <div class="content">` + 
		                        	list[i].content + `
		                        </div>
		                        <small>` + timeStamp(list[i].regdate) + `</small>
	                    		</div>`;
							} //filenum === 0일때
							
							
							else { //filenum !== 0일때 기본이미지 설정.
								
								str += `<div class="profile">
		                            <img src="<c:url value='/img/profile.png'/>">
		                            <p>` + list[i].writer + `</p>
		                            
		                            <a href="`+list[i].rno+`" id="rnodelete"><span style="float:right;" class="glyphicon glyphicon-remove"></span></a>
			                        </div>
			                        <div class="content">` + 
			                        	list[i].content + `
			                        </div>
			                        <small>` + timeStamp(list[i].regdate) + `</small>
		                    		</div>`;
								
							}
						}
					$('#replyContentDiv').html(str);
				}
			); //end getJSON	
		} //end 댓글 목록 불러오기
		
		//상세보기에서 댓글을 달았을 때의 등록 처리
		$('#replyRegBtn').click(function() {
			const content = $('#modal-reply-content').val();
			const writer = '${login.userid}';
			const bno = $('#con-bno').val();
			console.log(bno + writer + content);
			
			if(writer === '') {
				alert('로그인 후 댓글 쓰기가 가능합니다.');
				return;
			} else if(content.trim() === '') {
				alert('댓글 내용이 있어야 등록이 가능합니다.');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/promoReply/regist" />',
				contentType: 'application/json',
				data: JSON.stringify({
					'bno' : bno,
					'writer' : writer,
					'content' : content
				}),
				success: function(result) {
					console.log('댓글 등록 완료!');
					$('#modal-reply-content').val('');
					modalReplyList(bno);
				},
				error: function() {
					alert('댓글 등록 실패! 관리자에게 문의.');
				}
			}); //end ajax
			
		}); // end 댓글등록
		
		//댓글 삭제 버튼 누르면
		$('#replyContentDiv').on('click','a',function(e){
			e.preventDefault();
			//고유 기능 막고 rno 가져옴
			if($(this).attr('id') !== 'rnodelete'){
				return;
			}
			
			const rno = $(this).parent().children('#rnodelete')[0].getAttribute('href');
			console.log('삭제할 댓글 번호: '+rno);
			const bno = $('#con-bno').val();
			console.log('삭제할 글 번호: '+bno);
			
			$.ajax({
				type : 'post',
				url : '<c:url value ="/promoReply/delete"/>',
				data : JSON.stringify({
					'rno' : rno
					
				}),
				contentType : 'application/json',
				success : function(data){
					if(data === 'success'){
						
					console.log('삭제 성공')
					modalReplyList(bno);
					}else if(data === 'fail'){
						alert('삭제 권한이 없습니다.');
					}
				}
				
				
					,error : function(error){
						console.log(error);
						alert('삭제실패 관리자 문의.')
					}
					
				
 				
			});//end ajax
			
		});
		
		//날짜 처리 함수
		function timeStamp(millis) {
			
			const date = new Date(); //현재 날짜
			//현재 날짜를 밀리초로 변환 - 등록일 밀리초  -> 시간차
			const gap = date.getTime() - millis;
			
			let time; //리턴할 시간
			if(gap < 60 * 60 * 24 * 1000) { //1일 미만인 경우
				if(gap < 60 * 60 * 1000) { //1시간 미만일 경우
					time = '방금 전';
				} else { //1시간 이상일 경우
					time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
				}
			} else { //1일 이상일 경우
				const today = new Date(millis);
				const year = today.getFullYear(); //년
				const month = today.getMonth() + 1; //월
				const day = today.getDate(); //일
				const hour = today.getHours(); //시
				const minute = today.getMinutes(); //분
				
				time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시' + minute + '분';
			}
			
			return time;
			
		}
		
		
	</script>
</body>
</html>
