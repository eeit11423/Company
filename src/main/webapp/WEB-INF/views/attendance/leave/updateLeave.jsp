<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<style>
</style>
<meta charset="UTF-8">
<title>修改請假紀錄</title>
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
									<strong><h2>修改打卡紀錄</h2></strong>
								</div>
								<div class="card-body">
									<form:form class='center' action="../leave/update/${leave.leaveId}"
										modelAttribute="leave" method="POST">					
										<input type="hidden" name="leaveId" value="${leave.leaveId}">
										<input type="hidden" name="memberName" value="${leave.memberName}">	
										<input type="hidden" name="memberDepartment" value="${leave.memberDepartment}">	
									<fieldset>
										<div class="form-group row">
											<label class="col-md-2 col-form-label text-md-right"
												style="font-size:30px" for="memberName">姓名：</label>
											<div class="col-md-4 col-form-label text-md-center"
											style="font-size:30px">${leave.memberName}</div>
																							<div class="col-md-6"></div>
										</div>

										<div class="form-group row">
											<label for="memberNumber" style="font-size:30px"
												class="col-md-2 col-form-label text-md-right">編號：</label>
											<div class="col-md-4 col-form-label text-md-center"
											style="font-size:30px" >${leave.memberNumber}</div>
<!-- 										</div> -->

<!-- 											<div class="form-group row"> -->
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="memberDepartment">部門</label>
												<div class="col-md-4 col-form-label text-md-center"
												style="font-size:30px">${leave.memberDepartment}</div>
											</div>

											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="leaveDate">請假日期：</label>
												<div class="col-md-4 col-form-label text-md-center">
													<form:input id="leaveDate" style="font-size:30px"
														path="leaveDate" type='text' 
														class="form-control input-md text-md-center" value="${leave.leaveDate}"/>
													<form:errors path="leaveDate" cssClass="error" />
												</div>
<!-- 											</div> -->
											
<!-- 											<div class="form-group row"> -->
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
														for="leaveCategory">假別：</label>
												<div class="col-md-4">
													<form:select id="leaveCategory"	path="leaveCategory" style="font-size:30px"
																class="form-control input-md col-form-label text-md-center">
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
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="leaveStart">請假開始：</label>
												<div class="col-md-4">
													<form:input id="leaveStart" path="leaveStart" style="font-size:30px"
														type='text' class="form-control input-md text-md-center" value="${leave.leaveStart}"/>
													<form:errors path="leaveStart" cssClass="error" />
												</div>
<!-- 											</div> -->

<!-- 											<div class="form-group row"> -->
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
													for="leaveEnd">請假結束：</label>
												<div class="col-md-4">
													<form:input id="leaveEnd"
														path="leaveEnd" type='text' style="font-size:30px"
														class="form-control input-md text-md-center" value="${leave.leaveEnd}"/>
													<form:errors path="leaveEnd"
														cssClass="error" />
												</div>
											</div>

											
											<div class="form-group row">
												<label class="col-md-2 col-form-label text-md-right" style="font-size:30px"
																for="leaveCause">原因：</label>
												<div class="col-md-4">
													<form:input id="leaveCause"	path="leaveCause" style="font-size:30px"
																 type='text' class="form-control input-md col-form-label text-md-center" />
													<form:errors path="leaveCause" cssClass="error" />
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
</body>

</html>
