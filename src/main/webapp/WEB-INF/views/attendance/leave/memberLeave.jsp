<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div class="container-fluid row">
		<div class="card col-md-2">
    	<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<ul class="nav">

				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#punch" aria-expanded="false" aria-controls="punch">
						<i class="ti-user menu-icon"></i> <span style="font-size='30px'" class="menu-title">打卡系統</span>
						<i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="punch">
						<ul class="nav flex-column sub-menu">
							<li  class="nav-item"><a class="nav-link" style="font-size='20px'"
								href="${pageContext.request.contextPath}/attendance/punch/memberPunch">
									出勤打卡 </a></li>
						</ul>
					</div></li>
					
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#leave" aria-expanded="false" aria-controls="leave">
						<i class="ti-user menu-icon"></i> <span style="font-size='30px'" class="menu-title">請假系統</span>
						<i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="leave">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link" style="font-size='20px'"
								href="${pageContext.request.contextPath}/attendance/leave/memberInsertLeave">
									新增請假紀錄 </a></li>
							<li class="nav-item"><a class="nav-link" style="font-size='20px'"
								href="${pageContext.request.contextPath}/attendance/leave/memberLeave">
									請假記錄查詢</a></li>
						</ul>
					</div></li>
			</ul>
		</nav>
		</div>
	<div class="main-panel card col-md-10" >
		<div class="contnt-wrapper">
			<div class="row justify-content-center">
				<div class="card col-md-12">
					<div class="card-header text-white" style='background: #646D73'>
						<strong><h2>請假紀錄表</h2></strong>
					</div>
				<div class="card-body">
					<div class="form-group row">	
						<div class="col-md-6 text-md-center"><h3>使用者：${memberBean.memberName}</h3></div>					
						<div class="col-md-6 text-md-center"><h3>選擇年月份：<select style='font-siez:20px' id='dateselect'></select></h3></div>	
		<!-- 顯示書籍資料的區域 -->
					</div>
				<div class="card-body">
					<div align='center' id='tablearea' class='class="col-md-12 grid-margin stretch-card"'></div>
		<script>
			var selectElement = document.getElementById('dateselect'); 
			var tablearea = document.getElementById('tablearea'); 
			var detail = document.getElementById('detail');
			var xhr = new XMLHttpRequest(); 
			var xhr2 = new XMLHttpRequest(); 
			var xhr3 = new XMLHttpRequest(); 

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
						+ "<th align='center' width='200' style='font-size:30px;'>日期</th>"
						+ "<th align='center' width='200' style='font-size:30px;'>姓名</th>"
						+ "<th align='center' width='140' style='font-size:30px;'>假別</th>"
						+ "<th align='center' width='170' style='font-size:30px;'>請假開始</th>"
						+ "<th align='center' width='170' style='font-size:30px;'>請假結束</th>"
						+ "<th align='center' width='230' style='font-size:30px;'>請假時數</th>"
						+ "<th align='center' width='200' style='font-size:30px;'>原因</th>"
						+ "<th align='center' width='140' style='font-size:30px;'>審核</th>"
						+"</tr>";
				for (var i = 0; i < leave.length; i++) {
					var leaveDay = leave[i].leaveDate; //or time=1439018115000; 结果一样
					var leaveStart = leave[i].leaveStart;
					var leaveEnd = leave[i].leaveEnd;

					content += "<tr>"
					+ "<td align='center' style='font-size:30px;'>"	+ timeStampToDate(leaveDay) + "</td>"
					+ "<td align='center' style='font-size:30px;'>" + leave[i].memberName + "</td>" 
					+ "<td align='center' style='font-size:30px;'>" + leave[i].leaveCategory + "</td>" 
					+ "<td align='center' style='font-size:30px;'>"	+ timeStampToTime(leaveStart) + "</td>"
					+ "<td align='center' style='font-size:30px;'>" + timeStampToTime(leaveEnd)	+ "</td>"
					+ "<td align='center' style='font-size:30px;'>" + timeFn(leave[i].leaveHours) + "</td>" 
					+ "<td align='center' style='font-size:30px;'>" + leave[i].leaveCause + "</td>" 
					+ "<td align='center' style='font-size:30px;'>" + leave[i].leaveAudit + "</td>" 
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
				var month = ((datetime.getMonth() + 1) < 10 ? '0' : '') + (datetime.getMonth() + 1);
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
			
			function timeFn(timediff) {
			    var leave1=timediff%(24*3600*1000)    //计算天数后剩余的毫秒数
			    var hours=Math.floor(leave1/(3600*1000))//计算出小时数
			    //计算相差分钟数
			    var leave2=leave1%(3600*1000)    //计算小时数后剩余的毫秒数
			    var minutes=Math.floor(leave2/(60*1000))//计算相差分钟数
			    //计算相差秒数
			    var leave3=leave2%(60*1000)      //计算分钟数后剩余的毫秒数
			    var seconds=Math.round(leave3/1000)

			    var timeFn = hours+" 小時 "+minutes+" 分鐘 "+seconds+" 秒";
			    return timeFn;
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