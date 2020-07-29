<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
</head>
<body>
	<jsp:include page="/fragment/headerRearend.jsp" />
	 
       <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-3 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title text-md-center text-xl-left">員購營業額</p>
                  <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                    <c:forEach var='prices' items="${price}" >
                    
                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">${Math.round(prices)}</h3>
                    </c:forEach>
                    <i class="ti-calendar icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                  </div>  
                  <p style="white-space:pre" class="mb-0 mt-2 text-danger ">                             <span class="text-black ml-1"><small>TWD</small></span></p>
                </div>
              </div>
            </div>
            <div class="col-md-3 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title text-md-center text-xl-left">員工總人數</p>
                  <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                   <c:forEach var='MN' items="${peopleNumber}" >
                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">${MN}</h3>
                    </c:forEach>
                    <i class="ti-user icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                  </div>  
                  <p class="mb-0 mt-2 text-danger"><span class="text-black ml-1"><small></small></span></p>
                </div>
              </div>
            </div>
            <div class="col-md-3 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title text-md-center text-xl-left">商品總數</p>
                  <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                    <c:forEach var='PN' items="${priceNumber}" >
                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">${PN}</h3>
                    </c:forEach>
                    <i class="ti-agenda icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                  </div>  
                  <p class="mb-0 mt-2 text-success"><span class="text-black ml-1"><small></small></span></p>
                </div>
              </div>
            </div>
            <div class="col-md-3 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title text-md-center text-xl-left">薪水支出</p>
                  <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                    <c:forEach var='SA' items="${salary}" >
                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">${SA}</h3>
                     </c:forEach>
                    <i class="ti-layers-alt icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                  </div>  
                  <p class="mb-0 mt-2 text-success"><span class="text-black ml-1"><small></small></span></p>
                </div>
              </div>
            </div>
      
          </div>
        	
        
          <div class="row">
            <div class="col-md-7 grid-margin stretch-card">
              <div class="card">
                <div class="card-body" style="hight:1px">
               					<ul class="nav nav-tabs" id="mySelect" role="tablist" >
                                	<li class="nav-item" value="Taipei" onclick="ck('Taipei')">
                                    	<a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true" >熱門產品</a>
                                	</li>
                                	<li class="nav-item" value="Taoyuan" onclick="ck('Taoyuan')">
                                    	<a class="nav-link" id="specification-tab" data-toggle="tab" href="#specification" role="tab" aria-controls="specification" aria-selected="false" >熱門活動</a>
                                	</li>
                            	</ul>
<!-- 						<select id="mySelect" name="YourLocation" onchange="ck()"> -->
<!-- 　					<option value="Taipei">熱門產品</option> -->
<!-- 　					<option value="Taoyuan">熱門活動</option> -->
<!-- 　					 -->
<!-- 					</select> -->				
                  <div class="table-responsive">
                
                    <table class="table table-hover" id="tableaaajex">
                      <thead>
                        <tr>
                          <th>品項</th>
                          <th>產品名稱</th>
                          <th>總數</th>
                          <th>總金額</th>
                        </tr>
                        
                      </thead>
                      <tbody>
                   <c:forEach var='TPp' items="${ss}" >
                        <tr>
                      
                          <td>${TPp.value.shoppingType}</td>                             
                          <td>${TPp.value.shoppingProductName}</td>
                          <td class="text-danger"><h3> ${TPp.value.countTest} <svg width="1em" height="1em" viewBox="2 0 20 20" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" />
</svg></h3></td>
                          <td><label class="badge badge-danger"><b>${Math.round(TPp.value.countTest * (TPp.value.price*0.9))}</b></label></td>
                      </tr>
                      
                           </c:forEach>
