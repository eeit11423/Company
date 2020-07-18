<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
	<head>
		<title>訂餐系統</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/orderLunchCss/css/main.css" />
		<link rel='stylesheet'href='${pageContext.request.contextPath}/dist/orderLunchCss/css/adminlte.css' type="text/css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
										<li>店家名單：<a href="#second">麥當勞</a></li>
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
								<ul class="features">
									<li>
										店家：<input type="text">
									</li>
									<li>
										結束時間：<input type="text">
									</li>
								</ul>
								<ul class="features">
									<li>
										餐點：<input type="text"  class="button">
									</li>
									<li>
										價格：<input type="text"  class="button">
									</li>
									<li >
										<p id='insertText'>新增/刪除</p>
										<a href="generic.html" class="far fa-plus-square fa-3x"></a>
										<a href="generic.html" class="far fa-minus-square fa-3x" ></a>
									</li>
								</ul>
								
								<footer class="major">
									<ul class="actions special">
										<li><a href="generic.html" class="button">建立</a></li>
									</ul>
								</footer>
							</section>
							
							<!-- First Section -->
							<section id="second" class="main special">
								<header class="major">
									<h2>選擇你要的餐點吧！</h2>
								</header>
								<ul class="features">
									<li>
										店家：
									<select>
										<option>麥當勞</option>
									</select>
									</li>
									<li>
									餐點：
									<select>
										<option>麥脆雞</option>
									</select>
									</li>
									<li>
										價格：<input type="text" readonly="readonly" value="100">
									</li>
									<li style="white-space: nowrap;">
										數量：<input type="text" readonly="readonly" value="0">
									</li>
									<li >
										<p id='insertText'>新增/刪除</p>
										<a href="generic.html" class="far fa-plus-square fa-3x"></a>
										<a href="generic.html" class="far fa-minus-square fa-3x" ></a>
									</li>
								</ul>
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

	</body>
</html>