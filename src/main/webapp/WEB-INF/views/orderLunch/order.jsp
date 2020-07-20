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
											<h2>選擇喜歡的店家</h2>
										</header>
										<p>選擇一家要進行訂購的店家  再+1吧！</p> 
										<ul class="actions">
											<li>店家名單：
												<c:forEach var='store' items='${storeList}'>
													<a id="${store}" onclick="getJson(${store})" style="cursor: pointer;">${store}</a>
												</c:forEach>
											</li>
										</ul>
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
              <div
                style="
                  display: flex;
                  width: 50%;
                  margin: 0 10px;
                  align-items: center;
                "
              >
                <span style="display: block;"> 店家：</span
                ><input type="text" style="width: 80%;" />
              </div>
              <div style="display: flex;width: 50%;margin: 0 10px; align-items: center;">
                <span style="display: block;white-space: nowrap;" >結束時間：</span><input type="text" style="width: 80%;" id='datepicker' />
              </div>
                   <div
                style="
                  display: flex;
                  width: 50%;
                  margin: 0 10px;
                  align-items: center;
                "
              >
                <span style="display: block;white-space: nowrap;">建立者：</span
                ><input type="text" style="width: 80%;" />
              </div>
            </div>
            <div class="first-feature-box"></div>
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
									<select id="second-store" style="width:60%">
										<option>麥當勞</option>
									</select>
									</div>
								<ul class="features">
									<li style="display:flex; align-items: center; width:60%;">
									 <span style="white-space: nowrap;">餐點：</span>
									<select>
										<option>麥脆雞</option>
									</select>
									</li>
									<li style="display:flex; align-items: center;">
										 <span style="white-space: nowrap;">價格：</span><input type="text" readonly="readonly" value="100">
									</li>
									<li style="white-space: nowrap; margin-top:0 ;display:flex; align-items: center;">
										 <span style="white-space: nowrap;">數量：</span><input type="text" readonly="readonly" value="0">
									</li>
									    <li style=" margin-top:0 ;display:flex; align-items: center;width:50%">
                                           <span style="white-space: nowrap;">點餐者：</span><input type="text" readonly="readonly" value="多多" />
                                        </li>
                                        
									<li style="margin-top:1%">
										  <a id="second-add" class="far fa-plus-square fa-3x second-add"></a>
         								  <a id="second-remove" class="far fa-minus-square fa-3x second-remove" ></a>
									</li>
								</ul>
								</div>
								<footer class="major">
									<ul class="actions special">
										<li><a href="generic.html" class="button">送出</a></li>
									</ul>
								</footer>
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
										<li><a href="generic.html" class="button">Learn More</a></li>
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
		
		    var firstData = [{sale:'100',price:'100'}]
		
		    addFirstData(firstData);
		    
			function addFirstData(data){
		    	data.map((item,index)=>
			      {console.log(index)
			        var htmlTag =`  <ul class="features" style="margin:10px 0 0 0;justify-content: inherit;">
			        	             	 <li style="display:flex; align-items: center;margin-left: 0.5em;"> 
			        	              		 <span style="white-space: nowrap;white-space: nowrap;">餐點：</span><input type="text" value=${'${item.sale}'}></span>
			        	              	 </li>
			        	               	<li style="display:flex; align-items: center;"> 
			        	             	 	 <span style="white-space: nowrap;">價格：</span><input type="text" value=${'${item.sale}'}></span> 
			        	            		</li>
			        	             	<li> 
			        	                	<a id="second-add" class="far fa-plus-square fa-3x second-add" onclick="insertMenu()" ></a>
			        	                	<a id="second-remove" class="far fa-minus-square fa-3x second-remove" onclick="removeFirstData(item,index)"></a>
			        	            	   </li>
			        	           </ul>`
			        $(".first-feature-box").append(htmlTag);
			      }
			      )
		    }
			
		function	removeFirstData(item,index){
			 var taskIndex = firstData.indexOf(item);
			      firstData.splice(taskIndex, 1);
			      console.log(firstData);
			}
			
		      
		      //  新增菜單選項
      function insertMenu(e){
//         	  $.ajax({'url':'/mvcExercisetest/orderLunch/insertMenu',
//     				'method' : "POST",
//     				'data' : {'store' : e.id
//     				}
//       })   
    	  fetch('/mvcExercisetest/orderLunch/insertMenu', {
    		    body: JSON.stringify(firstData), // must match 'Content-Type' header
    		    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
    		    credentials: 'same-origin', // include, same-origin, *omit
    		    headers: {
    		      'user-agent': 'Mozilla/4.0 MDN Example',
    		      'content-type': 'application/json'
    		    },
    		    method: 'POST', // *GET, POST, PUT, DELETE, etc.
    		    mode: 'cors', // no-cors, cors, *same-origin
    		    redirect: 'follow', // manual, *follow, error
    		    referrer: 'no-referrer', // *client, no-referrer
    		  })
    		  .then(response =>{
    			     $(".features").remove();
 		        	firstData.push({sale:'',price:''});
 		        	addFirstData(firstData);
    		  }) // 輸出成 json
    		

               
      }
			
			</script>
 <script>
 var item =
	  '<ul class="features">'+
		'<li style="display:flex; align-items: center; width:60%;"><span style="white-space: nowrap;">餐點：</span><select><option>麥脆雞</option></select></li>'+
       '<li style="display:flex; align-items: center;"><span style="white-space: nowrap;">價格：</span><input type="text" readonly="readonly" value="100"></li>'+
       '<li style="display:flex; align-items: center;"><span style="white-space: nowrap;">數量：</span><input type="text" readonly="readonly" value="0"></li>'+
       '<li  style=" margin-top:0 ;display:flex; align-items: center;"><span style="white-space: nowrap;">餐點者：</span><input type="text" readonly="readonly" value="0"></li>'+
       '<li style="margin-top:1%"><a id="second-add" class="far fa-plus-square fa-3x second-add"></a><a id="second-remove" class="far fa-minus-square fa-3x second-remove" ></a></li>'+
       '</ul>';
       $( function() {
    	    $( "#datepicker" ).datepicker();
    	  } );
       
       
     $(document).on("click", ".second-add", function () {
         $(".features-box").append(item);
       });
     
      $(document).on("click", ".second-remove", function () {
          $(".features").last().remove();
        });
      
      //
      function getJson(e) {
    	  $.ajax({'url':'/mvcExercisetest/orderLunch/selectStoreList',
				'method' : "POST",
				'data' : {'store' : e.id
				},'success' : function(datas) {
					var datasJson = JSON.parse(datas);
					var i;
					var text ='';
					  for (var i = 0; i < datasJson.length; i++) {
					        var a=datasJson[i].store;
					        $( "#second-store").empty();
					        $("#second-store").append("<option>"+a+"</option>");
	              }
					
				},'error':function(xhr, ajaxOptions, thrownError){
					console.log(xhr.responseText);
				}
     		 });
      };
      
    
    </script>
	</body>
</html>