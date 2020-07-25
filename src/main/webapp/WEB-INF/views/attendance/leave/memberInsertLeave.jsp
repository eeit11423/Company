<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>新增請假紀錄</title>
<link href="${pageContext.request.contextPath}/css/attendance-form.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/dist/css/vendor.bundle.base.css" rel="stylesheet"  media="all" />
<link href="${pageContext.request.contextPath}/dist/css/style.css" rel="stylesheet"  media="all" />
<link href="${pageContext.request.contextPath}/dist/css/themify-icons.css" rel="stylesheet"  media="all" />
<link rel="shortcut icon" href="/dist/images/favicon.png" />

<script>
	window.onload = function() {
		var btn = document.getElementById("clickmeS");
		btn.onclick = function() {
			leaveDate = document.getElementById("leaveDate") 
			leaveDate.value = "2020-1-1" 
			leaveStart = document.getElementById("leaveStart") 
			leaveStart.value = "2020-1-1 09:00:00.000" 
			leaveEnd = document.getElementById("leaveEnd") 
 			leaveEnd.value = "2020-1-1 18:00:00.000" 
 			Category = document.getElementById("leaveCategory") 
 			option=Category.getElementsByTagName("option")
 			option[0].selected = true 
			leaveCause = document.getElementById("leaveCause") 
 			leaveCause.value = "跨年" 
		}
	}
</script>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
<div class="container-fluid page-body-wrapper">
    	<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<ul class="nav">

				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#punch" aria-expanded="false" aria-controls="punch">
						<i class="ti-user menu-icon"></i> <span class="menu-title">打卡系統</span>
						<i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="punch">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/attendance/punch/memberPunch">
									出勤打卡 </a></li>
						</ul>
					</div></li>
					
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#leave" aria-expanded="false" aria-controls="leave">
						<i class="ti-user menu-icon"></i> <span class="menu-title">請假系統</span>
						<i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="leave">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/attendance/leave/memberInsertLeave">
									新增請假紀錄 </a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/attendance/leave/memberLeave">
									請假記錄查詢</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</nav>
	<div class="main-panel" >
		<div class="contnt-wrapper">
			<div class="row">
				<div class="card">
					<div class="card-header text-white" style='background: #646D73'>
						<strong><h3>新增請假紀錄</h3></strong>
					</div>
					<div class="card-body">
						<form:form method='POST' modelAttribute="leave" action='saveInsertLeave'
									 enctype='multipart/form-data' class='form-horizontal'>
							<input type="hidden" name='memberName' value="${leave.memberName}"/>
							<input type="hidden" name='memberNumber' value="${leave.memberNumber}"/>
							<input type="hidden" name='memberDepartment' value="${leave.memberDepartment}"/>
							<input type="hidden" name='leaveAudit' value="審核中"/>

							<fieldset>
								<div class="form-group row">
									<label class="col-md-4 col-form-label text-md-right"
										for="memberNumber">姓名</label>
									<div class="col-md-6">${leave.memberName}</div>
								</div>
								<div class="form-group row">
									<label for="memberName"
										class="col-md-4 col-form-label text-md-right">編號</label>
									<div class="col-md-6">${leave.memberNumber}</div>
								</div>
								<div class="form-group row">
									<label class="col-md-4 col-form-label text-md-right"
										for="memberDepartment">部門</label>
									<div class="col-md-6">${leave.memberDepartment}</div>
								</div>
								<div class="form-group row">
									<label class="col-md-4 col-form-label text-md-right"
											for="leaveDate">請假日期</label>
									<div class="col-md-6">
										<form:input id="leaveDate" path="leaveDate" 
												type='text'	class="form-control input-md" />
										<form:errors path="leaveDate" cssClass="error" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-4 col-form-label text-md-right"
													for="leaveStart">請假開始</label>
									<div class="col-md-6">
										<form:input id="leaveStart" path="leaveStart"
														type='text' class="form-control input-md" />
										<form:errors path="leaveStart" cssClass="error" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-4 col-form-label text-md-right"
													for="leaveEnd">請假結束</label>
									<div class="col-md-6">
										<form:input id="leaveEnd" path="leaveEnd" type='text'
														class="form-control input-md" />
										<form:errors path="leaveEnd" cssClass="error" />
									</div>
								</div>
											
								<div class="form-group row">
									<label class="col-md-4 col-form-label text-md-right"
											for="leaveCategory">假別</label>
									<div class="col-md-6">
										<form:select id="leaveCategory"	path="leaveCategory"
													class="form-control input-md">
											<form:option value='事假'>事假</form:option>
											<form:option value='病假'>病假</form:option>
											<form:option value='公假'>公假</form:option>
											<form:option value='婚嫁'>婚嫁</form:option>
											<form:option value='喪假'>喪假</form:option>
										</form:select>
										<form:errors path="leaveCategory" cssClass="error" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-4 col-form-label text-md-right"
													for="leaveCause">原因</label>
									<div class="col-md-6">
										<form:input id="leaveCause"	path="leaveCause"
													 type='text' class="form-control input-md" />
										<form:errors path="leaveCause" cssClass="error" />
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
</body>
</html>