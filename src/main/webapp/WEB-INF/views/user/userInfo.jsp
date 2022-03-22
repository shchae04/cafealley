<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>userInfo</title>


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
								<li><a href="<c:url value='/user/cmnBoardChk' />">작성글보기</a></li>
								<li><a href="<c:url value='/user/cmnReplyChk' />">작성댓글보기</a></li>
							</ul>
						</li>
						<c:if test="${not empty login.businessnum}">
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">홍보 게시판<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value='/user/promoBoardChk' />">작성글보기</a></li>
									<li><a href="<c:url value='/user/promoReplyChk' />">작성댓글보기</a></li>
								</ul>
							</li>
							
							<li>
								<a href="<c:url value='/user/orderDelHistory' />">주문내역/배송조회</a>
							</li>
						</c:if>
						
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

							<form id="infoForm" action="<c:url value='/user/userUpdate' />" method="post" enctype="multipart/form-data">
								<table class="table">
									<tbody class="m-control">
										<tr>
											<td>
												프로필 사진
											</td>
											<c:choose>
												<c:when test="${not empty login.filenum}">
													<td>
														<input type="file" id="file" name ="file">	
														<div class="fileDiv">
										                	<img id="fileImg" style="width: 60px;" src="<c:url value='/loadimg/display/${login.filenum}/1'/>" onerror="deleteimg(this)" />
														</div>
													</td>
												</c:when>
												<c:otherwise>
													<td>
														<input type="file" id="file" name ="file">	
														<div class="fileDiv">
										                	<img id="fileImg" src="<c:url value='/img/img_ready.png' />" />
														</div>
													</td>
												</c:otherwise>
											</c:choose>
											
											
										</tr>
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
											<td>*E-mail</td>
											<td>
												<input style="width: 180px;" class="form-control input-sm" id="useremail" name="useremail">
												<span id="emailChk"></span>
											</td>
										</tr>
										<tr>
											<td>휴대폰</td>
											<td>
												<select style="width: 70px; display: inline-block"
													class="userphone1 form-control input-sm sel" id="userphone1" name="userphone1">
														<option>010</option>
														<option>011</option>
														<option>017</option>
														<option>018</option>
												</select>
												<input style="width: 120px; display: inline-block" class="form-control input-sm"
													class="userphone2" id="userphone2" name="userphone2" maxlength="4"
													placeholder="숫자 4자리 입력">
												<input style="width: 120px; display: inline-block" class="form-control input-sm"
													 class="userphone3" id="userphone3" name="userphone3" maxlength="4"
													placeholder="숫자 4자리 입력"><span id="phoneChk"></span>
											</td>
										</tr>
										
										<c:if test="${not empty login.businessnum}">
											<tr>
												<td>*우편번호</td>
												<td class="clearfix">
													<input style="width: 180px; display: inline-block; cursor: auto;"
													class="form-control input-sm" id="addrzipnum"
													name="zipcode">
													<button style="display: inline-block;" type="button" class="addr-btn btn btn-primary" id="addrBtn">주소찾기</button>
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
												<td><input style="width: 300px; cursor: auto;"
													class="form-control input-sm add" id="addrdetail"
													name="addrdetail"></td>
											</tr>
										</c:if>
										
										<c:choose>
											<c:when test="${empty login.businessnum}">
												<tr>
													<td>MEMBERSHIP</td>
													<td><a href="#">가입 링크</a></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td>*사업자 번호</td>
													<td>
														<input style="width: 300px; cursor: auto;"
														class="form-control input-sm add" id="businessnum"
														name="businessnum"><span id="bsnsNumCheck"></span>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
										
										
									</tbody>
								</table>
							

								<div class="titlefoot">
									<button type="button" class="btn" id="updateBtn">수정</button>
									<button type="button" class="btn" id="deleteBtn">탈퇴</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<%@ include file="../include/footer.jsp"%>
	<!-- 카카오 api를 이용하기 위한 코드 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		
		// 이미지 로드 실패시 이미지태그 삭제
		function deleteimg($input){
			$input.remove();
		}
	 
	
		//다음 주소 api 사용해보기
		function searchAddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('addrzipnum').value = data.zonecode;
	                document.getElementById("addrbasic").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addrdetail").focus();
	            }
	        }).open();
	    }
		
		$('#addrBtn').click(function() {
			searchAddress();
		});//주소 찾기 버튼 클릭 시 카카오 api 함수 발동
		
		
		$(function() {
			const fileImgSrc = $('#fileImg').attr('src');
			
				$.ajax({
					type : 'get',
					url : '<c:url value="/user/display" />',
					data : fileImgSrc,
					contentType : 'application/json',
					success : function(data) {
						console.log('비동기 success');
						console.log('fileImgSrc: ' + data);
					}
				});// 인증 이메일 전송 비동기 끝 
			
			// 유효성 검증 정규표현식
			const getPwCheck = RegExp(/^.*(?=.*\d)(?=.*[a-zA-Z])/);
			const getEmailCheck =  RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			const getPhoneCheck = RegExp( /[^0-9]/g);
			const getBsnsNumCheck = RegExp(/([0-9]{3})-?([0-9]{2})-?([0-9]{5})/);
			
			//핸드폰 값
			const userphone = $('#userphone1').val() + $('#userphone1').val() + $('#userphone1').val();
			
			let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;

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
					$('#phoneChk').html('<b style="font-size: 12px; color: red;">숫자만 입력 가능합니다.</b>');
					chk4 = false;
				} else {
					console.log('전화번호 값 검증 완료');
					$('#phoneChk').html('');
					chk4 = true;
				}
				
				// 사업자번호란 입력 검증
				
				if(!getBsnsNumCheck.test($('#businessnum').val())) {
					console.log('사업자번호 양식에 맞지 않음');
					$('#bsnsNumCheck').html('<b style="font-size: 12px; color: red;">양식에 맞게 작성해 주세요.</b>');
					chk5 = false;
				} else {
					console.log('사업자번호 값 검증 완료');
					$('#bsnsNumCheck').html('');
					chk5 = true;
				}
				
				//전부 통과됐다면 수정 처리
				if(chk1 && chk2 && chk3 && chk4 && chk5) {
					confirm('수정하시겠습니까?');
					console.log('수정 처리');
					$('#updateBtn').attr('type', 'submit');
				}
				
			}); //수정버튼 클릭 입력값 검증 끝
			
			//탈퇴버튼 클릭 시 탈퇴 페이지로 이동
			$('#deleteBtn').click(function() {
				console.log('탈퇴버튼 클릭');
				$('#updateBtn').attr('type', 'button');
				location.href='<c:url value="/user/memDelete" />';
			});//탈퇴버튼 클릭 시 이동 끝
			


		}); //end jQuery
		
		//자바 스크립트 파일 미리보기 기능
	      function readURL(input) {
	           if (input.files && input.files[0]) {
	               const reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
	               //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
	              	reader.readAsDataURL(input.files[0]); 
	               //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
	               $(".fileDiv").css("display", "block");
	               
	               reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
	                   $('#fileImg').attr("src", event.target.result); 
	                   console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
	              }
	           }
	       }
	      //file업로드 인풋창에 변화 발생했다면
	      //readURL에 file업로드 창 데이터를 전달함.
	      $("#file").change(function() {
	           readURL(this); //this는 #file자신 태그를 의미
	           
	       });
		
	</script>

	
</body>

</html>