<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>orderManagement</title>
    
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    
    

    <style>
        @font-face {
            font-family: 'S-CoreDream-4Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

         body {
            width: 100%;
            font-family: 'S-CoreDream-4Regular';
        }
        section {
            display: block;
            width: 90%;
            margin: 160px auto;
        }
        .container{
            min-width: 1200px;
        }

        .ord-mgmt-title {
            font-size: 29px;
            font-weight: bold;
        }

        .ord-mgmt-table {
            margin: 30px 0;
        }
        a{
        	font-weight: 700;
        }
    </style>
</head>
<body>
    
    <%@ include file="../include/header.jsp" %>
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <p class="ord-mgmt-title">주문 관리</p>
                    <table class="table ord-mgmt-table w-auto text-center align-middle">
                        <thead>
                            <tr>
                                <td>주문번호</td>
                                <td>주문자아이디</td>
                                <td>총 주문 가격</td>
                                <td>주문 정보</td>
                                <td>주문 날짜</td>
                                <td>주문 상태</td>
                                <td>배송 정보</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>abc1234</td>
                                <td>${orderlist.userid}</td>
                                <td><a href="#">xxxx 외 x개</a></td>
                                <td>22/03/10</td>
                                <td>
                                    <select>
                                        <option value="wait-dep">입금대기중</option>
                                        <option value="dep-cmp">입금완료</option>
                                        <option value="pre-del">배송준비중</option>
                                        <option value="being-del">배송중</option>
                                    </select>
                                </td>
                                <td>
                                    <button id="btn-del-info">배송정보보기</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </section>

    <%@ include file="../include/footer.jsp" %>
        
    <script>
        $(function(){
            $('#btn-del-info').click(function(){
                window.open('http://127.0.0.1:5500/orderManagement.html', '사용자 배송정보', 'width=500, height=700, scrollbars=yes, resizable=no')
            });//배송정보보기 버튼 이벤트 끝
        }); //end jQuery
    </script>

</body>
</html>