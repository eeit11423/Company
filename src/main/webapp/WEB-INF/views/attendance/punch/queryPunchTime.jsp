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
				<strong><h2>打卡紀錄表</h2></strong>
			</div>
			<div class="card-body">
				<div class="form-group row">
					<span class="col-md-3 text-md-right" style="font-size:30px;">請挑選姓名：</span>
					<div class="col-md-3 text-md-center"><select style="font-size:30px;=" id='membername'></select></div>
					<span class="col-md-3 text-md-right" style="font-size:30px;">選擇年月份：</span>
					<div class="col-md-3 text-md-center"><select style="font-size:30px;" id='dateselect'></select></div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
					<div align='center' class='col-md-12'>
						<button class="btn btn-secondary col-md-3" style="font-size:20px;" id='btn_late'>遲到</button>
						<button class="btn btn-secondary col-md-3" style="font-size:20px;" id='btn_early'>早退</button>
						<button class="btn btn-secondary col-md-3" style="font-size:20px;" id='btn_reset'>重設</button>
					</div>
				<hr>
				</div>
				<div align='center' id='tablePunch' class="table-responsive col-md-12"></div>
		
		<script>
			var selectElement = document.getElementById('membername'); 
			var selectElement2 = document.getElementById('dateselect'); 
			var btn_late = document.getElementById("btn_late");
			var btn_early = document.getElementById("btn_early");
			var btn_reset = document.getElementById("btn_reset");
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
					}
				}
				xhr2.open("GET", "<c:url value='queryAttendanceData' />?memberNumber=all&selectdate=all", true);
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
				xhr3.open("GET", "<c:url value='queryAttendanceData' />?memberNumber=" + memberNumber + "&selectdate=" + selectdate, true);
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
				xhr3.open("GET", "<c:url value='queryAttendanceData' />?memberNumber=" + memberNumber + "&selectdate=" + selectdate, true);
				// 			// 送出請求						
				xhr3.send();
			}

			btn_reset.onclick = function(){
				xhr4.onreadystatechange = function() {
					if (xhr4.readyState == 4 && xhr4.status == 200) {
						displayPagePunchTime(xhr4.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement.options[selectElement.selectedIndex].value;
			xhr4.open("GET",
					"<c:url value='queryAttendanceData' />?memberNumber="+ memberNumber 
					+ "&selectdate=" + selectdate, true);
			xhr4.send();
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
			
			function displayPagePunchTime(responseText) {
				var mapData = JSON.parse(responseText);
				var punchData = mapData.punch;
				var contentPunch = "<table class='table table-hover border border-secondary'";
				contentPunch += "<tr class='tm-tr-header' align='center'>"
						+ "<th align='left' width='200' style='font-size:30px;'>日期</th>"
						+ "<th align='left' width='200' style='font-size:30px;'>姓名</th>"
						+ "<th align='left' width='170' style='font-size:30px;'>上班時間</th>"
						+ "<th align='left' width='140' style='font-size:30px;'>遲到</th>"
						+ "<th align='left' width='170' style='font-size:30px;'>下班時間</th>"
						+ "<th align='left' width='140' style='font-size:30px;'>早退</th>"
						+ "<th align='left' width='230' style='font-size:30px;'>上班時數</th>"
						+ "<th align='left' width='140' style='font-size:30px'>修改</th></tr>";
				for (var i = 0; i < punchData.length; i++) {
					var punch = punchData[i];
					contentPunch += "<tr>"
						    		+ "<td align='left' style='font-size:30px'>" + timeStampToDate(punch.punchDate) + "</td>"
									+ "<td align='left' style='font-size:30px'>"	+ punch.memberName + "</td>"
									+ "<td align='left' style='font-size:30px'>" + chekWorkOn(punch.punchWorkOn) + "</td>"
									+ "<td align='left' style='font-size:30px;'>" + checkState(punch.punchLate) + "</td>"
									+ "<td align='left' style='font-size:30px'>" + chekWorkOff(punch.punchWorkOff) + "</td>"
									+ "<td align='left' style='font-size:30px;'>" + checkState(punch.punchEarly) + "</td>"
									+ "<td align='left' style='font-size:30px'>" + timeFn(punch.punchHours) + "</td>"
									+ "<td align='left' style='font-size:30px'>" + checkPunchTimeDataExist(punch.memberName) + "</td></tr>";
									
					function checkState(String){
						if (String == null){
							return '正常';
						}else{
							console.log('punchLateTd'+i);
							var punchLateTdd = document.getElementById('punchLateTd'+i);
// 							var punchLateTdd = $('#punchLateTd'+i);
							console.log(punchLateTdd);
								$(punchLateTdd).attr("background-color","red");
// 								punchLateTdd.css("background-color","red");
							return String;
						}
						
					}
									
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
							return "<a href='punchTimeEdit/" + punch.punchId + "'>更改</a>/<a href='deletePunchTime/"
								+ punch.punchId + "' onclick='confirm(\"確認刪除此筆請假紀錄？\")'>刪除</a>";
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
				contentPunch += "</table>";
				tablePunch.innerHTML = contentPunch;
			}
		</script>
			</div>
		</div>
		</div>
		</div>
	</div>
</body>
</html>