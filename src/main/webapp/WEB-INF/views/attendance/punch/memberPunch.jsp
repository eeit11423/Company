<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>出勤系統</title>
<link href="${pageContext.request.contextPath}/css/attendance-form.css"
	rel="stylesheet" />
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container"
		style="text-align: center; background-color: #dee2e6">
		<h1>
			出勤系統
			<hr>
		</h1>
		<button onclick="location.href='../../'">返回首頁</button>
		<button onclick="location.href='../leave/memberLeave'">請假系統</button>
		<div id="Date"></div>
		<h4>使用者：${memberpunch[0].memberName}</h4>

		<script type="text/javascript"> 
	function setClock(){
		var date=new Date(); //建立日期
		var year=date.getFullYear(); //获取当前年份 
		var mon=date.getMonth()+1; //获取当前月份 
		var da=(date.getDate()<10 ? '0' : '') + date.getDate(); //获取当前日 
		var day=date.getDay(); //获取当前星期几 
		var h=(date.getHours()<10 ? '0' : '') + date.getHours(); //获取小时 
		var m=(date.getMinutes()<10 ? '0' : '') + date.getMinutes(); //获取分钟 
		var s=(date.getSeconds()<10 ? '0' : '') + date.getSeconds(); //获取秒 
		var d=document.getElementById('Date'); 
		d.innerHTML='現在時間:'+year+'年'+mon+'月'+da+'日'+'星期'+day+' '+h+':'+m+':'+s;	}
	window.setInterval(setClock,1000);
	window.setInterval(setClock());

</script>
		<!-- 	<div class="container" align='center' > -->
		<div align='center'>
			<button id='manage' name='manage' style='display: none'
				onclick="location.href='queryPunchTime'">後台管理</button>
		</div>
		<div class="container" align='center' style="text-align: center">
			<button onclick="location.href='punchWorkOn'">上班打卡</button>
			<button onclick="location.href='punchWorkOff'">下班打卡</button>
			<button onclick="location.href='memberInsertPunchTime'">新增紀錄</button>
			<button id='btn_late'>遲到</button>
			<button id='btn_early'>早退</button>
		</div>
		選擇年月份：<select id='dateselect'></select>
		<hr>
	</div>
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
			var btn_late = document.getElementById("btn_late");
			var btn_early = document.getElementById("btn_early");
			var selectElement = document.getElementById('dateselect'); 
			var tablearea = document.getElementById('tablearea'); 
			var xhr = new XMLHttpRequest(); 
			var xhr2 = new XMLHttpRequest(); 
			var xhr3 = new XMLHttpRequest(); 
			var xhr4 = new XMLHttpRequest(); 

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
				// 			// 定義open方法
				var selectdate = selectElement.options[selectElement.selectedIndex].value;
				xhr2.open("GET",
						"<c:url value='queryPunchTimeData' />?memberNumber="+ ${memberpunch[0].memberNumber} 
						+ "&selectdate=" + selectdate, true);
				// 			// 送出請求						
				xhr2.send();
			}
			
			btn_late.onclick = function(){
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPagePunchTime(xhr3.responseText);
					}
				}
				var selectdate = selectElement.options[selectElement.selectedIndex].value;
			xhr3.open("GET",
					"<c:url value='queryPunchTimeDataByPunchLate' />?memberNumber="+ ${memberpunch[0].memberNumber} 
					+ "&selectdate=" + selectdate + "&punchLate=遲到", true);
			xhr3.send();
			}

			btn_early.onclick = function(){
				xhr3.onreadystatechange = function() {
					if (xhr3.readyState == 4 && xhr3.status == 200) {
						displayPagePunchTime(xhr3.responseText);
					}
				}
				var selectdate = selectElement.options[selectElement.selectedIndex].value;
			xhr3.open("GET",
					"<c:url value='queryPunchTimeDataByPunchEarly' />?memberNumber="+ ${memberpunch[0].memberNumber} 
					+ "&selectdate=" + selectdate + "&punchEarlt=早退", true);
			xhr3.send();
			}
			
			function displayPagePunchTime(responseText) {
				var mapData = JSON.parse(responseText);
				var punchtimes = mapData.punchtimes;
				var countLate = 0;
				var countEarly = 0;
				var content = "<table class='tm-responsive-table' align='center' border='1'  bgcolor='#fbdb98'>";

				content += "<tr class='tm-tr-header' align='center'>"
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
					if(punchtimes[i].punchLate != null){
						countEarly ++;
					}
					if(punchtimes[i].punchLate != null){
						countLate ++;
					}
					content += "<tr ><td align='center'>" + punchtimes[i].punchId + "</a></td>"
							+ "<td align='center'>"	+ punchtimes[i].memberName	+ "</td>"
							+ "<td align='center'>"	+ timeStampToDate(punchday)	+ "</td>"
							+ "<td align='center'>"	+ timeStampToTime(workOn) + "</td>"
							+ "<td align='center'>"	+ checkNull(punchtimes[i].punchLate) + "</td>"
							+ "<td align='center'>"	+ timeStampToTime(workOff) + "</td>"
							+ "<td align='center'>"	+ checkNull(punchtimes[i].punchEarly) + "</td></tr>";
				}
				content += "</table>";
				tablearea.innerHTML = content;
				console.log(countEarly);
				console.log(countLate);
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
				var month = datetime.getMonth() + 1;
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
		</script>
	</div>
</body>
</html>