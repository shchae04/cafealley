<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴</title>

<link rel="stylesheet" href="<c:url value='/css/kwstyle.css'/>">



</head>

<body>


	<%@ include file="../include/header.jsp"%>

	<div class="finor-container"
		style="margin-top: 150px; margin-left: 450px;">
		<div class="finor-wrapper2" style="width: 850px;">
			<div>
				<h2
					style="font-weight: 900; margin-bottom: 10px; padding-left: 20px;">회원 탈퇴</h2>
				<hr>
			</div>
			<div class=""
				style="border: 1px solid lightgray; padding-left: 20px; margin-bottom: 20px;">
				<div style="margin-top: 10px;">
					<span> 아래의 안내사항을 확인하고, 비밀번호를 입력한 후 동의하고 탈퇴하기 버튼을 눌러 골목커피
						서비스를 탈퇴할 수 있습니다. </span>
				</div>
				<div class="mw-text" style="margin-top: 80px; line-height: 1.4;">
					<span style="font-weight: 900;">서비스 탈퇴 안내 사항</span><br> <span>1.
						모든 개인 정보는 탈퇴 이후 바로 삭제됩니다.</span> <br> <span>2. 커뮤니티 글 내역 등
						활동내역은 탈퇴 이후 바로 삭제되어 복구할 수 없습니다</span> <br> <span>3. 단, 개인정보
						처리방침 제6조(개인정보의 보유 기간 및 파기)에 따른 특별한 경우, 한시적으로 개인정보를 보존합니다.</span>
				</div>
				<div style="margin-top: 30px;">
					<h2 style="font-weight: 900; margin-top: 60px;">비밀번호 확인</h2>
				</div>
				<div class="mw-tablediv">
					<div>
						<span style="margin-right: 100px;">이름</span> <input type="text"
							value="${login.username}" disabled>
					</div>
					<div>
						<span style="margin-right: 85px;">아이디</span> <input type="text"
							value="${login.userid}" disabled>
					</div>
					<div>
						<span>비밀번호 확인</span> &nbsp; <input type="password" id="userPw">
					</div>
				</div>
				<div class="mw-button">
					<button type="submit" id="btnDel">
						<span
							style="color: white; font-size: 20px; vertical-align: middle;">탈퇴하기
						</span>
					</button>
				</div>
				<br> <br>
			</div>

		</div>


	</div>

	<%@ include file="../include/footer.jsp"%>


	<script>
	
		
		//제이쿼리 시작
		$(function() {
			
			let chk = false;
			
			//탈퇴버튼 클릭 이벤트
			$('#btnDel').click(function() {
				
				console.log('탈퇴하기 버튼 클릭됨');
				
				if(userPw === '') {// 공백 체크
					alert('비밀번호를 입력해 주세요.');
					chk = false;
				}
				
				chk = true;
				
				//비밀번호가 공백이 아니라면
				if(chk) {
					const userPw = $('#userPw').val();
					const userId = '${login.userid}';

					console.log(userPw);//비밀번호 값 확인
					console.log(userId);//비밀번호 값 확인
					
					
					const userInfo = {
							"userid" : userId,
							"userpw" : userPw
					};
					
					//비동기 통신 시작
					$.ajax({
						type : 'post',
						url : '<c:url value="/user/memDelete" />',
						data : JSON.stringify(userInfo),
						contentType : 'application/json',
						success : function(data) {
							if (data === 'match') {
								console.log('비동기 success');
								$('#userPw').attr('readonly', true);
								alert('탈퇴되었습니다.');
								location.href = 'http://localhost/cafealley/';
							} else {
								console.log('비동기 fail');
								alert('비밀번호를 확인해 주세요.');
							}
						},
						error : function() {
							console.log('비동기 error');
							alert('서버 에러입니다. 관리자에게 문의하세요.');
						}
					});//end ajax
					
				}
				
				

			});//탈퇴버튼 이벤트 끝

		});//end jQuery
	</script>

</body>

</html>