<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
    	.blinking{ 
	    	-webkit-animation:blink 1.2s ease-in-out  alternate; 
	    	-moz-animation:blink 1.2s ease-in-out  alternate; 
	    	animation:blink 1.2s ease-in-out  alternate; 
    	}
    	@-webkit-keyframes blink{ 
    		0% {opacity:0;} 
    		100% {opacity:1;} 
    	} 
    	@-moz-keyframes blink{ 
    		0% {opacity:0;} 
    		100% {opacity:1;} 
    	} 
    	@keyframes blink{ 
    		0% {opacity:0;} 
    		100% {opacity:1;} 
    	}
    
    	.modal-content {
    		height: 680px;
    	}
        .promboard {
            display: block;
            margin-top: 150px;
            min-height: 5000px;
            min-width: 1200px;
        }
        a:focus{
            color:black;
        }
        li {
            list-style: none;
        }

        .aside-wrapper {
            position: absolute;
            min-width: 20%;
            max-width: 20%;
            margin: 0;
            left: 0px;
            background-color: #ffffff;
            top: 150px;

        }

        aside {
            min-width: 100%;
            float: left;
            position: sticky;
            top: 150px;
        }

        .promboard-filter {
            padding: 0 30px 0 30px;
        }

        .promboard-filter>li {
            border-bottom: solid 1px black;
            padding: 0.5vh 0 0.5vh 0;
        }

        .promboard-filter li span {
            font-size: 2vh;
            font-weight: 700;
        }

        .promboard-filter li ul li {
            padding: 0;
            margin: 0;
        }

        .promboard-filter input[type="checkbox"] {
            font-size: 1.5vh;
            display: none;
        }

        .promboard-filter label:hover {
            cursor: pointer;
        }



        /* snsboard */
        section {
            position: relative;
            left: 300px;
            min-width: 900px;
            max-width: 900px;
            margin: 20px 0 0 0;
        }

        #contentDiv {
            margin: 0 0 0 calc(30vw - 300px);
            min-width: 940px;
            max-width: 940px;
            border-right: 1px solid #ddd;
            border-left: 1px solid #ddd;
            background-color: white;
            padding: 10px 20px;
            position: relative;
        }

        .cafeowner-menu {
            position: absolute;
            top: 15px;
            right: 15px;
        }

        .glyphicon-user {
            display: inline-block;
            height: 20px;
            padding-right: 15px;
            border-right: 1px solid black;
        }

        .glyphicon-pencil {
            display: inline-block;
            height: 20px;
            padding-left: 15px;
        }

        .content-wrapper {
            margin-top: 50px;
            width: 900px;
        }

        .title-inner {
            position: relative;
            padding: 15px 0;
            margin-top: 15px;
            border-top: 1px solid #ddd;
        }


        .title p,
        .profile p {
            font-weight: bolder;
        }

        .title-inner .profile {
            position: absolute;
            /*부모기준으로 위치지정 릴레이티브*/
            top: 15px;
            left: 0;
        }

        .title-inner .title {
            padding-left: 50px;
        }

        .image-inner {
            width: 900px;
        }

        .image-inner img {
            min-width: 900px;
            min-height: 600px;
            max-height: 600px;
        }

        .like-inner {
            position: relative;
            padding: 10px;
            margin-top: 10px;
            min-height: 40px;
            max-height: 40px;
            /* border-top: 1px solid #ddd; */
            border-bottom: 1px solid #ddd;

        }

        .like-inner img {
            width: 20px;
            height: 20px;
        }

        .like-inner .hashtag {
        	margin-top: 30px;
            position: absolute;
            top: 10px;
            right: 15px;
            padding: 0;
        }
        
        .like-inner .main {
        	margin-top: 5px;
            position: absolute;
            top: 0px;
            right: 15px;
            padding: 0;
        }

        .like-inner .hashtag li {
            float: left;
            padding-left: 5px;
            padding-right: 5px;
            font-size: 15px;
        }


        .like-inner .hashtag select {
            border-radius: 0;
            outline: none;
            border: 2px solid #000;
            font-size: 16px;
        }


        .link-inner {
            overflow: hidden;
            padding: 10px 0;
        }

        .link-inner a {
            float: left;
            width: 33.3333%;
            text-align: center;
            text-decoration: none;
            color: #333333;
        }

        .link-inner i {
            margin: 0 5px;
        }

        .link-inner img {
            width: 18px;
            height: 18px;
            margin-bottom: 3px;
        }

        /* 캐러셀 이동버튼 뒤에 그림자 없애기 */
        /* .carousel-control.left,
        .carousel-control.right {
            background-image: none;
        } */

        /* 모달 닫는 버튼 */
        .modal-dialog button[data-dismiss='modal'] {
            position: fixed;
            right: -100px;
            top: 0px;
            color: white;
            font-size: 50px;
            opacity: 1;
        }


        .modal-promimg {
            display: block;
            float: left;
            max-width: 800px;
            min-width: 800px;
        }

        .modal-promimg img {
            /* max-width: 630px;
            min-width: 630px; */
            min-height: 600px;
            max-height: 600px;
            margin: 0 auto;
        }

        .modal-promcontent {
            display: block;
            min-width: 350px;
            max-width: 350px;
            max-height: 600px;
            min-height: 600px;
            float: right;
        }

        .modal-promcontent .title-inner {
            margin: 0;
        }

        .modal-promcontent .content-inner {
            max-height: 95px;
            min-height: 95px;
            position: relative;
        }

        .modal-promcontent .content-inner textarea {
            display: inline-block;
            position: absolute;
            top: 15px;
            left: 0;
            border: none;
            resize: none;
            width: 90%;
            height: 80px;
            font-size: 15px;
            overflow: scroll;
            -ms-overflow-style: none;
            overflow-x: hidden;
            outline: none;
            border: 1px solid #ddd;
        }

        .modal-promcontent .content-inner textarea::-webkit-scrollbar {
            display: none;
        }

        .modal-promcontent .like-inner {
            padding-left: 5px;
            padding-right: 5px;
        }

        .modal-promcontent .reply-inner {
            padding: 30px 0 15px;
            margin-top: 50px;
            border-bottom: 1px solid #ddd;
            min-height: 325px;
            max-height: 325px;
            overflow: scroll;
            overflow-x: hidden;
            -ms-overflow-style: none;
        }

        .modal-promcontent .reply-inner::-webkit-scrollbar {
            display: none;
        }

        .modal-promcontent .reply-inner .reply-content {
            padding: 5px 0;
        }

        .modal-promcontent .reply-inner .reply-content .profile img {
            width: 25px;
            height: 25px;
        }

        .modal-promcontent .reply-inner .reply-content .profile p,
        .modal-promcontent .reply-inner .reply-content .profile img {
            display: inline-block;
        }

        .modal-promcontent .reply-form {
            display: block;
            width: 100%;
            height: 50px;
            position: relative;
        }

        .modal-promcontent .reply-form textarea {
            display: inline-block;
            position: absolute;
            top: 15px;
            left: 0;
            border: none;
            resize: none;
            width: 75%;
            height: 25px;
            overflow: scroll;
            -ms-overflow-style: none;
            font-size: 15px;
        }

        .modal-promcontent .reply-form textarea::-webkit-scrollbar {
            display: none;
        }

        .reply-form textarea:focus {
            outline: none;
        }

        .reply-form textarea::placeholder {
            line-height: 25px;
            text-indent: 10px;
            font-size: 15px;
            color: black;
        }

        .modal-promcontent .reply-form input[type="button"] {
            display: inline-block;
            position: absolute;
            top: 5px;
            right: 0;
            border: none;
            width: 20%;
            height: 50px;
            background-color: white;
            color: cornflowerblue;
            font-weight: bolder;

        }

        #myModal3 .like-inner,
        #myModal4 .like-inner {
            min-height: 430px;
            max-height: 430px;
        }

        #myModal3 .like-inner .hashtag,
        #myModal4 .like-inner .hashtag {
            position: absolute;
            top: 10px;
            left: 15px;
            padding: 0;
        }

        #myModal3 .like-inner .hashtag p,
        #myModal3 .like-inner .hashtag span,
        #myModal4 .like-inner .hashtag p,
        #myModal4 .like-inner .hashtag span {
            font-size: 20px;
            font-weight: bolder;
        }

        #myModal3 .like-inner label:hover,
        #myModal4 .like-inner label:hover {
            cursor: pointer;
        }

        #myModal3 .like-inner ul,
        #myModal4 .like-inner ul {
            padding: 0;
        }

        #myModal3 .like-inner ul li,
        #myModal4 .like-inner ul li {
            float: none;
            font-size: 18px;
        }

        /* sns파일 업로드시 미리보기  */

        .fileDiv {
            width: 800px;
            box-sizing: border-box;
            border: 1px dashed #ffffff;
        }

        .fileDiv:hover {
            cursor: pointer;
            border: 1px dashed #555;
            opacity: 0.5;
        }

        .fileDiv img {
            display: block;
        }

        .fileDiv p {
            text-align: center;
            margin-top: 10px;
        }

        #myModal4 .modal-promimg img[src="/cafealley/img/upload.png"] {
            width: 300px;
            min-height: 300px;
            margin: 0 250px 100px;
        }

        #myModal4 .like-inner .hashtag p.warn {
            font-size: 10px;
            width: 100%;
            position: absolute;
            bottom: -100px;
            color: red;
        }
    </style>

