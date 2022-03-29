<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/bootstrap.css">

    <style>
        .ul-list>li {
            width: 326px;
            height: 300px;
            border: 2px solid #ddd;
            list-style: none;
            float: left;
            margin: 0 20px;
            position: relative;
        }


        .ul-list li>div {
            width: 200px;
            position: absolute;
            left: 62px;
            top: 200px;
        }

        .ul-list>span {
            position: inherit;

        }

        div>p,
        strong {
            text-align: center;
            font-size: 18px;

        }

        .ul-list li i {
            position: relative;
            top: 60px;
        }
    </style>


   
</head>

<body>	

		<%@ include file="./include/header.jsp" %>
	

    <div class="container" style="margin: 200px auto;">
        <div style="margin-bottom: 100px;">

            <ul class="ul-list">
                <li style="margin-left: 0;">
                    <i class="fa-solid fa-circle-nodes fa-8x" style="left: 100px;"></i>
                    <div>
                        <p>
                            <strong>COFFEE CONNECT</strong>
                        </p>
                        <p>VISION</p>
                    </div>
                </li>
                <li style="visibility:hidden">
                    <div>
                        <p>
                            <strong>Information Base</strong>
                        </p>
                        <p>정보 기반</p>
                    </div>
                </li>
                <li>

                    <i class="fa-solid fa-people-line fa-8x" style="left: 90px;"></i>
                    <div >
                        <p>
                            <strong>CAFE WITH ALLEY</strong>
                        </p>
                        <p>MISSION</p>
                    </div>
                </li>

            </ul>



        </div>


        
        <div class="col-xs-12" style="margin-top: 50px; margin-bottom: 100px; font-weight: bold;">

            <div>

                <span>
                    <p style="text-align: center;">
                        <Strong>카페</Strong>, 그 이상의 문화를 만들다
                        <br>
                        카페엘리는 공유 카페 브랜드로서 커피는 물론 다양한 디저트를 함께 즐기는 새로운 카페 문화를 선보였습니다.

                        사업을 통해 서울과 수도권, 지방 광역시 등에 동네 카페 문화를 확산시키며 고객의 기호와 니즈에 맞는 리딩 브랜드로서의 기틀을 다져나갔습니다.
                        <br>
                        카페엘리는 <strong>Communication</strong> 을 통해

                        다양한 경험을 제공할 것 입니다.
                        (주)Cafe Alley는 프리미엄 커피, 동네 공유 카페 문화의 지속적인 가치를 창조하며 더욱 차별화된 제품과 서비스를 선보일 것입니다.
                    </p>
                </span>

            </div>

        </div>



        <div>
            
            <ul class="ul-list" style="margin: 0 auto;">
                <p style="font-size: 40px; font-weight: bold; text-align: left; margin-left: 35px;  color: black;">핵심가치</p>
                <li style="margin-left: 0;">



                    <i style="left: 107px;" class="fa-solid fa-heart fa-8x"></i>

                    <div>
                        <p>
                            <strong>Customer Oriented</strong>
                        </p>
                        <p>고객 중심</p>
                    </div>
                </li>

                <li>

                    <i style="left: 110px;" class="fa-solid fa-database fa-8x"></i>

                    <div>
                        <p>
                            <strong>Information Base</strong>
                        </p>
                        <p>정보 기반</p>
                    </div>
                </li>

                <li>

                    <i style="left: 100px;" class="fa-solid fa-tower-cell fa-8x"></i>

                    <div>
                        <p>
                            <strong>Operational Excellence</strong>
                        </p>
                        <p>운영 탁월성</p>
                    </div>
                </li>

            </ul>




        </div>

        







    </div>

	<%@ include file="./include/footer.jsp" %>

</body>

</html>