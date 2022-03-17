<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Cafe Alley</title>
	
	<link rel="stylesheet" href="<c:url value='/css/kwstyle2.css'/>">
	
</head>
<body>

<%@ include file="./include/header.jsp" %>

    <section style="margin-top: 150px;">
        <!-- 슬라이드(캐러셀) 구현 시작 -->
        <div class="container-fluid" style="width: auto;">
            <div class="row">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="<c:url value='/img/slide1.jpg'/>" alt="슬라이드1">
                        </div>
                        <div class="item">
                            <img src="<c:url value='/img/slide2.jpg'/>" alt="슬라이드2">
                        </div>
                        <div class="item">
                            <img src="<c:url value='/img/slide3.jpg'/>" alt="슬라이드3">
                        </div>
                    </div>

                    <!-- 좌, 우 화살표 (없애고 싶으면 지워도 됩니다.) -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>
            </div>
        </div>
    </section>

    <!-- map api -->
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <h2>Located</h2>
                </div>
            </div>
            <div class="row">
                <ul class="col-xs-12 prod-list mapsize">
                    <img src="<c:url value='/img/map1111.png'/>">
                 
                </ul>
            </div>


            <!-- 이달의 커피숍-->
            <div class="row">
                <ul class="col-xs-12" style="margin-top: 80px; margin-left: 20px;">
                    <h2>이달의 커피숍</h2>
                </ul>
                <ul class="col-xs-12" style="margin: 0 auto; padding: 0;">
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#" class="prod-link">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                           
                        </a>
                    </li>
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#" class="prod-link">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                            
                        </a>
                    </li>
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#" class="prod-link">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                           
                        </a>
                    </li>
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#" class="prod-link">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                         
                        </a>
                    </li>
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#" class="prod-link">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!--하단 배너 1-->
    <section>
        <div class="container">
            <div class="row">
                <ul class="col-xs-12 prod-list" style="margin: 0 auto; padding: 0;">
                    <li class="col-xs-6">
                        <h3>커뮤니티 게시판</h3>
                        <a href="#" class="prod-link">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                        </a>
                    </li>
                    <li class="col-xs-6">
                        <h3>공지사항</h3>
                        <a href="#" class="prod-link">
                            <img src="<c:url value='/img/box2.jpg'/>" alt="box2">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!--하단 배너 2-->
    <section>
        <div class="container">
            <div class="row">
                <ul class="col-xs-12 prod-list">
                    <li class="col-xs-6">
                        <h3 style="text-align: left;">#커피의 종류</h3>
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/DPDH9lOs3QI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 
                    </li>
                    <li class="col-xs-6">
                        <h3>Membership</h3>
                        <a href="#" class="prod-link">
                            <img src="<c:url value='/img/box2.jpg'/>" alt="box2">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>


<%@ include file="./include/footer.jsp"%>

</body>
</html>
