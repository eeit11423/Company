<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>第一次登入修改資料</title>
<script >
window.onload = function(){
		var btn = document.getElementById("clickmeS");
		btn.onclick = function(){
		pwd = document.getElementById("memberPassword")
		pwd.value="12345"
		Name =  document.getElementById("memberName")
		Name.value ="哲賢"
		address = document.getElementById("memberAddress")
		address.value = "新北市中和區中山路三段128號15樓"
		email = document.getElementById("memberEmail")
		email.value="eeit114no4@gmail.com"
		cell = document.getElementById("memberPhone")
		cell.value = "0928103546"
		bir = document.getElementById("memberBirthdaay")
		bir.value = "1997/04/03"
		gender = document.getElementById("women")
		gender.checked = true;
		
		
		}
	}
</script>
</head>
<body style="background-image: url(../personalcss/img/4.jpg);background-size: cover ;">
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
<!-- 	<script -->
<!-- 		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<!-- 	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
	<!------ Include the above in your HEAD tag ---------->


	<div id="fullscreen_bg" class="fullscreen_bg" />
	<div class="container">
		<div id="signupbox" style="margin-top: 50px"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">第一次登入，會員資料修改</div>
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
							<label for="firstname" class="col-md-3 control-label">帳號</label>
							<div class="col-md-9">
								<form:hidden id="memberNumber" path="memberNumber"
									class='form-control' />
								${member.memberNumber}

							</div>
						</div>


						<div class="form-group">
							<label for="memberPassword" class="col-md-3 control-label">密碼</label>
							<div class="col-md-9">
								<form:input type="password" path="memberPassword"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-3 control-label" for='memberName'>姓名
							</label>
							<div class="col-md-9">
								<form:input id="memberName" path="memberName" type='text'
									class='form-control' />
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-3 control-label" for='memberAddress'>地址
							</label>
							<div class="col-md-9">
								<form:input id="memberAddress" path="memberAddress" type='text'
									class='form-control' />
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-3 control-label" for='memberEmail'>信箱
							</label>
							<div class="col-md-9">
								<form:input id="memberEmail" path="memberEmail" type='text'
									class='form-control' />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label" for='memberPhone'>電話
							</label>
							<div class="col-md-9">
								<form:input id="memberPhone" path="memberPhone" type='text'
									class='form-control' />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label" for='memberGender'>性別
							</label>
							<div class="col-md-9">
								<form:radiobutton id="men" path="memberGender" value="男"
									 />男
								<form:radiobutton id="women" path="memberGender" value="女"
									 />女
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label" for='memberBirthdaay'>出生日期
							</label>
							<div class="col-md-9">
								<form:input id="memberBirthdaay" path="memberBirthdaay" type='text'
									class='form-control' />
							</div>
						</div>

							<div>
							<img id="productImage1" src="" >
							</div>
						<div class="form-group">
								<label class='col-md-3 control-label' for="productImage">圖片</label>
							<div class="col-md-9">
								<form:input id="productImage" path="productImage" type='file'
									class='form:input-large' />
							</div>
						</div>
					



						<div class="form-group">
							<!-- Button -->
							<div class="col-md-offset-3 col-md-9">
								<input id="btnAdd" type='submit' class='btn btn-primary' value="送出" />
							<input type='button' class='btn btn-primary'  id='clickmeS' value='一鍵Demo' >

							</div>
						</div>
					</form:form>
				</div>
			</div>

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