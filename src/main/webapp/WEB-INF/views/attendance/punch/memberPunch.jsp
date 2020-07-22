<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>出勤系統</title>
<script language="JavaScript">
	function ShowTime(){
		var NowDate=new Date();
　		var h=NowDate.getHours();
　		var m=NowDate.getMinutes();
　		var s=NowDate.getSeconds();　
　		document.getElementById('showbox').innerHTML = h+'時'+m+'分'+s+'秒';
　		setTimeout('ShowTime()',1000);
}
</script>
</head>
<body onload="ShowTime()"	>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container" style="text-align: center">
		<h1>
			出勤系統
			<hr>
		</h1>
		<a href='<c:url value='/'/>'>返回首頁</a>
		<h4>使用者：${memberpunch[0].memberName}</h4><span id="showbox"></span>
<!-- 		<span><button id='manage' name='manage' style='display:none' onclick="location.href='queryPunchTime'">出勤管理</button></span> -->
	</div>
	<div align='center'>
		<button id='manage' name='manage' style='display:none' onclick="location.href='queryPunchTime'">出勤管理</button>
		<div class="container" align='center' style="text-align: center">
			<button onclick="location.href='punchWorkOn'">上班打卡</button>
			<button onclick="location.href='punchWorkOff'">下班打卡</button>
			<button onclick="location.href='memberInsertPunchTime'">新增紀錄</button>
		</div>
		選擇年月份：<select id='dateselect'></select>
		<!-- 顯示書籍資料的區域 -->
			<hr>
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
				xhr.open("GET","<c:url value='queryPunchTimeData' />?memberNumber="+ ${memberpunch[0].memberNumber} 
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
						"<c:url value='queryPunchTimeData' />?memberNumber="+ ${memberpunch[0].memberNumber} 
						+ "&selectdate=" + selectdate, true);
				// 			// 送出請求						
				xhr2.send();
			}
			

			
			function displayPagePunchTime(responseText) {
				var mapData = JSON.parse(responseText);
				var punchtimes = mapData.punchtimes;
				var content = "<table align='center' border='1'  bgcolor='#fbdb98'>";

				content += "<tr align='center'>"
						+ "<th align='center' width='70'>流水號</th>"
						+ "<th align='center' width='100'>姓名</th>"
						+ "<th align='center' width='100'>日期</th>"
						+ "<th align='center' width='140'>上班時間</th>"
						+ "<th align='center' width='70'>遲到</th>"
						+ "<th align='center' width='140'>下班時間</th>"
						+ "<th align='center' width='70'>早退</th></tr>";
				for (var i = 0; i < punchtimes.length; i++) {
					var punchday = punchtimes[i].punchDate; //or time=1439018115000; 结果一样
					console.log(timeStampToDate(punchday));
					var workOn = punchtimes[i].punchWorkOn;
					console.log(timeStampToTime(workOn));
					var workOff = punchtimes[i].punchWorkOff;
					console.log(punchtimes[i].punchWorkOff);
					console.log(timeStampToTime(workOff));
					console.log('-------------------------------------');

					content += "<tr ><td align='center'>" + punchtimes[i].punchId + "</a></td>"
							+ "<td align='center'>"	+ punchtimes[i].memberName	+ "</td>"
							+ "<td align='center'>"	+ timeStampToDate(punchday)	+ "</td>"
							+ "<td align='center'>"	+ timeStampToTime(workOn) + "</td>"
							+ "<td align='center'>"	+ punchtimes[i].punchLate + "</td>"
							+ "<td align='center'>"	+ timeStampToTime(workOff) + "</td>"
							+ "<td align='center'>"	+ punchtimes[i].punchEarly + "</td></tr>";
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
				if (time != null){					
					var datetime = new Date();
					datetime.setTime(time);
					var hour = datetime.getHours();
					var minute = datetime.getMinutes();
					var second = datetime.getSeconds();
					var time = hour + ":" + minute + ":" + second;
					return time;
				}else{
					return 'null';
				}
			}
		</script>
	</div>
</body>
</html>