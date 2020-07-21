<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%-- <link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" /> --%>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>查詢出勤紀錄</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container" style="text-align: center">
		<h1>
			公司員工出勤紀錄
			<hr>
		</h1>
	</div>
	<div align='center'>
		請挑選姓名: <select id='membername'></select> 選擇年月份：<select id='dateselect'></select>
		<hr>
		<a href='memberPunch'>回前頁</a>
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
					jQuery("#membername").prepend("<option value='all'>all</option>");
					console.log(selectElement)
// 					    selectElement.options.unshift(['all', 'all']);
					var dateselect = [
							['all'],
							['2020-1'],['2020-2'], ['2020-3',],
							['2020-4'], ['2020-5'],['2020-6'], 
							['2020-7'],['2020-8'], ['2020-9'],
							['2020-10'], ['2020-11'],[ '2020-12'] ];
					for (var i = 0; i < dateselect.length; i++) {
						var option2 = new Option(dateselect[i]);
						selectElement2.options[selectElement2.options.length] = option2;
					}

				}
			}
			xhr.open("GET", "<c:url value='getAllMember'/>", true);
			xhr.send();
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
						"<c:url value='queryPunchTimeData' />?memberNumber="
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
						"<c:url value='queryPunchTimeData' />?memberNumber="
								+ memberNumber + "&selectdate=" + selectdate,
						true);
				// 			// 送出請求						
				xhr2.send();
			}

			function displayPagePunchTime(responseText) {
				var mapData = JSON.parse(responseText);
				var punchtimes = mapData.punchtimes;
				var content = "<table align='center' border='1'  bgcolor='#fbdb98'>";

				content += "<tr align='center'>"
						+ "<th align='center' width='40'><a href='insertPunchTime'>新增</a></th>"
						+ "<th align='center' width='70'>姓名</th>"
						+ "<th align='center' width='140'>日期</th>"
						+ "<th align='center' width='140'>上班時間</th>"
						+ "<th align='center' width='70'>遲到</th>"
						+ "<th align='center' width='200'>下班時間</th>"
						+ "<th align='center' width='70'>早退</th>"
						+ "<th align='center' width='70'>編輯</th></tr>";
				for (var i = 0; i < punchtimes.length; i++) {
					var punchday = punchtimes[i].punchDate; //or time=1439018115000; 结果一样
					console.log(timeStampToDate(punchday));
					var workOn = punchtimes[i].punchWorkOn;
					console.log(timeStampToTime(workOn));
					var workOff = punchtimes[i].punchWorkOff;
					console.log(timeStampToTime(workOff));
					console.log('-------------------------------------');

					content += "<tr><td align='center'>" + punchtimes[i].punchId	+ "</td>"
							+ "<td align='center'>"	+ punchtimes[i].memberName + "</td>"
							+ "<td align='center'>"	+ timeStampToDate(punchday)	+ "</td>"
							+ "<td align='center'>"	+ timeStampToTime(workOn) + "</td>"
							+ "<td align='center'>"	+ punchtimes[i].punchLate + "</td>"
							+ "<td align='center'>" + timeStampToTime(workOff) + "</td>"
							+ "<td align='center'>"	+ punchtimes[i].punchEarly + "</td>"
							+ "<td align='center'><a href='punchTimeEdit/" + punchtimes[i].punchId + "'>更改</a>/<a href='deletePunchTime/" + punchtimes[i].punchId  + "'>刪除</a></td></tr>";
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