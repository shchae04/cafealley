<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap css -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>">
<!-- header와 footer, 폰트에대한 css -->
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/6bdfd4f896.js"
	crossorigin="anonymous"></script>
<!-- jquery와 bootstrapjs 순서는 중요합니다. 항상 jquery가 bootstrap.js보다 먼저 와야합니다.
그렇지 않으면 bootstrap.js에서 동작하는 modal이나 dropdown등이 동작되지 않을 수 있습니다. -->
<!-- jquery -->
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<!-- bootstrap js -->
<script src="<c:url value='/js/bootstrap.js' />"></script>


</head>
<body>


	<header>
		<div class="header">
			<nav class="header-container">
				<div class="header-logo">
					<a href="<c:url value='/'/>"><img width="150px"
						src="<c:url value='/img/logo.png'/>" alt="logo"></a>
				</div>


				<ul class="header-nav header-nav-upper clearfix">
					<c:choose>
						<c:when test="${empty login}">
							<li><a data-toggle="modal" href="#myModal">로그인</a></li>
						</c:when>
						<c:otherwise>					
							<c:choose>
								<c:when test="${login.admin == 'yes'}">
									<li class="dropdown"><a href="#">${login.userid}님<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li id="header-name">${login.username}님(관리자)</li>
											<li>${login.useremail}</li>
											<li><a href="<c:url value='/user/userInfo' />">마이페이지</a></li>										
											<li><a href="<c:url value='/ordering/orderManagement' />">주문관리</a></li>										
											<li><a href="<c:url value='/product/productList' />">상품관리</a></li>										
											<!--  <li id="header-barcode">barcode here</li> -->
										</ul>
									</li>
								</c:when>
								<c:when test="${empty login.businessnum}">
									<li class="dropdown"><a href="#">${login.userid}님<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li id="header-name">${login.username}님(일반회원)</li>
											<li>${login.useremail}</li>
											<li><a href="<c:url value='/user/userInfo' />">마이페이지</a></li>										
											<!--  <li id="header-barcode">barcode here</li> -->
										</ul>
									</li>
								</c:when>
								<c:otherwise>
									<li class="dropdown"><a href="#">${login.userid}님<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li id="header-name">${login.username}님(사업자회원)</li>
											<li>${login.useremail}</li>
											<li><a href="<c:url value='/user/userInfo' />">마이페이지</a></li>
											<li><a href="<c:url value='/cart/cartList' />">장바구니</a></li>
											<li><a href="<c:url value='/user/orderDelHistory' />">주문내역</a></li>
										</ul>
									</li>
								</c:otherwise>
							</c:choose>
							<li><a href="<c:url value='/user/userInfo' />">마이페이지</a></li>
							<li><a data-toggle="modal" href="<c:url value='/user/logout' />">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${empty login}">
					<li><a href="<c:url value='/user/joinSelect' />">회원가입</a></li>
					</c:if>
					<li><a href="mailto:coffeealley.gmail.com">고객문의</a></li>
				</ul>

				<ul class="header-nav header-nav-dropdown clearfix">
					<li><a href="<c:url value='/cafeinfo'/>">사이트 소개</a></li>
					<li><a href="<c:url value='/user/alleyMap'/>">Alley 위치</a></li>
					<li><a href="<c:url value='/noBoard/noList'/>">공지사항</a></li>
					<li><a href="<c:url value='/cmBoard/cmList'/>">Coffee Talk</a></li>
					<li><a href="<c:url value='/promo/list'/>">카페 게시판</a></li>
					<li><a href="<c:url value='/evBoard/evList'/>">이벤트</a></li>

					<c:if test="${login.businessnum != ''}">
					<li class="dropdown"><a href="<c:url value='/shop/shopList'/>">Owner Mall </a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/shop/shopList?condition=beans&keyword=latest'/>">원두</a></li>
							<li><a href="<c:url value='/shop/shopList?condition=tea&keyword=latest'/>">티 / 액상차</a></li>
							<li><a href="<c:url value='/shop/shopList?condition=milk&keyword=latest'/>">유제품</a></li>
							<li><a href="<c:url value='/shop/shopList?condition=syrup&keyword=latest'/>">시럽 / 소스</a></li>
							<li><a href="<c:url value='/shop/shopList?condition=powder&keyword=latest'/>">파우더 / 농축액</a></li>
							<li><a href="<c:url value='/shop/shopList?condition=coffeemachine&keyword=latest'/>">커피용품, 머신</a></li>
						</ul>
					</li>

					</c:if>
				</ul>

			</nav>

		</div>

	</header>


	<!----------------------------------------------------------로그인  Modal ---------------------------------------------------------->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">

			<!-- Modal Content -->
			<div class="modal-content" style="height: 371.5px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">로그인</h4>
				</div>
				<div class="modal-body">
					<form action="#">
						<h5>아이디</h5>
						<input type="text" id="userid" class="form-control"
							placeholder="Text input"><span id="idCheck"></span>
						<h5>비밀번호</h5>
						<input type="password" id="userpw" class="form-control"
							placeholder="password input"><span id="pwCheck"></span> <label>
							<input style="border:1px solid #ddd; width:8px; height:8px" id="autoLogin" type="checkbox"> <small>로그인 유지</small>
						</label>
						<div class="login-center">
							<button type="button" id="btnLogin"
								class="btn btn-primary btn-block">Log In</button>
							<div class="login-center2 clearfix">
								<div style="float: left;">아직 회원이 아니신가요?</div>
								<div style="float: right;">
									<a href="<c:url value='/user/formJoinGen' />">일반회원 가입</a><br> <a href="<c:url value='/user/formJoinBsns' />">카페회원 가입</a>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	
	<!-- 네이버 로그인을 위한 script -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<script>
		$(function() {
			
			//네이버 로그인 API
			//Client ID - pqVtFOpYyzJzRAPjYSYs
			//Client Secret - BlS3zrgBho
			
			const getIdCheck = RegExp(/^[a-z0-9]{4,12}$/);
			const getPwCheck = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/);

			let chk1 = false, chk2 = false;
			
			//로그인 버튼 클릭 이벤트
			$('#btnLogin').click(function() {
				//ID 입력값 검증 끝
				if ($('#userid').val() === '') {//공백 체크
					console.log('아이디의 값이 공백임.');
					alert('아이디는 필수 정보입니다!');
					chk1 = false;
					return;
				}
				//정규표현식
				else if (!getIdCheck.test($('#userid').val())) {
					console.log('아이디 값이 정규표현식에 맞지 않음.');
					alert('영문, 숫자조합 4-12자로 작성해주세요.');
					chk1 = false;
					return;
				} else {
					chk1 = true;
				}

				//비밀번호 입력값 검증(공백, 정규표현식)
				if ($('#userpw').val() === '') {
					alert('비밀번호는 필수 정보입니다!');
					chk2 = false;
					return;
				} else if (!getPwCheck.test($('#userpw').val())) {
					alert('특수문자 포함 8자 이상으로 작성해 주세요.');
					chk2 = false;
					return;
				} else {
					chk2 = true;
				}//비밀번호 입력값 검증 끝!
				
				//아이디, 비밀번호 정규표현식 검증이 끝났다면
				//로그인 진행
				if(chk1 && chk2) {
						
					const userid = $('#userid').val();
					const userpw = $('#userpw').val();
					const autoLogin = $('#autoLogin').is(':checked');
					
					/*
					//자동로그인 체크박스 체크 되었는지 여부
					//is() - 상태 여부를 판단하여 논리값을 리턴한다.
					*/
					
					//콘솔에서 한 번 확인해보기
					console.log('id: ' + userid);
					console.log('pw: ' + userpw);
					
					
					//체크박스의 체크 여부를 확인하여 자동로그인을 구현할지를 정한다.
					const userInfo = {
							"userid" : userid,
							"userpw" : userpw,
							"autoLogin" : autoLogin
					};
							
					//비동기 통신 시작
					$.ajax({
						type : 'POST',
						url : '<c:url value="/user/loginCheck" />',
						contentType : 'application/json',
						dataType : 'text',
						data : JSON.stringify(userInfo),
						success : function(result) {
							if(result === 'idFail') {
								console.log('존재하지 않는 아이디입니다.');
								alert('존재하지 않는 아이디입니다.');
						                
					            //잘못 적은 아이디값은 보고 고칠 수 있도록 두고 비밀번호값을 지운다.
					            $('#userpw').val('');
					            $('#userid').focus();//커서를 이동시키고, 스크롤도 해당 위치로 이동시키는 함수
					                
					            //꼭 다시 false로 돌려놓아야함
					            chk1 = false, chk2 = false;
							} else if(result === 'pwFail') {
								console.log('비밀번호가 틀렸습니다');
								alert('비밀번호가 틀렸습니다.');
					                
					            $('#userpw').val('');
					            $('#userpw').focus();//커서를 이동시키고, 스크롤도 해당 위치로 이동시키는 함수
					            chk2 = false;
							} else {
								console.log('로그인 성공');
								location.href='http://localhost';
							}
						},
						error : function() {
							alert('통신 실패');
						}
					});//end ajax(로그인 비동기 처리)
							
				} 
				
				
			});//로그인 검증
			
		});//제이쿼리 끝
	</script>

</body>
</html>