<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://www.google.com/recaptcha/api.js"></script>
	<title>Login V18</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/logincss/images/icons/favicon.ico"/>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/vendor/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/vendor/animate/animate.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/vendor/css-hamburgers/hamburgers.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/vendor/animsition/css/animsition.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/vendor/select2/select2.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/vendor/daterangepicker/daterangepicker.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/logincss/css/main.css">
</head>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
			<form:form method='POST' modelAttribute='loginBean'
					enctype="multipart/form-data" class="login100-form validate-form" onsubmit="return submitUserForm();">
				
					<span class="login100-form-title p-b-43">
						付酬者員工內部網
					</span>
					
				<form:errors path="invalidCredentials" class="text-danger" style="font-size:12px" />
					<div class="wrap-input100 validate-input" data-validate="">
						<form:input class="input100" id="account" path="userId" type='text' placeholder="帳號" />
						<span class="focus-input100"></span>
						
					</div>
					<form:errors path="userId" class="text-danger" style="font-size:12px" />
					<div></div>
					
					<div class="wrap-input100 validate-input" data-validate="">
						<form:input class="input100" id="account" path="password" type='password' placeholder="密碼" />
						<span class="focus-input100"></span>
						
					</div>
					<form:errors path="userId" class="text-danger" style="font-size:12px" />
					<div></div>
					
					

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<form:checkbox path="rememberMe" />
							<span class="text-muted" style="font-size: 14px">Remember me</span>
						</div>

						<div>
							<a href="forgetpwd" class="txt1">
								Forgot Password?
							</a>
						</div>
					</div>
			
					<div id="grecaptcha" class="g-recaptcha"
						data-sitekey="6LcXZ7IZAAAAAAkcEb54s18XQh2cq-DzVhCd-LxB" style="padding:10px 70px "></div>
					<div id="g-recaptcha-error"style="padding:10px 70px "></div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>
					
					
					<div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							
						</span>
					</div>

					<div class="login100-form-social flex-c-m">
						<a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
							<i class="fa fa-facebook-f" aria-hidden="true"></i>
						</a>

						<a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</div>
				</form:form>

				<div class="login100-more" style="background-image: url('logincss/images/bg-01.jpg');">
				</div>
			</div>
		</div>
	</div>
<script>
		function submitUserForm() {
			var response = grecaptcha.getResponse();
			if (response.length == 0) {
				document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">請點選我不是機器人</span>';
				return false;
			}
			return true;
		}
		function verifyCaptcha() {
			document.getElementById('g-recaptcha-error').innerHTML = '';
		}
	</script>


</body>
</html>