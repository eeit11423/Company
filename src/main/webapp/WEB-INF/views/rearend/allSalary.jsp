<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/fragment/header.jsp" />
<html>
<head>

<meta charset="UTF-8">
<script src='//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script> 
<!-- <link rel="stylesheet" -->
<!--     href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/dist/css/adminlte.css'
	type="text/css" />
	<link rel='stylesheet'
	href='${pageContext.request.contextPath}/plugin/bootstrap/js/.css'
	type="text/js" />
	
<title>Products</title>
</head>
<body>

	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>員工資料</h1>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
<%-- 			<c:forEach var='ga' items='${graph}'> --%>




<%-- 			<input type="hidden" id="salary${ga.memberId}" value="${ga.memberSalary}"> --%>
<%-- 			<input type="hidden" id="name${ga.memberId}" value="${ga.memberName}"> --%>
			

<%-- 			</c:forEach> --%>
		
		</div>
		<figure class="highcharts-figure">
    <div id="container1"></div>
    <p class="highcharts-description">
     a
    </p>
	
    <button id="plain">長條圖</button>
    <button id="inverted">橫條形統計圖</button>
    <button id="polar">圓餅圖</button>
    <figure class="highcharts-figure">
    <div id="container"></div>
    <p class="highcharts-description">
     B
    </p>
</figure>
    <figure class="highcharts-figure">
    <div id="container"></div>

</figure>
</figure>
	</section>
	<script>
// 	var members = "${graph}";
// 	var mem = "${graph[0].getMemberName()}";
// 	console.log(mem);
// for (var a = 1; a <= 21; a++) {
// 	console.log("${graph[0].getMemberName()}");
// }

let member_Department = [];
var member_Salary = [];
var xhr = new XMLHttpRequest();
xhr.open("GET", "<c:url value='allSalary_ajax' />", true);
xhr.send();
xhr.onreadystatechange = function() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var members = JSON.parse(xhr.responseText);
		for (var aa in members) {
			if(members[aa][0]!="董事長"){
			member_Department.push(members[aa][0]);
			member_Salary.push(parseInt(members[aa][1]));
		
			}
		}
		

// 		console.log(member_Salary);
// 		console.log(member_Department);
// 		for(var i=0; i <= members.length; i++){
// // 			console.log(members[i]);
			
// 			 //last = members[i].pop();
// 			 s = members[i];
// 			for ( var Department in s) {
// 				console.log(s[Department]);
// 			}
// 			//console.log(last);
// // 			for (var a = 0; a < s.length; a++) {
// // 				console.log(s[a]);
// // 			}
			
// 			//member_Department.push(s);
// 		}
		var chart = Highcharts.chart('container1', {

		    title: {
		        text: '部門總額'
		    },

		    subtitle: {
		        text: 'Plain'
		    },

		    xAxis: {
		    	
		    	categories:member_Department
		    		 
		    		
		    },

		    series: [{
		        type: 'column',
		        colorByPoint: true,
		        
		        data: member_Salary,
		        showInLegend: false
		    }]

		});


		$('#plain').click(function () {
		    chart.update({
		        chart: {
		            inverted: false,
		            polar: false
		        },
		        subtitle: {
		            text: '長條圖'
		        }
		    });
		});

		$('#inverted').click(function () {
		    chart.update({
		        chart: {
		            inverted: true,
		            polar: false
		        },
		        subtitle: {
		            text: '橫條形統計圖'
		        }
		    });
		});

		$('#polar').click(function () {
		    chart.update({
		        chart: {
		            inverted: false,
		            polar: true
		        },
		        subtitle: {
		            text: '圓餅圖'
		        }
		    });
		});
	}
}

var member_S = [];
var member_L = [];
var member_R = [];

var Lsum=0;
var Rsum=0;
var Ssum=0;
var xhr2 = new XMLHttpRequest();
xhr2.open("GET", "<c:url value='allSpeople_ajax' />", true);
xhr2.send();
xhr2.onreadystatechange = function() {
	if (xhr2.readyState == 4 && xhr2.status == 200) {
		var members1 = JSON.parse(xhr2.responseText);
		for (var d in members1) {
				if(members1[d][0]!="董事長"){
					 member_S.push(parseInt(members1[d][1]));
					 member_L.push(parseInt(members1[d][2]));
					 member_R.push(parseInt(members1[d][3]));
					
						
				}
				
		}
		for (var i = 0; i < member_L.length; i++) {
	        Lsum += member_L[i];
	        Rsum += member_R[i];
	        Ssum += member_S[i];
	        
	    };
	    console.log(members1);
	    console.log(Lsum);
		//console.log(member_L);
		console.log(Rsum);
		console.log(Ssum);
		//console.log(member_S);
	 // Build the chart

	    Highcharts.chart('container', {
	        chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45
	            }
	        },
	        title: {
	            text: 'Contents of Highsoft\'s weekly fruit delivery'
	        },
	        subtitle: {
	            text: '3D donut in Highcharts'
	        },
	        plotOptions: {
	            pie: {
	                innerSize: 100,
	                depth: 45
	            }
	        },
	        series: [{
	            name: 'Delivered amount',
	            colors: [ '#00FF00', '#ACD6FF', '#FFC0CB'],
	            data: [
	                ['總人數', Ssum],
	                ['男生', Lsum],
	                ['女生', Rsum],
	      
	            ]
	        }]
	    });
		
			
 		}
}

	</script>
</body>
</html>
