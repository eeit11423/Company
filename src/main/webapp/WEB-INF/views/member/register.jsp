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
	width: 500px;
	margin: auto;
}
</style>

<style type="text/css">
   span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}
</style>

<title>Products</title>
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">新增會員資料</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute='memberbean'
			enctype="multipart/form-data" class='form-horizontal'>
			<fieldset>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='memberNumber'>帳號:
					</label>
					<div class="col-lg-10">
						<form:input id="memberNumber" path="memberNumber" type='text' class='form:input-large' />
						<form:errors path="memberNumber" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='memberPassword'>密碼:
					</label>
					<div class="col-lg-10">
						<form:input id="memberPassword" path="memberPassword" type='password' class='form:input-large' />
						<form:errors path="memberPassword" cssClass="error" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='memberSalary'>新資:
					</label>
					<div class="col-lg-10">
						<form:input id="memberName" path="memberSalary" type='text' class='form:input-large' />
						<form:errors path="memberSalary" cssClass="error" />
					</div>
				</div>


				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='memberDepartment'>部門:
					</label>
					<div class="col-lg-10">
						<form:select path="memberDepartment">
							<form:options items="${memberList}" />
						</form:select>
						<form:errors path="memberDepartment" cssClass="error" />123
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">圖片
					</label>

					<div class='col-lg-10'>
						<form:input id="productImage" path="productImage" type='file'
							class='form:input-large' /> 
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