<!--                         <tr> -->
<!--                           <td>Messsy</td> -->
<!--                           <td>Flash</td> -->
<!--                           <td class="text-danger"> 21.06% <i class="ti-arrow-down"></i></td> -->
<!--                           <td><label class="badge badge-warning">In progress</label></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>John</td> -->
<!--                           <td>Premier</td> -->
<!--                           <td class="text-danger"> 35.00% <i class="ti-arrow-down"></i></td> -->
<!--                           <td><label class="badge badge-info">Fixed</label></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>Peter</td> -->
<!--                           <td>After effects</td> -->
<!--                           <td class="text-success"> 82.00% <i class="ti-arrow-up"></i></td> -->
<!--                           <td><label class="badge badge-success">Completed</label></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>Dave</td> -->
<!--                           <td>53275535</td> -->
<!--                           <td class="text-success"> 98.05% <i class="ti-arrow-up"></i></td> -->
<!--                           <td><label class="badge badge-warning">In progress</label></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                           <td>Messsy</td> -->
<!--                           <td>Flash</td> -->
<!--                           <td class="text-danger"> 21.06% <i class="ti-arrow-down"></i></td> -->
<!--                           <td><label class="badge badge-info">Fixed</label></td> -->
<!--                         </tr> -->
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-5 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">等待處理事件</h4>
									<div class="list-wrapper pt-2">
										<ul class="d-flex flex-column-reverse todo-list todo-list-custom">
											<c:forEach var='mess' items="${message}">
											<c:if test="${mess.memberId == '0' }">
											<li>
												<div class="form-check form-check-flat">													
												<label class="form-check-label">
														<input class="checkbox" type="checkbox" onchange="UpMessage(${mess.messageId})" >
														${mess.message}
												</label>
												</div>
												<i class="remove ti-trash" onclick="remove(${mess.messageId})"></i>
											</li>
											</c:if>
											<c:if test="${mess.memberId == '1' }">
											<li class="completed">
												<div class="form-check form-check-flat">
													<label class="form-check-label">
															<input class="checkbox" type="checkbox" checked onchange="UpMessage(${mess.messageId})">
													 		 ${mess.message}
													</label>
							 					</div>
												<i class="remove ti-trash" onclick="remove(${mess.messageId})"></i>
											</li>
											</c:if>
									</c:forEach>
									</ul>
                 				    </div>
                 						 <div class="add-items d-flex mb-0 mt-4">
										<input id="inmessage"  type="text" class="form-control todo-list-input mr-2"  placeholder="新增事情">
										<button class="add btn btn-icon text-primary todo-list-add-btn bg-transparent" onclick="addmessage()">
										<i class="ti-location-arrow"></i></button>
									</div>
								</div>
							</div>
            </div>
            
          </div>
          <div class="row">
            <div class="col-md-7 grid-margin stretch-card">
              <div class="card">
                <div class="card-body" style="hight:1px">
			        <figure class="highcharts-figure">
			    	<div id="container"></div>
			    	<p class="highcharts-description">
			
			    	</p>
					</figure>
		
                 
                </div>
              </div>
            </div>
            <div class="col-md-5 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<figure class="highcharts-figure">
								    <div id="container1"></div>
								    <p class="highcharts-description">
								       
								    </p>
									</figure>							
							</div>
            </div>            
          </div>        
         </div>
         </div>
<script>
function UpMessage(id) {
	$.ajax({//AJAX開始
        url :"upmessage_ajax",
        type : "POST",       
        data: { messageId:id},
      
        success : function(data) 
        {
       	 
			
        },error: function(data) {
		
        }
    });
}

