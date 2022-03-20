<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>orderDeliveryChk</title>

    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    

    <style>
        .clearfix::after {
            content: '';
            display: block;
            clear: both;
        }

        .titlefoot {
            float: right
        }

        .form-control {
            display: inline-block;
            width: 200px;
        }

        .container {
            min-width: 1200px;
            margin-top: 150px;
            margin-bottom: 50px;
        }

        .top {
            padding: 12px;
            border: 1px solid gray;
            position: relative;
        }

        .search-input {
            position: absolute;
            right: 70px;
            bottom: 5px;
        }

        .search-btn {
            position: absolute;
            right: 13px;
            bottom: 5px;
        }
    </style>

</head>

<body>


	<%@ include file="../include/header.jsp" %>
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!--카테고리 메뉴-->
                    <ul class="nav nav-tabs">
                        <li><a href="#">회원정보</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티게시판<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">작성글보기</a></li>
                                <li><a href="#">작성댓글보기</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">홍보게시판<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">작성글보기</a></li>
                                <li><a href="#">작성댓글보기</a></li>
                            </ul>
                        </li>
                        <li class="active"><a href="#">주문내역/배송조회</a></li>
                    </ul>

                    <br>
                    <h3>
                        <strong>주문내역/배송조회</strong>
                    </h3>

                    <div>
                        <div class="top">
                            <!--클릭하면 해당 기간의 주문내역을 조회합니다-->
                            <strong>조회기간</strong>
                            <button type="button" class="btn-xs">15일</button>
                            <button type="button" class="btn-xs">1개월</button>
                            <button type="button" class="btn-xs">3개월</button>
                            <button type="button" class="btn-xs">6개월</button>

                            <div class="searchbb" style="float: right;">
                                <input type="text" class="search-input form-control" placeholder="검색" />
                                <button type="submit" class="search-btn btn btn-default">조회</button>
                            </div>
                        </div>
                    </div>

                    <form action="#">
                        <!--테이블 자동 크기 조절-->
                        <table class="table table-hover w-auto">
                            <thead>
                            	<tr>
	                                <th>주문번호</th>
	                                <th>주문일자</th>
	                                <th>주문상품</th>
	                                <th>총 구매금액</th>
	                                <th>주문상태</th>
	                                <th>환불/반품</th>
	                             <tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>22021333781</td>
                                    <td>2022-03-08</td>
                                    <td><a href="#" style="font-weight: 500;">사장님이 주문한 상품 외 0건</a></td>
                                    <td>00000원</td>
                                    <td>결제완료</td>
                                    <td><button type="button" class="btn-xs">환불/반품</button></td>
                                </tr>
                                <tr>
                                    <td>22021333781</td>
                                    <td>2022-03-08</td>
                                    <td><a href="#">사장님이 주문한 상품 외 0건</a></td>
                                    <td>00000원</td>
                                    <td>결제완료</td>
                                    <td><button type="button" class="btn-xs">환불/반품</button></td>
                                </tr>

                            </tbody>
                        </table>
					</form>

                        <div class="text-center">
                            <ul class="pagination">
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

    </body>

</html>