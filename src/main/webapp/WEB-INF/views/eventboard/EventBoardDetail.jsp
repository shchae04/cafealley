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
                                
                                <c:if test="${article.ismod} = '1'">
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
                                   
                                      <div style="text-align: center;">
	                                    <img alt="pic1" onerror="deleteimg(this)" src="<c:url value='/loadimg/display/${article.key}/1'/>">
	                                    <img alt="pic2" onerror="deleteimg(this)" src="<c:url value='/loadimg/display/${article.key}/2'/>">
	                                    <img alt="pic3" onerror="deleteimg(this)" src="<c:url value='/loadimg/display/${article.key}/3'/>">
                                    </div>
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
                    <button class="detailbtn btn btn-dark" id="modbtn" onclick="location.href='<c:url value="/evBoard/evModi?bno=${article.bno}"/>'">수정</button>
                    <button class="detailbtn btn btn-dark" id="listbtn" onclick="location.href='<c:url value="/evBoard/evList"/>'">목록</button>
                    <div class="col-xs-3">
                        <input id="prev" type="button" onclick="location.href='<c:url value="/evBoard/evDetail?bno=${article.bno -1 }"/>'" class="btn" value="이전글">
                        <input id="next" type="button" onclick="location.href='<c:url value="/evBoard/evDetail?bno=${article.bno +1 }"/>'" class="btn btn" value="다음글">
                    
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

                            <textarea id="reply" class="form-control" rows="3" placeholder="댓글을 입력해주세요"></textarea>
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
                            <div class="reply-group" id="replyList">
                                <!-- 댓글이 반복적으로 달릴 공간! -->
                              <%--   
                              <div style="padding: 20px 50px; border-bottom: 2px solid black; border-top: 2px solid black;">
                                    <strong class="left">${writer}</strong>
                                    <small class="left">2022/01/06</small>
                                    <!-- 수정이 한번이라도 일어났으면 수정됨! -->
                                    <small class="left">수정됨</small>
                                    <!-- 댓글을 작성한 회원에게만 보여짐. -->
                                    <a id="replymodbtn" class="modify" href="#"><span class="glyphicon glyphicon-pencil"></span>수정</a>
                                    <a id="replydelbtn" class="delete" href="#"><span class="glyphicon glyphicon-remove"></span>삭제</a>
                                    <p>여기는 댓글</p>
                                </div>
							 --%>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>



  <%@ include file="../include/footer.jsp" %>

    <script>
    // img load실패시 이미지태그 삭제
    function deleteimg($input){
    	$input.remove();
    }


    </script>




</body>

</html>