</head>

<body>


    <%@ include file="../include/header.jsp"%>
    
    
    
    
    <!---------------------------------------------------------- 글 상세  Modal ---------------------------------------------------------->
    <div class="modal fade" id="modalContent">
        <div class="modal-dialog" style="width: 1200px;">

            <button type="button" class="close" data-dismiss="modal">&times;</button>

            <!-- Modal Content -->
            <div class="modal-content">

                <div class="modal-body clearfix">

                    <div class="modal-promimg">
                        <div id="myCarousel2" class="carousel" data-ride="carousel" data-interval="false">
							
							<!-- 비동기 방식으로 캐러셀 추가 -->
							
                        </div> <!-- carousel-->
                    </div> <!-- modal-promimg -->



                    <div class="modal-promcontent">
                        <div id="addProf" class="title-inner">

							<!-- 비동기 내에서 완성됨. -->
							
                        </div>
                        <!--내용영역 70자 내로 작성하게 할 것.-->
                        <div class="content-inner">
                            <p id="con-content"></p>
                            <small id="con-regdate"></small>
                        </div>

                        <!-- 좋아요 및 해쉬태그 영역-->
                        <div class="like-inner">
                            <!--좋아요-->
                            <img src="<c:url value='/img/like2.png'/>"> <span id="like-cnt">522</span>
                            <!-- 해쉬태그 -->
                            <ul class="hashtag clearfix">
                                <li><a id="con-area" href="#">#서울</a></li>
                                <li><a id="con-place" href="#">#Morden / Neat</a></li>
                                <li><a id="con-limit" href="#">#No Kids</a></li>
                            </ul>
                        </div>

                        <!-- 댓글 영역 -->
                        <div id="replyContentDiv" class="reply-inner">
							
							<!-- 비동기 방식으로 불러오고 있습니다. -->
							
                        </div>
                        <div class="reply-form">
                                <textarea name="content" id="modal-reply-content" placeholder="댓글 입력"></textarea>
                                <input type="button" value="게시" id="replyRegBtn"></input>
                        </div>



                    </div> <!-- modal-promcontent-->

                </div> <!-- modal-body-->

            </div> <!-- modal-content -->
        </div> <!-- modal-dialog -->
    </div> <!-- modal-fade myModal2-->


    <!---------------------------------------------------------- 수정 Modal ---------------------------------------------------------->
    <div class="modal fade" id="modifyModal">
        <div class="modal-dialog" style="width: 1200px;">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <!-- Modal Content -->
            <div class="modal-content">

                <div class="modal-body clearfix">

                    <div class="modal-promimg">
                        <div id="myCarousel3" class="carousel" data-ride="carousel" data-interval="false">
                            
                            <!-- 비동기 처리~ -->

                        </div> <!-- carousel-->
                    </div> <!-- modal-promimg -->


                    <div class="modal-promcontent">
                        <div class="title-inner">

                            <!--제목영역-->
                            <div class="profile">
                                <img src="<c:url value='/img/profile.png'/>">
                            </div>
                            <div class="title">
                                <p id="mod-writer">coffeelover123</p>
                            </div>
                            <div class="cafeowner-menu">
                                <a id="mod-complete" href="#"><span class="glyphicon glyphicon-ok"></span>&nbsp;Complete</a>
                            </div>
                        </div>
                        <!--내용영역 70자 내로 작성하게 할 것.-->
                        <div class="content-inner">
                            <textarea name="content" id="modifymodal-content"></textarea>
                        </div>

                        <!-- 좋아요 및 해쉬태그 영역-->
                        <div class="like-inner">
                            <!-- 해쉬태그 -->
                            
                                <p>Area</p>
                                <span>#</span>
                                <select name="area" id="mod-area">
                                    <option value="서울">서울</option>
                                    <option value="경기/인천">경기/인천</option>
                                    <option value="강원">강원</option>
                                    <option value="충북">충북</option>
                                    <option value="충남/대전">충남/대전</option>
                                    <option value="경북/대구">경북/대구</option>
                                    <option value="경남/부산">경남/부산</option>
                                    <option value="전북">전북</option>
                                    <option value="전남/광주">전남/광주</option>
                                    <option value="제주">제주</option>
                                </select>


                                <div style="margin-top: 25px;"></div>
                                <p>Place</p>
                                <span>#</span>
                                <select name="" id="mod-place">
                                    <option value="-"> - </option>
                                    <option value="Nature / Wooden">Nature / Wooden</option>
                                    <option value="Concrete / Industrial">Concrete / Industrial</option>
                                    <option value="Morden / Neat">Morden / Neat</option>
                                    <option value="Retro / Vintage">Retro / Vintage</option>
                                    <option value="Cozy / Comfort">Cozy / Comfort</option>
                                </select>


                                <div style="margin-top: 25px;"></div>
                                <p>Restrictions</p>
                                <ul>
                                    <li><span>#&nbsp;</span><label><input type="checkbox" name="limitation1" value="No Kids">No Kids</label></li>
                                    <li><span>#&nbsp;</span><label><input type="checkbox" name="limitation2" value="No Pets">No Pet</label></li>
                                    <li><span>#&nbsp;</span><label><input type="checkbox" name="limitation3" value="No Study">No Study</label></li>
                                </ul>

                        </div>
                        </ul>
                    </div>


                </div> <!-- modal-promcontent-->

            </div> <!-- modal-body-->

        </div> <!-- modal-content -->
    </div> <!-- modal-dialog -->
    </div> <!-- modal-fade myModal3-->


    <!---------------------------------------------------------- 작성 Modal ---------------------------------------------------------->
    <div class="modal fade" id="myModal4">
        <div class="modal-dialog" style="width: 1200px;">
            <button type="button" class="close" data-dismiss="modal" id="writing-dismiss">&times;</button>
            <!-- Modal Content -->
            <div class="modal-content">

                <div class="modal-body clearfix">
                    <div class="modal-promimg" id="writingmodal-img">
                        <div id="myCarousel4" class="carousel" data-ride="carousel" data-interval="false">

                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel4" data-slide-to="0" class="active"></li>
                            </ol>


                            <div class="carousel-inner" role="listbox">
                                <div class="item active">


                                    <label for="file" class="fileDiv">
                                        <p>클릭해서 업로드할 이미지를 선택해주세요.</p>
                                        <img id="fileImg" src="<c:url value='/img/upload.png'/>" alt="upload" />
                                        <input type="file" name="file" id="file" onchange="readURL(this)"
                                            style="display: none;">
                                    </label>
                                </div>
                            </div>

                            <a class="left carousel-control" href="#myCarousel4" role="button" data-slide="prev"
                                style="display:none">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel4" role="button" data-slide="next"
                                style="display:none">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>

                        </div> <!-- carousel-->
                    </div> <!-- modal-promimg -->



                    <div class="modal-promcontent">
                        <div class="title-inner">

                            <!--제목영역-->
                            <div class="profile">
                                <img src="<c:url value='/img/profile.png'/>">
                            </div>
                            <div class="title">
                                <p id="writer">${login.username}</p>
                            </div>
                            <div class="cafeowner-menu">
                                <a href="#"><span class="glyphicon glyphicon-ok"></span>&nbsp;Complete</a>
                            </div>
                        </div>
                        <!--내용영역 70자 내로 작성하게 할 것.-->
                        <div class="content-inner">
                            <textarea name="content" id="writingmodal-content"></textarea>
                        </div>

                        <!-- 좋아요 및 해쉬태그 영역-->
                        <div class="like-inner">
                            <!-- 해쉬태그 -->
                            <ul class="hashtag clearfix">
                                <p>Area</p>
                                <span>#</span>
                                <select name="area" id="write-area">
                                    <option value="서울" selected>서울</option>
                                    <option value="경기/인천">경기/인천</option>
                                    <option value="강원">강원</option>
                                    <option value="충북">충북</option>
                                    <option value="충남/대전">충남/대전</option>
                                    <option value="경북/대구">경북/대구</option>
                                    <option value="경남/부산">경남/부산</option>
                                    <option value="전북">전북</option>
                                    <option value="전남/광주">전남/광주</option>
                                    <option value="제주">제주</option>
                                </select>


                                <div style="margin-top: 25px;"></div>
                                <p>Place</p>
                                <span>#</span>
                                <select name="place" id="write-place">
                                    <option value="none" selected> - </option>
                                    <option value="Nature / Wooden">Nature / Wooden</option>
                                    <option value="Concrete / Industrial">Concrete / Industrial</option>
                                    <option value="Modern / Neat">Modern / Neat</option>
                                    <option value="Retro / Vintage">Retro / Vintage</option>
                                    <option value="Cozy / Comfort">Cozy / Comfort</option>
                                </select>


                                <div style="margin-top: 25px;"></div>
                                <p>Restrictions</p>
                                <ul>
                                    <li><span>#&nbsp;</span><label><input type="checkbox" id="limit1" name="limitation1" value="No Kids">No Kids</label></li>
                                    <li><span>#&nbsp;</span><label><input type="checkbox" id="limit2" name="limitation2" value="No Pet">No Pet</label></li>
                                    <li><span>#&nbsp;</span><label><input type="checkbox" id="limit3" name="limitation3" value="No Study">No Study</label></li>
                                </ul>
                                <p class="warn">카페 사장님께서는 연관 없는 내용을 작성시 제재를 받으실 수 있습니다.</p>
                        </div>
                        </ul>
                    </div>


                </div> <!-- modal-promcontent-->

            </div> <!-- modal-body-->

        </div> <!-- modal-content -->
    </div> <!-- modal-dialog -->
    </div> <!-- modal-fade myModal4-->




    <div class="promboard clearfix">


        <!-- 어사이드 영역 -->
        <div class="aside-wrapper">
            <aside>
                <ul class="promboard-filter">
                    <li>
                        <span>지역</span>
                        <ul id="area">
                            <li><label><input type="checkbox">서울</label></li>
                            <li><label><input type="checkbox">경기/인천</label></li>
                            <li><label><input type="checkbox">강원</label></li>
                            <li><label><input type="checkbox">충북</label></li>
                            <li><label><input type="checkbox">충남/대전</label></li>
                            <li><label><input type="checkbox">경북/대구</label></li>
                            <li><label><input type="checkbox">경남/부산</label></li>
                            <li><label><input type="checkbox">전북</label></li>
                            <li><label><input type="checkbox">전남/광주</label></li>
                            <li><label><input type="checkbox">제주</label></li>
                        </ul>
                    </li>
                    <li>
                        <span>분위기/장소</span>
                        <ul id="place">
                            <li><label><input type="checkbox">Nature / Wooden</label></li>
                            <li><label><input type="checkbox">Concrete / Industrial</label></li>
                            <li><label><input type="checkbox">Morden / Neat</label></li>
                            <li><label><input type="checkbox">Retro / Vintage</label></li>
                            <li><label><input type="checkbox">Cozy / Comfort</label></li>
                        </ul>
                    </li>
                    <li>
                        <span>제한</span>
                        <ul id="restrict">
                            <li><label><input type="checkbox">No Kids</label></li>
                            <li><label><input type="checkbox">No Pets</label></li>
                            <li><label><input type="checkbox">No Study</label></li>

                        </ul>
                    </li>
                </ul>
            </aside>
        </div>

        <!-- 글 영역 -->
        <section>

            <div id="contentDiv">
                        
				<!-- getJSON이 영역을 채우고 있어용 -->
				                
            </div>
        </section>

    </div>


