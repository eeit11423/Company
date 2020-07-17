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
<title>Products</title>
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">修改會員資料</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute='member' enctype="multipart/form-data"
			class='form-horizontal'>
			<fieldset>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='memberNumber'>帳號: </label>
					<div class="col-lg-10">
						<form:hidden id="memberNumber" path="memberNumber" class='form:input-large' />
						${member.memberNumber}
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='memberPassword'>密碼: </label>
					<div class="col-lg-10">
						<form:input id="memberPassword" path="memberPassword" type='text' class='form:input-large' />
							
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='memberName'>姓名 </label>
					<div class="col-lg-10">
						<form:input id="memberName" path="memberName" type='text' class='form:input-large' />
					</div>
				</div>



				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="memberAddress">地址 </label>
					<div class='col-lg-10'>
						<form:input id="memberAddress" path="memberAddress" type='text' class='form:input-large' />
							
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="memberEmail">信箱 </label>
					<div class='col-lg-10'>
						<form:input id="memberEmail" path="memberEmail" type='text' class='form:input-large' />
							
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="memberGender">姓別 </label>
					
					<div class='col-lg-10'>
						<form:input id="memberGender" path="memberGender" type='text' class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">圖片 </label>
					
					<div class='col-lg-10'>
						<form:input id="productImage" path="productImage" type='file' class='form:input-large' />
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
</body>
</html>
