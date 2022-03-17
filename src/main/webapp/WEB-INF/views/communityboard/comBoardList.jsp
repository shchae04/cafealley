<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판</title>

    <link rel="stylesheet" href="<c:url value='/css/shstyle.css'/>">
    
</head>

<body>



<%@ include file="../include/header.jsp" %>




    <section>

        <div class="container" style="margin-top: 150px;">
            <div class="row">
                <div class="board-table">
                    <div class="titlebox">

                    </div>
                </div>

                <!-- 검색창을 배치하고 싶을 때 -->
                <div class="listhead" style="margin-bottom: 100px;">
                    <div
                        style="float: left; font-size: 20px; margin-top: 15px; margin-left: 30px; border-bottom: 3px solid black;">
                        <strong>게시판</strong>
                    </div>
                    <form class="navbar-form navbar-right" action="#" method="get">
                        <div class="input-group">
                            <div class="search-wrap clearfix">
                                <select class="form-control search-select" id="condition">
                                    <option value="title">제목</option>

                                    <option value="writer">작성자</option>

                                </select>
                                <button id="searchbtn" type="button" class="btn btn-info search-btn">검색</button>
                                <input type="text" class="form-control search-input">
                            </div>

                        </div>
                    </form>
                </div>

                <table class="table table-hover table-bordered listtable">
                    <thead>
                        <th style="width: 4%; color: black;">번호</th>
                        <th style="width: 75%; color: black; text-align: center;">제목</th>
                        <th style="width: 12%;">작성자</th>
                        <th style="width: 10%;">작성일</th>

                    </thead>
                    <!-- 게시글 가져오기 반복문-->
                    <!-- dummy 데이터 입니다 -->
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><a href="https://www.naver.com">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>

                        </tr>
                        <tr>
                            <td>2</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td><a href="#">첫글</a></td>
                            <td>홍길동</td>
                            <td>~~~~~~~</td>
                        </tr>
                    </tbody>
                </table>

                <hr>
                <button type="button" class="write btn btn-info">글쓰기</button>


                <div class="text-center">
                    <ul class="pagination mypage">
                        <li><a href="#">이전</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">다음</a></li>
                    </ul>
                </div>



            </div>
        </div>
        </div>
    </section>


<%@ include file="../include/footer.jsp" %>

    <script>
        //검색
        const $searchbtn = document.querySelector('#searchbtn');

        $searchbtn.addEventListener('click', function (e) {
            const keyword = document.querySelector('#searchbtn').value;
            const condition = document.querySelector('#condition').value;

            location.href = "/project/list?keyword=" + keyword + "&condition=" + condition;

        });
    </script>




</body>

</html>