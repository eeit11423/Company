<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <title>MeetMe Personal</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!--  		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/vendors/linericon/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/vendors/animate-css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/vendors/popup/magnific-popup.css">
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss/css/responsive.css">
    </head>
    <body style="background-image: url(../personalcss/img/4.jpg);background-size: cover ; ">
    <jsp:include page="/fragment/header.jsp" />
    
        <section class="profile_area">
           	<div class="container" >
           		<div class="profile_inner p_120">
					<div class="row">
					<c:forEach var='member' items='${onemember}'>
						<div class="col-lg-5" style="padding-left:80px">
							<img class="img-thumbnail" src="<c:url value='/getPicture/${member.memberId}' />" alt="Cinque Terre" width="400" height="400"/>
						</div>
						<div class="col-lg-7">
							<div class="personal_text">
								<h5 style="color:#01B468;font-weight:bold;">員工資料</h5>
								<p style="margin-bottom:0px;color:#01B468">員工帳號: ${member.memberNumber} </p>
								<p style="margin-bottom:0px;color:#01B468">員工薪資: ${member.memberSalary}</p>
								<p style="margin-bottom:0px;color:#01B468">員工績效: ${member.memberPerformance} </p>
								<p style="margin-bottom:0px;color:#01B468">員工部門: ${member.memberDepartment} </p>
								<p style="margin-bottom:0px;color:#01B468">員工到職日期: ${member.memberRegisterDate} </p>
								<p style="margin-bottom:0px;color:#01B468">&nbsp;</p>
								<h5 style="color:#2894FF;font-weight:bold;">個人資料</h5>
								<p style="margin-bottom:0px;color:#2894FF">${member.memberName}</p>
								<p style="margin-bottom:0px;color:#2894FF">性別:${member.memberGender}</p>
								<p style="margin-bottom:0px;color:#2894FF">生日:${member.memberBirthdaay}</p>
								<p style="margin-bottom:0px;color:#2894FF">電話:${member.memberPhone}</p>
								<p style="margin-bottom:0px;color:#2894FF">信箱:${member.memberEmail}</p>
								<p style="margin-bottom:0px;color:#2894FF">地址:${member.memberAddress}</p>
								<p style="margin-bottom:0px;color:#FFDC35">&nbsp;</p>
								<h4>
<%-- 								<a href="personalUpdate/${member.memberId}" class="btn btn-outline-warning"> --%>
<!-- 									<span class="glyphicon-info-sigh glyphicon"></span>編輯基本資料 </a> -->
									 <button type="button" class="btn btn-outline-warning" data-toggle="modal" data-target="#myModal">
										   編輯個人資料
									 </button>
<%-- 									<a href="updatepasswd/${member.memberId}" style="color:#FFDC35">&nbsp;&nbsp;&nbsp;&nbsp;更改密碼?</a> --%>
									<a href="/mvcExercisetest/updatepasswd/${member.memberId}" class="btn btn-outline-warning">
									<span class="glyphicon-info-sigh glyphicon"></span>更改密碼
								</a>
								</h4>
								<h4></h4>
								
							
							</div>
						</div>
						</c:forEach>
					</div>
           		</div>
            </div>
        </section>
        <div align='center'>
		<a href="<c:url value='/'  />"class="btn btn-primary">回首頁</a>
		<div class="container">

  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header"style="background-color:#E8FFC4;">
          <h4 class="modal-title">會員資料修改</h4>
        </div>
        
<!--         Modal body -->
        <c:forEach var='member' items='${onemember}'>
        <div class="modal-body" style="background-color:#E8FFC4;">
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
							<div class="col-md-1">
								<form:hidden id="memberNumber" path="memberNumber" 
 									class='form-control' /> 
 								${member.memberNumber} 

							</div>
						</div>

<!-- 						<div class="form-group"> -->
<!-- 							<label for="memberPassword" class="col-md-3 control-label">密碼</label> -->
<!-- 							<div class="col-md-9"> -->
<%-- 								<form:input type="password" path="memberPassword" --%>
<%--  									class="form-control" />  --%>
<!-- 							</div> -->
<!-- 						</div> -->

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
								<form:input id="memberBirthdaay" path="memberBirthdaay" type='date'
									class='form-control' />
							</div>
						</div>
						<div class="form-group">
							<label class='col-md-3 control-label' for="productImage">圖片
							</label>

							<div class='col-md-9'>
								<form:input id="productImage" path="productImage" type='file'
 									class='form:input-large' /> 
							</div>
							<div><img id="productImage1" src="" ">
							</div>
							
						</div>

						<div class="form-group">
							<div class="col-md-offset-3 col-md-9">
								<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />

							</div>
						</div>

					</form:form>
        </div>
        </c:forEach>
        <div class="modal-footer" style="background-color:#E8FFC4;">
          <button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
	</div>
  
     
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
        <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="vendors/isotope/isotope.pkgd.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/popup/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendors/counter-up/jquery.counterup.min.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="js/theme.js"></script>
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