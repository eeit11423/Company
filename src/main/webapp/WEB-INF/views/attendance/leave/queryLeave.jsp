<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢請假紀錄</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container" style="text-align: center">
		<h1>
			查詢請假紀錄
			<hr>
		</h1>
	</div>
	<div align='center'>
		請挑選姓名: <select id='membername'></select> 選擇年月份：<select id='dateselect'></select>
		<hr>
		<a href='backLeave'>回前頁</a>
		<hr>
		<!-- 顯示書籍資料的區域 -->
		<div align='center' id='tablearea' style='height: 150px;'
			class='center'></div>
		<script>
			var selectElement = document.getElementById('membername'); // 取出select標籤
			var selectElement2 = document.getElementById('dateselect'); // 取出select標籤
			var tablearea = document.getElementById('tablearea'); // 取出書籍資料的div標籤
			var detail = document.getElementById('detail'); // 取出書籍資料的div標籤
			var xhr = new XMLHttpRequest(); // 讀取書籍表格內的書籍資料
			var xhr2 = new XMLHttpRequest(); // 讀取單一書籍的資料
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

				}
			}
			xhr.open("GET", "<c:url value='getAllMember'/>", true);
			xhr.send();
			var dateselect = [ [ 'all' ], [ '2020-1' ], [ '2020-2' ],
					[ '2020-3', ], [ '2020-4' ], [ '2020-5' ], [ '2020-6' ],
					[ '2020-7' ], [ '2020-8' ], [ '2020-9' ], [ '2020-10' ],
					[ '2020-11' ], [ '2020-12' ] ];
			for (var i = 0; i < dateselect.length; i++) {
				var option2 = new Option(dateselect[i]);
				selectElement2.options[selectElement2.options.length] = option2;
			}
			selectElement.onchange = function() {
				xhr2.onreadystatechange = function() {
					if (xhr2.readyState == 4 && xhr2.status == 200) {
						displayPagePunchTime(xhr2.responseText);
					}
				}
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				// 			// 定義open方法
				xhr2.open("GET",
						"<c:url value='queryLeaveData' />?memberNumber="
								+ memberNumber + "&selectdate=" + selectdate,
						true);
				// 			// 送出請求						
				xhr2.send();
			}

			selectElement2.onchange = function() {
				xhr2.onreadystatechange = function() {
					if (xhr2.readyState == 4 && xhr2.status == 200) {
						displayPagePunchTime(xhr2.responseText);
					}
				}
				// 			//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
				var memberNumber = selectElement.options[selectElement.selectedIndex].value;
				var selectdate = selectElement2.options[selectElement2.selectedIndex].value;
				// 			// 定義open方法
				xhr2.open("GET",
						"<c:url value='queryLeaveData' />?memberNumber="
								+ memberNumber + "&selectdate=" + selectdate,
						true);
				// 			// 送出請求						
				xhr2.send();
			}

			function displayPagePunchTime(responseText) {
				var leave = JSON.parse(responseText);
				var content = "<table align='center' border='1'  bgcolor='#fbdb98'>";

				content += "<tr align='center'>"
						+ "<th align='center' width='60'><a href='insertLeave'>新增</a></th>"
						+ "<th align='center' width='100'>姓名</th>"
						+ "<th align='center' width='200'>日期</th>"
						+ "<th align='center' width='200'>上班時間</th>"
						+ "<th align='center' width='200'>下班時間</th></tr>";
				for (var i = 0; i < leave.length; i++) {
					var leaveDay = leave[i].leaveDate; //or time=1439018115000; 结果一样
					var leaveStart = leave[i].leaveStart;
					var leaveEnd = leave[i].leaveEnd;

					content += "<tr>"
							+ "<td width='70'><a href='leaveEdit/" + leave[i].leaveId + "'>"
							+ leave[i].leaveId + "</a></td>"
							+ "<td align='center'>" + leave[i].memberName
							+ "</td>" + "<td align='center'>"
							+ timeStampToDate(leaveDay) + "</td>"
							+ "<td align='center'>"
							+ timeStampToTime(leaveStart) + "</td>"
							+ "<td align='center'>" + timeStampToTime(leaveEnd)
							+ "</td></tr>";
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