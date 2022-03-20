<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

  <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    상세보기
                    <div class="titlebox" style="text-align: center; border-bottom: 3px solid black;">


                    </div>

                    <form action="#" class="detailform clearfix" method="post">
                        <div class="form-group" style="margin-top: 30px;">
                            <label for="bId">&nbsp;&nbsp;</label>
                            <span id="bid" name="bid" style="font-size: 16px;">${article.bno }</span>
                            <!-- <input type="text" id="bid" class="form-control" style=" border: none; border-color: transparent; cursor: auto;width: 5%;  background: white;" readonly value="3"> -->

                        </div>
                        <div class="form-group">
                            <label class="regdate"
                                style="display: inline;">작성일&nbsp;&nbsp;&nbsp;<small><fmt:formatDate value="${article.regdate }" pattern="MM-dd"/></small>
								
                                <label class="modifycheck" style="float:inherit; font-size: 8px;">
                                
                                <c:if test="${article.ismod ='1'}">
                                <small>수정됨</small>
                                </c:if>
                                
                                </label>
                            </label>
                        </div>

                        <div class="form-group">
                            <label for="writer">작성자&nbsp;&nbsp;</label>
                            <!-- <input type="text" id="writer" style="border-color: transparent;cursor: auto; width: 20%;background: white;" class="form-control" readonly value="admin" > -->
                            <span id="write" name="writer">${article.writer }</span>
                        </div>
                        <div class="form-group">
                            <label for="title"> 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <!-- <input type="text" id="title" style="cursor: auto; width: 20%;background: white;" class="form-control" readonly > -->
                            <span id="title" name="title">${article.title }</span>
                        </div>
                        <div class="form-group">
                            <label for="content clearfix">내용</label>
                            <div class="form-row">
                            <!-- key 값이랑 연동. -->
                                <div class="img-wrapper" style="margin: 40px 0; width: 33%; float: left;">
                                   
                                    <!-- img테이블이랑 join 해서 파일 경로를 가져온다. -->
                                    <img name="key" src="/upload/${img.foldername}/${img.filename}" alt="내용1">
                                </div>
                             
                              
                            </div>
                                <div class="detailtext">
             					 <p class="col-xs-12">
             					 ${article.content}
             					 
             					 </p>	
                                </div>
                        </div>




                    </form>
                    <!-- 이전글 다음글 버튼 배치 -->
                    <br><br><br>
                    <br>
                    <!-- 작성한 회원만 수정가능 -->
                    <button class="detailbtn btn btn-dark" id="modbtn" onclick="location.href='<c:url value="/noBoard/noModi?bno=${article.bno}"/>'">수정</button>
                    <button class="detailbtn btn btn-dark" id="listbtn" onclick="location.href='<c:url value="/noBoard/noList"/>'">목록</button>
                    <div class="col-xs-3">
                        <input id="prev" type="button" onclick="location.href='<c:url value="/noBoard/noDetail?bno=${article.bno -1 }"/>'" class="btn" value="이전글">
                        <input id="next" type="button" onclick="location.href='<c:url value="/noBoard/noDetail?bno=${article.bno +1 }"/>'" class="btn btn" value="다음글">
                    
                    </div>
                    <br><br><br><br>
                </div>
            </div>
        </div>

    </section>

    <!-- 공지사항 같은 경우 -> 댓글 작성공간을 날려버리면 된다. -->
    <section class="reply" style="margin-bottom: 100px;">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <!-- 댓글 작성 공간 -->
                    <div class="reply-wrap">
                        <!-- 현재 로그인 한 사용자의 정보를 토대로 댓글 -->
                        <div class="reply-content" style="margin-top: 20px;">

                            <textarea class="form-control" rows="3" placeholder="댓글을 입력해주세요"></textarea>
                            <div class="reply-group clearfix">
                                <div class="reply-input">

                                </div>
                                <br>
                                <button id="registbtn" class="submitbtn btn">등록하기</button>
                            </div>
                        </div>
                    </div>

                    <!-- 댓글이 달릴 공간 비동기. -->
                    <div class="reply-wrap">

                        <div class="reply-content">
                            <hr>
                            <div class="reply-group">
                                <!-- 댓글이 반복적으로 달릴 공간! -->
                                <div
                                    style="padding: 20px 50px; border-bottom: 2px solid black; border-top: 2px solid black;">
                                    <strong class="left">${writer}</strong>
                                    <small class="left">2022/01/06</small>
                                    <!-- 수정이 한번이라도 일어났으면 수정됨! -->
                                    <small class="left">수정됨</small>
                                    <!-- 댓글을 작성한 회원에게만 보여짐. -->
                                    <a id="replymodbtn" class="modify" href="#"><span
                                            class="glyphicon glyphicon-pencil"></span>수정</a>
                                    <a id="replydelbtn" class="delete" href="#"><span
                                            class="glyphicon glyphicon-remove"></span>삭제</a>
                                    <p>여기는 댓글</p>
                                </div>


                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>



  <%@ include file="../include/footer.jsp" %>

    <script>
        

	$(document).ready(function() {
		
		$('#registbtn').click(function() {
			
			/*
			댓글을 등록하려면 게시글 번호도 보내 주셔야 합니다.
			댓글 내용, 작성자, 댓글 비밀번호, 게시글 번호를 
			json 표기 방법으로 하나로 모아서 전달해 주시면 됩니다.
			비동기 통신으로 댓글 삽입을 처리해 주시고,
			console.log를 통해 '댓글 등록 완료!'를 확인하시고
			실제 DB에 댓글이 추가되는지도 확인해 주세요.
			전송방식: POST, url: /reply/replyRegist
			*/
			
			const bno = '${article.bno}'; //컨트롤러에서 넘어온 게시글번호
			const content = $('#reply').val(); //댓글 내용
			const writer = $('#replyId').val(); //작성자
			
			
			if(content === '') {
				alert('내용을 입력하세요!');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/noReply/replyRegist" />',
				data: JSON.stringify(
					{
						"bno":bno,
						"writer":writer,
						"content":content
					}		
				),
				dataType: 'text', //서버로부터 어떤 형식으로 받을지(생략 가능)
				contentType: 'application/json',
				success: function(data) {
					console.log('통신 성공! ' + data);
					$('#reply').val('');
					$('#replyId').val('');
					$('#replyPw').val('');
					getList(1, true); //등록 성공 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현.
				},
				error: function() {
					alert('등록에 실패했습니다. 관리자에게 문의하세요!');
				}
			}); //댓글 등록 비동기 통신 끝.
		}); //댓글 등록 이벤트 끝.
		
		//더보기 버튼 처리(클릭 시 전역변수 페이지번호에 +1값을 전달)
		$('#moreList').click(function() {
			//더보기잖아요. 누적해야 되지 않을까요?
			//1페이지의 댓글 내용 밑에다가 2페이지를 줘야지
			//1페이지를 없애고 2페이지를 보여주는 게 아니라는 거죠.
			getList(++page, false);
		});
		
		
		//목록 요청
		let page = 1; //페이지 번호
		let strAdd = ''; //화면에 그려넣을 태그를 문자열의 형태로 추가할 변수.
		
		getList(1, true); //상세보기 화면에 처음 진입 시 댓글 리스트를 불러옴.
		
		//getList 매개값으로 요청된 페이지 번호와
		//화면을 리셋할 것인지의 여부를 bool타입의 reset이름의 변수로 받겠습니다.
		//(페이지가 그대로 머물면서 댓글이 밑에 계속 쌓이기 때문에, 상황에 따라서
		//페이지를 리셋해서 새롭게 가져올 것인지, 누적해서 쌓을 것인지의 여부를 확인)
		function getList(pageNum, reset) {
			
			const bno = '${article.bno}'; //게시글 번호
			
			//getJSON 함수를 통해 JSON 형식의 파일을 읽어올 수 있다.
			//get방식의 요청을 통해 서버로부터 받은 JSON 데이터를 로드한다.
			//$.getJSON(url, [DATA], [통신 성공 여부])
			$.getJSON(
				"<c:url value='/noReply/getList/' />" + bno,
				function(data) {
					console.log(data);
					//data로 list가 들어온다 replyvo타입의 리스트
					
					let total = data.total; //총 댓글수
					console.log('총 댓글수: ' + total);
					let replyList = data.list; //댓글 리스트
					
					//insert, update, delete 작업 후에는
					//댓글을 누적하고 있는 strAdd 변수를 초기화를 해서
					//화면이 리셋된 거처럼 보여줘야 합니다.
					if(reset === true) {
						strAdd = '';
						page = 1;
					}
					
				
					
					
					//응답 데이터의 길이가 0보다 작으면 함수를 종료하자.
					if(replyList.size() <= 0) {
						return; //함수 종료.
					}
					
					for(let i=0; i<replyList.length; i++) {
						
						strAdd += "<div class='reply-wrap' style='display:none;'>";
                        strAdd += "<div class='reply-image'>";
                        strAdd += "<img src='../resources/img/profile.png'>";
                        strAdd += "</div>";
                        strAdd += "<div class='reply-content'>";
                        strAdd += "<div class='reply-group'>";
                        strAdd += "<strong class='left'>"+ replyList[i].writer +"</strong>"; 
						strAdd += "<small class='left'>"+ timeStamp(replyList[i].regdate) +"</small>";
                        strAdd += "<a href='" + replyList[i].rno + "' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>";
                        strAdd += "<a href='" + replyList[i].rno + "' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
                        strAdd += "</div>";
                        strAdd += "<p class='clearfix'>"+ replyList[i].content +"</p>";
                        strAdd += "</div>";
                    	strAdd += "</div>";
						
					}
					$('#replyList').html(strAdd); //replyList영역에 문자열 형식으로 모든 댓글을 추가.
					//화면에 댓글을 표현할 때 reply-wrap이 display: none으로 선언되어 있는데,
					//jQuery의 fadeIn 함수로 서서히 드러나도록 처리.
					$('.reply-wrap').fadeIn(500);
					
				}
			); //end getJSON
			
		} // end getList()
		
		
		//수정, 삭제
		/*
		$('.replyModify').click(function(e) {
			e.preventDefault();
			console.log('수정 이벤트 발생!');
		});
		ajax함수의 실행이 더 늦게 완료가 되기 때문에, 실제 이벤트 선언이 먼저 실행되게 됩니다.
		이런 상황에서는 화면에 댓글 관련 창은 아무것도 등록되지 않은 형태이므로,
		일반 클릭 이벤트가 동작하지 않습니다.
		이 때는, 이미 존재하는 #replyList에 이벤트를 등록하고, 이벤트를 자식에게 전파시켜
		사용하는 제이쿼리의 이벤트 위임 함수를 반드시 사용해야 합니다.
		*/
		
		$('#replyList').on('click', 'a', function(e) {
			e.preventDefault(); //태그의 고유 기능을 중지.
			//1. a태그가 두 개(수정, 삭제)이므로 버튼부터 확인.
			//수정, 삭제가 발생하는 댓글 번호가 몇 번인지의 여부도 확인.
			
			const rno = $(this).attr('href');
			$('#modalRno').val(rno);
			
			//2. 모달 창 하나를 이용해서 상황에 따라 수정 / 삭제 모달을 구분하기 위해
			//조건문 작성.
			
			//hasClass()는 클래스 이름에 매개값이 포함되어 있다면 true, 없으면 false.
			if($(this).hasClass('replyModify')) {
				//수정 버튼을 눌렀으므로 수정 모달 형식으로 변경.
				$('.modal-title').html('댓글 수정');
				$('#modalReply').css('display', 'inline');
				$('#modalModBtn').css('display', 'inline');
				$('#modalDelBtn').css('display', 'none'); //수정이므로 삭제버튼은 숨기자.
				//jQuery를 이용한 모달 창 열기/닫기 ('show' / 'hide')
				//BootStrap에서는 trigger를 통해서 모달을 열고 닫았지만, 지금은 그런 게 없기 때문에
				//제이쿼리를 이용하여 직접 모달을 열어줍니다.
				$('#replyModal').modal('show');	
			} else {
				//삭제 버튼을 눌렀으므로 삭제 모달 형식으로 변경.
				$('.modal-title').html('댓글 삭제');
				$('#modalReply').css('display', 'none');
				$('#modalModBtn').css('display', 'none');
				$('#modalDelBtn').css('display', 'inline');
				$('#replyModal').modal('show');	
			}
		
		}); //수정 or 삭제 버튼 클릭 이벤트 처리 끝.
		
		
		//수정 처리 함수 (수정 모달을 열어서 수정 내용을 작성 후 수정 버튼을 클릭했을 시)
		$('#modalModBtn').click(function() {
			
			/*
			1. 모달창에 rno값, 수정한 댓글 내용(reply), replyPw값을 얻습니다.
			2. ajax함수를 이용해서 post방식으로 reply/update 요청,
			필요한 값은 JSON형식으로 처리해서 요청.
			3. 서버에서는 요청받을 메서드 선언해서 비밀번호 확인하고, 비밀번호가 맞다면
			 수정을 진행하세요. 만약 비밀번호가 틀렸다면 "pwFail"을 반환해서
			 '비밀번호가 틀렸습니다.' 경고창을 띄우세요.
			4. 업데이트가 진행된 다음에는 modal창의 모든 값을 ''로 처리해서 초기화 시키시고
			 modal창을 닫으세요.
			 수정된 댓글 내용이 반영될 수 있도록 댓글 목록을 다시 불러 오세요.
			*/
			
			const reply = $('#modalReply').val();
			const rno = $('#modalRno').val();
			const replyPw = $('#modalPw').val();
			
			if(reply === '' || replyPw === '') {
				alert('내용, 비밀번호를 확인하세요!');
				return;
			}
			
			$.ajax({
				type : "post",
				url : "<c:url value='/reply/update' />",
				contentType : 'application/json',
				data : JSON.stringify({
					'reply' : reply,
					'rno' : rno,
					'replyPw' : replyPw
				}),
				success : function(data) {
					if(data === 'modSuccess') {
						alert('정상 수정되었습니다.');
						$('#modalReply').val('');
						$('#modalPw').val('');
						$('#replyModal').modal('hide');
						getList(1, true);
					} else {
						alert('비밀번호를 확인하세요.');
						$('#modalPw').val('');
					}
				},
				error : function() {
					alert('수정에 실패했습니다. 관리자에게 문의하세요.');
				}
				
			}); //end ajax(수정)
			
		}); //수정 처리 이벤트 끝.
		
		
		//삭제함수
		$('#modalDelBtn').click(function() {
			/*
			1. 모달창에 rno값, replyPw값을 얻습니다.
			2. ajax함수를 이용해서 POST방식으로 /reply/delete 요청
			 필요한 값은 JSON 형식으로 처리해서 요청
			3. 서버에서는 요청을 받아서 비밀번호를 확인하고, 비밀번호가 맞으면
			 삭제를 진행하시면 됩니다.
			4. 만약 비밀번호가 틀렸다면, 문자열을 반환해서 
			 '비밀번호가 틀렸습니다.' 경고창을 띄우세요.
			*/
			const rno = $('#modalRno').val();
			const replyPw = $('#modalPw').val();
			
			if(replyPw === '') {
				alert('비밀번호를 확인하세요.');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: "<c:url value='/reply/delete' />",
				data: JSON.stringify({
					'rno' : rno,
					'replyPw' : replyPw
				}),
				headers : {
					'Content-type' : 'application/json'
				},
				success : function(data) {
					if(data === 'delSuccess') {
						alert('댓글이 삭제되었습니다.');
						$('#modalPw').val(''); //비밀번호 초기화
						$('#replyModal').modal('hide'); //모달 내리기
						getList(1, true);
					} else {
						alert('비밀번호가 틀렸습니다.');
					}
				},
				error : function() {
					alert('삭제에 실패했습니다. 관리자에게 문의하세요.');
				}
			}); //삭제 비동기 통신 끝.
		
		}); //삭제 이벤트 끝.
		
		
		// 날짜 처리 함수
		function timeStamp(millis) {
			
			const date = new Date(); //현재 날짜
			//현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
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
				
				time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시 ' + minute + '분'; 
				
			}
			return time;
		}
		
		
		
	}); //end jQuery
	
        

    </script>




</body>

</html>