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
			<div class="card-header text-white text-md-center" style='background: #646D73'>
				<strong><h2>請假紀錄表</h2></strong>
			</div>
			<div class="card-body">
				<div class="form-group row">
					<span class="col-md-2 text-md-right" style="font-size:30px;">請挑選姓名：</span>
					<div class="col-md-2 text-md-center"><select style="font-size:30px;" id='membername'></select></div>
					<span class="col-md-2 text-md-right" style="font-size:30px;">選擇年月份：</span>
					<div class="col-md-2 text-md-center"><select style="font-size:30px;" id='dateselect'></select></div>
					<span class="col-md-2 text-md-right" style="font-size:30px;">選擇分類：</span>
					<div class="col-md-2 text-md-center"><select style="font-size:30px;" id='category'></select></div>
				</div>
			</div>
			<div align='center'><button class="btn btn-primary col-md-3" style='font-size:20px;' id='btn_checkaudit'>未審核</button></div>
			<hr>
			<div class="card-body">
				<div align='center' id='tableLeave' class="table-responsive col-md-12"></div>
			</div>
		
		<script>
			var selectElement = document.getElementById('membername'); 
			var selectElement2 = document.getElementById('dateselect'); 
			var selectElement3 = document.getElementById('category'); 
			var btn_checkaudit = document.getElementById("btn_checkaudit");
			var tablePunch = document.getElementById('tablePunch'); 
			var detail = document.getElementById('detail'); 
			var xhr = new XMLHttpRequest();			
			var xhr2 = new XMLHttpRequest(); 
			var xhr3 = new XMLHttpRequest(); 
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
					var category = [ ['all'] ,['事假'],['公假'],['病假'],['婚假'],['喪假']];
					for (var i = 0; i < dateselect.length; i++) {
						var option2 = new Option(dateselect[i]);
						selectElement2.options[selectElement2.options.length] = option2;
					}
					for (var i = 0; i < category.length; i++) {
						var option3 = new Option(category[i]);
						selectElement3.options[selectElement3.options.length] = option3;
					}

				}
			}
			xhr.open("GET", "<c:url value='getAllMember'/>", true);
			xhr.send();

			window.onload = function() {
				xhr2.onreadystatechange = function() {
					if (xhr2.readyState == 4 && xhr2.status == 200) {
						displayPageLeave(xhr2.responseText);
					}
				}
				xhr2.open("GET", "<c:url value='queryAttendanceData'/>?memberNumber=all&selectdate=all&category=all", true);
				// 			// 送出請求						
				xhr2.send();
			}

			selectElement.onchange = function() {
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPageLeave(xhr3.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				var selectcategory = selectElement3.options[selectElement3.selectedIndex].value;
				xhr3.open("GET", "<c:url value='queryAttendanceData' />?memberNumber="
						+ memberNumber + "&selectdate=" + selectdate +"&selectcategory=" + selectcategory, true);
				xhr3.send();
			}

			selectElement2.onchange = function() {
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPageLeave(xhr3.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				var selectcategory = selectElement3.options[selectElement3.selectedIndex].value;
				xhr3.open("GET", "<c:url value='queryAttendanceData' />?memberNumber="
						+ memberNumber + "&selectdate=" + selectdate +"&selectcategory=" + selectcategory, true);
				xhr3.send();
			}
			
			selectElement3.onchange = function() {
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPageLeave(xhr3.responseText);
					}
				}
				// 			//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				var selectcategory = selectElement3.options[selectElement3.selectedIndex].value;
				xhr3.open("GET", "<c:url value='queryAttendanceData' />?memberNumber="
						+ memberNumber + "&selectdate=" + selectdate +"&selectcategory=" + selectcategory, true);
				// 			// 送出請求						
				xhr3.send();
			}
			
			btn_checkaudit.onclick = function(){
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPageLeave(xhr3.responseText);
					}
				}
			xhr3.open("GET",
					"<c:url value='queryAttendanceDataByAudit'/>?memberNumber=all" 
					+ "&selectdate=all&selectcategory=all&='審核中'", true);
			xhr3.send();
			}

			function displayPageLeave(responseText) {
				var leaveData = JSON.parse(responseText);
				var contentLeave = "<table class='table table-hover border border-secondary'";

				contentLeave += "<tr>"
						+ "<th align='left' width='200' style='font-size:30px'>日期</th>"
						+ "<th align='left' width='200' style='font-size:30px'>姓名</th>"
						+ "<th align='left' width='170' style='font-size:30px'>請假開始</th>"
						+ "<th align='left' width='170' style='font-size:30px'>請假結束</th>"
						+ "<th align='left' width='140' style='font-size:30px'>假別</th>"
						+ "<th align='left' width='230' style='font-size:30px'>請假時數</th>"
						+ "<th align='left' width='140' style='font-size:30px'>審核</th>"
						+ "<th align='left' width='140' style='font-size:30px'>修改</th></tr>";
						
				for (var i = 0; i < leaveData.length; i++) {
					var leave = leaveData[i];
					contentLeave += "<tr>"							
								+ "<td align='left' style='font-size:30px'>" + timeStampToDate(leave.leaveDate) + "</td>"
								+ "<td align='left' style='font-size:30px'>" + leave.memberName + "</td>"
								+ "<td align='left' style='font-size:30px'>" + timeStampToTime(leave.leaveStart) + "</td>"
								+ "<td align='left' style='font-size:30px'>" + timeStampToTime(leave.leaveEnd) + "</td>"
								+ "<td align='left' style='font-size:30px'>" + leave.leaveCategory + "</td>"
								+ "<td align='left' style='font-size:30px'>" + timeFn(leave.leaveHours) + "</td>"
								+ "<td align='left' style='font-size:30px'>" + checkAudit(leave.leaveAudit) + "</td>"
								+ "<td align='left' style='font-size:30px'>" + checkLeaveDataExist(leave.memberName) + "</td></tr>";
								
					function checkAudit(String){
						if (String == '審核中'){
							return "<a href='checkAudit/" + leave.leaveId +"' onclick='confirm(\"確認通過審核？\")'>審核中</a>";
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
							return "<a class='deletelink' href='leaveEdit/" + leave.leaveId + "'>更改</a>/<a href='deleteLeave/"
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
				}
				contentLeave += "</table>";
				tableLeave.innerHTML = contentLeave;
			}
		</script>
		</div>
		</div>
	</div>
</body>
</html>