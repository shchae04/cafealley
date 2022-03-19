<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bsuserInfo</title>


<style>

	.container {
		min-width: 1200px;
		margin-top: 150px;
		margin-bottom: 80px;
	}
	
	.clearfix::after {
		content: '';
		display: block;
		clear: both;
	}
	
	.titlefoot {
		float: right;
	}
	
	
	.form-control {
		display: inline-block;
	}
	
	<!--
	.userphone2,
	.userphone3 {
		float: left;
	}
	
	.addr-btn {
		float: left;
	}
	-->
</style>

</head>

<body>

	<%@ include file="../include/header.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!--카테고리 메뉴-->
					<ul class="nav nav-tabs">
						<li class="active"><a href="#">회원정보</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">커뮤니티게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">작성글보기</a></li>
								<li><a href="#">작성댓글보기</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">커뮤니티게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">작성글보기</a></li>
								<li><a href="#">작성댓글보기</a></li>
							</ul></li>
						<li><a href="#">주문내역/배송조회</a></li>
					</ul>

					<br>
					<h3>
						<c:choose>
							<c:when test="${not empty login.businessnum}">
								<strong>사업자 회원 정보</strong>
							</c:when>
							<c:otherwise>
								<strong>회원 정보</strong>
							</c:otherwise>
						</c:choose>
					</h3>

					<div class="tab-content">
						<div id="info" class="tab-pane fade in active">

							<br>
							<p>*표시는 필수 입력 표시입니다</p>

							<form action="<c:url value='/user/userUpdate' />" method="post">
								<table class="table">
									<tbody class="m-control">
										<tr>
											<td class="col-sm-2">*아이디</td>
											<td class="col-sm-8">
											<input value="${login.userid}" style="width: 180px; cursor: default;"
												id="userid" class="form-control input-sm" name="userid" readonly>
											</td>
										</tr>
										
										<c:choose>
											<c:when test="${not empty login.businessnum}">
												<tr>
													<td>*카페이름</td>
													<td>
														<input value="${login.username}" style="width: 180px; cursor: default;"
														class="form-control input-sm" name="username" readonly>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td>*이름</td>
													<td>
														<input value="${login.username}" style="width: 180px; cursor: default;"
														class="form-control input-sm" name="username" readonly>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
										
										<tr>
											<td>*비밀번호</td>
											<td>
											<input style="width: 180px;" type="password"
												class="form-control input-sm" id="userPw" name="userpw"
												placeholder="영문(대/소),숫자 포함 8~16자"><span id="pwChk"></span>
											</td>
										</tr>
										<tr>
											<td>*비밀번호확인</td>
											<td>
											<input style="width: 180px;" type="password"
												class="form-control input-sm" id="userPwChk"><span id="pwChk2"></span>
											</td>
										</tr>
										<tr>
											<td>E-mail</td>
											<td>
												<input style="width: 180px;" class="form-control input-sm" id="useremail" name="useremail">
												<span id="emailChk"></span>
											</td>
										</tr>
										<tr >
											<td>휴대폰</td>
											<td class="clearfix">
												<select style="width: 70px;"
													class="userphone1 form-control input-sm sel" id="userphone1" name="userphone1">
														<option>010</option>
														<option>011</option>
														<option>017</option>
														<option>018</option>
												</select>
												<input style="width: 120px;" class="form-control input-sm"
													class="userphone2" id="userphone2" name="userphone2" maxlength="4"
													placeholder="숫자 4자리 입력">
												<input style="width: 120px;" class="form-control input-sm"
													 class="userphone3" id="userphone3" name="userphone3" maxlength="4"
													placeholder="숫자 4자리 입력"><span id="phoneChk"></span>
											</td>
										</tr>
										
										<c:if test="${not empty login.businessnum}">
											<tr>
												<td>*우편번호</td>
												<td class="clearfix">
													<input style="width: 180px; cursor: auto;"
													class="form-control input-sm" id="addrzipnum"
													name="zipcode">
													<button type="button" class="addr-btn btn btn-primary" id="addrBtn">주소찾기</button>
												</td>
											</tr>
											<tr>
												<td>*카페주소</td>
												<td><input style="width: 500px; cursor: auto;"
													class="form-control input-sm add" id="addrbasic"
													name="addrbasic"></td>
											</tr>
											<tr>
												<td>*상세주소</td>
												<td><input style="width: 500px; cursor: auto;"
													class="form-control input-sm add" id="addrdetail"
													name="addrdetail"></td>
											</tr>
										</c:if>
										<c:if test="${empty login.businessnum}">
											<tr>
												<td>MEMBERSHIP</td>
												<td><a href="#">가입 링크</a></td>
											</tr>
										</c:if>
										
										
										
									</tbody>
								</table>
							

								<div class="titlefoot">
									<button type="button" class="btn" id="updateBtn">수정</button>
									<button type="button" class="btn">탈퇴</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<%@ include file="../include/footer.jsp"%>

	<script>
		$(function() {

			//비밀번호 유효성 검증 정규표현식
			const getPwCheck = RegExp(/^.*(?=.*\d)(?=.*[a-zA-Z])/);
			const getEmailCheck =  RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			const getPhoneCheck = RegExp( /[^0-9]/g);
			
			//핸드폰 값
			const userphone = $('#userphone1').val() + $('#userphone1').val() + $('#userphone1').val();
			
			let chk1 = false, chk2 = false, chk3 = false, chk4 = false;

			//수정버튼 클릭 시 사용자의 입력값 검증!
			$('#updateBtn').click(function() {
				console.log('수정버튼 클릭');

				//비밀번호란 입력값 검증
				if ($('#userPw').val() === '') {//비밀번호란 공백 확인
					console.log('비밀번호: ' + $('#userPw').val())
					console.log('비밀번호값이 공백임');
					$('#pwChk').html('<b style="font-size: 12px; color: red;">비밀번호는 필수 정보입니다.</b>');
					$('#userPw').focus();
					chk1 = false;
				}
				//비밀번호 유효성 검사
				else if (!getPwCheck.test($('#userPw').val())) {
					console.log('비밀번호 양식과 불일치');
					$('#pwChk').html('<b style="font-size: 12px; color: red;">영문(대/소), 숫자 포함 8~16자로 작성해 주세요.</b>');
					$('#userPw').focus();
					chk1 = false;
				} else { //통과
					console.log('비밀번호 검증 완료');
					$('#pwChk').html('');
					chk1 = true;
				}

				//비밀번호 확인란 입력 검증
				if ($('#userPwChk').val() === '') {//비밀번호 확인란 공백 검증
					console.log('비밀번호 확인란 공백');
					$('#pwChk2').html('<b style="font-size: 12px; color: red;">비밀번호 확인은 필수 정보입니다.</b>');
					$('#userPwChk').focus();
					chk2 = false;
				} else if ($('#userPwChk').val() !== $('#userPw').val()) { //비밀번호 확인란 유효성 검사
					console.log('비밀번호와 불일치');
					$('#pwChk2').html('<b style="font-size: 12px; color: red;">작성하신 비밀번호와 일치하지 않습니다.</b>');
					chk2 = false;
				} else { //통과
					$('#pwChk2').html('');
					chk2 = true;
				}
				
				// 이메일란 입력 검증
				if($('#useremail').val() ==='') {
					console.log('이메일 값 공백');
					$('#emailChk').html('<b style="font-size: 12px; color: red;">이메일은 필수 정보입니다.</b>');
					$('#useremail').focus();
					chk3 = false;
				} else if (!getEmailCheck.test($('#useremail').val())) {
					console.log('이메일 양식에 맞지 않음');
					$('#emailChk').html('<b style="font-size: 12px; color: red;">이메일 양식이 올바르지 않습니다 예)aaa@aaa.aaa</b>');
					$('#useremail').focus();
					chk3 = false;
				} else {
					console.log('이메일 값 검증 완료');
					$('#emailChk').html('');
					chk3 = true;
				}
				
				// 전화번호란 입력 검증
				if(getPhoneCheck.test(userphone)) {
					console.log('전화번호 양식에 맞지 않음');
					$('#phoneChk').html('<b style="font-size: 12px; color: red;">숫자만 입력 가능합니다</b>');
					chk4 = false;
				} else {
					console.log('전화번호 값 검증 완료');
					$('#phoneChk').html('');
					chk4 = true;
				}
				
				//전부 통과됐다면 수정 처리
				if(chk1 && chk2 && chk3 && chk4) {
						console.log('수정 처리');
						$('#updateBtn').attr('type', 'submit');
					}//end ajax(수정 처리)
				
			}); //수정버튼 클릭 입력값 검증 끝
			
			

		}); //end jQuery
		
		
		
		
		
		
		
	</script>

	<!--전화번호 숫자 외 문자 입력시 다른 커서 누를 경우 문자 자동 삭제-->
	<script>
	/*
			$(document).ready(function() {
				$("input#userphone2").blur(function() {
					const num = $("#userphone2").val();
					blur(num);
				});

				$("input#userphone2").click(function() {
					const num = $("#userphone2").val();
					focus(num);
				});
			});

			function focus(num) {
				num = num.replace(/[^0-9]/g, '');
				$("#userphone2").val(num);
			}

			function blur(num) {
				num = num.replace(/[^0-9]/g, '');
				$("#userphone2").val(num);
			}
			*/
	</script>
</body>

</html>