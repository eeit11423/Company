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
	border: 1px solid 	#FFFFFF;
	width: 400px;
	margin: auto;
}
</style>
<title>addTrainProduct</title>
</head>
<body>
<%-- <jsp:include page="/fragment/header.jsp" /> --%>
	<section>
		<div class="container">
			<h1 style="text-align: center">新增與編輯</h1>
		</div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="trainingBean" class='form-horizontal'
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
<!-- 				<div class="form-group"> -->
<!-- 					<label class='control-label col-lg-2 col-lg-2' for="trainingStartDate"> -->
<!-- 						訓練開始日期時間 </label> -->
<!-- 					<div class='col-lg-10'> -->
<%-- 					 <form:input type="date" id="trainingStartDate" path="trainingStartDate"  --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div>	 -->
<!-- 				</div>	 -->
<!-- 				<div class="form-group"> -->
<!-- 					<label class='control-label col-lg-2 col-lg-2' for="trainingEndDate"> -->
<!-- 						訓練結束日期時間 </label> -->
<!-- 					<div class='col-lg-10'> -->
<%-- 					 <form:input type="date" id="trainingEndDate" path="trainingEndDate"  --%>
<%-- 							class='form:input-large' />						 --%>
<!-- 					</div> -->
<!-- 				</div> -->
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="URLUpload">
						網址上傳連結 </label>
					<div class='col-lg-10'>
						<form:input id="URLUpload" path="URLUpload" type='text'
							class='form:input-large' />
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
</body>
</html>
