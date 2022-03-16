<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memSbscrInfo</title>
    

    <style>
        .clearfix::after {
            content: '';
            display: block;
            clear: both;
        }
    
        .container {
            min-width: 1200px;
            margin-top: 150px;
            margin-bottom: 150px;
        }
    
        .membership {
            padding: 20px;
            margin-top: 20px;
            margin-bottom: 10px;
        }
    
        .membership-text {
            border-top: 2px solid black;
            border-bottom: 2px solid black;
            padding: 20px;
            margin: 20px;
        }
    
        .membership-text3 {
            border-top: 2px solid black;
            border-bottom: 2px solid black;
            padding: 80px;
            margin: 20px;
        }
    </style>

</head>

<body>
    
	<%@ include file="../include/header.jsp" %>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <br>
                    <h1><strong>멤버십 구독 서비스</strong></h1>

                    <div class="membership">
                        cafe alley 만의 구독 서비스<br>
                        cafe alley에 등록된 모든 카페의 멤버십 통합!<br>
                        어느 곳에서나 10잔 이상 구매시 1잔 무료!
                    </div>


                    <div class=containter-fluid>
                        <div class="row">
                            <!--내용은 변경-->
                            <div class="col-md-4">
                                <h3><strong>회원 구독 서비스</strong></h3>
                                <div class="membership-text">
                                    <strong>cafe alley만의 모든 카페 멤버십을 통합!!</strong><br>
                                    <br>
                                    어느 카페든 10잔을 구매했을 경우 <br>
                                    <strong>1잔 무료 서비스!</strong><br>
                                    <br>
                                    커피 맛집, 디저트 맛집 <br>
                                    노키즈존, 반려동물 동반가능 등 <br>
                                    편의시설을 따로따로 알아 볼 필요 없이 <br>
                                    한번에 찾아 볼 수 있는 편리함!
                                </div>

                            </div>
                            <div class="col-md-4">
                                <h3><strong>사장님 구독 서비스</strong></h3>
                                <div class="membership-text">
                                    카페 물품 <br>
                                    이곳 저곳 돌아다니지 않고 <br>
                                    한 곳에서 편리하게! <br>
                                    시중가보다 더욱 저렴하게! <br>
                                    <br>
                                    우리 가게의 홍보를 보다 쉽게! <br>
                                    고객 관리를 더 편리하게! <br>
                                    커뮤니티로 <br>
                                    고객 유치는 자연스럽게!
                                </div>

                            </div>
                            <div class="col-md-4">
                                <h3><strong>금액 안내</strong></h3>
                                <div class="membership-text3">
                                    이 모든 혜택을<br>
                                    월 4,000원에 만나보세요!
                                </div>

                            </div>
                        </div>
                    </div>
                    <br>
                    <button type="button" class="btn">구독 서비스 신청</button>
                </div>

            </div>
        </div>

		<%@ include file="../include/footer.jsp" %>

</body>

</html>