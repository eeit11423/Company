<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公司出勤紀錄表</title>
</head>
<body>
	<jsp:include page="/fragment/headerRearend.jsp" />
	<div class="container-scroller" >
		<div class="contnt-wrapper">
		<div class="row">
		<div class="card">
			<div class="card-header text-white" style='background: #646D73'>
				<strong><h2>出勤紀錄表</h2></strong>
			</div>
			<div class="card-body">
				<div class="form-group row">
					<span class="col-md-3 text-md-right" style="font-size:30px;">請挑選姓名：</span>
					<div class="col-md-3 text-md-center"><select style="font-size:30px;" id='membername'></select></div>
					<span class="col-md-3 text-md-right" style="font-size:30px;">選擇年月份：</span>
					<div class="col-md-3 text-md-center"><select style="font-size:30px;" id='dateselect'></select></div>
				</div>
			</div>
			<hr>
			<div class="card-body">
				<div class="form-group row">
					<div align='center' class='col-md-6'>
						<h3>打卡紀錄</h3>
						<button class="btn btn-secondary col-md-4" style="font-size:20px;" id='btn_late'>遲到</button>
						<button class="btn btn-secondary col-md-4" style="font-size:20px;" id='btn_early'>早退</button>
					</div>
					<div align='center' class='col-md-6'>
						<h3>請假紀錄</h3>
						<button class="btn btn-secondary col-md-4" style="font-size:20px;" id='btn_leave'>請假</button>
					</div>
					<div align='center' id='tablePunch' class="table-responsive col-md-6"></div>
					<div align='center' id='tableLeave' class="table-responsive col-md-6"></div>
		</div>
		
		<script>
			var selectElement = document.getElementById('membername'); 
			var selectElement2 = document.getElementById('dateselect'); 
			var btn_late = document.getElementById("btn_late");
			var btn_early = document.getElementById("btn_early");
			var btn_leave = document.getElementById("btn_leave");			
			var tablePunch = document.getElementById('tablePunch'); 
			var detail = document.getElementById('detail'); 
			var xhr = new XMLHttpRequest();			
			var xhr2 = new XMLHttpRequest(); 
			var xhr3 = new XMLHttpRequest(); 
			var xhr4 = new XMLHttpRequest(); 
			var memberData = [];
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var members = JSON.parse(xhr.responseText);
					for (var i = 0; i < members.length; i++) {
						var member = [ members[i].memberName,
								members[i].memberNumber ];
						memberData.push(member);
					}
					for (var i = 0; i < memberData.length; i++) {
						var option = new Option(memberData[i][0], ""
								+ memberData[i][1]);
						selectElement.options[selectElement.options.length] = option;
					}
					jQuery("#membername").prepend(
							"<option value='all'>all</option>");
					console.log(selectElement)
					var dateselect = [ [ 'all' ], [ '2020-1' ], [ '2020-2' ],
							[ '2020-3', ], [ '2020-4' ], [ '2020-5' ],
							[ '2020-6' ], [ '2020-7' ], [ '2020-8' ],
							[ '2020-9' ], [ '2020-10' ], [ '2020-11' ],
							[ '2020-12' ] ];
					for (var i = 0; i < dateselect.length; i++) {
						var option2 = new Option(dateselect[i]);
						selectElement2.options[selectElement2.options.length] = option2;
					}

				}
			}
			xhr.open("GET", "<c:url value='getAllMember'/>", true);
			xhr.send();

			window.onload = function() {
				xhr2.onreadystatechange = function() {
					if (xhr2.readyState == 4 && xhr2.status == 200) {
						displayPagePunchTime(xhr2.responseText);
						displayPageLeave(xhr2.responseText);
					}
				}
				xhr2.open("GET", "<c:url value='queryAttendanceData' />?memberNumber=all&selectdate=all", true);
				// 			// 送出請求						
				xhr2.send();
			}

			selectElement.onchange = function() {
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPagePunchTime(xhr3.responseText);
						displayPageLeave(xhr3.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				// 			// 定義open方法
				xhr3.open("GET", "<c:url value='queryAttendanceData' />?memberNumber=" + memberNumber + "&selectdate=" + selectdate, true);
				// 			// 送出請求						
				xhr3.send();
			}

			selectElement2.onchange = function() {
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPagePunchTime(xhr3.responseText);
						displayPageLeave(xhr3.responseText);
					}
				}
				// 			//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				// 			// 定義open方法
				xhr3.open("GET", "<c:url value='queryAttendanceData' />?memberNumber=" + memberNumber + "&selectdate=" + selectdate, true);
				// 			// 送出請求						
				xhr3.send();
			}

			btn_late.onclick = function(){
				xhr4.onreadystatechange = function() {
					if (xhr4.readyState == 4 && xhr4.status == 200) {
						displayPagePunchTime(xhr4.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement.options[selectElement.selectedIndex].value;
			xhr4.open("GET",
					"<c:url value='queryAttendanceDataByPunchLate' />?memberNumber="+ memberNumber 
					+ "&selectdate=" + selectdate + "&punchLate=遲到", true);
			xhr4.send();
			}
			
			btn_early.onclick = function(){
				xhr4.onreadystatechange = function() {
					if (xhr4.readyState == 4 && xhr4.status == 200) {
						displayPagePunchTime(xhr4.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement.options[selectElement.selectedIndex].value;
			xhr4.open("GET",
					"<c:url value='queryAttendanceDataByPunchEarly' />?memberNumber="+ memberNumber 
					+ "&selectdate=" + selectdate + "&punchEarly=早退", true);
			xhr4.send();
			}
			
			btn_leave.onclick = function(){
				xhr4.onreadystatechange = function() {
					if (xhr4.readyState == 4 && xhr4.status == 200) {
						displayPagePunchTime(xhr4.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement.options[selectElement.selectedIndex].value;
			xhr4.open("GET",
					"<c:url value='queryAttendanceDataByLeave' />?memberNumber="+ memberNumber 
					+ "&selectdate=" + selectdate + "&leave=all", true);
			xhr4.send();
			}
			
			
			
			

				
			function displayPagePunchTime(responseText) {
				var mapData = JSON.parse(responseText);
				var punchData = mapData.punch;
				var contentPunch = "<table class='table table-hover border border-secondary'";
				contentPunch += "<tr align='center'>"
						+ "<th align='center' width='100'>日期</th>"
						+ "<th align='center' width='100'>姓名</th>"
						+ "<th align='center' width='140'>上班時間</th>"
						+ "<th align='center' width='70'>遲到</th>"
						+ "<th align='center' width='140'>下班時間</th>"
						+ "<th align='center' width='70'>早退</th>"
						+ "<th align='center' width='140'>上班時數</th>"
						+ "<th align='center' width='100'>出勤修改</th></tr>";
				for (var i = 0; i < punchData.length; i++) {
					var punch = punchData[i];
					contentPunch += "<tr>"
						    		+ "<td align='center'>" + timeStampToDate(punch.punchDate) + "</td>"
									+ "<td align='center'>"	+ punch.memberName + "</td>"
									+ "<td align='center'>" + chekWorkOn(punch.punchWorkOn) + "</td>"
									+ "<td align='center'>" + checkNull(punch.punchLate) + "</td>"
									+ "<td align='center'>" + chekWorkOff(punch.punchWorkOff) + "</td>"
									+ "<td align='center'>" + checkNull(punch.punchEarly) + "</td>"
									+ "<td align='center'>" + timeFn(punch.punchHours) + "</td>"
									+ "<td align='center'>" + checkPunchTimeDataExist(punch.memberName) + "</td></tr>";
									
					function checkNull(String) {
						if (String == null) {
							return '';
						} else {
							return String;
						}
					}				
					
					function chekWorkOn(time) {
						if(punch.punchLate != null){
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
						}else{
							return '';
						}
					}
					
					function chekWorkOff(time) {
						if(punch.punchEarly != null){
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
						}else{
							return '';
						}
					}
					
					function checkPunchTimeDataExist(String) {
						if (String == null) {
							return "<a href='insertPunchTime'>新增</a>";
						} else {
							return "<a class='deletelink' href='punchTimeEdit/" + punch.punchId + "'>更改</a>/<a href='deletePunchTime/"
								+ punch.punchId + "' onclick='confirm(\"確認刪除此筆請假紀錄？\")'>刪除</a>";
						}
					}
							
				}
				contentPunch += "</table>";
				tablePunch.innerHTML = contentPunch;
			}
			function displayPageLeave(responseText) {
				var mapData = JSON.parse(responseText);
				var leaveData = mapData.leave;
				var contentLeave = "<table class='table table-hover border border-secondary'";

				contentLeave += "<tr align='center'>"
						+ "<th align='center' width='100'>日期</th>"
						+ "<th align='center' width='100'>姓名</th>"
						+ "<th align='center' width='100'>請假開始</th>"
						+ "<th align='center' width='100'>請假結束</th>"
						+ "<th align='center' width='100'>假別</th>"
						+ "<th align='center' width='140'>請假時數</th>"
						+ "<th align='center' width='100'>請假審核</th>"
						+ "<th align='center' width='100'>請假修改</th></tr>";
						
				for (var i = 0; i < leaveData.length; i++) {
					var leave = leaveData[i];
					contentLeave += "<tr>"							
								+ "<td align='center'>" + timeStampToDate(leave.leaveDate) + "</td>"
								+ "<td align='center'>"	+ leave.memberName + "</td>"
								+ "<td align='center'>" + timeStampToTime(leave.leaveStart) + "</td>"
								+ "<td align='center'>" + timeStampToTime(leave.leaveEnd) + "</td>"
								+ "<td align='center'>" + leave.leaveCategory + "</td>"
								+ "<td align='center'>" + timeFn(leave.leaveHours) + "</td>"
								+ "<td align='center'>" + checkAudit(leave.leaveAudit) + "</td>"
								+ "<td align='center'>" + checkLeaveDataExist(leave.memberName) + "</td></tr>";
								
					function checkAudit(String){
						if (String == '審核中'){
							return "<a href='../leave/checkAudit/" + leave.leaveId +"' onclick='confirm(\"確認通過審核？\")'>審核中</a>";
						}else if(String == '通過')
							return '通過';
						else{
							return '';
						}
					}
					function checkLeaveDataExist(String) {
						if (String == null) {
							return "<a href='../leave/insertLeave'>新增</a>";
						} else {
							return "<a class='deletelink' href='../leave/leaveEdit/" + leave.leaveId + "'>更改</a>/<a href='../leave/deleteLeave/"
								+ leave.leaveId + "' onclick='confirm(\"確認刪除此筆請假紀錄？\")'>刪除</a>";
						}
					}
					
					function timeStampToTime(time) {
						if (time != null) {
							var datetime = new Date();
							datetime.setTime(time);
							var hour = (datetime.getHours() < 10 ? '0' : '')
									+ datetime.getHours();
							var minute = (datetime.getMinutes() < 10 ? '0' : '')
									+ datetime.getMinutes();
							var time = hour + ":" + minute;
							return time;
						} else {
							return '';
						}
					}
				}
					
				contentLeave += "</table>";
				tableLeave.innerHTML = contentLeave;
			}
					function timeStampToDate(date) {
						if (date != null) {
							var datetime = new Date();
								datetime.setTime(date);
							var year = datetime.getFullYear();
							var month = ((datetime.getMonth() + 1) < 10 ? '0' : '') + (datetime.getMonth() + 1);
							var date = (datetime.getDate() < 10 ? '0' : '')
								+ datetime.getDate();
							var date = year + "-" + month + "-" + date;
							return date;
						}
					}
		
					function timeFn(timediff) {
					    if (timediff != null){
							var leave1=timediff%(24*3600*1000)    //计算天数后剩余的毫秒数
						    var hours=Math.floor(leave1/(3600*1000))//计算出小时数
						    var leave2=leave1%(3600*1000)    //计算小时数后剩余的毫秒数
					    	var minutes=Math.floor(leave2/(60*1000))//计算相差分钟数
		
						    var timeFn = hours+" 小時 "+minutes+" 分鐘 ";
						    return timeFn;
					    } else{
					    	return '';
					    }
					}
		</script>
		</div>
		</div>
	</div>
</body>
</html>