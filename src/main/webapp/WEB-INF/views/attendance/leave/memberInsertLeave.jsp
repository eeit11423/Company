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
			leaveDate.value = "2020-7-30" 
			leaveStart = document.getElementById("leaveStart") 
			leaveStart.value = "2020-7-30 09:00:00.000" 
			leaveEnd = document.getElementById("leaveEnd") 
 			leaveEnd.value = "2020-7-30 12:00:00.000" 
 			Category = document.getElementById("leaveCategory") 
 			option=Category.getElementsByTagName("option")
 			option[0].selected = true 
			leaveCause = document.getElementById("leaveCause") 
 			leaveCause.value = "演講" 
		}
	}
</script>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container-fluid row">
		<div class="card col-md-2">
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
		</div>
	<div class="main-panel col-md-10" align='center'>
		<div class="contnt-wrapper" align='center'>
			<div class="row justify-content-center" >
				<div class="card col-md-12">
					<div class="card-header text-white" style='background: #646D73'>
						<strong><h2>新增請假紀錄</h2></strong>
					</div>
					<div class="card-body">
						<form:form method='POST' modelAttribute="leave" action='memberSaveInsertLeave'
									 enctype='multipart/form-data' class='form-horizontal'>
							<input type="hidden" name='memberName' value="${leave.memberName}"/>
							<input type="hidden" name='memberNumber' value="${leave.memberNumber}"/>
							<input type="hidden" name='memberDepartment' value="${leave.memberDepartment}"/>
							<input type="hidden" name='leaveAudit' value="審核中"/>

							<fieldset>
								<div class="form-group row">
									<label class="col-md-2 col-form-label text-md-right"
										style="font-size:30px" for="memberNumber">姓名：</label>
									<div class="col-md-4 col-form-label text-md-center"
									style="font-size:30px">${leave.memberName}</div>
									<div class="col-md-6"></div>
								</div>
								<div class="form-group row">
									<label for="memberName" style="font-size:30px"
										class="col-md-2 col-form-label text-md-right">編號：</label>
									<div class="col-md-4 col-form-label text-md-center" 
									style="font-size:30px">${leave.memberNumber}</div>
<!-- 								</div> -->
<!-- 								<div class="form-group row"> -->
									<label class="col-md-2 col-form-label text-md-right"
										style="font-size:30px" for="memberDepartment">部門：</label>
									<div class="col-md-4 col-form-label text-md-center"
									style="font-size:30px">${leave.memberDepartment}</div>
								</div>
								<div class="form-group row">
									<label class="col-md-2 col-form-label text-md-right"
										style="font-size:30px" for="leaveDate">請假日期：</label>
									<div class="col-md-4">
										<form:input id="leaveDate" path="leaveDate" style="font-size:30px"
												type='text'	class="form-control input-md col-form-label text-md-center" />
										<form:errors path="leaveDate" cssClass="error" />
									</div>
<!-- 								</div> -->
<!-- 								<div class="form-group row"> -->
									<label class="col-md-2 col-form-label text-md-right"
										style="font-size:30px" for="leaveCategory">假別：</label>
									<div class="col-md-4">
										<form:select id="leaveCategory" style="height:60px;font-size:30px;text-align:center;text-align-last:center"
													path="leaveCategory" class="form-control input-md col-form-label text-md-center">
											<form:option align='center' style="font-size:30px" value='事假'>事假</form:option>
											<form:option align='center' style="font-size:30px" value='病假'>病假</form:option>
											<form:option align='center' style="font-size:30px" value='公假'>公假</form:option>
											<form:option align='center' style="font-size:30px" value='婚嫁'>婚嫁</form:option>
											<form:option align='center' style="font-size:30px" value='喪假'>喪假</form:option>
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
<!-- 								</div> -->
<!-- 								<div class="form-group row"> -->
									<label class="col-md-2 col-form-label text-md-right"
												style="font-size:30px" for="leaveEnd">請假結束；</label>
									<div class="col-md-4">
										<form:input id="leaveEnd" path="leaveEnd" type='text' style="font-size:30px"
														class="form-control input-md col-form-label text-md-center" />
										<form:errors path="leaveEnd" cssClass="error" />
									</div>
								</div>
											
								
								<div class="form-group row">
									<label class="col-md-2 col-form-label text-md-right"
											style="font-size:30px" for="leaveCause">原因：</label>
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
</body>
</html>