<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cmnreplyChk</title>
    

    <style>
    	
    	* {
			border-radius: 0 !important;
		}
    	
        .clearfix::after {
            content: '';
            display: block;
            clear: both;
        }
    
        .container {
            min-width: 1200px;
            margin-top: 150px;
            margin-bottom: 50px;
        }
        .pagination .page-link {
            color: #000;
        }

        .pagination .page-link:active,
        .pagination .page-pre:active,
        .pagination .page-link:focus,
        .pagination .page-pre:focus,
        .pagination .page-link:hover,
        .pagination .page-pre:hover {
            color: #000;
        }

        .pagination .cur-page {
            background: #000;
            color: #fff;
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
						<li class="active"><a href="#">회원정보</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">공지 게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value='/user/noReplyChk' />">작성댓글보기</a></li>
							</ul>
						</li>
						<li class="dropdown active"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">이벤트 게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="<c:url value='/user/evReplyChk' />">작성댓글보기</a></li>
							</ul>
						</li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">커뮤니티 게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value='/user/cmnBoardChk' />">작성글보기</a></li>
								<li><a href="<c:url value='/user/cmnReplyChk' />">작성댓글보기</a></li>
							</ul>
						</li>
						<c:if test="${not empty login.businessnum}">
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">홍보 게시판<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value='/user/promoBoardChk' />">작성글보기</a></li>
									<li><a href="<c:url value='/user/promoReplyChk' />">작성댓글보기</a></li>
								</ul>
							</li>
							
							<li>
								<a href="<c:url value='/user/orderDelHistory' />">주문내역/배송조회</a>
							</li>
						</c:if>
						
					</ul>

                    <br>
                    <h3>
                        <strong>작성 댓글 보기</strong>
                    </h3>
                    <br>
                    <form action="#">
                        <!--테이블 자동 크기 조절-->
                        <table class="table table-hover w-auto">
                            <thead>
                            	<tr>
	                                <td>댓글</td>
	                                <td>작성게시글</td>
	                                <td>작성일</td>
	                             </tr>
                            </thead>

                            <tbody>
                               <c:forEach var="vo" items="${replyList}">
                                <tr>
                                    <td>
                                    	<a href="<c:url value='/evBoard/evDetail?bno=${vo.bno}'/>">${vo.content}</a>
                                    </td>
                                    <td>${vo.writer}</td>
		                            <td> <fmt:formatDate value="${vo.regdate}" pattern="MM-dd"/>
                                </tr>
                               </c:forEach>
                           </tbody>
                        </table>
					</form>

                    <form action="<c:url value='/user/evReplyChk' />" name="pageForm">
                     <div class="text-center">
                         <ul class="pagination" id="pagination">
                         	<c:if test="${pc.prev}">
                             	<li class="page-pre">
                             		<a class="page-link" href="#" data-pageNum="${pc.beginPage-1}">이전</a>
                             	</li>
                             </c:if>
                             
                             <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                             	<li class="page-num">
                             		<a class="${pc.paging.pageNum == num ? 'cur-page page-link' : 'page-link'}" href="#" data-pageNum="${num}">${num}</a>
                             	</li>
                             </c:forEach>
                             
                             <c:if test="${pc.next}">
                            		<li class="page-next">
                            			<a href="#" data-pageNum="${pc.endPage+1}">다음</a>
                            		</li>
                             </c:if>
                         </ul>
                         
                         <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                         <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                         <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
                         <input type="hidden" name="keyword" value="${pc.paging.keyword}">
                         <input type="hidden" name="condition" value="${pc.paging.condition}">
                         
                     </div>
                    </form>
                </div>
            </div>
        </div>

    </section>
    
    <%@ include file="../include/footer.jsp" %>
	
	<script>
    $(function() {

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