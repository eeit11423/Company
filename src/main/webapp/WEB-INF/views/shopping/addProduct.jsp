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
			shoppingname = document.getElementById("shoppingname")
			shoppingname.value = "戰戟鯊終極版 電競耳機"
				shoppingProductTotal = document.getElementById("shoppingProductTotal")
			shoppingProductTotal.value = 50
				shoppingProductPrice = document.getElementById("shoppingProductPrice")
			shoppingProductPrice.value = 9999
			shoppingProductPrice = document.getElementById("productrelation")
			shoppingProductPrice.value = "伸縮吊桿麥克風 伸縮式吊桿麥克風 隔音人造皮革耳墊  7.1 dolby 環繞音效 "
			productrelation = document.getElementById("shoppingProductDiscount")
			productrelation.value = 0.9
			shoppingProductDiscount = document.getElementById("shoppingType")
			shoppingProductDiscount.value = "耳機"
	

		}

	}
	

</script>




<title>Products</title>
</head>
<body >
	<jsp:include page="/fragment/headerRearend.jsp" />
<div class="main-panel" >
         <div class="content-wrapper">
<!-- 			<div class="row"> -->
	<main class="my-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="card">	
						<div class="card-header text-white" style='background: #646D73'>
							<strong><h3>商品新增</h3></strong>
						</div>
						<div class="card-body" >

							<!--       三個地方要完全一樣 -->
							<form:form method='POST' modelAttribute="shoppingBean"
								enctype='multipart/form-data' class='form-horizontal'>
								<fieldset>
								 <input type='hidden'  id='memberNumber' name='memberNumber' path="memberNumber" value='${memberBean.memberNumber}'/>
									<div class="form-group row">
										<label for="shoppingname"
											class="col-md-2 col-form-label text-md-right">產品名稱</label>
										<div class="col-md-4">
											<form:input type="text" id="shoppingname" path="shoppingname"
												class="form-control input-md" />
												<form:errors path="shoppingname" cssClass="error"/>
										</div>
												<label class="col-md-1 col-form-label text-md-right"
											for="shoppingType"> 種類</label>
										<div class="col-md-3">
											<form:input id="shoppingType" path="shoppingType" type='text'
												class="form-control input-md" />
													<form:errors path="shoppingType" cssClass="error"/>
										</div>
									</div>

								
										<div class="form-group row">
										<label class="col-md-2 col-form-label text-md-right"
											for="productrelation">商品敘述 </label>
										<div class="col-md-4">
											<form:input id="productrelation" path="productrelation"
												type='text' class="form-control input-md" />
													<form:errors path="productrelation" cssClass="error"/>
										</div>
										<label class="col-md-1 col-form-label text-md-right"
											for='shoppingProductTotal'> 數量</label>
										<div class="col-md-3">
											<form:input id="shoppingProductTotal"
												path="shoppingProductTotal" type='text'
												class="form-control input-md" />
												<form:errors path="shoppingProductTotal" cssClass="error"/>
										</div>
									</div>



									<div class="form-group row">
										<label class="col-md-2 col-form-label text-md-right"
											for="shoppingProductPrice"> 價格 </label>
										<div class="col-md-3">
											<form:input id="shoppingProductPrice"
												path="shoppingProductPrice" type='text'
												class="form-control input-md" />
												<form:errors path="shoppingProductPrice" cssClass="error"/>
										</div>
										<label class="col-md-2 col-form-label text-md-right"
											for="shoppingProductDiscount"> 折扣</label>
										<div class="col-md-3">
											<form:input id="shoppingProductDiscount"
												path="shoppingProductDiscount" type='text'
												class="form-control input-md" />
												<form:errors path="shoppingProductDiscount" cssClass="error"/>
										</div>
									</div>
									<div class="form-group row">
										<label for="your_pass" class="col-md-2 col-form-label text-md-right"
											for='productImage'><i></i> 照片上傳 </label>
										<div class="col-md-4">
											<form:input path="productImage" type='file' />
											<form:errors path="productImage" cssClass="error"/>
										</div>
										<div class="form-group ">
												<img  id="productImage1" >
											</div>
										
						
                                   </div>
									<div class='col-lg-offset-2 col-lg-12'>
										<input id="btnAdd" type='submit'
											class="btn btn-secondary btn-lg btn-block" value="送出" />
										<input type='button' class='btn btn-primary float-right'  id='clickmeS' value='一鍵Demo' >
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
					$("#productImage1").attr('width', "120px");
					$("#productImage1").attr('heigth', "1200px");
		
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>