function remove(id){
	 $.ajax({//AJAX開始
         url :"removemessage_ajax",
         type : "POST",       
         data: { messageId:id},
       
         success : function(data) 
         {
        	 
		
         },error: function(data) {
		
         }
     });
}

 function addmessage(){
	 	 var message=$("#inmessage").val();
	 	 $.ajax({//AJAX開始
         url :"rearend/allmessage_ajax",
         type : "POST",       
         data: { addmessage:message },
       
         success : function(data) 
         {
        	 
		
         },error: function(data) {
		
         }
     });
}

 function ck(K) {//
// 	 var K = document.getElementById("mySelect").value;

	 var urlAJAX = "";
	 if (K == "Taoyuan") {
		 urlAJAX = "rearend/allActivity_ajax";
		 Taoyuana(urlAJAX);
	}else if(K == "Taipei"){
 		urlAJAX =  "rearend/allproductNO1_ajax";
 		Taipei(urlAJAX);
 	}
	 
	 function Taoyuana(urlAJAX) {
		 $("#tableaaajex  ").html("");
			var table = document.getElementById("tableaaajex");
			   $.ajax({//AJAX開始
			          url : urlAJAX,
			          type : "GET",
			          success : function(data) 
			          {
			        	  var th = table.insertRow(0);
			        	  var onename=th.insertCell(0);
			        	  var TWOname=th.insertCell(1);
			        	  onename.innerHTML="<b>活動名稱</b>"
			        	  TWOname.innerHTML="<b>報名人數</b>"
			        	  console.log(th);
			        	  
			        	  for (var i = 0; i < data.length; i++) {
			        		  var tr = table.insertRow(1+i);
			        		  var ActivityName = tr.insertCell(0);
			        		  var ActivityNumber = tr.insertCell(1);
			        		  ActivityName.innerHTML=data[i][0];
					          ActivityNumber.innerHTML=data[i][1]; 
							} 
			          },error: function(data) {
			              console.log('');
			          	}
			      });
		}   

		function Taipei(urlAJAX) {
			 console.log("FUCK");
			var table = document.getElementById("tableaaajex");
			 $.ajax({//AJAX開始
		          url : urlAJAX,
		          type : "GET",
		          success : function(data) 
		          {
		        	  $("#tableaaajex").html("");
		        	  var th = table.insertRow(0);
		        	  var Taipeith=th.insertCell(0);
		        	  var Taipei1=th.insertCell(1);
		        	  var Taipei2=th.insertCell(2);
		        	  var Taipei3=th.insertCell(3);
		        	  Taipeith.innerHTML="<b>項目</b>";
		        	  Taipei1.innerHTML="<b>產品名稱</b>";
		        	  Taipei2.innerHTML="<b>總數</b>";
		        	  Taipei3.innerHTML="<b>總金額</b>";
		        	  console.log(data);
		        	  for (var i = 0; i < data.length; i++) {
		        		  var tr = table.insertRow(1+i);
		        		   var ProductType = tr.insertCell(0);
		        		   var ProductName = tr.insertCell(1);
		        		   var ProductNumber = tr.insertCell(2);
		        		   var PriceNumber = tr.insertCell(3);
		        			  ProductType.innerHTML=data[i][0];
		        			  ProductName.innerHTML=data[i][1];
		        			  $(ProductNumber).attr("class","text-danger");

		        			  ProductNumber.innerHTML='<h3>'+data[i][2]+'<i class="ti-arrow-up"></i>'+'</h3>';		        			  
		        			  PriceNumber.innerHTML="<label class='badge badge-danger'>"+Math.round((data[i][3]*0.9)*data[i][2])+"</label>";		        			  

		        			  ProductNumber.innerHTML='<h3>'+data[i][2]+ "<svg width='1em' height='1em' viewBox='2 0 20 20' class='bi bi-caret-up-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>"+
		        			  "<path d='M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z'/>"+
		        				 "</svg>"+'</h3>';
		        			  
		        			  
		        			  
		        			 		        			  
		        			  PriceNumber.innerHTML="<label class='badge badge-danger'>"+(data[i][3]*0.9)*data[i][2]+"</label>";		        			  

						}
		        	  
		          },error : function(data) {
		              console.log('');
		          }
		      });
			}	
}
 var member_Ts = [];
 var member_Ss = [];
 var xhr = new XMLHttpRequest();
 var map1= new Map();
 xhr.open("GET", "<c:url value='shoppingtypeyS_ajax' />", true);
 xhr.send();
 xhr.onreadystatechange = function() {
 	if (xhr.readyState == 4 && xhr.status == 200) {
 		var members1 = JSON.parse(xhr.responseText);
 		for (var d in members1) { 			
			 member_Ts.push({name:members1[d][0],y:members1[d][1]});
// 			 member_Ss.push(parseInt(members1[d][1]));	
			// map1.set(members1[d][0],parseInt(members1[d][1]));
			// var map = [{ y: 20, name: "Medical Aid"},{y: 5, name: "Debt/Capital" }];
			//[{name: members1[0][0],y: 5,sliced: true,selected: true},{name: 'asa',y: 56,sliced: true,selected: true}]
}
 		
 
 		console.log(member_Ts);
 	
// 	圓型產品比例分布圖
 Highcharts.chart('container', {
	 credits: { enabled:false }, 
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: '各產品分類販賣比例'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '%'
	        }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: false
	            },
	            showInLegend: true
	        }
	    },
	    xAxis: {
	        name: member_Ts,
	    },
	    series: [{
	        name: 'Brands',
	        colorByPoint: true,
	        data:
	        	member_Ts
	        
	        
	        	//[{name: members1[0][0],y: 5},{name: 'asa',y: 56}]
	    }]
	});
	}
 }
 var member_T = [];
 var member_S = [];
 var xhr2 = new XMLHttpRequest();
 xhr2.open("GET", "<c:url value='shoppingtypey_ajax' />", true);
 xhr2.send();
 xhr2.onreadystatechange = function() {
 	if (xhr2.readyState == 4 && xhr2.status == 200) {
 		var members = JSON.parse(xhr2.responseText);
 		for (var d in members) { 			
 					 member_T.push(members[d][0])
 					 member_S.push(parseInt(members[d][1]));			
 		}
//  		console.log(member_S);
//3D產品分布圖	
 Highcharts.chart('container1', {
	 credits: { enabled:false }, 
	    chart: {
	        type: 'column',
	        options3d: {
	            enabled: true,
	            alpha: 10,
	            beta: 25,
	            depth: 70
	        }
	    },
	    title: {
	        text: '各類型產品銷售總額'
	    },
	    subtitle: {
	        text: ''
	    },
	    plotOptions: {
	        column: {
	            depth: 25
	        }
	    },
	    xAxis: {
	        categories: member_T,
	        labels: {
	            skew3d: true,
	            style: {
	                fontSize: '16px'
	            }
	        }
	    },
	    yAxis: {
	        title: {
	            text: null
	        }
	    },
	    series: [{
	        name: '各產品金額',
	        data: member_S
	    }]
	});
	}
 }
 </script>

        </div>
 
 
 
 
 

 

  <!-- endinject -->
  <!-- Custom js for this page-->

  <!-- End custom js for this page-->
</body>
</html>