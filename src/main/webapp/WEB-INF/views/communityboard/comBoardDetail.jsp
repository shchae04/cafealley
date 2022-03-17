<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

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
                            <label for="bId">글번호&nbsp;&nbsp;</label>
                            <span id="bid" name="bid" style="font-size: 16px;">3</span>
                            <!-- <input type="text" id="bid" class="form-control" style=" border: none; border-color: transparent; cursor: auto;width: 5%;  background: white;" readonly value="3"> -->

                        </div>
                        <div class="form-group">
                            <label class="regdate"
                                style="display: inline;">작성일&nbsp;&nbsp;&nbsp;<small>2022-01-06</small>

                                <label class="modifycheck" style="float:inherit; font-size: 8px;"><small>수정됨 ( o ,
                                        x)</small></label>
                            </label>
                        </div>

                        <div class="form-group">
                            <label for="writer">작성자&nbsp;&nbsp;</label>
                            <!-- <input type="text" id="writer" style="border-color: transparent;cursor: auto; width: 20%;background: white;" class="form-control" readonly value="admin" > -->
                            <span id="write" name="writer">writer</span>
                        </div>
                        <div class="form-group">
                            <label for="title"> 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <!-- <input type="text" id="title" style="cursor: auto; width: 20%;background: white;" class="form-control" readonly > -->
                            <span id="title" name="title">제목</span>
                        </div>
                        <div class="form-group">
                            <label for="content clearfix">내용</label>
                            <div class="form-row">
                                <div class="img-wrapper" name="" style="margin: 40px 0; width: 33%; float: left;">
                                    <img src="../img/prod1.jpg" alt="내용1">
                                </div>
                             
                                <div class="detailtext" style="float: left;">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam laudantium iure
                                    et nemo sequi veritatis quidem facere laborum quo, facilis, sapiente vitae. Iusto
                                    dolorum laborum perferendis perspiciatis similique sequi veniam!
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam laudantium iure
                                    et nemo sequi veritatis quidem facere laborum quo, facilis, sapiente vitae. Iusto
                                    dolorum laborum perferendis perspiciatis similique sequi veniam!
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam laudantium iure
                                    et nemo sequi veritatis quidem facere laborum quo, facilis, sapiente vitae. Iusto
                                    dolorum laborum perferendis perspiciatis similique sequi veniam!
                                </div>
                                <div class="img-wrapper" name="" style="margin: 40px 0; width: 33%; float: left;">
                                    <img src="../img/prod1.jpg" alt="내용1">
                                </div>
                                <div class="detailtext2" style="float: left;">
                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis earum facere
                                    temporibus sequi officia similique vero odit a beatae dolores eum, libero neque,
                                    perferendis animi itaque vitae debitis porro iusto!
                                </div>
                            </div>
                        </div>




                    </form>
                    <!-- 이전글 다음글 버튼 배치 -->
                    <br><br><br>
                    <br>
                    <!-- 작성한 회원만 수정 삭제가능 -->
                    <button class="detailbtn btn" id="delbtn">삭제</button>
                    <button class="detailbtn btn btn-dark" id="modbtn">수정</button>
                    <button class="detailbtn btn btn-dark" id="listbtn">목록</button>
                    <div class="col-xs-3">
                        <input id="prev" type="button" class="btn" value="이전글">
                        <input id="next" type="button" class="btn btn" value="다음글">
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
                                    <strong class="left">커피사조!</strong>
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
        //이전버튼
        const prev = document.querySelector('#prev')
        //다음버튼
        const next = document.querySelector('#next')
        //수정버튼
        const modbtn = document.querySelector('#modbtn')
        //목록버튼
        const listbtn = document.querySelector('#listbtn')
        //삭제버튼
        const delbtn = document.querySelector('#delbtn')





        //ajax 비동기식 등록!
        //댓글 등록하기 버튼
        const replyregist = document.querySelector('#registbtn')

        //댓글 수정버튼
        const remodbtn = document.querySelector('#replymodbtn')

        //댓글 삭제버튼
        const redelbtn = document.querySelector('#replydelbtn')
        

    </script>




</body>

</html>