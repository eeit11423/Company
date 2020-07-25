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
                          <td class="text-success"> ${TPp.value.countTest} <i class="ti-arrow-up"></i></td>
                          <td><label class="badge badge-danger">${Math.round(TPp.value.countTest * (TPp.value.price*0.9))}</label></td>
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
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card position-relative">
                <div class="card-body">
                  <p class="card-title">Detailed Reports</p>
                  <div class="row">
                    <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-center">
                      <div class="ml-xl-4">
                        <h1>33500</h1>
                        <h3 class="font-weight-light mb-xl-4">Sales</h3>
                        <p class="text-muted mb-2 mb-xl-0">The total number of sessions within the date range. It is the period time a user is actively engaged with your website, page or app, etc</p>
                      </div>  
                    </div>
                    <div class="col-md-12 col-xl-9">
                      <div class="row">
                        <div class="col-md-6 mt-3 col-xl-5">
                          <canvas id="north-america-chart"></canvas>
                          <div id="north-america-legend"></div>
                        </div>
                        <div class="col-md-6 col-xl-7">
                          <div class="table-responsive mb-3 mb-md-0">
                            <table class="table table-borderless report-table">
                              <tr>
                                <td class="text-muted">Illinois</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 20.3%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">524</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">Washington</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">722</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">Mississippi</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">173</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">California</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">945</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">Maryland</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">553</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">Alaska</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">912</h5></td>
                              </tr>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
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
		        	  console.log(th);
		        	  for (var i = 0; i < data.length; i++) {
		        		  var tr = table.insertRow(1+i);
		        		   var ProductType = tr.insertCell(0);
		        		   var ProductName = tr.insertCell(1);
		        		   var ProductNumber = tr.insertCell(2);
		        		   var PriceNumber = tr.insertCell(3);
		        			  ProductType.innerHTML=data[i][0];
		        			  ProductName.innerHTML=data[i][1];
		        			  $(ProductNumber).attr("class","text-success");
		        			  ProductNumber.innerHTML=data[i][2]+'<i class="ti-arrow-up"></i>';		        			  
		        			  PriceNumber.innerHTML="<label class='badge badge-danger'>"+data[i][3]+"</label>";		        			  
						}
		        	  
		          },error : function(data) {
		              console.log('');
		          }
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