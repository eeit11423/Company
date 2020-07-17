<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>登入</title>
	<meta charset="UTF-8">
<!-- 	//<meta name="viewport" content="width=device-width, initial-scale=1"> -->

	<link rel="icon" type="image/png" href='${pageContext.request.contextPath}/images/icons/favicon.ico'/>
	<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css'>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(${pageContext.request.contextPath}/images/bg-01.jpg);">
					<span class="login100-form-title-1">
						登入
					</span>
				</div>

				<form:form method='POST' modelAttribute='memberBeans' enctype="multipart/form-data" class="login100-form validate-form">
					<div class="wrap-input100 validate-input m-b-26" data-validate="帳號不能為空白">
						<span class="label-input100">帳號</span>
						<form:input class="input100" id="account" path="userId" type='text' placeholder="輸入帳號" />
						
						<span class="focus-input100"></span>
					</div>
					<div>
					zzzzzzzzzzzzz
					<form:errors path="userId"  />
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "密碼不能為空白">
						<span class="label-input100">密碼</span>
						<form:input class="input100" id="pwd" path="password" type='password' placeholder="輸入密碼" />
						<form:errors  path="password" cssClass="error" />
						<span class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-b-30">
						<div class="contact100-form-checkbox">
						<form:checkbox path="rememberMe" /><span>記住我</span>
						</div>

						<div>
							<a href="#" class="txt1">
								忘記密碼??
							</a>
							
						</div>
					</div>

					<div class="container-login100-form-btn">
					<input id="btnAdd" type='submit' class='login100-form-btn' value="登入"/>		
					</div>
				</form:form>
				<div align='center'>
					
				</div>
			</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/animsition/js/animsition.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/select2/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/countdowntime/countdowntime.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>