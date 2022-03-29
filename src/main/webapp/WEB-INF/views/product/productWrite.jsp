<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">


<style>
body {
	width: 100%;
	height: 100%;
}

section {
	margin-top: 150px;
	min-height: 488px;
}

.container {
	min-width: 1200px;
	height: 100%;
}

.page-title {
	text-align: center;
	font-size: 25px;
	font-weight: 900;
}

.page-desc {
	margin-top: 20px;
	text-align: left;
}

.row {
	display: block;
	width: 100%;
	margin: 30px auto;
	padding-left: 85px;
}

.lower-bar {
	display: block;
	width: 100%;
	height: 70px;
	border-bottom: 2px solid white;
}

.divforright {
	width: fit-content;
	height: fit-content;
	text-align: center;
	display: block;
	float: right;
}

.cart-list {
	background: black;
	width: 90%;
	padding: 0 !important;
}

.cart-table {
	margin-top: 15px;
	background: #fff;
}

.cart-table>thead {
	font-weight: bold;
}

.cart-table>tbody {
	font-size: 12px;
	line-height: 1px;
}

.cart-table>tbody>tr>td>p {
	margin: 0;
}

input[type="number"] {
	border: 1px solid #ddd;
	width: 40px;
	text-align: center;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	opacity: 1;
}

body>section>div>div>div>table>tbody>tr:nth-child(1)>td.prod-info {
	padding-bottom: 50px;
}

input {
	border: 1px solid #ddd;
}

.prod-info input {
	height: 25px;
	width: 100%;
	margin-top: 10px;
}

.prod-info input::placeholder {
	text-align: center;
}

.prod-price {
	padding-top: 30px;
}

.prod-category {
	font-weight: 700;
}

.prod-category select {
	border: 1px solid #ddd;
}

.prod-qty input[type="number"] {
	width: 70px;
	padding: 5px;
	border: 1px solid #ddd;
	display: inline-block;
	position: relative;
}

.cart-table>thead>tr>td, .cart-table>tbody>tr>td, .cart-table>tfoot>tr>td
	{
	margin: 0;
	vertical-align: middle;
}

.cart-table .prod-qty img {
	width: 13px;
	height: 9px;
	margin-left: 2px;
	cursor: pointer;
	display: block;
}

.qty-up-down {
	position: absolute;
}

.cart-table button {
	width: auto;
	height: 20px;
}

.cart-table tr {
	border-top: 1px solid #ddd;
}

.cart-table tbody .prod-qty .btn-qty-update {
	width: 80px;
}

.prod-normal-price>input, .prod-discount-price>input {
	width: 100px;
	text-align: right;
}

.btn-all-order {
	width: fit-content;
	height: 50px;
	margin: 0 0 10px 10px;
	padding: 15px;
	display: inline-block;
}

.prod-desc>p {
	font-size: 14px;
	font-weight: 700;
}

.prod-desc>textarea {
	width: 100%;
	resize: none;
	border: 1px solid #ddd;
	height: 500px;
	padding: 20px;
	line-height: 300%;
}

.btn-all-order {
	background: black;
	color: white;
	font-size: 18px;
}

.btn-all-order:hover {
	font-style: italic;
}

/*  */
.prod-img input[type="file"] {
	width: 100px;
	height: 100px;
	margin-right: -30px;
	background: transparent;
	color: transparent;
	z-index: 999;
}

.prod-img input[type="file"]::-webkit-file-upload-button {
	display: none;
}

.prod-img label {
	width: 100px;
	height: 100px;
	float: right;
	margin-left: -100px;
	z-index: 1;
	font-size: 10px;
	text-align: center;
	pointer-events: none;
	padding-top: 30px;
}

tbody> tr> td> .topmargin{
	margin-top:45px;
	height: 25px;
}

.clearfix::after {
	content: '';
	display: block;
	clear: both;
}
</style>


