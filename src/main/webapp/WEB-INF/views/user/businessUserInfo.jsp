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

.container {
	min-width: 1200px;
	margin-top: 150px;
	margin-bottom: 80px;
}
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
						<strong>사장님 회원 정보</strong>
					</h3>

					<div class="tab-content">
						<div id="info" class="tab-pane fade in active">

							<br>
							<p>*표시는 필수 입력 표시입니다</p>

							<form action="<c:url value='/user/userUpdate' />">
								<table class="table">
									<tbody class="m-control">
										<tr>
											<td class="col-sm-2">*아이디</td>
											<td class="col-sm-8">
											<input value="${login.userid}" style="width: 180px; cursor: default;"
												class="form-control input-sm" name="userid" readonly>
											</td>
										</tr>
										<tr>
											<td>*카페이름</td>
											<td><input value="${login.username}" style="width: 180px; cursor: default;"
												class="form-control input-sm" name="username" readonly></td>
										</tr>
										<tr>
											<td>*비밀번호</td>
											<td>
											<input style="width: 180px;" type="password"
												class="form-control input-sm" id="usePw" name="userpw"
												placeholder="영문(대/소),숫자 포함 8~16자"><span id="pwChk"></span>
											</td>
										</tr>
										<tr>
											<td>*비밀번호확인</td>
											<td>
											<input style="width: 180px;" type="password"
												class="form-control input-sm" id="userPwChk"
												name="userPwChk"><span id="pwChk2"></span>
											</td>
										</tr>
										<tr>
											<td>E-mail</td>
											<td>
											<input style="width: 180px;" class="form-control input-sm" name="useremail1">@
												<select style="width: 180px;" class="form-control input-sm sel"
												name="useremail2">
													<option>naver.com</option>
													<option>gmail.com</option>
													<option>daum.net</option>
											</select>
											</td>
										</tr>
										<tr>
											<td>휴대폰</td>
											<td><select style="width: 70px;"
												class="form-control input-sm sel" name="userphone1">
													<option>010</option>
													<option>011</option>
													<option>017</option>
													<option>018</option>
											</select> <input style="width: 120px;" class="form-control input-sm"
												id="userphone2" name="userphone2" maxlength="8"
												placeholder="숫자 8자리 입력"></td>
										</tr>
										<tr>
											<td>*우편번호</td>
											<td><input style="width: 180px; cursor: auto;"
												class="form-control input-sm" id="addrzipnum"
												name="addrzipnum" readonly>
												<button type="button" class="btn btn-primary" id="addrBtn">주소찾기</button>
											</td>
										</tr>
										<tr>
											<td>*카페주소</td>
											<td><input style="width: 500px; cursor: auto;"
												class="form-control input-sm add" id="addrbasic"
												name="addrbasic" readonly></td>
										</tr>
										<tr>
											<td>*상세주소</td>
											<td><input style="width: 500px; cursor: auto;"
												class="form-control input-sm add" id="addrdetail"
												name="addrdetail" readonly></td>
										</tr>
									</tbody>
								</table>
							</form>

							<div class="titlefoot">
								<button type="button" class="btn" id="updateBtn">수정</button>
								<button type="button" class="btn">탈퇴</button>
							</div>
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

			//수정버튼 클릭 시 사용자의 입력값 검증!
			$('#updateBtn').click(function() {

				//비밀번호란 입력값 검증
				//비밀번호란 공백 확인
				if ($('#usePw').val() === '') {
					console.log('비밀번호값이 공백임');
					$('#pwChk').html('<b style="font-size: 12px; color: red;">비밀번호는 필수 정보입니다.</b>');
					$('#usePw').focus();
				}
				//비밀번호 유효성 검사
				else if (!getPwCheck.test($('#usePw').val())) {
					$('#pwChk').html('<b style="font-size: 12px; color: red;">영문(대/소문자), 숫자, 특수문자 포함 8 ~ 16자로 작성해 주세요.</b>');
					$('#usePw').focus();
				} else { //통과
					$('#pwChk').html('');
				}

				//비밀번호 확인란 입력 검증
				//비밀번호 확인란 공백 검증
				if ($('#userPwChk').val() === '') {
					$('#userPwChk')
							.html('<b style="font-size: 12px; color: red;">[비밀번호 확인은 필수 정보입니다!]</b>');
					$('#userPwChk').focus();
				} else if ($('#userPwChk').val() !== $('#usePw').val()) { //비밀번호 확인란 유효성 검사
					$('#pwChk2').html('<b style="font-size: 12px; color: red;">[작성하신 비밀번호와 일치하지 않습니다.]</b>');
				} else { //통과
					$('#pwChk2').html('');
				}

			}); //비밀번호 확인 검증 끝

		}); //수정버튼 클릭 유효성 검증 끝
		
		
		
		
		
		
		
	</script>

	<!--전화번호 숫자 외 문자 입력시 다른 커서 누를 경우 문자 자동 삭제-->
	<script>
		/*
			$(document).ready(function() {
				$("input#userphone2").blur(function() {
					var num = $("#userphone2").val();
					blur(num)
				});

				$("input#userphone2").click(function() {
					var num = $("#userphone2").val();
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