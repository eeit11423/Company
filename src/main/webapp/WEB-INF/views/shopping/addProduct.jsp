<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<script>
body{ margin: 0; font-size: .9rem; font-weight: 400; line-height: 1.6;
color: #212529; text-align: left; background-color: #f5f8fa; }

.navbar-laravel { box-shadow: 0 2px 4px rgba(0,0,0,.04); } .navbar-brand
, .nav-link, .my-form, .login-form { font-family: Raleway, sans-serif; }

.my-form { padding-top: 1.5rem; padding-bottom: 1.5rem; } .my-form .row
{ margin-left: 0; margin-right: 0; } .login-form { padding-top: 1.5rem;
padding-bottom: 1.5rem; } .login-form .row { margin-left: 0;
margin-right: 0; }

</script>



<title>Products</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />

	<main class="my-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header text-white" style='background: #646D73'>
							<strong><h3>商品新增</h3></strong>
						</div>
						<div class="card-body">

							<!--       三個地方要完全一樣 -->
							<form:form method='POST' modelAttribute="shoppingBean"
								enctype='multipart/form-data' class='form-horizontal'>
								<fieldset>
								   	<div class="form-group row">
										<label class="col-md-4 col-form-label text-md-right"
											for="memberNumber" > 上傳員工編號</label>
										<div class="col-md-6">
											<form:input id="memberNumber" path="memberNumber" type='text'
												value='${memberBean.memberNumber}' class="form-control input-md" />
										</div>
									</div>
								
									<div class="form-group row">
										<label for="shoppingname"
											class="col-md-4 col-form-label text-md-right">產品名稱</label>
										<div class="col-md-6">
											<form:input type="text" id="shoppingname" path="shoppingname"
												class="form-control input-md" />
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-4 col-form-label text-md-right"
											for='shoppingProductTotal'> 數量</label>
										<div class="col-md-6">
											<form:input id="shoppingProductTotal"
												path="shoppingProductTotal" type='text'
												class="form-control input-md" />
										</div>
									</div>



									<div class="form-group row">
										<label class="col-md-4 col-form-label text-md-right"
											for="shoppingProductPrice"> 價格 </label>
										<div class="col-md-6">
											<form:input id="shoppingProductPrice"
												path="shoppingProductPrice" type='text'
												class="form-control input-md" />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-md-4 col-form-label text-md-right"
											for="productrelation"> 敘述 </label>
										<div class="col-md-6">
											<form:input id="productrelation" path="productrelation"
												type='text' class="form-control input-md" />
										</div>
									</div>
								
									<div class="form-group row">
										<label class="col-md-4 col-form-label text-md-right"
											for="shoppingProductDiscount"> 商品折扣</label>
										<div class="col-md-6">
											<form:input id="shoppingProductDiscount"
												path="shoppingProductDiscount" type='text'
												class="form-control input-md" />
										</div>
									</div>

								
									<div class="form-group row">
										<label class="col-md-4 col-form-label text-md-right"
											for="shoppingType"> 商品種類</label>
										<div class="col-md-6">
											<form:input id="shoppingType" path="shoppingType" type='text'
												class="form-control input-md" />
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-4 col-form-label text-md-right"
											for="productrelation"> 商品敘述</label>
										<div class="col-md-6">
											<form:input id="productrelation" path="productrelation"
												type='text' class="form-control input-md" />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-md-4 col-form-label text-md-right"
											for='productImage'> 照片上傳 </label>
										<div class="col-md-6">
											<form:input path="productImage" type='file' />
											
										</div>
						
<br>&nbsp;
									<div class='col-lg-offset-2 col-lg-12'>
										<input id="btnAdd" type='submit'
											class="btn btn-secondary btn-lg btn-block" value="送出" />
									</div>

								</fieldset>
							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>

	</main>

</body>
</html>
