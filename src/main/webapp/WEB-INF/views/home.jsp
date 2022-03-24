<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                            <a href="<c:url value='/promo/list'/>"><img src="<c:url value='/img/slide1.jpg'/>" alt="슬라이드1"></a>
                        </div>
                        <div class="item">
                            <a href="<c:url value='/shop/shopList'/>"><img src="<c:url value='/img/slide2.jpg'/>" alt="슬라이드2"></a>
                        </div>
                        <div class="item">
                            <a href="<c:url value='/cmBoard/cmList'/>"><img src="<c:url value='/img/slide3.jpg'/>" alt="슬라이드3"></a>
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
                <ul class="col-xs-12 mapsize">
                    <img src="<c:url value='/img/map1111.png'/>">
                 
                </ul>
            </div>


            <!-- 이달의 커피숍-->
            <div class="row">
                <ul class="col-xs-12" style="margin-top: 80px; margin-left: 20px;">
                    <h2>BEST CAFE</h2>
                </ul>
                <ul class="col-xs-12" style="margin: 0 auto; padding: 0;">
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                           
                        </a>
                    </li>
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                            
                        </a>
                    </li>
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                           
                        </a>
                    </li>
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#">
                            <img src="<c:url value='/img/box1.jpg'/>" alt="box1">
                         
                        </a>
                    </li>
                    <li class="col-xs-2" style="margin: 0 20px;">
                        <a href="#">
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
                <ul class="col-xs-12">
                    <li class="col-xs-6">
                        <h3>공지사항</h3>
                        <table class="table table-hover w-auto">
                           <thead>
                               <tr>
                                <th>제목</th>
                                <th>작성일</th>
                            </tr>
                           </thead>

                           <!--작성글을 클릭하면 해당 게시물 상세 창으로 이동합니다-->
                           <tbody>
                               <c:forEach var="no" items="${noboard}">
                                <tr>
                                    <td>
                                        <a href="<c:url value='/noBoard/noDetail?bno=${no.bno}'/>">${no.title}</a>
                                    </td>
                                    <td> <fmt:formatDate value="${no.regdate}" pattern="MM-dd"/>
                                </tr>
                               </c:forEach>
                           </tbody>
                       </table>
                    </li>
                    <li class="col-xs-6">
                        <h3>커뮤니티</h3>
                        <table class="table table-hover w-auto">
                           <thead>
                               <tr>
                                <th>제목</th>
                                <th>작성일</th>
                            </tr>
                           </thead>

                           <!--작성글을 클릭하면 해당 게시물 상세 창으로 이동합니다-->
                           <tbody>
                               <c:forEach var="cm" items="${cmboard}">
                                <tr>
                                    <td>
                                        <a href="<c:url value='/cmBoard/cmDetail?bno=${cm.bno}'/>">${cm.title}</a>
                                    </td>
                                    <td> <fmt:formatDate value="${cm.regdate}" pattern="MM-dd"/>
                                </tr>
                               </c:forEach>
                           </tbody>
                       </table>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!--하단 배너 2-->
    <section>
        <div class="container">
            <div class="row">
                <ul class="col-xs-12" style="margin-bottom: 50px;">
                    <li class="col-xs-6">
                        <h3 style="text-align: left;">커피 종류</h3>
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/DPDH9lOs3QI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </li>
                    
                    <li class="col-xs-6">
                        <h3 style="text-align: left;">원두 종류</h3>
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/OdWEovjCy1o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </li>
                </ul>
            </div>
        </div>
    </section>


<%@ include file="./include/footer.jsp"%>

<script>
$(function() {

    console.log('${boardList}');
    // 페이지 url 요청
    $('#pagination').on('click', 'a', function(e) {
        e.preventDefault();
        console.log($(this));
        const value = $(this).data('pagenum');
        console.log(value);
        document.pageForm.pageNum.value = value;
        document.pageForm.submit();
    });
});// end jQuery
</script>

</body>
</html>