</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<section>
	<form action="productWrite" method="post" enctype="multipart/form-data" name="productForm">
		<div class="container">
			<p class="page-title">상품 등록</p>
			<p class="page-desc">
				<strong style="color: red;">*</strong> 상품 카테고리를 먼저 선택해주세요.
			</p>
			<div class="row">
				<div class="col-xs-12 cart-list clearfix">
					<table class="table w-auto text-center align-middle cart-table">
						<thead>
							<tr>
								<td>상품 카테고리</td>
								<td>상품 이미지</td>
								<td>상품명</td>
								<td>재고</td>
								<td>상품정상가격</td>
								<td>상품판매가격</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="prod-category"><select name="procategory" id="category" class="topmargin">
										<option value="non-selected">-</option>
										<option value="beans">원두</option>
										<option value="tea">티/액상차</option>
										<option value="milk">유제품</option>
										<option value="syrup">시럽/소스</option>
										<option value="powder">파우더/농축액</option>
										<option value="coffeemachine">커피용품, 머신</option>

								</select></td>
								<td class="prod-img"><label for="img">클릭하거나<br>드래그
										드롭하여<br>업로드
								</label> <input type="file" name="file" id="img" disabled></td>
								<td class="prod-info">옵션 존재시 상품명과 함께 괄호내에 옵션명 기재<br>
									ex) 상품명(옵션명)<br> <input type="text" name="proname" placeholder=""
									disabled>
								</td>
								<td class="prod-qty numeric"><input type="number" class="topmargin" name="prostock"
									min="1" max="99999" disabled></td>
								<td class="prod-normal-price numeric"><input name="proprice" class="topmargin" type="text"
									onkeyup="regex(this)" disabled> 원</td>
								<td class="prod-discount-price numeric"><input name="prosellprice" class="topmargin" type="text"
									onkeyup="regex(this)" disabled>원</td>
							</tr>
							<tr>
								<td class="prod-desc" colspan="7">
									<p>상품 상세설명</p> <textarea name="prodetail" id="prod-desc" disabled></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<div class="lower-bar clearfix">
						<div class="divforright">
							<button class="btn-all-order" type="button">
								<span class="glyphicon glyphicon-ok"></span> 상품 등록완료
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</section>



	<%@ include file="../include/footer.jsp"%>

	<script>
        const $table = document.querySelector('.table');

        // 삭제버튼 누르면 tr삭제하는 로직
        $table.addEventListener('click', e => {
            if (!(e.target.matches('.btn-remove') || e.target.matches('.glyphicon-remove'))) {
                return;
            }

            // 여기에 상품이 등록된 판매게시글이 있는지 여부 확인해서 돌려보내거나
            // 아니면 삭제를 진행하고 아래의 tr삭제를 진행하도록 하자.


            // 해당 tr삭제
            if (e.target.matches('.btn-remove')) {
                e.preventDefault();
                e.target.parentNode.parentNode.remove();
            } else {
                e.target.parentNode.parentNode.parentNode.remove();
            }
        })

        const $tableinputs = document.querySelectorAll('.table input'); // 테이블 내의 인풋
        const $tabletextarea = document.querySelector('.table textarea'); // 테이블 내의 텍스트에리어
        const $prodDesc = document.getElementById('prod-desc');
        
        // 카테고리 선택시 이벤트
        $table.addEventListener('change', e => {
            if (!e.target.matches('#category')) {
                return;
            }
         	// 카테고리 선택해야 diabled 풀리게끔하기.
            if (e.target.value === 'non-selected') {
                for (let $input of $tableinputs) {
                    $input.setAttribute('disabled', true);
                }
                $tabletextarea.setAttribute('disabled', true);
                $prodDesc.textContent ='';
                return;
            } else {
                for (let $input of $tableinputs) {
                    $input.removeAttribute('disabled');
                }
                $tabletextarea.removeAttribute('disabled');
            }
         	
         	// 어떤 카테고리를 선택했느냐에 따라 textarea에 미리 띄워놓는다.
         	if(e.target.value === 'beans'){
         		$prodDesc.innerHTML = `
제조연월일 : ex) 발주확인 후 당일 로스팅 생산방식
유통기한 : ex) 제조일로부터 1년
용량 : ex) 200g, 1kg/1P
원재료및 함량 : ex) 아라비카 원두커피 100%
상품 설명 : `;
         	}
         	else if (e.target.value === 'tea'){
         		$prodDesc.innerHTML = `
제조연월일 : ex) 별도표기
유통기한 : ex) 제품뒷면표기일까지 (일,월,년,순)
보관방법 : ex) 직사광선을 피하고 건조 서늘한 곳 또는 냉장보관/개봉 후에는 변질 우려가 있으므로 빠른 시일내에 섭취 요망
제조국가 : ex) 뉴질랜드
수입원 : ex) 샷 베버리지스 코리아 유한회사
상품 설명 : `;
         	}
         	else if (e.target.value === 'syrup'){
				$prodDesc.innerHTML = `
제조연월일 : ex) 유통기한에서 36개월 전
유통기한 : ex) 제품 상단 표기월 1일까지
상품 설명 : 
수입원 : ex) (주)애니원에프앤씨`;
         	}
         	else if (e.target.value ==='powder'){
         		$prodDesc.innerHTML = `
제조연월일 : ex) 별도표기
유통기한 : ex) 제품뒷면표기일까지 (일,월,년,순)
보관방법 : ex) 직사광선을 피하고 건조 서늘한 곳 보관`;
         	}
         	else if (e.target.value ==='milk'){
         		$prodDesc.innerHTML = `
제조연월일 : ex) 별도표기
유통기한 : ex) 제품뒷면표기일까지 (일,월,년,순)
상품 설명 : `;	
         	}
         	else{
         		$prodDesc.innerHTML = `
상품설명 : `;
         	}	
        });

        // 유효성검사
        const $confirmbtn = document.querySelector('.btn-all-order');
        $confirmbtn.addEventListener('click', e => {
            // 카테고리 미선택시 돌려보냄
            if (document.querySelector('#category').value === 'non-selected') {
                alert('카테고리를 선택해주세요.');
                return;
            }
                                
            // 인풋 하나라도 입력안하면 돌려보냄
            for (let $input of $tableinputs) {
                if ($input.value.trim() === '') {
                    alert('모든 입력에대해 기재해주세요.');
                    return;
                }
            }
            if ($tabletextarea.value.trim() === '') {
                alert('모든 입력에대해 기재해주세요.');
                return;
            }
            

            if($('input[name="proprice"]').val()<=$('input[name="prosellprice"]').val()){
            	console.log('proprice' + $('input[name="proprice"]').val());
            	console.log('prosellprice' + $('input[name="prosellprice"]').val());
            	alert('상품 판매가는 상품 정상가보다 낮게 측정되어야 합니다.');
            	return;
            }
            document.productForm.submit();
            
        });
        
        function regex(input){
            input.value = input.value.replace(/[^0-9]{1,10}/g,"");
            if(parseInt(input.value)>999999999){
                input.value="";
            }
        }

        // 이미지 파일 업로드시 이미지 파일 띄우게끔
        const $imgfile = document.querySelector('#img');
        $imgfile.addEventListener('change', e=>{
        	
        	//작성시 이미지 유효성 검사
    		let file = $('#img').val();
    		console.log(file);
    		file = file.slice(file.indexOf('.') + 1).toLowerCase();
    		console.log(file);
    		if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
    			alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
    			$('#img').val('');
    			return;
    		} 
        	
        	
        	
            readURL(e.target);
            //파일 업로드시 DB에 업로드
            /* form.action='upload';
            form.submit(); */
        });
        
        function readURL(input){
            var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
                //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
                reader.readAsDataURL(input.files[0]);
                console.log()
                // fileDiv내의 img태그 아이디 가져오기
                // FileReader 객체가 생성되서 동작을 한다면,
                reader.onload = function (event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                    // 위에서 얻어온 img태그 아이디를 통해 img src 바꿔줌.
                    $('label[for="img"]').html('<img id="fileImg" src="'+ event.target.result + '" alt="upload" style="width:100px; height:100px;"/>');
                    $('#fileImg').css('margin-top', '-30px');
                }
        }
        
     

    </script>
</body>
</html>