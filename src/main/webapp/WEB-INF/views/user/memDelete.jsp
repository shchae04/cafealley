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
					style="font-weight: 900; margin-bottom: 10px; padding-left: 20px;">회원
					탈퇴</h2>
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
							value="홍길동" disabled>
					</div>
					<div>
						<span style="margin-right: 85px;">아이디</span> <input type="text"
							value="hong1234" disabled>
					</div>
					<div>
						<span>비밀번호 확인</span> &nbsp; <input type="password" value="">
					</div>
				</div>
				<div class="mw-button">
					<button type="submit">
						<span
							style="color: white; font-size: 20px; vertical-align: middle;">탈퇴
							하기</span>
					</button>
				</div>
				<br> <br>
			</div>

		</div>


	</div>

	<%@ include file="../include/footer.jsp" %>
	
</body>

</html>