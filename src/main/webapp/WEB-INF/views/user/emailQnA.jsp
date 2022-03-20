<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="<c:url value='/css/shstyle.css'/>">


</head>

<body>

	<%@ include file="../include/header.jsp" %>
	
	
	<div class="container qna"
		style="margin-top: 150px; margin-bottom: 100px;">


		<h3 class="qnatitle"
			style="text-align: center; font: 30px; font-weight: bold;">
			문의 및 건의에 대한 내용은 <br>coffeealley@gmail.com으로 전송됩니다.
		</h3>
		<div class="col-xs-12 qnaborder">

			<form class="" name="qnaform">
				<div class="form-group  col-xs-12">
					<label for="writer">문의자</label>
					<input type="text"
						class="form-control" value="${login.userid}" id="writer" readonly
						style="background: transparent; cursor: auto;">
				</div>
				<div class="form-group col-xs-12">

					<label for="email">Email</label><input type="email"
						class="form-control" id="email" placeholder="Email"
						style="background: transparent;"> <br> <label
						for="qnacontent"> 내용 </label> <input type="file" value="파일첨부"
						style="display: inline; margin-left: 10px;"> <br>
					<br>
					<textarea name="qna" id="qnacontent" class="form-control" rows="7"
						style="background: none;" placeholder="작성할 내용을 입력해주세요"></textarea>
				</div>

				<button id="subm" class="btn btn-primary" type="button"
					style="float: right; margin-right: 17px;">전송</button>


			</form>
		</div>
	</div>


	<%@ include file="../include/footer.jsp" %>


	
	<script>
		//전송버튼 누르면
		document
				.querySelector('#subm')
				.addEventListener(
						'click',
						function() {

							//문의 내용이 ''인지 아닌지
							const content = document.querySelector('textarea');
							if (content.value === '') {
								alert('문의 내용은 필수입니다.');
								content.focus();
								return;

							}

							//이메일 검증
							const email = document.querySelector('#email').value;
							console.log(email);

							const regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

							if (regExp.test(email) === true) {
								alert('전송완료');
								document.qnaform.submit();
								//목록으로 이동시킨다.
							} else {
								event.preventDefault();
								alert('이메일 형식을 확인해주세요');
								return;
							}

						});
	</script>

</body>

</html>