<%@include file="../include/footer.jsp"%>

    <script>
    	
    	//글 목록 작업
    	let str = '';
		let page = 1;
		
    	getListLike(function(data) {
			getList(data, true, page,'','','','','');
		});
    	
    	function getListLike(callbackFunc) {
			
    		const userid = '${login.userid}';
			console.log(userid);
			
			if(userid !== '') {
				$.ajax({
					type: 'post',
					url: '<c:url value="/promo/listLike" />',
					contentType: 'application/json',
					data: userid,
					success: function(data) {
						console.log(data);
						
						callbackFunc(data);
					},
					error: function() {
						alert('처리 안됨!');	
					}
				});
			} else {
				callbackFunc(null);
			}		
			
		} //end getList
		
		
		//
		
			
			
			
	
		
			//지역 페이징 처리 각자의 area li 지목.
        		const $area = document.getElementById('area');
                const $place = document.getElementById('place');
                const $restrict = document.getElementById('restrict');


                //값을 담을 변수 선언 값이 판단 될 때 마다
                var picarea ='';
                var picmood ='';
                var limit1 ='false';
                var limit2 ='false';
                var limit3 ='false';
		
             
                	
                	//값 불러오는곳!!
		const $promboardfilter = document.querySelector('.promboard-filter');
                $promboardfilter.addEventListener('click', e => {



                    console.log('이벤트 발생');

                    if (e.target.matches('#area input[type="checkbox"]')) {
                        console.log('지역필터안에 들어옴');

                        //선택한 지역
                        picarea = e.target.parentNode.textContent;

                        if (e.target.checked) {

                            if (picarea === '서울') {
                                e.target.parentNode.style.fontSize = '20px';

                                //나머지 false 처리.
                                // console.log($area.children[1].children[0].childNodes[0]);
                                for (let $li of $area.children) {
                                    //console.log($li);
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '경기/인천') {
                                e.target.parentNode.style.fontSize = '20px';

                                for (let $li of $area.children) {
                                    //console.log($li);
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '강원') {
                                e.target.parentNode.style.fontSize = '20px';
                                for (let $li of $area.children) {
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '충북') {
                                e.target.parentNode.style.fontSize = '20px';
                                for (let $li of $area.children) {
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '충남/대전') {
                                e.target.parentNode.style.fontSize = '20px';
                                for (let $li of $area.children) {
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '경북/대구') {
                                e.target.parentNode.style.fontSize = '20px';
                                for (let $li of $area.children) {
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '경남/부산') {
                                e.target.parentNode.style.fontSize = '20px';
                                for (let $li of $area.children) {
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '전북') {
                                e.target.parentNode.style.fontSize = '20px';
                                for (let $li of $area.children) {
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '전남/광주') {
                                e.target.parentNode.style.fontSize = '20px';
                                for (let $li of $area.children) {
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }

                            if (picarea === '제주') {
                                e.target.parentNode.style.fontSize = '20px';
                                for (let $li of $area.children) {
                                    if ($li.children[0].children[0] !== e.target) {
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }

                                }
                            }




                        } else {


                            if (picarea === '서울') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '경기/인천') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '강원') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '충북') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '충남/대전') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '경북/대구') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '경남/부산') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '전북') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '전남/광주') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                            if (picarea === '제주') {
                                e.target.parentNode.style.fontSize = '14px';
                                picarea = '';
                            }

                        }





                    } else if (e.target.matches('#place input[type="checkbox"]')) {
                        console.log('분위기필터안에 들어옴');
                        
                        picmood = e.target.parentNode.textContent;

                        if (e.target.checked) {

                            if(picmood === 'Nature / Wooden'){
                                e.target.parentNode.style.fontSize = '20px';

                                for($li of $place.children){
                                    if($li.children[0].children[0] !== e.target){
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }
                                }
                            }

                            if(picmood === 'Concrete / Industrial'){
                                e.target.parentNode.style.fontSize = '20px';

                                for($li of $place.children){
                                    if($li.children[0].children[0] !== e.target){
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }
                                }
                            }

                            if(picmood === 'Morden / Neat'){
                                e.target.parentNode.style.fontSize = '20px';

                                for($li of $place.children){
                                    if($li.children[0].children[0] !== e.target){
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }
                                }
                            }

                            if(picmood === 'Retro / Vintage'){
                                e.target.parentNode.style.fontSize = '20px';

                                for($li of $place.children){
                                    if($li.children[0].children[0] !== e.target){
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }
                                }
                            }

                            if(picmood === 'Cozy / Comfort'){
                                e.target.parentNode.style.fontSize = '20px';

                                for($li of $place.children){
                                    if($li.children[0].children[0] !== e.target){
                                        $li.children[0].children[0].checked = false;
                                        $li.children[0].style.fontSize = '14px';
                                    }
                                }
                            }




                        } else {

                            if(picmood === 'Nature / Wooden'){
                                picmood = '';
                            }

                            if(picmood === 'Concrete / Industrial'){
                                picmood = '';
                            }


                            if(picmood === 'Morden / Neat'){
                                picmood = '';
                            }


                            if(picmood === 'Retro / Vintage'){
                                picmood = '';
                            }


                            if(picmood === 'Cozy / Comfort'){
                                picmood = '';
                            }


                        }

                    } else if (e.target.matches('#restrict input[type="checkbox"]')) {
                        if (e.target.checked) {
                            e.target.parentNode.style.fontSize = '20px';
                            var restrict = e.target.parentNode.textContent;

                            //boolean 타입의 변수 3개 선언. 누적해서 제한해야 하는데 어떻게 하지..

                            if (restrict === 'No Kids') {
                                limit1 = 'true';
                            }

                            if (restrict === 'No Pets') {
                                limit2 = 'true';
                            }

                            if (restrict === 'No Study') {
                                limit3 = 'true';
                            }





                        } else {
                            var restrict = e.target.parentNode.textContent;
                            if (restrict === 'No Kids') {
                                limit1 = 'false';
                                e.target.parentNode.style.fontSize = '14px';
                            }
                            if (restrict === 'No Pets') {
                                limit2 = 'false';
                                e.target.parentNode.style.fontSize = '14px';
                            }
                            if (restrict === 'No Study') {
                                limit3 = 'false';
                                e.target.parentNode.style.fontSize = '14px';
                            }


                        }



                    } else {
                        //여기서 getList 불러
                        return;
                    }

                    //전송합니다. 제한사항 , 지역, 무드
                    //limit1,limit2,limit3,picarea,plicmood
                    // getList(data,true,page,limit1,limit2,limit3,picarea,picmood);




        	console.log('제한사항 설정 함수 in : ' + '제한사항1 :'+limit1+ '제한사항2 :'+ limit2+ '제한사항3 :'+ limit3+ '장소: '+ picarea + 'mood :'+ picmood);

        			//서울이면 한번 부르고, 경기두번, 강원 3번 뭔가 이상한데?
        					
        					
        	 if(e.target.matches('#restrict input[type="checkbox"]') || e.target.matches('#place input[type="checkbox"]') || e.target.matches('#area input[type="checkbox"]')){
                 //e.target이 클릭하면 그때만 getList를 부른다.
                 console.log('getList함수 동작!!!!!!!!!!!!!');
                 getListLike(function(data){
                	 
                 getList(data,true,page,limit1,limit2,limit3,picarea,picmood);
                
                 })

             }
                }); //이벤트 처리 끝. 
                	
        
        	function getList(data, reset, page,limit1,limit2,limit3,area,place) {

			
        	// 값 불러오는곳!
        	
        
        		
                
        
                

        console.log(data);
			if(reset == true) {
				console.log('페이지 초기화');
				str = '';
			}
			
		
			
			

			$.getJSON(
				'<c:url value="/promo/getList?pageNum=" />' + page +"&limitation1="+
						limit1 +"&limitation2="+limit2+"&limitation3="+limit3+
						"&area="+area+"&place="+place,
				function(list) {
					console.log(JSON.stringify(list));					
					
					if(reset != false) {
			            str += `<c:if test="${login.businessnum != null}">
			                <div class="cafeowner-menu">
			                    <a class="glyphicon glyphicon-user" href="mypost"> My Posts</a>
			                    <a class="glyphicon glyphicon-pencil" data-toggle="modal" href="#myModal4"> Write</a>
			                </div>
		                </c:if>`;
					}
					
					for(let i=0; i<list.length; i++) {
						console.log('게시글 정보'+list[i]);
						//filenum === 0 이라면
						if(list[i].filenum === 0){
							
						
						str += '<div class="content-wrapper">';
	                    str += '<div class="title-inner">';
	                    str += '<div class="profile">';
	                    str += `<img src='<c:url value="/img/profile.png"/>'`+` style="width:40px; height:40px;" />`;
	                    str += '</div>';
	                    str += '<div class="title">';
	                    str += '<p>' + list[i].writer + '</p>';
	                    str += '<small>' + timeStamp(list[i].regdate) + '</small>';
	                    str += '</div>';
	                    str += '</div>';
	                    str += '<div class="content-inner">';
	                    str += '<p>' + list[i].content + '</p>';
	                    str += '</div>';
	                    str += '<div class="image-inner">';

	                    str += '<div id="carousel-carou' + i + '" style="width: 900px; height: 600px;" class="carousel" data-ride="carousel" data-interval="false">';
	                    str += '<ol class="carousel-indicators">';
	                    
	                    
	                    //indicator 보여지는 곳.
	                    
	                    
	         
	                    
	                    
	                    
	                    str += '<li data-target="#carousel-carou' + i +'" data-slide-to="0" class="active"></li>';
	                    if(list[i].filecnt === 2) {
	                    	str += '<li data-target="#carousel-carou' + i +'" data-slide-to="1"></li>';
	                    } else if(list[i].filecnt === 3) {
	                    	str += '<li data-target="#carousel-carou' + i +'" data-slide-to="1"></li>';
	                    	str += ' <li data-target="#carousel-carou' + i +'" data-slide-to="2"></li>';
	                    }
	                   
	                    
	                    
	                    
	                    
	                    str += '</ol>';
	                    str += '<div class="carousel-inner" role="listbox">';
	                    str += '<div class="item active">';
	                    str += '<a data-toggle="modal" href="' + list[i].bno + '">'
	                    str += `<img src="<c:url value='/loadimg/display/` + list[i].key + `/1'/>" alt="슬라이드1"></a>`;
	                    str += '</div>';
						if(list[i].filecnt === 2) {
		                    str += '<div class="item">';
		                   	str += `<a data-toggle="modal" href="` + list[i].bno + `"><img src="<c:url value='/loadimg/display/` + list[i].key + `/2'/>" alt="슬라이드2"></a>`;
		                    str += '</div>';
	                    } else if(list[i].filecnt === 3) {
		                    str += '<div class="item">';
		                   	str += `<a data-toggle="modal" href="` + list[i].bno + `"><img src="<c:url value='/loadimg/display/` + list[i].key + `/2'/>" alt="슬라이드2"></a>`;
		                    str += '</div>';

	                    	str += '<div class="item">';
		                    str += `<a data-toggle="modal" href="` + list[i].bno + `"><img src="<c:url value='/loadimg/display/` + list[i].key + `/3'/>" alt="슬라이드3"></a>`;
		                    str += '</div>';
	                    }
	                    
	                    str += '</div>';
	                    str += '<a class="left carousel-control" href="#carousel-carou' + i + '" role="button" data-slide="prev">';
	                    str += '<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span>';
	                    str += '</a>';
	                    str += '<a class="right carousel-control" href="#carousel-carou' + i + '" role="button" data-slide="next">';
	                    str += '<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>';
	                    str += '<span class="sr-only">Next</span>';
	                    str += '</a>';
	                    str += '</div>';
	                    str += '</div>';
	                    str += `<div class="like-inner">
	                        <!--좋아요-->
	                        <img src="<c:url value='/img/like2.png'/>"> <span>` + list[i].likeCnt + `</span>
	                        <!-- 해쉬태그 -->
	                        <ul class="hashtag main clearfix">
	                            <li><a href="#">#` + list[i].area  + `</a></li>
	                            <li><a href="#">#` + list[i].place + `</a></li>
	                            <li><a href="#">` + (list[i].limitation1 === 'true' ? '#No Kids ' : '#Kids Free ') + (list[i].limitation2 === 'true' ? '#No Pets ' : '#Pets Free ') + (list[i].limitation3 === 'true' ? '#No Study' : '#Study Free') +
	                            `</a></li>
	                        </ul>
	                    </div>
	                    
	                    
	                    
	                    
	                    <div class="link-inner">
	                        <a id="likeBtn" href="` + list[i].bno + `">`;
	                        
	                        if(data !== null) {
		                        if(data.includes(list[i].bno)) {
		                        	str += `<img src="<c:url value='/img/like2.png' />" alt="like2">&nbsp;좋아요</a>`;
		                        } else {
		                        	str += `<img src="<c:url value='/img/like1.png' />" alt="like1">&nbsp;좋아요</a>`;
		                        }
	                        } else {
	                        	str += `<img src="<c:url value='/img/like1.png'/>" alt="like1">&nbsp;좋아요</a>`;
	                        }
	                        
	                    str += ` 
	                        <a id="regist" href="` + list[i].bno +`"><i class="glyphicon glyphicon-comment"></i>댓글달기</a>
	                        <a id="delete" href="` + list[i].bno +`"><i class="glyphicon glyphicon-remove"></i>삭제하기</a>
	                    </div>
	                </div>`;
	                
					} //filenum 0 끝.
					
					else{ //filenum !== 0
						
						str += '<div class="content-wrapper">';
	                    str += '<div class="title-inner">';
	                    str += '<div class="profile">';
	                    str += `<img style="width:40px" src='<c:url value="/loadimg/display/`+list[i].filenum+`/1"/>' />`;
	                    str += '</div>';
	                    str += '<div class="title">';
	                    str += '<p>' + list[i].writer + '</p>';
	                    str += '<small>' + timeStamp(list[i].regdate) + '</small>';
	                    str += '</div>';
	                    str += '</div>';
	                    str += '<div class="content-inner">';
	                    str += '<p>' + list[i].content + '</p>';
	                    str += '</div>';
	                    str += '<div class="image-inner">';

	                   
	                    
	                    str += '<div id="carousel-carou' + i + '" style="width: 900px; height: 600px;" class="carousel" data-ride="carousel" data-interval="false">';
	                  
	                    
	                    // 날리거나 안날리기.
	                    
	                    
	                    str += '<ol class="carousel-indicators">';
	                    str += '<li data-target="#carousel-carou' + i +'" data-slide-to="0" class="active"></li>';
	                    if(list[i].filecnt === 2) {
	                    	str += '<li data-target="#carousel-carou' + i +'" data-slide-to="1"></li>';
	                    } else if(list[i].filecnt === 3) {
	                    	str += '<li data-target="#carousel-carou' + i +'" data-slide-to="1"></li>';
	                    	str += ' <li data-target="#carousel-carou' + i +'" data-slide-to="2"></li>';
	                    }
	                    str += '</ol>';
	                   
	                    
	                    
	                    // 
	                    
	                   
	                   str += '<div class="carousel-inner" role="listbox">';
	                    str += '<div class="item active">';
	                    str += '<a data-toggle="modal" href="' + list[i].bno + '">'
	                    str += `<img src="<c:url value='/loadimg/display/` + list[i].key + `/1'/>" alt="슬라이드1"></a>`;
	                    str += '</div>';
						if(list[i].filecnt === 2) {
		                    str += '<div class="item">';
		                   	str += `<a data-toggle="modal" href="` + list[i].bno + `"><img src="<c:url value='/loadimg/display/` + list[i].key + `/2'/>" alt="슬라이드2"></a>`;
		                    str += '</div>';
	                    } else if(list[i].filecnt === 3) {
		                    str += '<div class="item">';
		                   	str += `<a data-toggle="modal" href="` + list[i].bno + `"><img src="<c:url value='/loadimg/display/` + list[i].key + `/2'/>" alt="슬라이드2"></a>`;
		                    str += '</div>';

	                    	str += '<div class="item">';
		                    str += `<a data-toggle="modal" href="` + list[i].bno + `"><img src="<c:url value='/loadimg/display/` + list[i].key + `/3'/>" alt="슬라이드3"></a>`;
		                    str += '</div>';
	                    }
	                    
	                    str += '</div>';
	                    str += '<a class="left carousel-control" href="#carousel-carou' + i + '" role="button" data-slide="prev">';
	                    str += '<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span>';
	                    str += '</a>';
	                    str += '<a class="right carousel-control" href="#carousel-carou' + i + '" role="button" data-slide="next">';
	                    str += '<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>';
	                    str += '<span class="sr-only">Next</span>';
	                    str += '</a>';
	                    str += '</div>';
	                    str += '</div>';
	                    str += `<div class="like-inner">
	                        <!--좋아요-->
	                        <img src="<c:url value='/img/like2.png'/>"> <span>` + list[i].likeCnt + `</span>
	                        <!-- 해쉬태그 -->
	                        <ul class="hashtag main clearfix">
	                            <li><a href="#">#` + list[i].area  + `</a></li>
	                            <li><a href="#">#` + list[i].place + `</a></li>
	                            <li><a href="#">` + (list[i].limitation1 === 'true' ? '#No Kids ' : '#Kids Free ') + (list[i].limitation2 === 'true' ? '#No Pets ' : '#Pets Free ') + (list[i].limitation3 === 'true' ? '#No Study' : '#Study Free') +
	                            `</a></li>
	                        </ul>
	                    </div>
	                    <div class="link-inner">
	                    
	                        <a id="likeBtn" href="` + list[i].bno + `">`;
	                        
						
                        if(data !== null) {
	                        if(data.includes(list[i].bno)) {
	                        	str += `<img src="<c:url value='/img/like2.png' />" alt="like2">&nbsp;좋아요</a>`;
	                        } else {
	                        	str += `<img src="<c:url value='/img/like1.png' />" alt="like1">&nbsp;좋아요</a>`;
	                        }
                        } else {
                        	str += `<img src="<c:url value='/img/like1.png' />" alt="like1">&nbsp;좋아요</a>`;
                        }
                    
	                    str += ` 
	                        <a id="regist" href="` + list[i].bno +`"><i class="glyphicon glyphicon-comment"></i>댓글달기</a>
	                        <a id="delete" href="` + list[i].bno +`"><i class="glyphicon glyphicon-remove"></i>삭제하기</a>
	                    </div>
	                </div>`;
	                
						
						
					}
					
				}
	                $('#contentDiv').html(str);
				}
			); //end getJSON
			
			return;
			
		};
		
		
		//상세보기 처리
		$('#contentDiv').on('click', '.carousel-inner a', function(e) {
			e.preventDefault();
			const bno = $(this).attr('href');
			console.log('상세보기 글번호: ' + bno);
			modalContent(bno);
		}); //end 모달 상세보기.
		
		
		
		
		
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		//모달 상세
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		function modalContent(bno) {
			console.log('모달 상세처리 진행.');
			let str = '';
			
			$.getJSON(
				'<c:url value="/promo/getContent/" />' + bno,
				function(data) {
					console.log(data);
					
					if(data.filenum != 0){
						
					
					
					str += '<ol class="carousel-indicators">';
                    str += '<li data-target="#myCarousel2" data-slide-to="0"></li>';
                    if(data.filecnt === 2) {
                    	str += '<li data-target="#myCarousel2" data-slide-to="1" class=""></li>';
                    } else if(data.filecnt === 3) {
                    	str += '<li data-target="#myCarousel2" data-slide-to="1" class=""></li>';
                    	str += '<li data-target="#myCarousel2" data-slide-to="2" class=""></li>';
                    }
                    str += '</ol>';     
                    
                    str += '<div class="carousel-inner" role="listbox">';
                    str += `<div class="item active">
                        <img src="<c:url value='/loadimg/display/` + data.key + `/1'/>" alt="슬라이드1">
                    	</div>`;
                   	if(data.filecnt === 2) {
                   		str += `<div class="item">
                            <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
                        	</div>`;
                   	} else if(data.filecnt === 3) {
                   		str += `<div class="item">
                            <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
                        	</div>`;
                   		str += `<div class="item">
                            <img src="<c:url value='/loadimg/display/` + data.key + `/3'/>" alt="슬라이드3">
                        	</div>`;
                   	}
                   	
                   	str += `<a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>`;
                $('#myCarousel2').html(str);
                
                str = '';
                
                str += 
                	
				`<input type="hidden" id="con-bno" name="bno" value="` + data.bno + `">

                <div class="profile">
                    
                    
                    <img style="width:40px" src="<c:url value='/loadimg/display/` + data.filenum + `/1'/>">                   	
                                    	
                    
                </div>
                <div class="title">
                    <p id="con-writer">` + data.writer + `</p>
                </div>`;
                if(data.writer === '${login.username}') {
                	str += `<div class="cafeowner-menu">
                        <a id="removeModalBtn" href="` + data.bno + `"><span class="glyphicon glyphicon-remove"></span>&nbsp;Remove</a>
                        <a id="modifyModalBtn" data-toggle="modal" href="` + data.bno + `"><span
                                class="glyphicon glyphicon-erase"></span>&nbsp;Modify</a>
                    </div>;`
            		    }
					//data.filenum 이 null 이 아닌경우.
					} else {
						
						
						
						
						str += '<ol class="carousel-indicators" >';
	                    str += '<li data-target="#myCarousel2" data-slide-to="0"></li>';
	                    if(data.filecnt === 2) {
	                    	str += '<li data-target="#myCarousel2" data-slide-to="1"></li>';
	                    } else if(data.filecnt === 3) {
	                    	str += '<li data-target="#myCarousel2" data-slide-to="1"></li>';
	                    	str += '<li data-target="#myCarousel2" data-slide-to="2"></li>';
	                    }
	                    str += '</ol>';     
	                    
	                    str += '<div class="carousel-inner" role="listbox">';
	                    str += `<div class="item active">
	                        <img src="<c:url value='/loadimg/display/` + data.key + `/1'/>" alt="슬라이드1">
	                    	</div>`;
	                   	if(data.filecnt === 2) {
	                   		str += `<div class="item">
	                            <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
	                        	</div>`;
	                   	} else if(data.filecnt === 3) {
	                   		str += `<div class="item">
	                            <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
	                        	</div>`;
	                   		str += `<div class="item">
	                            <img src="<c:url value='/loadimg/display/` + data.key + `/3'/>" alt="슬라이드3">
	                        	</div>`;
	                   	}
	                   	
	                   	str += `<a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
	                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	                    <span class="sr-only">Previous</span>
	                </a>
	                <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
	                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                    <span class="sr-only">Next</span>
	                </a>`;
	                $('#myCarousel2').html(str);
	                
	                str = '';
	                
	                str += 
	                	
					`<input type="hidden" id="con-bno" name="bno" value="` + data.bno + `">

	                <div class="profile">
	                    
	                    
	                    <img src="<c:url value='/img/profile.png'/>">                   	
	                                    	
	                    
	                </div>
	                <div class="title">
	                    <p id="con-writer">` + data.writer + `</p>
	                </div>`;
	                if(data.writer === '${login.username}') {
	                	str += `<div class="cafeowner-menu">
	                        <a id="removeModalBtn" href="` + data.bno + `"><span class="glyphicon glyphicon-remove"></span>&nbsp;Remove</a>
	                        <a id="modifyModalBtn" data-toggle="modal" href="` + data.bno + `"><span
	                                class="glyphicon glyphicon-erase"></span>&nbsp;Modify</a>
	                    </div>;`
	            		    }
						
					}
                $('#addProf').html(str);
                
                //$('#con-bno').val(data.bno);
                //$('#con-writer').html(data.writer);
                $('#like-cnt').html(data.likeCnt);
                $('#con-content').html(data.content);
                $('#con-regdate').html(timeStamp(data.regdate));
                $('#con-area').html(data.area);
                $('#con-place').html(data.place);
                $('#con-limit').html(
                	(data.limitation1 === 'true' ? '#No Kids' : '#Kids Free') + 
                	(data.limitation2 === 'true' ? '#No Pets' : '#Pets Free') + 
                	(data.limitation3 === 'true' ? '#No Study' : '#Study Free')
                );
                $('#modalContent').modal('show');
                    
				}
			); //end getJSON
		}	
		
		
		//모달이 열리는 순간 댓글 목록 불러오기
		$('#modalContent').on('shown.bs.modal', function(e) {
			const bno = $('#con-bno').val();
			modalReplyList(bno);
		});
		
		function modalReplyList(bno) {
			let str = '';
			
			$.getJSON(
				'<c:url value="/promoReply/replyList/" />' + bno,
				function(list) {
					console.log(list);
					for(let i=0; i<list.length; i++) {
						if(i === 0) {
							str += '<div class="reply-content blinking">';
						} else 	{
							str += '<div class="reply-content">';
						}
						///////수정한곳
						if(list[i].filenum !== 0){
							
	                    
							
							str += `<div class="profile">
	                            <img src="<c:url value='/loadimg/display/`+list[i].filenum+`/1'/>">
	                            <p>` + list[i].writer + `</p>
	                            
	                            <a href="`+list[i].rno+`" id="rnodelete"><span style="float:right;" class="glyphicon glyphicon-remove"></span></a>
		                        </div>
		                        <div class="content">` + 
		                        	list[i].content + `
		                        </div>
		                        <small>` + timeStamp(list[i].regdate) + `</small>
	                    		</div>`;
							} //filenum === 0일때
							
							
							else { //filenum !== 0일때 기본이미지 설정.
								
								str += `<div class="profile">
		                            <img src="<c:url value='/img/profile.png'/>">
		                            <p>` + list[i].writer + `</p>
		                            
		                            <a href="`+list[i].rno+`" id="rnodelete"><span style="float:right;" class="glyphicon glyphicon-remove"></span></a>
			                        </div>
			                        <div class="content">` + 
			                        	list[i].content + `
			                        </div>
			                        <small>` + timeStamp(list[i].regdate) + `</small>
		                    		</div>`;
								
							}
						}
					$('#replyContentDiv').html(str);
				}
			); //end getJSON	
		} //end 댓글 목록 불러오기
		
		//상세보기에서 댓글을 달았을 때의 등록 처리
		$('#replyRegBtn').click(function() {
			const content = $('#modal-reply-content').val();
			const writer = '${login.userid}';
			const bno = $('#con-bno').val();
			console.log(bno + writer + content);
			
			if(writer === '') {
				alert('로그인 후 댓글 쓰기가 가능합니다.');
				return;
			} else if(content.trim() === '') {
				alert('댓글 내용이 있어야 등록이 가능합니다.');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/promoReply/regist" />',
				contentType: 'application/json',
				data: JSON.stringify({
					'bno' : bno,
					'writer' : writer,
					'content' : content
				}),
				success: function(result) {
					console.log('댓글 등록 완료!');
					$('#modal-reply-content').val('');
					modalReplyList(bno);
				},
				error: function() {
					alert('댓글 등록 실패! 관리자에게 문의.');
				}
			}); //end ajax
			
		}); // end 댓글등록
		
		
		//삭제 버튼 누르면 
		
		
		
		
		//수정버튼을 눌렀을 때의 이벤트 처리.
		$('#addProf').on('click', 'a', function(e) {
			e.preventDefault();
			if($(this).attr('id') === 'removeModalBtn') {
				return;
			}
			const bno = $(this).attr('href');
			console.log(bno);
			
			let str = '';
			
			$.getJSON(
				'<c:url value="/promo/getContent/" />' + bno,
				function(data) {
					console.log(data);
					
					str += '<ol class="carousel-indicators">';
                    str += '<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>';
                    if(data.filecnt === 2) {
                    	str += '<li data-target="#myCarousel2" data-slide-to="1"></li>';
                    } else if(data.filecnt === 3) {
                    	str += '<li data-target="#myCarousel2" data-slide-to="1"></li>';
                    	str += ' <li data-target="#myCarousel2" data-slide-to="2"></li>';
                    }
                    str += '</ol>';     
                    
                    str += '<div class="carousel-inner" role="listbox">';
                    str += `<div class="item active">
                        <img src="<c:url value='/loadimg/display/` + data.key + `/1'/>" alt="슬라이드1">
                    	</div>`;
                   	if(data.filecnt === 2) {
                   		str += `<div class="item">
                            <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
                        	</div>`;
                   	} else if(data.filecnt === 3) {
                   		str += `<div class="item">
                            <img src="<c:url value='/loadimg/display/` + data.key + `/2'/>" alt="슬라이드2">
                        	</div>`;
                   		str += `<div class="item">
                            <img src="<c:url value='/loadimg/display/` + data.key + `/3'/>" alt="슬라이드3">
                        	</div>`;
                   	}
                   	
                   	str += `<a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
	                </a>
	                <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
	                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                    <span class="sr-only">Next</span>
	                </a>`;
	                $('#myCarousel3').html(str);
	                
					
					$('#mod-writer').html(data.writer);
					$('#mod-complete').attr('href', data.bno);
					$('#modifymodal-content').html(data.content);
					$('#mod-area').val(data.area).prop('selected', true);
					$('#mod-place').val(data.place).prop('selected', true);
					data.limitation1 === 'true' ? $('input[name=limitation1]').prop('checked', true) : $('input[name=limitation1]').prop('checked', false);
					data.limitation2 === 'true' ? $('input[name=limitation2]').prop('checked', true) : $('input[name=limitation2]').prop('checked', false);
					data.limitation3 === 'true' ? $('input[name=limitation3]').prop('checked', true) : $('input[name=limitation3]').prop('checked', false);
					
					$('#modifyModal').modal('show');
					
				}
			
			);
			
		}); //end 수정 버튼처리.
		
		//수정 처리
		$('#mod-complete').click(function(e) {
			const bno = $(this).attr('href');
			console.log(bno);
			const writer = $('#mod-writer').text();
			console.log(writer);
			const content = $('#modifymodal-content').val();
			console.log(content);
			const area = $('#mod-area option:selected').val();
			console.log(area);
			const place = $('#mod-place option:selected').val();
			console.log(place);
			const limit1 = $('input[name=limitation1]').is(':checked');
			console.log(limit1);
			const limit2 = $('input[name=limitation2]').is(':checked');
			console.log(limit2);
			const limit3 = $('input[name=limitation3]').is(':checked');
			console.log(limit3);
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/promo/update" />',
				contentType: 'application/json',
				data: JSON.stringify({
					'bno' : bno, 'content' : content,
					'area' : area, 'place' : place, 'limitation1' : limit1,
					'limitation2' : limit2, 'limitation3' : limit3
				}),
				success: function(result) {
					console.log('수정 완료!');
					modalContent(bno);
				},
				error: function() {
					alert('댓글 등록 실패! 관리자에게 문의.');
				}
			});
		});
		
		//삭제버튼~
		$('#addProf').on('click', 'a', function(e) {
			e.preventDefault();
			
			if($(this).attr('id') === 'modifyModalBtn') {
				return;
			}
			console.log('삭제 버튼 눌리니?');
			
			if(!confirm('정말 삭제하시겠습니까?')) return;
			
			const bno = $(this).attr('href');
			console.log(bno);
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/promo/delete" />',
				data: bno,
				contentType: 'application/json',
				success: function(result) {
					location.href='<c:url value="/promo/list" />';
				},
				error: function() {
					alert('삭제 실패! 관리자에게 문의!');
				}
			});
			

		});
		
		
		//댓글 삭제 버튼 누르면
		$('#replyContentDiv').on('click','a',function(e){
			e.preventDefault();
			//고유 기능 막고 rno 가져옴
			if($(this).attr('id') !== 'rnodelete'){
				return;
			}
			
			const rno = $(this).parent().children('#rnodelete')[0].getAttribute('href');
			console.log('삭제할 댓글 번호: '+rno);
			const bno = $('#con-bno').val();
			console.log('삭제할 글 번호: '+bno);
			
			$.ajax({
				type : 'post',
				url : '<c:url value ="/promoReply/delete"/>',
				data : JSON.stringify({
					'rno' : rno
					
				}),
				contentType : 'application/json',
				success : function(data){
					if(data === 'success'){
						
					console.log('삭제 성공')
					modalReplyList(bno);
					}else if(data === 'fail'){
						alert('삭제 권한이 없습니다.');
					}
				}
				
				
					,error : function(error){
						console.log(error);
						alert('삭제실패 관리자 문의.')
					}
					
				
 				
			});//end ajax
			
		});
    
    
    
        
         // 주석처리 if( || || 처리로 input 값을 모두 얻자.)
            //console.log(area);
            //console.log(limit1,limit2,limit3);

            
        //간단하게 해결해 보자.. ->
        
                                                                                                                                                                            


        let filecount = 0;

        function readURL(input) {
            if (input.files && input.files[0]) {

            	console.log(input);
            	console.log(input.files);
            	
                var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
                //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
                reader.readAsDataURL(input.files[0]);

                //파일업로드시 p태그를 안보이게한다.
                input.parentNode.children[0].style.display = "none";
                // fileDiv내의 img태그 아이디 가져오기
                let fileImg = "#" + input.parentNode.children[1].getAttribute('id');
                console.log(fileImg);
                console.log(reader);

                // FileReader 객체가 생성되서 동작을 한다면,
                reader.onload = function (event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                    // 위에서 얻어온 img태그 아이디를 통해 img src 바꿔줌.
                    console.log(event.target);
                    $(fileImg).attr("src", event.target.result);
                	console.log($(fileImg).attr('src'));
                    filecount++;
                    makeImgWindow(filecount);
                }


            }
        }

        ///// 작성모달에서 이미지 로직
        function makeImgWindow(filecount) {
        	console.log('이미지 등록 로직 시작.');
            if (filecount >= 3) return;

            $("a[data-slide='prev']").css('display', 'inline');
            $("a[data-slide='next']").css('display', 'inline');

            const $indicatorli = document.createElement('li');
            $indicatorli.setAttribute('data-target', "#myCarousel4");
            $indicatorli.setAttribute('data-silde-to', filecount);
            document.querySelector('#myCarousel4>.carousel-indicators').appendChild($indicatorli);

            const $itemdiv = document.createElement('div');
            $itemdiv.classList.add('item');
            $itemdiv.innerHTML = `<label for="file` + filecount + `" class="fileDiv">
                                        <p>클릭해서 업로드할 이미지를 선택해주세요.</p>
                                        <img id="fileImg` + filecount + `" src="<c:url value='/img/upload.png'/>" alt="upload" />
                                        <input type="file" name="file" id="file` + filecount + `" onchange="readURL(this)"
                                        style="display: none;">
                                    </label>`;
            document.querySelector('#myCarousel4>.carousel-inner').appendChild($itemdiv)
        }



        ///////////////////// 모달 완료버튼 클릭 관련 이벤트




        const $completebtn = document.querySelectorAll('.glyphicon-ok');
        console.log($completebtn);
        // 수정창 모달 Complete버튼 누르면 
        $completebtn[0].parentNode.addEventListener('click', e => {
            e.preventDefault();
            console.log('메롱');
            e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.children[0].click();
            // 수정창은 어차피 해당 글 다시 가져올 것이기 때문에 비워줄 필요가 없음.
        });
        // 작성창 모달 Complete버튼 누르면
        $completebtn[1].parentNode.addEventListener('click', e => {
            e.preventDefault();
            //console.log(e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.children[0]);
            //e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.children[0].click();
            // 작성모달창 클린하게.
            //cleaningModalWrite();
            regist();
            //location.href='<c:url value="/promo/list" />';
        });

        const $writingDismiss = document.querySelector('#writing-dismiss');
        $writingDismiss.addEventListener('click', e => {
            cleaningModalWrite();
        })
        
        
        //글 등록을 담당하는 함수
        function regist() {
			//작성자 얻어오기
        	const user_id = '${login.username}';
			console.log(user_id);
			//글 내용 얻어오기
			const content = $('#writingmodal-content').val();
			console.log('content: ' + content);

			//지역 얻어오기
			let area = document.querySelector('#write-area');
			console.log(area.options[area.selectedIndex].value);
			area = area.options[area.selectedIndex].value;
			//장소 컨셉 얻어오기
			let place = document.querySelector('#write-place');
			console.log(place.options[place.selectedIndex].value);
			place = place.options[place.selectedIndex].value;
			//제한사항 얻어오기
			const limit1 = document.querySelector('#limit1').checked;
			const limit2 = document.querySelector('#limit2').checked;
			const limit3 = document.querySelector('#limit3').checked;
			console.log(limit1);
			console.log(limit2);
			console.log(limit3);
			
			//파일 확장자 체크
			let fileList = [
				document.querySelector('#file'),
				document.querySelector('#file1'),
				document.querySelector('#file2')	
			];
 			let confirmList = [];
			for(let f of fileList) {
				if(f !== null && f.files.length !== 0) {
					confirmList.push(f);
				}
			}
			console.log(confirmList);
			
			//유효성 검증(누락된 값이 있는지 검증.)
			if(confirmList.length === 0) {
				alert('이미지 파일은 무조건 한개 이상 등록하셔야 합니다.');
				return;
			} else if(content === '') {
				alert('카페 상세 내용을 작성해 주세요.');
				return;
			} else if(place === 'none') {
				alert('장소의 컨셉을 설정해 주세요.');
				return;
			} else if(!confirm('모든 설정을 완료하신게 확실하신가요?')) {
				return;
			}
			
			
			for(let f of confirmList) {
				const file = f.value.slice(f.value.indexOf('.') + 1).toLowerCase();
				console.log(file);
				if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
					alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
					return;
				} 
			}
			console.log(confirmList);
			
			//ajax 비동기 전송을 위한 formData 객체 생성
			const formData = new FormData();
			for(let c of confirmList) {
				formData.append('file', c.files[0]);
			}
			formData.append('content', content);
			formData.append('writer', user_id);
			formData.append('area', area);
			formData.append('place', place);
			formData.append('limitation1', limit1);
			formData.append('limitation2', limit2);
			formData.append('limitation3', limit3);
			
			
			$.ajax({
				url: '<c:url value="/promo/upload" />',
				type: 'post',
				data: formData,
				contentType: false,
				processData: false,
				success: function(result) {
					console.log(result);
					location.href='<c:url value="/promo/list" />';
				},
				error: function(request, status, error) {
					console.log('code: ' + request + '\n' + 'message: ' + request.responseText + '\n' + 'error: ' + error);
				}
			});
		} //end regist



        // 모달창 내에 작성내용 싹 원상복구 시키기.
        function cleaningModalWrite() {
            console.log('작성모달 청소 시작');
            document.getElementById('writingmodal-img').innerHTML = `<div id="myCarousel4" class="carousel" data-ride="carousel" data-interval="false">
                            
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel4" data-slide-to="0" class="active"></li>
                            </ol>

                            
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    

                                    <label for="file" class="fileDiv">
                                        <p>클릭해서 업로드할 이미지를 선택해주세요.</p>
                                        <img id="fileImg" src="<c:url value='/img/upload.png'/>" alt="upload" />
                                        <input type="file" name="file" id="file" onchange="readURL(this)"
                                            style="display: none;">
                                    </label>
                                </div>        
                            </div>

                            <a class="left carousel-control" href="#myCarousel4" role="button" data-slide="prev"
                                style="display:none">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel4" role="button" data-slide="next"
                                style="display:none">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>

                        </div>`;
            document.querySelector('#writingmodal-content').value = '';
            document.querySelectorAll('input[type=checkbox]').checked = false;
            document.querySelector('#write-area').options.selectedIndex = 0;
            filecount = 0;
        }

        const $restrictselect = [...document.querySelectorAll('select[onchange="disableothers(this)"]')];
        //////// 한 제한사항 선택하면 나머지 선택 못하게 하기.
        function disableothers($changedselect) {

            $changedselect.setAttribute('disabled', true);

            for (let $select of $restrictselect) {
                // 나머지 select요소에게 이미 선택된 option은 선택 못하게 disabled
                if ($select.getAttribute('id') !== $changedselect.getAttribute('id')) {
                    for (let $option of $select.children) {
                        if ($option.value === $changedselect.value)
                            $option.setAttribute('disabled', true);
                    }
                }
            }
        }
        ///////// 제한사항 다시 선택하게 disabled 모두 풀어주기
        function refreshRestrict() {
            event.preventDefault();
            for (let $select of $restrictselect) {
                $select.removeAttribute('disabled');
                for (let $option of $select.children) {
                    $option.removeAttribute('disabled');
                }
            }
        }
        
      //날짜 처리 함수
		function timeStamp(millis) {
			
			const date = new Date(); //현재 날짜
			//현재 날짜를 밀리초로 변환 - 등록일 밀리초  -> 시간차
			const gap = date.getTime() - millis;
			
			let time; //리턴할 시간
			if(gap < 60 * 60 * 24 * 1000) { //1일 미만인 경우
				if(gap < 60 * 60 * 1000) { //1시간 미만일 경우
					time = '방금 전';
				} else { //1시간 이상일 경우
					time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
				}
			} else { //1일 이상일 경우
				const today = new Date(millis);
				const year = today.getFullYear(); //년
				const month = today.getMonth() + 1; //월
				const day = today.getDate(); //일
				const hour = today.getHours(); //시
				const minute = today.getMinutes(); //분
				
				time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시' + minute + '분';
			}
			
			return time;
			
		}
      
      






        ///////////////////////// 자동스크롤 및 옆에 aside바 걸리게하는 로직
        /*
       $(window).scroll(function(){
      	// 윈도우(device)의 높이와 현재 스크롤 위치 값을 더한 뒤, 문서(컨텐츠) 높이와 비교해서 같아지면 로직을 수행
      	// 문서 높이 - 브라우저창 높이 = 스크롤 창의 끝 높이와 같다면 -> 새로운 내용을 불러오자.
      	if(Math.round($(window).scrollTop()) === $(document).height()-$(window).height()){
      		//console.log(++page);
      		//$('#contentDiv').append("<h1> Page: " + page + "</h1>");
              //$('#contentDiv').append("<br>무한<br>페이징<br>로드<br>중입니다~~~<br><br>무한<br>페이징<br>로드<br>중입니다~~~<br><br>무한<br>페이징<br>로드<br>중입니다~~~<br><br>무한<br>페이징<br>로드<br>중입니다~~~<br>");
              
              // 목록 불러오기의 sql문을 페이징 쿼리를 사용해서 작성을 해 주시는 겁니다.
              // 사용자의 스크롤이 바닥에 닿았을 때, 페ㅔ이지 변수의 값을 하나 올리고
              // getList(false)를 주셔서 누적해서 계쏙 열어주시면 됩니다. -> 마치 getList(++page, false);
              // 게시글을 몇개씩 불러올 지는 페이징 알고리즘에서 알아서 정해주시면 됩니다.             
      	}
      	 
      	 
       });
       */
        $(window).scroll(function () {
            let minheightval = $(document).height() - vh(70);
            $('.aside-wrapper').css('min-height', minheightval)
        });

        function vh(v) {
            var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
            return (v * h) / 100;
        }

        function vw(v) {
            var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
            return (v * w) / 100;
        }
        
        
        
      	//댓글 달기 버튼을 누르면 모달창을 띄워주자.
        $('#contentDiv').on('click','a',function(e){
        	e.preventDefault();
        	console.log($(this).attr('href'));
        		const bno = $(this).attr('href');
        		//댓글달기와 삭제 버튼을 누르면 모달창을 띄워줌.
        	if($(this).attr('id') === 'regist' || $(this).attr('id') === 'delete'){
        		
    			//창 띄움.
    			modalContent(bno);
        	}
        		
        	// My post를 누르면 href 로 이동시킨다.
        	if($(this).attr('href') === 'mypost'){
        		location.href = "<c:url value ='/user/promoBoardChk'/>";
        	}
        });
      	
      	
      
        
        //좋아요 기능 구현을 하자.
        $('#contentDiv').on('click', 'a', function(e) {
        	e.preventDefault();
        	console.log($(this).attr('id'));
        	if(e.target.getAttribute('alt') === 'like1' && e.target.getAttribute('alt') === 'like2'){
				return;							
			}
        	if(!($(this).attr('id') === 'likeBtn' || e.target.getAttribute('alt')=== 'like2') || e.target.getAttribute('alt')=== 'like1') {
        		console.log('좋아요 버튼이 아님!');
        		return;
        	}
        	
        	
        	
        
        
        	
        	
			console.log('좋아요 버튼 클릭!' + $(this));
			console.log($(this).attr('src')!='');
			const $btn = e.target;
			const bno = $(this).attr('href');
			const id = '${login.userid}';
			if(id === '') {
				alert('로그인 안했구나?');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/promo/like" />',
				contentType: 'application/json',
				data: JSON.stringify({
					'bno' : bno,
					'userid' : id
				}),
				success: function(result) {
					console.log(result);
					if(result === 'like') {
						
						
						
						e.target.firstChild.setAttribute('src', '/img/like2.png');
						const $likeCnt = e.target.parentNode.previousElementSibling.children[1];
						console.log($likeCnt);
						$likeCnt.textContent = Number($likeCnt.textContent) + 1;
						
						
					} else {
						
						
							e.target.firstChild.setAttribute('src', '/img/like1.png');
							const $likeCnt = e.target.parentNode.previousElementSibling.children[1];
							console.log($likeCnt);
							$likeCnt.textContent = Number($likeCnt.textContent) - 1;

					}
				},
				error: function() {
					alert('좋아요 진행 에러!');
				}
			});
		}); //end 좋아요 처리.
        
		
		
		
		//무한 스크롤
		$(window).scroll(function() {
			//윈도우(device)의 높이와 현재 스크롤 위치 값을 더한 뒤, 문서(컨텐츠) 높이와 비교해서 같다면 로직을 수행.
			//문서높이 - 브라우저 창 높이 = 스크롤 창의 끝 높이와 같다면 -> 새로운 내용을 불러오기
			if($(window).scrollTop() === $(document).height() - $(window).height()) {
							
				//목록 불러오기 페이징을 완료를 하셨다면
				//페이지 값 하나 올리고, getList(false) 주셔서 누적해서 계속 열어주면 됩니다.
				//게시글을 몇 개씩 불러 올지는 페이징 알고리즘에서 알아서 정해 주시면 됩니다.
				//getList(++page, false);
				++page;
				console.log(page);
				getListLike(function(data) {
					getList(data, false, page,'','','','','');
				});
			
			}
		});
	
        
        /*
        //사업자가 아닌 회원이 글쓰기 버튼을 클릭했을 경우. (사업자가 아니면 글쓰기 버튼을 숨겨주어서 필요가 없어짐.)
        $('#myModal4').on('show.bs.modal', function(e) {
			console.log('모달이 열릴 때 이벤트 발생!');
			console.log('target: ' + e.target);
			const busiNum = '${login.businessnum}';
        	console.log(busiNum);
        	if(busiNum === '') {
				e.preventDefault();
        		console.log('사업자 번호 공백 확인!');
        		alert('사업자 회원만 작성이 가능한 게시판입니다. 권한이 없습니다.');
        		//$('#myModal4').modal('hide');
        	}
		});
        */
        
        
        
        
        
    </script>

</body>

</html>