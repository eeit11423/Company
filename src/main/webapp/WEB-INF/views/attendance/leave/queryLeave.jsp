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
	<div class="container" style="text-align: center;background-color:#dee2e6">
		<h1>
			查詢請假紀錄
			<hr>
		</h1>
		<a href='memberLeave'>回前頁</a>
		<a href='../punch/queryPunchTime'>出勤查詢</a>
		請挑選姓名: <select id='membername'></select> 選擇年月份：<select id='dateselect'></select>
	</div>
		<hr>
	<div align='center'>
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
			var xhr3 = new XMLHttpRequest(); // 讀取單一書籍的資料
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
			
			window.onload = function(){
				xhr3.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr3.status == 200) {
						displayPagePunchTime(xhr3.responseText);
					}
				}
				xhr3.open("GET","<c:url value='queryLeaveData'/>?memberNumber=all&selectdate=all", true);
				// 			// 送出請求						
				xhr3.send();
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
						+ "<th align='center' width='60'>流水號</th>"
						+ "<th align='center' width='100'>姓名</th>"
						+ "<th align='center' width='100'>部門</th>"
						+ "<th align='center' width='200'>日期</th>"
						+ "<th align='center' width='100'>假別</th>"
						+ "<th align='center' width='200'>請假開始</th>"
						+ "<th align='center' width='200'>請假結束</th>"
						+ "<th align='center' width='200'>原因</th>"
						+ "<th align='center' width='100'><a href='insertLeave'>新增</a></th>"
						+"</tr>";
				for (var i = 0; i < leave.length; i++) {
					var leaveDay = leave[i].leaveDate; //or time=1439018115000; 结果一样
					var leaveStart = leave[i].leaveStart;
					var leaveEnd = leave[i].leaveEnd;

					content += "<tr>"
							+ "<td align='center'>" + leave[i].leaveId + "</td>"
							+ "<td align='center'>" + leave[i].memberName + "</td>" 
							+ "<td align='center'>" + leave[i].memberDepartment + "</td>" 
							+ "<td align='center'>"	+ timeStampToDate(leaveDay) + "</td>"
							+ "<td align='center'>" + leave[i].leaveCategory + "</td>" 
							+ "<td align='center'>"	+ timeStampToTime(leaveStart) + "</td>"
							+ "<td align='center'>" + timeStampToTime(leaveEnd)	+ "</td>"
							+ "<td align='center'>" + leave[i].leaveCause + "</td>" 
							+ "<td align='center'><a href='leaveEdit/" + leave[i].leaveId 
							+ "'>更改</a>/<a href='deleteLeave/" + leave[i].leaveId  
							+ "' onclick='confirmDelete()';>刪除</a></td>";
							+"</tr>";
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
		 	function confirmDelete() {
	 			var result = confirm("確定刪除此筆記錄?");
	 			if (result) {
	 			return true;
	 			}
	 		return false;
	 		}
		</script>
	</div>
</body>
</html>