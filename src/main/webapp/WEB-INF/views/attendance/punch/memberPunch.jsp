<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>打卡系統</title>
<link href="${pageContext.request.contextPath}/css/attendance-form.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/dist/css/vendor.bundle.base.css"
	rel="stylesheet" media="all" />
<link href="${pageContext.request.contextPath}/dist/css/style.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/dist/css/themify-icons.css"
	rel="stylesheet" media="all" />
<link rel="shortcut icon" href="/dist/images/favicon.png" />
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container-fluid row">
		<div class="card col-md-2">
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">

					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#punch" aria-expanded="false"
						aria-controls="punch"> <i class="ti-user menu-icon"></i> <span
							class="menu-title">打卡系統</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="punch">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/attendance/punch/memberPunch">
										打卡紀錄查詢 </a></li>
							</ul>
						</div></li>

					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#leave" aria-expanded="false"
						aria-controls="leave"> <i class="ti-user menu-icon"></i> <span
							class="menu-title">請假系統</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="leave">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/attendance/leave/memberInsertLeave">
										新增請假紀錄 </a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/attendance/leave/memberLeave">
										請假記錄查詢</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</div>
		<div class="main-panel col-md-10">
			<div class="contnt-wrapper ">
				<div class="row justify-content-center">
					<div class="card col-md-12">
						<!-- 		<div> -->
						<div class="card-header text-white" style='background: #646D73'>
							<!-- 			<div class="text-white" style='background: #646D73'> -->
							<div class="form-group row">
								<div class="col-md-4 text-md-left">
									<strong><h1>打卡紀錄表</h1></strong>
								</div>
								<div class="col-md-6 text-md-right">
									<h3 id="Date"></h3>
								</div>
							</div>
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
						</div>
						<!-- 			<div> -->
						<div class="card-body">
							<div class="form-group row">
								<div class="col-md-3 text-md-right">
									<h3>使用者：</h3>
								</div>
								<div class="col-md-3 text-md-left">
									<h3>${memberBean.memberName}</h3>
								</div>
								<div class="col-md-3 text-md-right">
									<h3>選擇年月份：</h3>
								</div>
								<div class="col-md-3">
									<select style='font-size: 20px;' id='dateselect'></select>
								</div>
							</div>
							<div class="form-group row">
								<button class="btn btn-primary col-md-3"
									style='font-size: 20px;' onclick="location.href='punchWorkOn'">上班打卡</button>
								<button class="btn btn-primary col-md-3"
									style='font-size: 20px;' onclick="location.href='punchWorkOff'">下班打卡</button>
								<button class="btn btn-primary col-md-3"
									style='font-size: 20px;' id='btn_late'>遲到</button>
								<button class="btn btn-primary col-md-3"
									style='font-size: 20px;' id='btn_early'>早退</button>
							</div>
						</div>
						<div class="card-body">
							<!-- 			<div> -->
							<div align='center' id='tablearea'
								class='class="col-md-12 grid-margin stretch-card"'></div>
							<script>
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
				var content = "<table class='table table-hover border border-secondary'>";

				content += "<tr class='tm-tr-header' align='center'>"
						+ "<th align='center' width='140' style='font-size:30px;'>日期</th>"
						+ "<th align='center' width='140' style='font-size:30px;'>上班時間(09:00:00)</th>"
						+ "<th align='center' width='70' style='font-size:30px;'>遲到</th>"
						+ "<th align='center' width='140' style='font-size:30px;'>下班時間(18:00:00)</th>"
						+ "<th align='center' width='70' style='font-size:30px;'>早退</th>"
						+ "<th align='center' width='70' style='font-size:30px;'>上班時數</th></tr>";
				for (var i = 0; i < punchtimes.length; i++) {
					var punch = punchtimes[i];
// 					console.log(punch)
// 					console.log(punch.punchWokrOn)
					if(punchtimes[i].punchLate != null){
						countEarly ++;
					}
					if(punchtimes[i].punchLate != null){
						countLate ++;
					}
					content += "<tr>"
							+ "<td align='center' style='font-size:30px;'>"	+ timeStampToDate(punch.punchDate)	+ "</td>"
							+ "<td align='center' style='font-size:30px;'>"	+ chekWorkOn(punch.punchWorkOn) + "</td>"
							+ "<td id='punchLateTd" + i + "' align='center' style='font-size:30px;'>" + checkState(punchtimes[i].punchLate) + "</td>"
							+ "<td align='center' style='font-size:30px;'>"	+ chekWorkOff(punch.punchWorkOff) + "</td>"
							+ "<td id='punchEarly' align='center' style='font-size:30px;'>"	+ checkState(punchtimes[i].punchEarly) + "</td>"
							+ "<td align='center' style='font-size:30px;'>"	+ timeFn(checkZero(checkNull(punchtimes[i].punchHours))) + "</td></tr>";

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
							
							
					function checkNull(String){
						if (String == null){
							return '';
						}else{
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
						var datetime = new Date();
						datetime.setTime(date);
						var year = datetime.getFullYear();
						var month = ((datetime.getMonth() + 1) < 10 ? '0' : '') + (datetime.getMonth() + 1);
						var date = (datetime.getDate()<10 ? '0' : '') + datetime.getDate();
						var date = year + "-" + month + "-" + date;
						return date;
					};
		
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
				}
				content += "</table>";
				tablearea.innerHTML = content;
// 				console.log(countEarly);
// 				console.log(countLate);
			}
		</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>