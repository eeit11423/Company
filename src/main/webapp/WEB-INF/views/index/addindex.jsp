<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
</style>
<meta charset="UTF-8">
<script>
window.onload = function() {
	var btn = document.getElementById("clickmeS");
	btn.onclick = function() {
		indexH2 = document.getElementById("indexH2")
		indexH2.value = "付酬者有限公司"
			indexP = document.getElementById("indexP")
		indexP.value = "員工每個人真誠溝通，互助學習，態度積極，快速行動。"
	}	


	}
</script>




<title>Products</title>
</head>
<body>
	<jsp:include page="/fragment/headerRearend.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">
			<!-- 			<div class="row"> -->
			<main class="my-form">
				<div class="cotainer">
					<div class="row justify-content-center">
						<div class="col-md-10">
							<div class="card">
								<div class="card-header text-white" style='background: #646D73'>
									<strong><h3>圖片新增</h3></strong>
								</div>
								<div class="card-body">

									<!--       三個地方要完全一樣 -->
									<form:form method='POST' modelAttribute="indexBean"
										enctype='multipart/form-data' class='form-horizontal'>
										<fieldset>
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-md-right"
													for="memberNumber"> 上傳員工編號</label>
												<div class="col-md-6">
													<form:input id="memberNumber" path="memberNumber"
														type='text' value='${memberBean.memberNumber}'
														class="form-control input-md" />
													<form:errors path="memberNumber" cssClass="error" />
												</div>
											</div>
													
													<div class="form-group row">
												<label class="col-md-4 col-form-label text-md-right"
													for="indexH2"> 標頭文字</label>
												<div class="col-md-6">
													<form:input id="indexH2" path="indexH2"
														type='text' 
														class="form-control input-md" />
													<form:errors path="indexH2" cssClass="error" />
												</div>
											</div>
														<div class="form-group row">
												<label class="col-md-4 col-form-label text-md-right"
													for="indexP">文字內容</label>
												<div class="col-md-6">
													<form:input id="indexP" path="indexP"
														type='text' 
														class="form-control input-md" />
													<form:errors path="indexP" cssClass="error" />
												</div>
											</div>

											<div class="form-group ">
												<label for="your_pass" class="col-md-4 col-form-label text-md-right"><i
													></i></label>
												<form:input id="productImage" path="productImage"
													type='file'  />
											</div>
											<div class="form-group ">
												<img  class='col-lg-offset-2 col-lg-12' id="productImage1" >
											</div>

											<br>&nbsp;
											<div class='col-lg-offset-2 col-lg-12'>
												<input id="btnAdd" type='submit'
													class="btn btn-secondary btn-lg btn-block" value="送出" /> 
													<input type='button' class='btn btn-primary float-right'
													id='clickmeS' value='一鍵Demo'>
											</div>


										</fieldset>
									</form:form>

								</div>
							</div>
						</div>
					</div>
				</div>

			</main>
		</div>
	</div>
	</div>

	<script>
		$("#productImage").change(function() {
			readURL(this);
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#productImage1").attr('src', e.target.result);
					$("#productImage1").attr('width', "400px");
					$("#productImage1").attr('heigth', "400px");
		
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>
