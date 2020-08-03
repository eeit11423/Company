<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>score</title>
<jsp:include page="/fragment/header.jsp" />
<!--很重要，這三行一定要加~~從JQuery網站擷取你所需要的資源 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
        .form1{
            font-weight: 900;  /*字體粗細*/
            margin: 80px auto; /*最上面與視窗距離*/
            border: 1px solid;
            width: 600px; 
            border:  solid;
            border-color:#D0D0D0;           
        }
        .form11{
            border: 1px solid;
            border-color:#D0D0D0;
            padding-top: 5px;
        }
    </style>
    <script>
	    function reconfirmOrder() {
	
			if (confirm("確定送出評分結果 ? ") ) {
				document.forms[0].action="<c:url value='/train/scorepoint' />";
				document.forms[0].method="POST";
				document.forms[0].submit();
				
				return;
			} else {
				return;
			}
		}
    </script>
</head>
<body>
	<h1 style="text-align:center">自我學習評點</h1>
    <div style="text-align:center" class="form1">
        <div class="form11" id="d1">
        <div><a>1.理解程度。</a></div>
            <img class="c1" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c1" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c1" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c1" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c1" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <p id="p1" class="clap1">尚未評點</p>
            <input class="btn btn-secondary" type="button" id="btn1" value="重設" >
        </div>
            
        <div class="form11" id="d2" >
        <div><a>2.操作狀況。</a></div>
            <img class="c2" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c2" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c2" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c2" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c2" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <p id="p2" class="clap2">尚未評點</p>
            <input class="btn btn-secondary" type="button" id="btn2" value="重設">
        </div>
        <div class="form11" id="d3">
        <div><a>3.題目完成度。</a></div>
            <img class="c3" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c3" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c3" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c3" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c3" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <p id="p3">尚未評點</p>
            <input class="btn btn-secondary" type="button" id="btn3" value="重設">
        </div>
        <div class="form11" id="d4">
        <div><a>4.課程與工作應用。</a></div>
            <img class="c4" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c4" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c4" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c4" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c4" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <p id="p4">尚未評點</p>
            <input class="btn btn-secondary" type="button" id="btn4" value="重設">
        </div>
        <div  class="form11" id="d5">
        <div><a>5.是否具備此課程開發能力。</a></div>
            <img class="c5" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c5" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c5" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c5" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <img class="c5" src="${pageContext.request.contextPath}/images/starsmall.gif" />
            <p id="p5">尚未評點</p>
            <input class="btn btn-secondary" id="btn5" type="button" value="重設">
        </div>
    </div>
     
        
        
        
	<script >
            // let flag = true;     
                star();    
                star2();
                star3();
                star4();
                star5();
                
        function star(){
            $(".c1").hover(function () {                
                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
                $(this).attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");                            
                let rr = $(this).index();
                $("#p1").text("評點中..." + rr+"分");            
            }, function () {
                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
                $(this).attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
                $("#p1").text("尚未評點");
            });

            $(".c1").click(function () {
                    $('#p1').empty().append("最終評點 :  " + ($(this).index()) + "分");
                    let rr1 = $(this).index(); // 當點擊時自動把你的評分加進變數裡。
                    console.log("變數rr1+++++++++++"+rr1);
                    $(".c1").off("mouseenter mouseleave click");
                    $("#question1Id").val(rr1); //2; 點擊時把值丟給隱藏標籤
                    
            }); 
            }
        
        function star2(){
            $(".c2").hover(function () {                
                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
                $(this).attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
                $('p2').empty();              
                let rr = $(this).index();
                $("#p2").text("評點中..." + rr+"分");
                console.log(rr);
            }, function () {
                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
                $(this).attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
                $("#p2").text("尚未評點");
            });

            $(".c2").click(function () {
                    $('#p2').empty().append("最終評點 :  " + ($(this).index()) + "分");
                    let rr2 = $(this).index(); // 當點擊時自動把你的評分加進變數裡。
                    console.log("變數rr2+++++++++++"+rr2);
                    $(".c2").off("mouseenter mouseleave click");
                    $("#question2Id").val(rr2); //2; 點擊時把值丟給隱藏標籤
            });   
            }
        
        function  star3(){
            $(".c3").hover(function () {                
                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
                $(this).attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
                $('p3').empty();             
                let rr = $(this).index();
                $("#p3").text("評點中..." + rr+"分");
                console.log(rr);
            }, function () {
                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
                $(this).attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
                $("#p3").text("尚未評點");
            });

            $(".c3").click(function () {
                    $('#p3').empty().append("最終評點 :  " + ($(this).index()) + "分");
                    let rr3 = $(this).index(); // 當點擊時自動把你的評分加進變數裡。
                    console.log("變數rr3+++++++++++"+rr3);
                    $(".c3").off("mouseenter mouseleave click");
                    $("#question3Id").val(rr3); //2; 點擊時把值丟給隱藏標籤
            });   
            }    

        function star4(){
            $(".c4").hover(function () {                
                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
                $(this).attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
                $('p4').empty();               
                let rr = $(this).index();
                $("#p4").text("評點中..." + rr+"分");
                console.log(rr);
            }, function () {
                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
                $(this).attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
                $("#p4").text("尚未評點");
            });

            $(".c4").click(function () {
                    $('#p4').empty().append("最終評點 :  " + ($(this).index()) + "分");
                    let rr4 = $(this).index(); // 當點擊時自動把你的評分加進變數裡。
                    console.log("變數rr4+++++++++++"+rr4);
                    $(".c4").off("mouseenter mouseleave click");
                    $("#question4Id").val(rr4); //2; 點擊時把值丟給隱藏標籤
            });   
            }   
            
        function star5(){
		            $(".c5").hover(function () {                
		                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
		                $(this).attr("src", "${pageContext.request.contextPath}/images/chngstarsmall.gif");
		                $('p5').empty();            
		                let rr = $(this).index();
		                $("#p5").text("評點中..." + rr+"分");
		                console.log(rr);
		            }, function () {
		                $(this).prevAll().attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
		                $(this).attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
		                $("#p5").text("尚未評點");
		            });
		
		            $(".c5").click(function () {
		                    $('#p5').empty().append("最終評點 :  " + ($(this).index()) + "分");
		                    let rr5 = $(this).index(); // 當點擊時自動把你的評分加進變數裡。
		                    console.log("變數rr5+++++++++++"+rr5);
		                    $(".c5").off("mouseenter mouseleave click");
		                    $("#question5Id").val(rr5); //2; 點擊時把值丟給隱藏標籤
		            });   
            }
        
            $("#btn1").click(function () {
            	$(".c1").attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
            	$("#p1").text("尚未評點");
                star();

                alert("重新評點1");
            });

            $("#btn2").click(function () {
            	$(".c2").attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
            	$("#p2").text("尚未評點");
                star2();
                alert("重新評點2");
            });
            
            $("#btn3").click(function () {
            	$(".c3").attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
            	$("#p3").text("尚未評點");
                star3();
                alert("重新評點3");
            });

            $("#btn4").click(function () {
            	$(".c4").attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
            	$("#p4").text("尚未評點");
                star4();
                alert("重新評點4");
            });

            $("#btn5").click(function () {
            	$(".c5").attr("src", "${pageContext.request.contextPath}/images/starsmall.gif");
            	$("#p5").text("尚未評點");
                star5();
                alert("重新評點5");
            });
            
        
        </script>
       	<form  style="text-align:center" action="<c:url value='/train/scorepoint'/>"method="POST"> <!-- action代表送進controller的目標 -->
        	<Input id='question1Id' type='hidden' name='question1' value='0'><!-- 零代表的是預設值 -->
	        <Input id='question2Id' type='hidden' name='question2' value='0'>
	        <Input id='question3Id' type='hidden' name='question3' value='0'>
	        <Input id='question4Id' type='hidden' name='question4' value='0'>
	        <Input id='question5Id' type='hidden' name='question5' value='0'>
	        <Input id='memberNumber' type='hidden' name='memberNumber' value='${memberBean.memberNumber}'>
	        <Input id='trainingId' type='hidden' name='trainingId' value='${trainingId}'>
	        
	        
	        <Input style="" id='' type='submit'
	        	   class="btn btn-secondary" name='question1,question2,question3,
	        	   									question4,question5' value='送出' onclick="reconfirmOrder()">
			   
        </form>
       
</body>
</html>