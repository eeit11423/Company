<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
</style>
<title>Products</title>
</head>
<body style="background-image: url(../personalcss/img/4.jpg) ;">
	<section>
		<div class="container">
			<h1 style="text-align: center">忘記密碼</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">

		<form:form method='POST' modelAttribute='forgot'
			enctype="multipart/form-data" class='form-horizontal'>
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='account'>信箱:
					</label>
					<div class="col-lg-10">
						<form:input id="account" path="memberEmail" type='text'
							class='form:input-large' />
						<form:errors path="invalidCredentials" cssClass="error" />
					</div>
				</div>


				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
	<div align='center'>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
</body>
</html>
