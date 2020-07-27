<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改資料</title>
</head>
<body style="background-image: url(../personalcss/img/bg_1.jpg);background-size: cover ; ">
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->


	<div id="fullscreen_bg" class="fullscreen_bg" />
	<div class="container">
		<div id="signupbox" style="margin-top: 50px"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">會員資料修改</div>
					<div
						style="float: right; font-size: 85%; position: relative; top: -10px">
						<a id="signinlink" href="#""></a>
					</div>
				</div>
				<div class="panel-body">
					<form:form id="signupform" class="form-horizontal" role="form"
						method='POST' modelAttribute='member'
						enctype="multipart/form-data">

						<div id="signupalert" style="display: none"
							class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-md-3 control-label">員工編號</label>
							<div class="col-md-9">
								<form:hidden id="memberNumber" path="memberNumber"
									class='form-control' />
								${member.memberNumber}

							</div>
						</div>


						<div class="form-group">
							<label class="col-md-3 control-label" for='memberName'>員工姓名
							</label>
							<div class="col-md-9">
								<form:hidden id="memberName" path="memberName" 
									class='form-control' />
									${member.memberName}
							</div>
						</div>

		
						<div class="form-group">
							<label class="col-md-3 control-label" for='memberSalary'>員工薪資
							</label>
							<div class="col-md-9">
								<form:input id="memberEmail" path="memberSalary" type='text'
									class='form-control' />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label" for='memberPerformance'>員工績效
							</label>
							<div class="col-md-9">
								<form:input id="memberPerformance" path="memberPerformance" type='text'
									class='form-control' />
							</div>
						</div>
						
						
						
						<div class="form-group">
						<label class="col-md-3 control-label" for='memberSalary'>員工部門</label>
								<div class="col-md-9">
                            	<form:select path="memberDepartment" class='form:input-large'>
									<form:options items="${memberList}" class='form:input-large'/>
								</form:select>
								</div>
                        </div>
						
						<div class="form-group">
							<label class='col-md-3 control-label' for="productImage">員工圖片
							</label>

							<div class='col-md-9'>
								<form:input id="productImage" path="productImage" type='file'
									class='form:input-large' /> 
							</div>
							<div><img id="productImage1" src="" ">
							</div>
						</div>



						<div class="form-group">
							<!-- Button -->
							<div class="col-md-offset-3 col-md-9">
								<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />

							</div>
						</div>




					</form:form>
				</div>
			</div>]查詢所有 -- 更改




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