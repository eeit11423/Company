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
<title>新增請假紀錄</title>
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
			leaveDate = document.getElementById("leaveDate") 
			leaveDate.value = "2020-1-1" 
			leaveStart = document.getElementById("leaveStart") 
			leaveStart.value = "2020-1-1 11:00:00.000" 
			leaveEnd = document.getElementById("leaveEnd") 
 			leaveEnd.value = "2020-1-1 18:00:00.000" 
 			Category = document.getElementById("leaveCategory") 
 			option=Category.getElementsByTagName("option")
 			option[0].selected = true 
			leaveCause = document.getElementById("leaveCause") 
 			leaveCause.value = "應酬" 
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
									<strong><h2>新增請假紀錄</h2></strong>
								</div>
								<div class="card-body">

									<!--       三個地方要完全一樣 -->
									<form:form method='POST' modelAttribute="leave" action='saveInsertLeave'
									  class='form-horizontal'>
										<input type="hidden" name="leaveAudit" value="通過" />
										<fieldset>
											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right"
													style="font-size:30px" for="memberNumber">姓名：</label>
												<div class="col-md-4">
													<form:input id="memberNumber" path="memberNumber"
														type='text' style="font-size:30px"
														class="form-control input-md col-form-label text-md-center" />
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
												<label class="col-md-2 col-form-label text-md-right"
													style="font-size:30px" for="memberDepartment">部門：</label>
												<div class="col-md-4">
													<form:input id="memberDepartment" style="font-size:30px"
														path="memberDepartment" type='text'
														class="form-control input-md col-form-label text-md-center" />
													<form:errors path="memberDepartment" cssClass="error" />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="leaveDate">請假日期：</label>
												<div class="col-md-4">
													<form:input id="leaveDate"
														path="leaveDate" type='text' style="font-size:30px"
														class="form-control input-md col-form-label text-md-center" />
													<form:errors path="leaveDate" cssClass="error" />
												</div>
<!-- 											</div> -->
											
<!-- 											<div class="form-group row"> -->
												<label class="col-md-2 col-form-label text-md-right"
													style="font-size:30px" for="leaveCategory">假別：</label>
												<div class="col-md-4">
													<form:select id="leaveCategory" style="height:60px;font-size:30px;text-align:center;text-align-last:center"
													path="leaveCategory" class="form-control input-md col-form-label text-md-center">
														<form:option style="font-size:30px" value='事假'>事假</form:option>
														<form:option style="font-size:30px" value='病假'>病假</form:option>
														<form:option style="font-size:30px" value='公假'>公假</form:option>
														<form:option style="font-size:30px" value='婚嫁'>婚嫁</form:option>
														<form:option style="font-size:30px" value='喪假'>喪假</form:option>
													</form:select>
													<form:errors path="leaveCategory" cssClass="error" />
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right" 
													style="font-size:30px" for="leaveStart">請假開始：</label>
												<div class="col-md-4">
													<form:input id="leaveStart" path="leaveStart" style="font-size:30px"
														type='text' class="form-control input-md col-form-label text-md-center" />
													<form:errors path="leaveStart" cssClass="error" />
												</div>
<!-- 											</div> -->

<!-- 											<div class="form-group row"> -->
												<label class="col-md-2 col-form-label text-md-right"
													style="font-size:30px" for="leaveEnd">請假結束：</label>
												<div class="col-md-4">
													<form:input id="leaveEnd"
														path="leaveEnd" type='text' style="font-size:30px"
														class="form-control input-md col-form-label text-md-center" />
													<form:errors path="leaveEnd"
														cssClass="error" />
												</div>
											</div>
					
											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right"
													style="font-size:30px" for="leaveCause">原因：</label>
												<div class="col-md-4">
													<form:input id="leaveCause"
														path="leaveCause" type='text' style="font-size:30px"
														class="form-control input-md col-form-label text-md-center" />
													<form:errors path="leaveCause"
														cssClass="error" />
												</div>
												<div class="col-md-6"></div>
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
<!-- 	<div class="container" align='center'> -->
<!-- 		<div align='center' style="text-align: center;background-color:#dee2e6"> -->
<!-- 		<h1>新增請假紀錄</h1><hr> -->
<!-- 		<a href='queryLeave'>回前頁</a> -->
<!-- 		</div> -->
<!-- 		<hr> -->
<%-- 		<form:form action="saveInsertLeave" modelAttribute="leave" method='POST'> --%>
<!-- 		<table border='1' border-collaspe='collaspe'> -->

<!-- 			<tr style='height: 40px'>	 -->
<!-- 				<td align='center'>姓名:</td> -->
<%-- 				<td><form:input path='memberName' /> --%>
<%-- 				<font color='red' size='-2'><form:errors path="memberName" /></font> --%>
<!-- 				</td> -->
<!-- 			</tr>	 -->
<!-- 			<tr style='height: 40px'>	 -->
<!-- 				<td align='center'>編號:</td> -->
<%-- 				<td><form:input path='memberNumber' /> --%>
<%-- 				<font color='red' size='-2'><form:errors path="memberNumber" /></font> --%>
<!-- 			</tr> -->
<!-- 			<tr style='height: 40px'>	 -->
<!-- 				<td align='center'>部門:</td> -->
<%-- 				<td><form:input path='memberDepartment' /> --%>
<%-- 				<font color='red' size='-2'><form:errors path="memberDepartment" /></font> --%>
<!-- 			</tr> -->
<!-- 			<tr style='height: 40px'>	 -->
<!-- 				<td align='center'>日期:</td> -->
<%-- 				<td><form:input type='date' path='leaveDate' /></td> --%>
<!-- 			</tr> -->
<!-- 			<tr style='height: 40px'>	 -->
<!-- 				<td align='center'>開始時間:</td> -->
<%-- 				<td><form:input path='leaveStart' /></td> --%>
<!-- 			</tr> -->
<!-- 			<tr style='height: 40px'>	 -->
<!-- 				<td align='center'>結束時間:</td> -->
<%-- 				<td><form:input path='leaveEnd' /></td> --%>
<!-- 			</tr> -->
<!-- 			<tr style='height: 40px'> -->
<!-- 				<td align='center'>假別</td> -->
<%-- 				<td><form:select path='leaveCategory'> --%>
<%-- 					<form:option value='事假'>事假</form:option> --%>
<%-- 					<form:option value='病假'>病假</form:option> --%>
<%-- 					<form:option value='公假'>公假</form:option> --%>
<%-- 					<form:option value='婚嫁'>婚嫁</form:option> --%>
<%-- 					<form:option value='喪假'>喪假</form:option> --%>
<%-- 				</form:select> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr style='height: 40px'>	 -->
<!-- 				<td align='center'>原因:</td> -->
<%-- 				<td><form:input path='leaveCause' /></td> --%>
<!-- 			</tr> -->
<!-- 			<tr style='height: 40px'>	 -->
<!-- 				<td colspan='3' align='center'> -->
<!-- 							<input type='submit' class="btn btn-info" value='提交'> -->
<!-- 							<input type='reset' class="btn btn-outline-secondary "value='還原'> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			</table> -->
<%-- 		</form:form> --%>
<!-- 	</div> -->
</body>
</html>