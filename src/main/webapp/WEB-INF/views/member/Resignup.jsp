<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<title>Members</title>
<!-- <link rel='stylesheet' -->
<%-- 	href='${pageContext.request.contextPath}/css/styles.css' --%>
<!-- 	type="text/css" /> -->
</head>
<body>
<jsp:include page="/fragment/headerRearend.jsp" />

<div class="main-panel"> 
       <div class="content-wrapper">
 
	<section>
	<div class="row">
            <div class="col-md-10 grid-margin stretch-card" >
              <div class="card" style="background-color:#FFFFF4">
                <div class="card-body" style="background-color:#FFFFF4">
                  <p class="card-title mb-0"></p>
                  <div class="table-responsive" style="background-color:#FFFFF4">
		<div>
			<div class="container" style="text-align: center; background-color:#FFFFF4">
				<h1>離職清單</h1>
				<br>
			</div>
			<div align='center'>
<!-- 				請挑選部門: <select class='btn btn-outline-warning dropdown-toggle  btn-sm' id='Publish_test' onchange="memberChange()"> -->
<%-- 					<c:forEach var="member" items="${memberList}"> --%>
<%-- 						<option value="${member}">${member}</option> --%>
<%-- 					</c:forEach> --%>
<!-- 				</select> -->
				<hr>
<!-- 				<a href="downloadExcel" class="btn btn-success">下載Excel</a> -->
<!-- 				<a href="Resignup" class="btn btn-primary ">離職員工</a> -->
				<a class="btn btn-primary" href="<c:url value='/members' />">查詢會員資料</a>
			</div>

			<div id='showsmember' align='center'>
				<h1></h1>
			</div>

		</div>
		</div></div></div></div></div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">
		<div class="main-panel" style="background-color:#FFFFF4"> 
       <div class="content-wrapper" style="background-color:#FFFFF4">
<!-- 			<section class="container"> -->
		<div class="row" id='testshow' style="background-color:#FFFFF4">
		
			<c:forEach var='member1' items='${resign}'>
			<div class="col-md-4 grid-margin stretch-card" >
        	<div class="card" style="background-color:	#FFECEC">
			<div class="card-body" >
				<div class="col-sm-6 col-md-3" >
					<div class="thumbnail" style="width: 320px;" >
						<img height='200' width='150'
							src="<c:url value='/getPicture1/${member1.memberId}' />" />
						<div class="caption" ><p />
							<p>
								<b style='font-size: 16px;'>${member1.memberName}</b>
							</p>
							<p>會員帳號: ${member1.memberNumber}</p>
							<p>會員信箱: ${member1.memberEmail}</p>
							<p>會員性別: ${member1.memberGender}</p>
							<p>會員部門: ${member1.memberDepartment}</p>
							<p>
								<a class="btn btn-outline-danger" href="delect1/${member1.memberId}" >
									<span class="glyphicon-info-sigh glyphicon"></span>復職
								</a> 
<%-- 								<a href="update/${member1.memberId}" class="btn btn-primary"> --%>
<!-- 									<span class="glyphicon-info-sigh glyphicon"></span>修改 -->
<!-- 								</a> -->
								<a href="personal/${member1.memberId}" class="btn btn-outline-primary">
									<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
								</a>
								
							</p>

						</div>
					</div>
				</div></div></div></div>
		
			</c:forEach>
			</div>
		
		<div align='center'>
		
				<a href="<c:url value='/' />">回首頁</a>
				
		</div>
			</div></div></div></div>


</body>
</html>
