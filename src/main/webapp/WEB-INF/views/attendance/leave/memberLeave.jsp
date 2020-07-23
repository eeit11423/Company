<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>請假系統</title>
</script>
</head>
<body onload="ShowTime()"	>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container" style="text-align: center;background-color:#dee2e6">
		<h1>請假系統	</h1><hr>
		<a href='<c:url value='/'/>'>返回首頁</a>
		<h4>使用者：${memberleave[0].memberName}</h4>
		
		<div align='center'><button id='manage' name='manage' style='display:none' onclick="location.href='queryLeave'">出勤管理</button></div>
		<div class="container" align='center' style="text-align: center">
		<button onclick="location.href='memberInsertLeave'">新增紀錄</button>
		</div>
		選擇年月份：<select id='dateselect'></select>
		<!-- 顯示書籍資料的區域 -->
			<hr>
	</div>
	<div align='center'>
		<div align='center' id='tablearea' style='height: 150px;'
			class='center'></div>
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
				var content = "<table align='center' border='1'  bgcolor='#fbdb98'>";

				content += "<tr align='center'>"
						+ "<th align='center' width='60'>流水號</th>"
						+ "<th align='center' width='100'>姓名</th>"
						+ "<th align='center' width='200'>日期</th>"
						+ "<th align='center' width='100'>假別</th>"
						+ "<th align='center' width='200'>請假開始</th>"
						+ "<th align='center' width='200'>請假結束</th>"
						+ "<th align='center' width='200'>原因</th>"
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
					+ "<td align='center'>" + leave[i].leaveCause + "</td>" 
					+ "</tr>";
				}
				content += "</table>";
				tablearea.innerHTML = content;
			}

			function timeStampToDate(date) {
				var datetime = new Date();
				datetime.setTime(date);
				var year = datetime.getFullYear();
				var month = datetime.getMonth() + 1;
				var date = datetime.getDate();
				var hour = datetime.getHours();
				var minute = datetime.getMinutes();
				var second = datetime.getSeconds();
				var mseconds = datetime.getMilliseconds();
				var date = year + "-" + month + "-" + date;
				return date;
			};

			function timeStampToTime(time) {
				var datetime = new Date();
				datetime.setTime(time);
				var hour = datetime.getHours();
				var minute = datetime.getMinutes();
				var second = datetime.getSeconds();
				var time = hour + ":" + minute + ":" + second;
				return time;
			}
		</script>
	</div>
</body>
</html>