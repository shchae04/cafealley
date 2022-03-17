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
  	
    <div class="fin-container" style="margin-top: 200px;">
        <div class="fin-wrapper" style="display: block; margin: auto;">
            <div>
                <h1>회원가입</h1>
                <br>
                <span class="recborder">회원 가입 / 회원 유형</span>
         
                
                
            </div>
            <div class="" style="margin-top: 30px;">
            <span class="fa-solid fa-user-group fa-10x"></span>
                </div>
       

        <div class="fin-wrapper" style="margin-top: 30px; width: 800px;">
            <div class="leftrec" style="display: inline-block;">
                <div class="">
                <div style="display: inline-block;">
                    <h3 style="text-align: left;">개인회원</h3>
                    <p style="text-align: left;">개인 회원 가입을 원하시면 선택해주세요</p>
                    <br>
                </div>
                <div style="float: right;">
                    <input class="recbtn" type="button" value="회원가입">
                </div>
                </div>

            </div>
            <div class="leftrec" style="float: right;">
                <div class="">
                <div style="display: inline-block;">
                    <h3 style="text-align: left;">사업자회원</h3>
                    <p style="text-align: left;">사업자 회원 가입을 원하시면 선택해주세요</p>
                    <br>
                </div>
                <div style="float: right;">
                    <input class="recbtn" type="button" value="회원가입">
                </div>
                </div>

            </div>
            </div>
</div>



     <%@ include file="../include/footer.jsp" %>


</body>
</html>

