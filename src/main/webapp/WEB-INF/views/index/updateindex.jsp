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
									<strong><h3>圖片更新</h3></strong>
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
													
<!-- 													<input -->
<!-- 													type='button' class='btn btn-primary float-right' -->
<!-- 													id='clickmeS' value='一鍵Demo'> -->
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
