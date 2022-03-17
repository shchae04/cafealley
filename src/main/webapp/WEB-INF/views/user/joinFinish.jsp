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
    
    
</head>


<body>

	<%@ include file="../include/header.jsp" %>

    <div class="fin-container" style="margin-top: 150px; margin-left: 250px;">
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
                        <td>{홍길동}</td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td>{honggil1234}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <div class="wrapper">
                <button type="button" class="btn btn-lg" style="background-color: #ac7c7c; color: white;">로그인 화면으로 ></button>
                &emsp;&emsp;&emsp;&nbsp;
                <button type="button" class="btn btn-lg">메인페이지 </button>
                

            </div>
        </div>
    </div>


    <%@ include file="../include/footer.jsp" %>
</body>
</html>

