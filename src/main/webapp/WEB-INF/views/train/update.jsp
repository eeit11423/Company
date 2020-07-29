<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
<jsp:include page="/fragment/headerRearend.jsp" />
<div class="main-panel"><!-- 後面背景框架 -->
 <div class="content-wrapper">
<section>
		<div class="container">
			<h1 style="text-align: center">新增課程資料</h1>
		</div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="updatePic" class='form-horizontal'
									enctype="multipart/form-data">
			<fieldset >
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='trainingCourse'>
						課程</label>
					<div class="col-lg-10">
						 <form:input id="trainingCourse" path="trainingCourse" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"  for='brief'>
						介紹 </label>
					<div class="col-lg-10">
						<form:input id="brief" path="brief" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"  for='elaborate'>
						內容 </label>
					<div class="col-lg-10">
						<form:input id="elaborate" path="elaborate" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						類型 </label>
					<div class='col-lg-10'>
						<form:select path="category">
							<form:options items="${CategoryList}" />
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="trainingCredit">
						學分</label>
					<div class='col-lg-10'>
						<form:input id="trainingCredit" path="trainingCredit" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="courseNo">
						課程編號 </label>
					<div class='col-lg-10'>
						<form:input id="courseNo" path="courseNo" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="companyId">
						課程來源 </label>
					<div class='col-lg-10'>
						<form:select path="companyId">
							<form:options items="${companyList}" />
						</form:select>
					</div>	
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						圖片</label>	
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
	</div>
	</div>
</body>
</html>
