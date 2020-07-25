<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
>
<html>
<head>

<meta charset="UTF-8">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<title>Products</title>
</head>
<body>
<jsp:include page="/fragment/headerRearend.jsp" />
<div class="main-panel">
 <div class="content-wrapper">
   <div class="row">
      <div class="col-md-12 grid-margin stretch-card" >
       <div class="card">
         <div class="card-body" >
         	<figure class="highcharts-figure"> 
				<div id="container1"></div>
				<p class="highcharts-description"></p>
				<button id="inverted">橫條形統計圖</button>
				<button id="plain">長條圖</button>
				<button id="polar">圓餅圖</button>
			</figure>               
		  </div>
	   </div>
     </div>
   </div>
   <div class="row">
      <div class="col-md-12 grid-margin stretch-card">
       <div class="card">
         <div class="card-body" >
         	<figure class="highcharts-figure"> 
    			<div id="container" ></div>
    		</figure>
    		<p class="highcharts-description"></p>
    		<figure class="highcharts-figure">
    			<div id="container"></div>
			</figure>			          
		  </div>
	   </div>
     </div>
   </div>
  </div>
 </div>
 


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
			credits: { enabled:false },   //去掉右下角highchart.com
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
	chart.update({
	    chart: {
	        inverted: true,
	        polar: false
	    },
	    subtitle: {
	        text: '橫條形統計圖'
	    }
	});
}


var member_S = [];
var member_L = [];
var member_R = [];
var member_D = [];
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
					 member_D.push(members1[d][0])
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
			credits: { enabled:false },   //去掉右下角highchart.com
		    title: {
		        text: '部門男女人數'
		    },
		    xAxis: {
		        categories: member_D
		    },		    
		    yAxis:{
                title:{
                    text:'人數',
                    style: {
                         color: 'black'
                        
                     }
                },               
             },
		    labels: {
		        items: [{
		           
		            style: {
		                left: '50px',
		                top: '18px',
		                color: ( // theme
		                    Highcharts.defaultOptions.title.style &&
		                    Highcharts.defaultOptions.title.style.color
		                ) || 'black'
		            }
		        }]
		    },
		    series: [ {
		        type: 'column',
		        name: '總人數',
		        data: member_S,
		        color: "#5B4B00"
		    },{
		        type: 'column',
		        color:'#00AEAE',
		        name: '男生',
		        data: member_L
		    },  {
		        type: 'column',
		        color:'#FFAAD5',
		        name: '女生',
		        data: member_R
		    },
		 {
		        type: 'pie',
		        name: '',
		        data: [{
		            name: '男生總人數',
		            y: 13,
		            color: "#00AEAE" // Jane's color
		        }, {
		            name: '女生總人數',
		            y: 23,
		            color: "#FFAAD5" // John's color
		        }, {
		            name: '總人數',
		            y: 19,
		            color: "#5B4B00" // Joe's color
		        }],
		        center: [800,30],
		        size: 100,
		        
		        showInLegend: false,
		        dataLabels: {
		            enabled: false
		        }
		    }]
		});
// 	    Highcharts.chart('container', {
// 	        chart: {
// 	            type: 'pie',
// 	            options3d: {
// 	                enabled: true,
// 	                alpha: 45
// 	            }
// 	        },
// 	        title: {
// 	            text: '男女人數比例分佈圖'
// 	        },
// 	        subtitle: {
// 	            text: ''
// 	        },
// 	        plotOptions: {
// 	            pie: {
// 	                innerSize: 100,
// 	                depth: 45
// 	            }
// 	        },
// 	        series: [{
// 	            name: 'Delivered amount',
// 	            colors: [ '#00FF00', '#ACD6FF', '#FFC0CB'],
// 	            data: [
// 	                ['總人數', Ssum],
// 	                ['男生', Lsum],
// 	                ['女生', Rsum],
	      
// 	            ]
// 	        }]
// 	    });
		
			
 		}
}

	</script>
</body>
</html>
