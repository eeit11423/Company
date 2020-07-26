<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
	<head>
		<title>訂餐系統</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/orderLunchCss/css/main.css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/dist/orderLunchCss/css/noscript.css" /></noscript>
		<style>
			a {
   			 	text-decoration:none;
			}
			#insertText{
			margin: 0 0 0 0;
			}
		</style>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<span class="logo"><img src="${pageContext.request.contextPath}/images/orderLunchImages/logo.svg" alt="" /></span>
						<h1>員工訂餐系統</h1>
					</header>
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="#intro" class="active">訂購清單</a></li>
							<li><a href="#first">新增清單</a></li>
							<li><a href="#second">訂購名單</a></li>
							<li><a href="#cta">Get Started</a></li>
						</ul>
					</nav>
				<!-- Main -->
					<div id="main">
						<!-- Introduction -->
							<section id="intro" class="main">
								<div class="spotlight">
									<div class="content">
										<header class="major">
											<h2>訂單查詢</h2>
										</header>
										<div style=" display: flex; width: 100%; argin: 0 10px;  align-items: center;" >
											<span style="display: block;"> 訂購者姓名：</span> 
											<input type="text" style="width: 65%;" id="seachOrder" />
											
										</div>
									</div>
									<span class="image"><img src="${pageContext.request.contextPath}/images/orderLunchImages/mm.jpg" alt="" /></span>
								</div>
							</section>
						<!-- First Section -->
							<section id="first" class="main special">
								<header class="major">
									<h2>如果上面沒喜歡的 那就自己建立清單吧！</h2>
								</header>
								  <div>
                                   <div style="display: flex; align-items: center; padding-bottom: 5%; border-bottom: 1px solid rgb(197, 197, 197);">
              <div style=" display: flex; width: 50%; argin: 0 10px;  align-items: center;" >
                <span style="display: block;"> 店家：</span>
                <input type="text" style="width: 80%;" id="first-box-store" />
              </div>
              <div style="display: flex;width: 50%;margin: 0 10px; align-items: center;">
                <span style="display: block;white-space: nowrap;" >結束時間：</span><input type="text" style="width: 80%;" id='datepicker' />
              </div>
            </div>
            <div class="first-feature-box">
           		 <ul class="features first-feature"  style="margin:10px 0 0 0;justify-content: inherit;">
			      	 <li style="display:flex; align-items: center;margin-left: 0.5em;"> 
			     		 <span style="white-space: nowrap;white-space: nowrap;">餐點：</span><input type="text" id="menu2"></span>
			      	 </li>
			        <li style="display:flex; align-items: center;"> 
			        	  <span style="white-space: nowrap;">價格：</span><input  id="price2"  type="text" ></span>  	
			        </li>
			        <li>
			        	<a id="first-add" class="far fa-plus-square fa-3x first-add" onclick="insertMenu()" ></a>
			        </li>
			     </ul>
            </div>
          </div>
							</section>
							
							<!-- First Section -->
							<section id="second" class="main special">
								<header class="major">
									<h2>選擇你要的餐點吧！</h2>
								</header>
								<div class="features-box">
								<div  style="display:flex; align-items: center;padding-bottom:5%  ;border-bottom: 1px solid rgb(197, 197, 197);">
										<span style="white-space: nowrap;">店家：</span>
									<select id="second-store" style="width:60%" onchange="getJson()">
										<c:forEach var='store' items='${storeList}'>
											<option name="selectStore" value="${store}">${store}</option>
										</c:forEach>
									</select>
									</div>
									<div class="second-features-box">
										<ul class="features second-feature" id="second-feature">
											<li style="display:flex; align-items: center; width:60%;">
											 <span style="white-space: nowrap;" >餐點：</span>
												<select id = "menu3" onchange="getMenuPrice()"></select>
											</li>
											<li style="display:flex; align-items: center;">
												 <span style="white-space: nowrap;">價格：</span><input type="text" id="price3" value="100">
											</li>
											<li style="white-space: nowrap; margin-top:0 ;display:flex; align-items: center;">
												 <span style="white-space: nowrap;">數量：</span><input type="text"  id="quantity3" >
											</li>
										    <li style=" margin-top:0 ;display:flex; align-items: center;width:50%">
              							        <span style="white-space: nowrap;">點餐者：</span><input type="text" id="userName3" />
               							    </li>
											<li style="margin-top:1%">
											  <a id="second-add" class="far fa-plus-square fa-3x second-add" onclick="addSecondBox()"></a>
											</li>
										</ul>
									</div>
								</div>
							</section>
							
							
						<!-- Second Section -->
							<section id="cta" class="main special">
								<header class="major">
									<h2>Ipsum consequat</h2>
									<p>Donec imperdiet consequat consequat. Suspendisse feugiat congue<br />
									posuere. Nulla massa urna, fermentum eget quam aliquet.</p>
								</header>
								<ul class="statistics">
									<li class="style1">
										<span class="icon solid fa-code-branch"></span>
										<strong>5,120</strong> Etiam
									</li>
									<li class="style2">
										<span class="icon fa-folder-open"></span>
										<strong>8,192</strong> Magna
									</li>
									<li class="style3">
										<span class="icon solid fa-signal"></span>
										<strong>2,048</strong> Tempus
									</li>
									<li class="style4">
										<span class="icon solid fa-laptop"></span>
										<strong>4,096</strong> Aliquam
									</li>
									<li class="style5">
										<span class="icon fa-gem"></span>
										<strong>1,024</strong> Nullam
									</li>
								</ul>
								<p class="content">Nam elementum nisl et mi a commodo porttitor. Morbi sit amet nisl eu arcu faucibus hendrerit vel a risus. Nam a orci mi, elementum ac arcu sit amet, fermentum pellentesque et purus. Integer maximus varius lorem, sed convallis diam accumsan sed. Etiam porttitor placerat sapien, sed eleifend a enim pulvinar faucibus semper quis ut arcu. Ut non nisl a mollis est efficitur vestibulum. Integer eget purus nec nulla mattis et accumsan ut magna libero. Morbi auctor iaculis porttitor. Sed ut magna ac risus et hendrerit scelerisque. Praesent eleifend lacus in lectus aliquam porta. Cras eu ornare dui curabitur lacinia.</p>
								<footer class="major">
									<ul class="actions special">
										<li><a href="generic.html" class="button" >Learn More</a></li>
									</ul>
								</footer>
							</section>
					</div>

			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/dist/orderLunchCss/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/dist/orderLunchCss/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/dist/orderLunchCss/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/dist/orderLunchCss/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/dist/orderLunchCss/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/dist/orderLunchCss/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/dist/orderLunchCss/js/main.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

			<script>
		       $( function() {
		    	    $( "#datepicker" ).datepicker({
		    	    	dateFormat : "yy-mm-dd"
		    	    });
		    	  } );
			
		    function insertMenu(){
		    	  var store = document.getElementById("first-box-store").value;
		    	  var date = document.getElementById("datepicker").value;
		    	  var menu = document.getElementById("menu2").value;
		    	  var price = document.getElementById("price2").value;
		    	  $.ajax({'url':'/mvcExercisetest/orderLunch/insertStore',
						'method' : "POST",
						'data' : {'store' : store,'date':date ,'menu':menu,'price':price
						},'success' : function(datas) {
		 					$('#first-box-store').val("");
		 					$('#datepicker').val("");
		 					$('#menu2').val("");
		 					$('#price2').val("");
		 					if("success"==datas)
		 						alert("建立成功");
						},'error':function(xhr, ajaxOptions, thrownError){
							console.log(xhr.responseText);
						}
		     		 });
		    } 
		       	
      getJson(); 
      function getJson() {
    	  var select = document.getElementById("second-store");
    	  var chooseOption = select.options[select.selectedIndex].value;
    	  $.ajax({'url':'/mvcExercisetest/orderLunch/getStoreMenuList',
				'method' : "POST",
				'data' : {'store' : chooseOption
				},'success' : function(datas) {
					var secData = [];
 					var datasJson = JSON.parse(datas);
 					 secData = datasJson;
 					 $('#menu3').empty();
 					 for(var i = 0;i < secData.length; i++) {
 	 				    var newOption = $('<option value="'+secData[i].id+'" name="'+secData[i].product+'">'+secData[i].product+'</option>');
 	 				    $('#menu3').append(newOption);
               }
 				getMenuPrice();
				},'error':function(xhr, ajaxOptions, thrownError){
					console.log(xhr.responseText);
				}
     		 });
      };
      function getMenuPrice() {
    	  var select = document.getElementById("menu3").value;
    	  $.ajax({'url':'/mvcExercisetest/orderLunch/getStoreMenuPrice',
				'method' : "POST",
				'data' : {'menu' : select
				},'success' : function(datas) {
					var secData = [];
 					var datasJson = JSON.parse(datas);
 					 secData = datasJson;
 						document.getElementById("price3").value=secData[0].price;	
 						$("#quantity3").val("");
 						$("#userName3").val("");
				},'error':function(xhr, ajaxOptions, thrownError){
					console.log(xhr.responseText);
				}
     		 });
      };
      
   function changeSecStore(e){
    	  var select = document.getElementById("second-store");
    	  var chooseOption = select.options[select.selectedIndex].value
           console.log(select.options[select.selectedIndex])
           $(`#second-store option[value=${'${e.id}'}]`).attr('selected', 'selected');
      }
   
  
  function addSecondBox() {
	  var store = document.getElementById("second-store").value;
	  var menu = document.getElementById("menu3").value;
	  var price = document.getElementById("price3").value;
	  var quantity = document.getElementById("quantity3").value;
	  var userName = document.getElementById("userName3").value;
	  console.log("menu:"+menu);
	  $.ajax({'url':'/mvcExercisetest/orderLunch/addOrder',
			'method' : "POST",
			'data' : {'store' : store,'menu':menu , 'price':price ,  'quantity':quantity , 'userName':userName
			},'success' : function(datas) {
				var secData = datas;
				if("success"==secData)
					 alert("下單成功");
					$("#quantity3").val("");
					$("#userName3").val("");
			},'error':function(xhr, ajaxOptions, thrownError){
				console.log(xhr.responseText);
			}
 		 });
  };
  
    </script>
	</body>
</html>