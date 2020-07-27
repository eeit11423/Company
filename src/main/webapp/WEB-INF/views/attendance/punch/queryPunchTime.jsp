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
	<div class="main-panel" >
		<div class="contnt-wrapper">
		<div class="row">
		<div class="card">
			<div class="card-header text-white" style='background: #646D73'>
				<strong><h3>出勤紀錄表</h3></strong>
			</div>
			<div class="card-body">
			<a href='memberPunch'>回前頁</a> <a href='../leave/queryLeave'>請假查詢</a>
			</div>
			<div class="card-body">
				<div class="form-group row">
					<span class="col-md-2 text-md-right">請挑選姓名：</span>
					<div class="col-md-3"><select id='membername'></select></div>
					<span class="col-md-2 text-md-right">選擇年月份：</span>
					<div class="col-md-3"><select id='dateselect'></select></div>
				</div>
				<div class="row">
					<button class="btn btn-secondary col-md-4" id='btn_late'>遲到</button>
					<button class="btn btn-secondary col-md-4" id='btn_early'>早退</button>
					<button class="btn btn-secondary col-md-4" id='btn_leave'>請假</button>
				</div>
			</div>
			<div align='center' id='tablearea' class="col-md-12 grid-margin stretch-card"></div>
		</div>
		
		<script>
			var selectElement = document.getElementById('membername'); // 取出select標籤
			var selectElement2 = document.getElementById('dateselect'); // 取出select標籤
			var btn_late = document.getElementById("btn_late");
			var btn_early = document.getElementById("btn_early");
			var btn_leave = document.getElementById("btn_leave");			
			var tablearea = document.getElementById('tablearea'); // 取出書籍資料的div標籤
			var detail = document.getElementById('detail'); // 取出書籍資料的div標籤
			var xhr = new XMLHttpRequest(); // 讀取書籍表格內的書籍資料
			var xhr2 = new XMLHttpRequest(); // 讀取單一書籍的資料
			var xhr3 = new XMLHttpRequest(); // 讀取單一書籍的資料
			var xhr4 = new XMLHttpRequest(); // 讀取單一書籍的資料
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
					}
				}
				xhr2.open("GET",
								"<c:url value='queryAttendanceData' />?memberNumber=all&selectdate=all",
								true);
				// 			// 送出請求						
				xhr2.send();
			}

			selectElement.onchange = function() {
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPagePunchTime(xhr3.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				// 			// 定義open方法
				xhr3.open("GET",
						"<c:url value='queryAttendanceData' />?memberNumber="
								+ memberNumber + "&selectdate=" + selectdate,
						true);
				// 			// 送出請求						
				xhr3.send();
			}

			selectElement2.onchange = function() {
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPagePunchTime(xhr3.responseText);
					}
				}
				// 			//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				// 			// 定義open方法
				xhr3.open("GET",
						"<c:url value='queryAttendanceData' />?memberNumber="
								+ memberNumber + "&selectdate=" + selectdate,
						true);
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
				var attendances = JSON.parse(responseText);
				console.log("typeof attendances:" + typeof attendances);
				var content = "<table class='table table-hover border border-secondary'";
				content += "<tr align='center'>"
						+ "<th align='center' width='70'>流水號</th>"
						+ "<th align='center' width='100'>姓名</th>"
						+ "<th align='center' width='70'>部門</th>"
						+ "<th align='center' width='100'>上班日期</th>"
						+ "<th align='center' width='140'>上班時間</th>"
						+ "<th align='center' width='70'>遲到</th>"
						+ "<th align='center' width='140'>下班時間</th>"
						+ "<th align='center' width='70'>早退</th>"
						+ "<th align='center' width='140'>上班時數</th>"
						+ "<th align='center' width='100'>請假日期</th>"
						+ "<th align='center' width='100'>請假開始</th>"
						+ "<th align='center' width='100'>請假結束</th>"
						+ "<th align='center' width='100'>假別</th>"
						+ "<th align='center' width='140'>請假時數</th>"
						+ "<th align='center' width='100'>請假審核</th>"
						+ "<th align='center' width='100'>出勤修改</th>"
						+ "<th align='center' width='100'>請假修改</th></tr>";
				for (var i = 0; i < attendances.length; i++) {
					var punch = attendances[i][0]? attendances[i][0] : {};
					var leave = attendances[i][1]? attendances[i][1] : {};
					console.log("leave:"+leave);
					var attendanceId = punch.length != 0 ? punch.punchId : leave.leaveId;
					var attendanceName = punch.length != 0? punch.memberName : leave.memberName;
					var attendanceDepartment = punch.length != 0? punch.memberDepartment : leave.memberDepartment;
// 					content += "<tr><td align='center'>" + punch.punchId+ "</td>"
// 							+ "<td align='center'>"	+ punch.memberName + "</td>"
// 							+ "<td align='center'>" + punch.memberDepartment + "</td>"
					content += "<tr><td align='center'>" + attendanceId+ "</td>"
							+ "<td align='center'>"	+ attendanceName + "</td>"
							+ "<td align='center'>" + attendanceDepartment + "</td>"
							+ "<td align='center'>" + checkNull(timeStampToDate(punch.punchDate)) + "</td>"
							+ "<td align='center'>" + timeStampToTime(punch.punchWorkOn) + "</td>"
							+ "<td align='center'>" + checkNull(punch.punchLate) + "</td>"
							+ "<td align='center'>" + timeStampToTime(punch.punchWorkOff) + "</td>"
							+ "<td align='center'>" + checkNull(punch.punchEarly) + "</td>"
							+ "<td align='center'>" + timeFn(checkNull(checkZero(punch.punchHours))) + "</td>"
							+ "<td align='center'>" + checkNull(timeStampToDate(leave.leaveDate)) + "</td>"
							+ "<td align='center'>" + checkNull(timeStampToTime(leave.leaveStart)) + "</td>"
							+ "<td align='center'>" + checkNull(timeStampToTime(leave.leaveEnd)) + "</td>"
							+ "<td align='center'>" + checkNull(leave.leaveCategory) + "</td>"
							+ "<td align='center'>" + timeFn(checkZero(checkNull(leave.leaveHours))) + "</td>"
							+ "<td align='center'>" + checkNull(leave.leaveAudit) + "</td>"
							+ "<td align='center'>" + checkPunchTimeDataExist(punch.memberName) + "</td>"
// 							+ "<td align='center'><a href='punchTimeEdit/" + punch.punchId + "'>更改</a>/<a class='deletelink' href='deletePunchTime/"
// 							+ punch.punchId + "' onclick='confirmDelete()'>刪除</a></td>"
							+ "<td align='center'>" + checkLeaveDataExist(leave.memberName) + "</td>"
// 							+ "<td align='center'><a href='../leave/leaveEdit/" + leave.leaveId + "'>更改</a>/<a href='../leave/deleteLeave/"
// 							+ leave.leaveId + "' onclick='confirmDelete()'>刪除</a></td>"
							+ "</tr>";
					function checkLeaveDataExist(String) {
						if (String == null) {
							return "<a href='../leave/insertLeave'>新增</a>";
						} else {
							return "<a class='deletelink' href='../leave/leaveEdit/" + leave.leaveId + "'>更改</a>/<a href='../leave/deleteLeave/"
								+ leave.leaveId + "' onclick='confirmDelete()'>刪除</a>";
						}
					}
					
					function checkPunchTimeDataExist(String) {
						if (String == null) {
							return "<a href='insertPunchTime'>新增</a>";
						} else {
							return "<a class='deletelink' href='punchTimeEdit/" + punch.punchId + "'>更改</a>/<a href='deletePunchTime/"
								+ punch.punchId + "' onclick='confirmDelete()'>刪除</a>";
						}
					}
					
					function confirmDelete() {
						var result = confirm("確定刪除此筆記錄?");
						if (result) {
							return window.location.href='../leave/deleteLeave/';
						}
						return false;
					}
					
				}
				content += "</table>";
				tablearea.innerHTML = content;
			}
			
			function checkNull(String) {
				if (String == null) {
					return '';
				} else {
					return String;
				}
			}
			
			function checkZero(Long) {
				if (Long == 0) {
					return '';
				} else {
					return Long;
				}
			}
			

			function timeStampToDate(date) {
				if (date != null) {
					var datetime = new Date();
						datetime.setTime(date);
					var year = datetime.getFullYear();
					var month = datetime.getMonth() + 1;
					var date = (datetime.getDate() < 10 ? '0' : '')
						+ datetime.getDate();
					var date = year + "-" + month + "-" + date;
					return date;
				}
			};

			function timeStampToTime(time) {
				if (time != null) {
					var datetime = new Date();
					datetime.setTime(time);
					var hour = (datetime.getHours() < 10 ? '0' : '')
							+ datetime.getHours();
					var minute = (datetime.getMinutes() < 10 ? '0' : '')
							+ datetime.getMinutes();
					var second = (datetime.getSeconds() < 10 ? '0' : '')
							+ datetime.getSeconds();
					var time = hour + ":" + minute + ":" + second;
					return time;
				} else {
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
// 			function confirmDelete() {
// 				var result = confirm("確定刪除此筆記錄?");
// 				if (result) {
// 					return window.location='../leave/deleteLeave/';
// 				}
// 				return false;
// 			}
			
// 		    $(document).ready(function() {
// 		        $('.deletelink').click(function() {
// 		        	if (confirm('確定刪除此筆紀錄? ')) {
// 		        		var href = $(this).attr('href');
// 		                $('form').attr('action', href).submit();
// 		        	} 
// 		        	return false;
		            
// 		        });
// 		    })
		</script>
		</div>
		</div>
	</div>
</body>
</html>