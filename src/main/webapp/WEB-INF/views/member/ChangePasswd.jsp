<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改資料</title>
<script>
	window.onload = function(){
		var btn = document.getElementById("btnAdd");
		btn.onclick = function(){
		pwd1 = 	document.getElementById("passwd1").value;
		pwd2 = 	document.getElementById("passwd2").value;
		if (pwd1 != pwd2){
			document.getElementById("nopasswd").innerHTML="*密碼不相同";
		}
		else{
			document.getElementById("btnAdd").type = "submit";
			
		}
		}
	}
</script>
</head>
<body style="background-image: url(../personalcss/img/2.jpg);background-size: cover ; ">
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->


	<div id="fullscreen_bg" class="fullscreen_bg" style="padding-top: 6% ;border-radius:10%;"/>
	<div class="container">
		<div id="signupbox" style="margin-top: 50px;;border-radius:10%;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">修改密碼</div>
					<div
						style="float: right; font-size: 85%; position: relative; top: -10px">
						<a id="signinlink" href="#""></a>
					</div>
				</div>
				<div class="panel-body">
<%-- 					<form:errors path="invalidCredentials" class="text-danger" style="font-size:12px" /> --%>
					<form:form id="signupform" class="form-horizontal" role="form"
						method='POST' modelAttribute='changepwd'
						enctype="multipart/form-data">

						<div id="signupalert" style="display: none"
							class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>

<!-- 						<div class="form-group"> -->
<!-- 							<label for="firstname" class="col-md-3 control-label">帳號</label> -->
<!-- 							<div class="col-md-9"> -->
<%-- 								<form:hidden id="memberNumber" path="memberNumber" --%>
<%-- 									class='form-control' /> --%>
<%-- 								${member.memberNumber} --%>

<!-- 							</div> -->
<!-- 						</div> -->


						<div class="form-group">
							<label for="memberPassword" class="col-md-3 control-label">輸入舊密碼</label>
							<div class="col-md-9">
								<form:input type="password" path="memberPassword" id = "oldpasswd"
									class="form-control" />
								<form:errors path="memberPassword" class="text-danger" style="font-size:12px" />
							</div>
						</div>

						<div class="form-group">
							<label for="memberPassword" class="col-md-3 control-label">輸入新密碼</label>
							<div class="col-md-9">
								<form:input type="password" path="memberNewPassword" id = "passwd1"
									class="form-control" />
								<form:errors path="memberNewPassword" class="text-danger" style="font-size:12px" />
							</div>
						</div>
							
						<div class="form-group">
							<label for="memberPassword" class="col-md-3 control-label">確認新密碼</label>
							<div class="col-md-9">
								<input type="password" id="passwd2" class="form-control" />
								<p id="nopasswd" style="font-size:12px" class="text-danger"></p>
								
							</div>
						</div>

						<div class="form-group">
							<!-- Button -->
							<div class="col-md-offset-3 col-md-9">
								<input id="btnAdd" type='button' class='btn btn-primary'
							value="送出" />

							</div>
						</div>




					</form:form>
				</div>
			</div>




		</div>
</body>
</html>