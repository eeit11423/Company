<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Font Icon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/signup/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/signup/css/style.css">

<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 25pt;
}
</style>
<script >
window.onload = function(){
		var btn = document.getElementById("clickmeS");
		btn.onclick = function(){
		Name =  document.getElementById("name")
		Name.value ="1001"
		address = document.getElementById("your_pass")
		address.value = "1234"
		email = document.getElementById("your_pass2")
		email.value="38000"
		
		
		
		}
	}
</script >
</head>
<body>
<jsp:include page="/fragment/headerRearend.jsp" />

	<div class="" style="background: url(../signup/images/3.jpg);width:1500px">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image" style="padding-top: 100px">

						<figure>
							<img
								src="${pageContext.request.contextPath}/signup/images/signin-image.jpg"
								alt="sing up image">
						</figure>
					</div>

					<div class="signin-form">
						<h2 class="form-title">註冊</h2>
						<form:form method="POST" class="register-form" id="login-form"
							modelAttribute='memberbean' enctype="multipart/form-data">
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label>
								<form:input path="memberNumber" type="text" name="your_name"
									id="name" placeholder="員工編號" />
							</div>

							<div class="form-group">
								<form:errors path="memberNumber" cssClass="error" />
							</div>

							<div class="form-group">
								<label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
								<form:input path="memberPassword" type="password"
									name="your_pass" id="your_pass" placeholder="密碼" />
							</div>
							<div class="form-group">
								<form:errors path="memberPassword" cssClass="error" />
							</div>


							<div class="form-group">
								<label for="your_pass"><i
									class="zmdi zmdi-money zmdi-hc-lg"></i></label>
								<form:input path="memberSalary" type="text" name="your_pass"
									id="your_pass2" placeholder="薪資" />

							</div>

							<div class="form-group">
								<form:errors path="memberSalary" cssClass="error" />
							</div>

							<div class="form-group">
								<label for="your_pass"><i
									class="zmdi zmdi zmdi-gif zmdi-hc-3x"></i></label>
								<form:input id="productImage" path="productImage" type='file'
									class='form:input-large' />
							</div>
							<div><img id="productImage1" src="" >
							</div>

							<div class="form-group">
								<span>部門:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<form:select path="memberDepartment" class=''>
									<form:options items="${memberList}" class='' />
								</form:select>
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="註冊" />
								<a href="test" class="btn btn-outline-success" class="btn btn-primary"
									data-toggle="modal" data-target="#myModal" > 
									<span class="glyphicon-info-sigh glyphicon"></span>上傳Excel
									</a>
								<input type='button' class='form-submit'  id='clickmeS' value='一鍵Demo' >
							</div>
						</form:form>
						<div class="container">
						
							<div class="modal fade" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header" style="background-color:#FFFCEC;">
											<h4 class="modal-title">上傳excel</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<div class="modal-body" style="background-color:#FFFCEC;">
											<form method="post" action="test"
												enctype="multipart/form-data">
												<input type="file" name="uploadFile" /> <br /> 
												<input type="submit" value="上傳" class="btn btn-outline-success"/>
											</form>
											
										</div>

										<!-- Modal footer -->
										<div class="modal-footer" style="background-color:#FFFCEC;">
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">關閉</button>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
		</section>

	</div>
<script>
	$("#productImage").change(function(){
  readURL(this);
});
function readURL(input){
	  if(input.files && input.files[0]){
	    var reader = new FileReader();
	    reader.onload = function (e) {
	       $("#productImage1").attr('src', e.target.result);
	       $("#productImage1").attr('width', "200px");
	       $("#productImage1").attr('heigth', "200px");
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
}
</script>
</body>
</html>