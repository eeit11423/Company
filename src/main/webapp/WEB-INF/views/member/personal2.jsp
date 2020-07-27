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
 		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/vendors/linericon/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/vendors/animate-css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/vendors/popup/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/personalcss2/css/responsive.css">
    </head>
     <body style="background-image: url(../personalcss/img/4.jpg);background-size: cover ;">
    <jsp:include page="/fragment/headerRearend.jsp" />
 
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
								<a href="/mvcExercisetest/update/${member.memberId}" class="btn btn-primary">
									<span class="glyphicon-info-sigh glyphicon"></span>修改
								</a>
								</h4>
								
							
							</div>
						</div>
						</c:forEach>
					</div>
           		</div>
            </div>
        </section>

  

  
     
<!--         <script src="js/jquery-3.3.1.min.js"></script> -->
<!--         <script src="js/popper.js"></script> -->
<!--         <script src="js/bootstrap.min.js"></script> -->
<!--         <script src="js/stellar.js"></script> -->
<!--         <script src="vendors/lightbox/simpleLightbox.min.js"></script> -->
<!--         <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script> -->
<!--         <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script> -->
<!--         <script src="vendors/isotope/isotope.pkgd.min.js"></script> -->
<!--         <script src="vendors/owl-carousel/owl.carousel.min.js"></script> -->
<!--         <script src="vendors/popup/jquery.magnific-popup.min.js"></script> -->
<!--         <script src="js/jquery.ajaxchimp.min.js"></script> -->
<!--         <script src="vendors/counter-up/jquery.waypoints.min.js"></script> -->
<!--         <script src="vendors/counter-up/jquery.counterup.min.js"></script> -->
<!--         <script src="js/mail-script.js"></script> -->
<!--         <script src="js/theme.js"></script> -->

    </body>
</html>