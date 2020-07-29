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
	border: 1px solid 	#FFFFFF;
	width: 400px;
	margin: auto;
}
</style>
<title>addTrainProduct</title>
<script >
window.onload = function(){
	var btn = document.getElementById("clickmeS");
	btn.onclick = function(){
	trainingCourse =  document.getElementById("trainingCourse")
	trainingCourse.value ="您所不知道的PHP"
	
	brief = document.getElementById("brief")
	brief.value = "PHP（全稱：PHP：Hypertext Preprocessor，即「PHP：超文字預處理器」）是一種開源的通用電腦手稿語言，尤其適用於網路開發並可嵌入HTML中使用。"
	
	elaborate = document.getElementById("elaborate")
	elaborate.value="PHP的語法借鑑吸收C語言、Java和Perl等流行電腦語言的特點，易於一般程式設計師學習。PHP的主要目標是允許網路開發人員快速編寫動態頁面，但PHP也被用於其他很多領域。"
	
	category = document.getElementById("category")
	category.value = "後端"
	
	trainingCredit = document.getElementById("trainingCredit")
	trainingCredit.value = 37
	
	courseNo = document.getElementById("courseNo")
	courseNo.value = 011
	
	
	URLUpload = document.getElementById("URLUpload")
	URLUpload.value = "https://www.youtube.com/embed/OK_JCtrrv-c"
	
	
	}
}
</script>
</head>
<body>
<%-- <jsp:include page="/fragment/header.jsp" /> --%>
<jsp:include page="/fragment/headerRearend.jsp" />
<div class="main-panel"> <!-- 後面背景框架 -->
 <div class="content-wrapper">
	
	<section>
		<div class="container">
			<h1 style="text-align: center">新增與編輯</h1>
		</div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">
	<div>
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
					<label class="control-label col-lg-2 col-lg-2"  for='brief' >
						介紹 </label>
					<div class="col-lg-10">
						<form:input id="brief" path="brief" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"  for='elaborate' >
						內容 </label>
					<div class="col-lg-10">
						<form:input id="elaborate" path="elaborate" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category" >
						類型 </label>
					<div class='col-lg-10'>
						<form:select path="category">
							<form:options items="${CategoryList}" />
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="trainingCredit" >
						學分</label>
					<div class='col-lg-10'>
						<form:input id="trainingCredit" path="trainingCredit" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label  for="courseNo" >
						課程編號 </label>
					<div class='col-lg-10'>
						<form:input id="courseNo" path="courseNo" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label >
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
					<label  for="URLUpload" >
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
					<div class='col-lg-offset-3 col-lg-9'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
						<input type='button' class='btn btn-primary'  id='clickmeS' value='一鍵新增' >
					</div>
				</div>

			</fieldset>
		</form:form>
	</section>
	
	</div>
	</div>
	</div>
</body>
</html>
