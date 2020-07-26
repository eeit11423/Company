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
<title>修改出勤紀錄</title>
<script type="text/javascript">
// 	function confirmDelete(userId) {
// 		var result = confirm("確定刪除此筆記錄(帳號:" + userId.trim() + ")?");
// 		if (result) {
// 			document.forms[0].putOrDelete.value = "DELETE";
// 			return true;
// 		}
// 		return false;
// 	}
	function confirmUpdate(userId) {
		var result = confirm("確定送出此筆記錄(帳號:" + userId.trim() + ")?");
		if (result) {
// 			document.forms[0].putOrDelete.value = "PUT";
			return true;
		}
		return false;
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
						<div class="col-md-10">
							<div class="card">
								<div class="card-header text-white" style='background: #646D73'>
									<strong><h3>修改打卡紀錄</h3></strong>
								</div>
								<div class="card-body">
									<form:form class='center' action="../punchTime/update/${punch.punchId}" modelAttribute="punch"
											method="POST">									
										<input type="hidden" name="leaveId" value="${punch.punchId}">
										<input type="hidden" name="memberName" value="${punch.memberName}">	
										<input type="hidden" name="memberDepartment" value="${punch.memberDepartment}">	
									<fieldset>
										<div class="form-group row">
											<label class="col-md-4 col-form-label text-md-right"
												for="memberName">姓名</label>
											<div class="col-md-6 col-form-label text-md-center">${punch.memberName}</div>
										</div>

										<div class="form-group row">
											<label for="memberNumber"
												class="col-md-4 col-form-label text-md-right">編號</label>
											<div class="col-md-6 col-form-label text-md-center" >${punch.memberNumber}</div>
										</div>

											<div class="form-group row">
												<label class="col-md-4 col-form-label text-md-right"
													for="memberDepartment">部門</label>
												<div class="col-md-6 col-form-label text-md-center">${punch.memberDepartment}</div>
											</div>

											<div class="form-group row">
												<label class="col-md-4 col-form-label text-md-right"
													for="punchDate">上班日期</label>
												<div class="col-md-6 col-form-label text-md-center">${punch.punchDate}</div>
											</div>
											
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-md-right"
													for="punchWorkOn">上班時間</label>
												<div class="col-md-6">
													<form:input id="punchWorkOn" path="punchWorkOn"
														type='text' class="form-control input-md text-md-center" value="${punch.punchWorkOn}"/>
													<form:errors path="punchWorkOn" cssClass="error" />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-md-4 col-form-label text-md-right"
													for="punchWorkOff">下班時間</label>
												<div class="col-md-6">
													<form:input id="punchWorkOff"
														path="punchWorkOff" type='text'
														class="form-control input-md text-md-center" value="${punch.punchWorkOff}"/>
													<form:errors path="punchWorkOff"
														cssClass="error" />
												</div>
											</div>

											<div class="form-group row">
												<div class='col-lg-offset-2 col-lg-12'>
													<input id="btnAdd" type='submit'
														class="btn btn-secondary btn-lg btn-block" value="送出" />
													<input type='button' class='btn btn-primary float-right'
														id='clickmeS' value='一鍵Demo'>
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
