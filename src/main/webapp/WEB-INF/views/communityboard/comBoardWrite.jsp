<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cmboardwrite</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="https://kit.fontawesome.com/6bdfd4f896.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/style.css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
    

    <style>
    	* {
    		border-radius: 0 !important;
    	}
        .container {
            min-width: 1200px;
            margin-top: 180px;
            margin-bottom: 80px;
        }
        
        .fileDiv {
			height: 100px;
			width: 200px;
			display: none;
			margin-bottom: 10px;
		}
	
		.fileDiv img {
			width: 100%;
			height: 100%;
		}
		#writer{
			font-size: 15px;
			display: block;
		}
		#title{
        	heigth: 30px;
        	padding: 10px;
        	margin-left: 20px;
        	border: 1px solid black;
        }
    </style>




</head>

<body>


  <%@ include file="../include/header.jsp" %>


    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div >
                            <h3 class="write-service">
                                &nbsp;&nbsp; <strong>Coffee Talk</strong>
                            </h3>
                            
                        </div>
                            
                    </div>
                    <form name="writeform" method="post" action="<c:url value='/cmBoard/write' />" enctype="multipart/form-data">
                        <!-- 

                        <div class="row col-xs-12">
                          <label for="">????????? ??????</label> 
                          <select style="width: 93%;" name="category" class="category" id="">
                            <option value="notice"  hidden>?????? ?????????</option>
                            <option value="event" hidden>????????? ?????????</option>
                            <option value="community" selected>???????????? ?????????</option>
                          </select>
                        </div>
                      -->
                        <div class="form-group" 
                        style="border-top:3px solid black; border-bottom:3px solid black; padding-bottom: 20px; padding-top: 20px;">

                            <label for="writer">
                                <span class="glyphicon glyphicon-user"></span>?????????
                            </label>
                            <input type="text" class="" id="writer" name="writer" value="${login.userid }" readonly
                                style="cursor: auto; border-color: transparent; background-color: transparent; width: 180px;">
                        </div>
                        <div class="form-group">

                            <label for="title">
                                ??????
                            </label>
                            <input type="text" class="" id="title" name="title"
                                style="width: 300px; background-color: transparent;" />
                        </div>
                        
                        <!-- ?????? ??????. -->
                        <div class="form-group">
   	                     <p>3??? ?????? ????????????</p>
   	                     <input type="file" multiple="multiple" id="file" name="files">
                        
                        </div>
                        
                        <div class="fileDiv">
							<img id="fileImg" src="<c:url value='/img/load.png' />" />
						</div>
                        
                        
                        
                        <div class="form-group">
							<label for="content" class="col-sm-14">
								??????
		                        <textarea name="content" id="content" class="" style="width:100%; resize:none;" rows="7" cols="180"></textarea>
							</label>
                        </div>

                        <button type="button"
                        	onclick="location.href='<c:url value='/cmBoard/cmList'/>'"
                         class="detailbtn btn btn-dark" id="listbtn"
                            style="float: left; background-color: #000; color: #fff; border-color: #000;">??????</button>


                        <div class="write" style="float: right; margin-bottom: 40px;">
                            <!-- ???????????? -> ????????????. -->
                            <button id="delbtn" type="button"
                                style="background-color: #fff; border-color: #000; color:#000" class="btn btn-primary">
                                ??????
                            </button>
                            <button id="modbtn" type="button" style="background-color: #000; color: #fff; border-color: #000;"
                                class="btn btn-info">
                                ??????
                            </button>
                        </div>

                </form>
                </div>

            </div>
        </div>
       
    </section>


<%@ include file="../include/footer.jsp" %>



    <script>
        // ?????? 
        const title = document.getElementById('title')
        console.log(title)

        //??????
        const content = document.getElementById('content')
        console.log(content)

        // ????????????
        document.querySelector('#modbtn').addEventListener('click', function () {

            if (title.value === '' || content.value === '') {
                event.preventDefault();
                alert('????????? ????????? ??????????????????.')
                return;
            } 

            document.writeform.submit();


        });

        // ????????????
        document.querySelector('#delbtn').addEventListener('click', function (e) {
            if (confirm('???????????? ????????? ??????????????? ?????????????????????????')) {

                history.back();
            }
            return;
        });
        
        
        
        
        const $imgfile = document.querySelector('#file');
        console.log($imgfile);
        $imgfile.addEventListener('change', e=>{
        	
        	//????????? ????????? ????????? ??????
    		let file = $('#file').val();
    		console.log(file);
    		file = file.slice(file.indexOf('.') + 1).toLowerCase();
    		console.log(file);
    		if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
    			alert('????????? ??????(jpg, png, jpeg, bmp)??? ????????? ???????????????.');
    			$('#file').val('');
    			return;
    		} 
        	
            
        });
        
      
		function readURL(input) {
			
        	if (input.files) {
        		for(let i=0; i<input.files.length; i++){
        			
        		}
            	var reader = new FileReader(); //?????????????????? ?????? ????????? ?????? ?????????????????? ??????
            	//readAsDataURL ???????????? ???????????? ?????? Blob ?????? File?????? ?????? ?????? ?????? (MDN??????)
	        	reader.readAsDataURL(input.files[0]); 
            	//?????????????????? ????????? ??????????????? ?????????fileDiv??? ???????????????
	            $(".fileDiv").css("display", "block");
            	
            	reader.onload = function(event) { //?????? ????????? ??????????????? ?????? ????????? ??? ???????????? ????????????
                	$('#fileImg').attr("src", event.target.result); 
                	console.log(event.target)//event.target??? ???????????? ????????? ????????? ??????
	        	}
        	}
	    }
		
		
		$("#file").change(function() {
	        readURL(this); //this??? #file?????? ????????? ??????
	        
	    });
        
      



    </script>
    




</body>

</html>