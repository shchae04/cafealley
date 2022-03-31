<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 완료</title>
    
    <link rel="stylesheet" href="<c:url value='/css/kwstyle.css'/>">
    <style>
        .fin-container{
    min-width: 1100px;
    max-width: 1100px;
    margin: 400px auto;
    }
    .fin-wrapper{
    width: 800px;
    margin : 0 auto;
    }
    </style>
    
</head>


<body>

	<%@ include file="../include/header.jsp" %>

    <div class="fin-container">
        <div class="fin-wrapper">
            <span class="fa-solid fa-circle-check fa-10x"></span>
        </div>
        <div>
            <h2>회원가입이 완료되었습니다!</h2>
            <br>
            <span>모든 회원가입절차가 완료되었습니다.</span><br>
            <span>로그인 후 모든 서비스를 이용할 수 있습니다.</span>
            
        </div>
        <div>
            <table class="fin-table">
                <tbody>
                    <tr>
                        <td>이름</td>
                        <td>${info.username}</td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td>${info.userid}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <div class="wrapper">
                <button type="button" id="btnLogin" class="btn btn-lg" style="background-color: #ac7c7c; color: white;">
                	<a data-toggle="modal" data-target="#myModal">로그인 화면으로</a>
                </button>
                &emsp;&emsp;&emsp;&nbsp;
                <button type="button" class="btn btn-lg">
                	<a herf="<c:url value='/'/>">메인페이지</a>
                </button>
                

            </div>
        </div>
    </div>


    <%@ include file="../include/footer.jsp" %>

</body>
</html>

