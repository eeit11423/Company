<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
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
<title>新增打卡紀錄</title>
<script>
	window.onload = function() {
		var btn = document.getElementById("clickmeS");
		btn.onclick = function() {
			memberName = document.getElementById("memberName")
			memberName.value = "尼克"
			memberNumber = document.getElementById("memberNumber");
			memberNumber.value = "1001"
			memberDepartment = document.getElementById("memberDepartment")
			memberDepartment.value = "董事長"
			punchDate = document.getElementById("punchDate") 
			punchDate.value = "2020-8-1" 
			punchWorkOn = document.getElementById("punchWorkOn") 
			punchWorkOn.value = "2020-8-1 10:00:00.000" 
			punchWorkOff = document.getElementById("punchWorkOff") 
 			punchWorkOff.value = "2020-8-1 18:00:00.000" 
		}
	}
</script>
</head>
<body>
	<jsp:include page="/fragment/headerRearend.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">
			<!-- 			<div class="row"> -->
			<main class="my-form">
				<div class="cotainer">
					<div class="row justify-content-center">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header text-white" style='background: #646D73'>
									<strong><h2>新增打卡紀錄</h2></strong>
								</div>
								<div class="card-body">

									<!--       三個地方要完全一樣 -->
									<form:form method='POST' modelAttribute="punch" action='saveInsertPunchTime'
										enctype='application/x-www-form-urlencoded' class='form-horizontal'>
										<fieldset>
											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="memberNumber">姓名：</label>
												<div class="col-md-4">
													<form:input id="memberNumber" path="memberNumber"
														type='text' style="font-size:30px"
														class="form-control col-form-label text-md-center" />
													<form:errors path="memberNumber" cssClass="error" />
												</div>
												<div class="col-md-6"></div>
											</div>

											<div class="form-group row">
												<label for="memberName" style="font-size:30px"
													class="col-md-2 col-form-label text-md-right">編號：</label>
												<div class="col-md-4">
													<form:input type="text" id="memberName" style="font-size:30px"
														path="memberName" class="form-control input-md col-form-label text-md-center" />
													<form:errors path="memberName" cssClass="error" />
												</div>
<!-- 											</div> -->

<!-- 											<div class="form-group row"> -->
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="memberDepartment">部門：</label>
												<div class="col-md-4">
													<form:input id="memberDepartment" style="font-size:30px"
														path="memberDepartment" type='text'
														class="form-control input-md col-form-label text-md-center" />
													<form:errors path="memberDepartment" cssClass="error" />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="punchDate">上班日期：</label>
												<div class="col-md-4">
													<form:input id="punchDate" style="font-size:30px"
														path="punchDate" type='text'
														class="form-control input-md col-form-label text-md-center" />
													<form:errors path="punchDate" cssClass="error" />
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="punchWorkOn">上班時間：</label>
												<div class="col-md-4">
													<form:input id="punchWorkOn" path="punchWorkOn" style="font-size:30px"
														type='text' class="form-control input-md col-form-label text-md-center" />
													<form:errors path="punchWorkOn" cssClass="error" />
												</div>
<!-- 											</div> -->

<!-- 											<div class="form-group row"> -->
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="punchWorkOff">下班時間：</label>
												<div class="col-md-4">
													<form:input id="punchWorkOff" style="font-size:30px"
														path="punchWorkOff" type='text'
														class="form-control input-md col-form-label text-md-center" />
													<form:errors path="punchWorkOff"
														cssClass="error" />
												</div>
											</div>

											<div class="form-group row">
												<div class='col-lg-offset-2 col-lg-12'>
													<input id="btnAdd" type='submit' style="font-size:30px"
														class="btn btn-secondary btn-lg btn-block" value="送出" />
													<input type='button' class='btn btn-primary float-right'
														style="font-size:30px" id='clickmeS' value='一鍵Demo'>
												</div>
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
	<%-- 	<jsp:include page="/fragment/header.jsp" /> --%>
	<!-- 	<div class="container" align='center' > -->
	<!-- 		<div align='center' style="text-align: center;background-color:#dee2e6"> -->
	<!-- 			<h1>新增打卡紀錄</h1> -->
	<!-- 			<hr> -->
	<!-- 			<a href='queryPunchTime'>回前頁</a> -->
	<!-- 		</div> -->

	<%-- 		<form:form modelAttribute="punch" action='saveInsertPunchTime' --%>
	<%-- 			enctype='application/x-www-form-urlencoded' method='POST'> --%>
	<!-- 			<table border='1'> -->
	<!-- 				<tr style='height: 40px'> -->
	<!-- 					<td align='center'>姓名:</td> -->
	<%-- 					<td><form:input path='memberName'/> --%>
	<%-- 					 <form:errors path='memberName' cssClass="error"/>				 --%>
	<!-- 				</tr> -->
	<!-- 				<tr style='height: 40px'> -->
	<!-- 					<td align='center'>編號:</td> -->
	<%-- 					<td><form:input path='memberNumber' /> --%>
	<%-- 					<form:errors path='memberNumber' cssClass="error"/></td> --%>
	<!-- 				</tr> -->
	<!-- 				<tr style='height: 40px'> -->
	<!-- 					<td align='center'>部門:</td> -->
	<%-- 					<td><form:input path='memberDepartment' /> --%>
	<%-- 					<form:errors path='memberDepartment' cssClass="error"/></td> --%>
	<!-- 				</tr> -->
	<!-- 				<tr style='height: 40px'> -->
	<!-- 					<td align='center'>日期:</td> -->
	<%-- 					<td><form:input type='date' path='punchDate' /> --%>
	<%-- 					<form:errors path='punchDate' cssClass="error"/></td> --%>
	<!-- 				</tr> -->
	<!-- 				<tr style='height: 40px'> -->
	<!-- 					<td align='center'>上班時間:</td> -->
	<%-- 					<td><form:input path='punchWorkOn' /> --%>
	<%-- 					<form:errors path='punchWorkOn' cssClass="error"/></td> --%>
	<!-- 				</tr> -->
	<!-- 				<tr style='height: 40px'> -->
	<!-- 					<td align='center'>下班時間:</td> -->
	<%-- 					<td><form:input path='punchWorkOff' /> --%>
	<%-- 					<form:errors path='punchWorkOff' cssClass="error"/></td> --%>
	<!-- 				</tr> -->
	<!-- 				<tr style='height: 40px'> -->
	<!-- 					<td colspan='3' align='center'> -->
	<!-- 						<input type='submit' class="btn btn-info" value='提交'> -->
	<!-- 						<input type='reset' class="btn btn-outline-secondary"  value='還原'></td> -->
	<!-- 					</td> -->
	<!-- 				</tr> -->
	<!-- 			</table> -->
	<%-- 		</form:form> --%>
	<!-- 	</div> -->


</body>
</html>