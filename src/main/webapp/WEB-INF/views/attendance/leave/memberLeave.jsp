<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>請假系統</title>
<link href="${pageContext.request.contextPath}/css/attendance-form.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/dist/css/vendor.bundle.base.css" rel="stylesheet"  media="all" />
<link href="${pageContext.request.contextPath}/dist/css/style.css" rel="stylesheet"  media="all" />
<link href="${pageContext.request.contextPath}/dist/css/themify-icons.css" rel="stylesheet"  media="all" />
<link rel="shortcut icon" href="/dist/images/favicon.png" />

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
					</div></li>
			</ul>
		</nav>
	<div class="main-panel" >
		<div class="contnt-wrapper">
			<div class="row">
				<div class="card">
					<div class="card-header text-white" style='background: #646D73'>
						<strong><h3>請假紀錄表</h3></strong>
					</div>
					<div align='center'><button id='manage' name='manage' style='display:none' onclick="location.href='queryLeave'">後台管理</button></div>
					<div class="card-body">
						<div>						
							<h4>使用者：${memberleave[0].memberName}</h4>
								選擇年月份：<select id='dateselect'></select>
		<!-- 顯示書籍資料的區域 -->
						</div>
					</div>
					<div class="card-body">
						<div align='center' id='tablearea' style='height: 150px;' class='center'>
		<script>
			var btn = document.getElementById("manage"); 
			function checkAdmin(){
			    if(${memberBean.memberAdmin == "s"}) {
			        btn.style.display = "block";
			    } else {
			        btn.style.display = "none";
			    } 
			}
			checkAdmin();
			var selectElement = document.getElementById('dateselect'); // 取出select標籤
			var tablearea = document.getElementById('tablearea'); // 取出書籍資料的div標籤
			var detail = document.getElementById('detail'); // 取出書籍資料的div標籤
			var xhr = new XMLHttpRequest(); // 讀取書籍表格內的書籍資料
			var xhr2 = new XMLHttpRequest(); // 讀取書籍表格內的書籍資料

			var dateselect = [ [ 'all' ], [ '2020-1' ], [ '2020-2' ],
					[ '2020-3', ], [ '2020-4' ], [ '2020-5' ], [ '2020-6' ],
					[ '2020-7' ], [ '2020-8' ], [ '2020-9' ], [ '2020-10' ],
					[ '2020-11' ], [ '2020-12' ] ];
			for (var i = 0; i < dateselect.length; i++) {
				var option = new Option(dateselect[i]);
				selectElement.options[selectElement.options.length] = option;
			}
			window.onload = function(){
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						displayPagePunchTime(xhr.responseText);
					}
				}
				xhr.open("GET","<c:url value='queryLeaveData'/>?memberNumber="+ ${memberleave[0].memberNumber}
					+ "&selectdate=all", true);
				// 			// 送出請求						
				xhr.send();
			}
			
			selectElement.onchange = function() {
				xhr2.onreadystatechange = function() {
					if (xhr2.readyState == 4 && xhr2.status == 200) {
						displayPagePunchTime(xhr2.responseText);
					}
				}
				var selectdate = selectElement.options[selectElement.selectedIndex].value;
				// 			// 定義open方法
				xhr2.open("GET",
						"<c:url value='queryLeaveData' />?memberNumber="+ ${memberleave[0].memberNumber} 
						+ "&selectdate=" + selectdate, true);
				// 			// 送出請求						
				xhr2.send();
			}
			

			
			function displayPagePunchTime(responseText) {
				var leave = JSON.parse(responseText);
				var content = "<table class='table table-hover border border-secondary'>";

				content += "<tr align='center'>"
						+ "<th align='center' width='60'>流水號</th>"
						+ "<th align='center' width='100'>姓名</th>"
						+ "<th align='center' width='200'>日期</th>"
						+ "<th align='center' width='100'>假別</th>"
						+ "<th align='center' width='200'>請假開始</th>"
						+ "<th align='center' width='200'>請假結束</th>"
						+ "<th align='center' width='200'>請假時數</th>"
						+ "<th align='center' width='200'>原因</th>"
						+ "<th align='center' width='200'>審核</th>"
						+"</tr>";
				for (var i = 0; i < leave.length; i++) {
					var leaveDay = leave[i].leaveDate; //or time=1439018115000; 结果一样
					var leaveStart = leave[i].leaveStart;
					var leaveEnd = leave[i].leaveEnd;

					content += "<tr>"
					+ "<td align='center'>" + leave[i].leaveId + "</td>"
					+ "<td align='center'>" + leave[i].memberName + "</td>" 
					+ "<td align='center'>"	+ timeStampToDate(leaveDay) + "</td>"
					+ "<td align='center'>" + leave[i].leaveCategory + "</td>" 
					+ "<td align='center'>"	+ timeStampToTime(leaveStart) + "</td>"
					+ "<td align='center'>" + timeStampToTime(leaveEnd)	+ "</td>"
					+ "<td align='center'>" + leave[i].leaveHours + "</td>" 
					+ "<td align='center'>" + leave[i].leaveCause + "</td>" 
					+ "<td align='center'>" + leave[i].leaveAudit + "</td>" 
					+ "</tr>";
				}
				content += "</table>";
				tablearea.innerHTML = content;
			}

			function checkNull(String){
				if (String == null){
					return '';
				}else{
					return String;
				}
				
			}
			
			function timeStampToDate(date) {
				var datetime = new Date();
				datetime.setTime(date);
				var year = datetime.getFullYear();
				var month = datetime.getMonth() + 1;
				var date = (datetime.getDate()<10 ? '0' : '') + datetime.getDate();
				var date = year + "-" + month + "-" + date;
				return date;
			};

			function timeStampToTime(time) {
				if (time != null){					
					var datetime = new Date();
					datetime.setTime(time);
					var hour = (datetime.getHours()<10 ? '0' : '') +  datetime.getHours();
					var minute = (datetime.getMinutes()<10 ? '0' : '') +  datetime.getMinutes();
					var second = (datetime.getSeconds()<10 ? '0' : '') +  datetime.getSeconds();
					var time = hour + ":" + minute + ":" + second;
					return time;
				}else{
					return '';
				}
			}
		</script>
						</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>