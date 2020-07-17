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
	
	width: 600px;
	margin: auto;
}
</style>
<title>Products</title>
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">新增產品資料</h1>
		</div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="shoppingBean" enctype='multipart/form-data' class='form-horizontal'>
			<fieldset >
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='shoppingname'>
						產品名稱 </label>
					<div class="col-lg-10">
						 <form:input id="shoppingname" path="shoppingname" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"  for='shoppingProductTotal'>
						數量</label>
					<div class="col-lg-10">
						<form:input id="shoppingProductTotal" path="shoppingProductTotal" type='text'
							class='form:input-large' />
					</div>
				</div>

			<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='productImage'>
						照片上傳 </label>
					<div class="col-lg-10">
						  <form:input  path="productImage" type='file'/><br>&nbsp;
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="shoppingProductPrice">
						價格 </label>
					<div class='col-lg-10'>
 						<form:input id="shoppingProductPrice" path="shoppingProductPrice" type='text' 
					class='form:input-large' /> 
					</div>
				</div>
					<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productrelation">
						敘述 </label>
					<div class='col-lg-10'>
					<form:input id="productrelation" path="productrelation" type='text'
 					class='form:input-large' /> 
				</div> 
					</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="memberNumber">
						員工編號</label>
					<div class='col-lg-10'>
						<form:input id="memberNumber" path="memberNumber" type='text'
 							class='form:input-large' />  
					</div></div>
					<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="shoppingProductDiscount">
						商品折扣</label>
					<div class='col-lg-10'>
						<form:input id="shoppingProductDiscount" path="shoppingProductDiscount" type='text'
 							class='form:input-large' />  
					</div></div>
				 	 
					<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="shoppingItemId">
						商品編號</label>
					<div class='col-lg-10'>
						<form:input id="shoppingItemId" path="shoppingItemId" type='text'
 							class='form:input-large' />  
					</div></div>
						<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="shoppingType">
						商品種類</label>
					<div class='col-lg-10'>
						<form:input id="shoppingType" path="shoppingType" type='text'
 							class='form:input-large' />  
					</div></div>
					
					<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productrelation">
						商品敘述</label>
					<div class='col-lg-10'>
						<form:input id="productrelation" path="productrelation" type='text'
 							class='form:input-large' />  
					</div>
					</div>
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
			
			</fieldset>
		</form:form>
	</section>
</body>
</html>
