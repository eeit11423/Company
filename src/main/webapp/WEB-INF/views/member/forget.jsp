<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>第一次登入修改資料</title>
<style type="text/css">

	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;

</style>
<script >
window.onload = function(){
		var btn = document.getElementById("clickmeS1001");
		btn.onclick = function(){
		acc =  document.getElementById("acc")
		acc.value = "3001"
		Name =  document.getElementById("account")
		Name.value ="eeit114no4@gmail.com"
		
		}
}
</script>
</head>
<body style="background-image: url(${pageContext.request.contextPath}/personalcss/img/4.jpg);background-size: cover ;">
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
<!-- 	<script -->
<!-- 		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<!-- 	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
	<!------ Include the above in your HEAD tag ---------->


	<div id="fullscreen_bg" class="fullscreen_bg" />
	<div class="container">
		<div id="signupbox" style="margin-top: 50px"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">忘記密碼</div>
					<div
						style="float: right; font-size: 85%; position: relative; top: -10px">
						<a id="signinlink" href="#""></a>
					</div>
				</div>
				<div class="panel-body">
					<form:form id="signupform" class="form-horizontal" role="form"
						method='POST' modelAttribute='forgot'
						enctype="multipart/form-data">

						<div id="signupalert" style="display: none"
							class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>
						
						<div class="form-group">
							<label for="memberPassword" class="col-md-3 control-label">輸入帳號:</label>
							<div class="col-md-9">
								<input id="acc" type="text" path="memberPassword"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-3 control-label" for='memberName'>輸入信箱:
							</label>
							<div class="col-md-9">
								<form:input id="account" path="memberEmail" type='text'
							class='form-control'  />
							<form:errors path="invalidCredentials" cssClass="error" style='color:red'/>
							</div>
						</div>
						
<!-- 						<div class="form-group"> -->
<!-- 							<label for="firstname" class="col-md-3 control-label" >輸入帳號:</label> -->
<!-- 							<div class="col-md-9"> -->
<!-- 								<input id="acc" path="memberEmail" type='text' -->
<!-- 							class='form-control'  /> -->
<!-- 							</div> -->
<!-- 						<p></p> -->

<!-- 						<div class="form-group"> -->
<!-- 							<label for="firstname" class="col-md-3 control-label" >輸入註冊信箱:</label> -->
<!-- 							<div class="col-md-9"> -->
<%-- 								<form:input id="account" path="memberEmail" type='text' --%>
<%-- 							class='form-control'  /> --%>
<%-- 						<form:errors path="invalidCredentials" cssClass="error" style='color:red'/> --%>

<!-- 							</div> -->
<!-- 						</div> -->



						<div class="form-group">
							<!-- Button -->
							<div class="col-md-offset-3 col-md-9">
								<input id="btnAdd" type='submit' class='btn btn-primary' value="送出" />
								<input type='button' class='btn btn-primary'  id='clickmeS1001' value='Demo' >

							</div>
						</div>
					</form:form>
				</div>
			</div>

		</div>

</body>
</html>