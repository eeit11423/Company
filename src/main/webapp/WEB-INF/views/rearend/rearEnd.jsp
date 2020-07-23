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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   
 


  <link rel="shortcut icon" href="/dist/images/favicon.png" />
</head>
<body>
	<jsp:include page="/fragment/headerRearend.jsp" />
       <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <h4 class="font-weight-bold mb-0">數據分析表</h4>
                </div>
                <div>
                    <button type="button" class="btn btn-primary btn-icon-text btn-rounded">
                      <i class="ti-clipboard btn-icon-prepend"></i>報表
                    </button>
                </div>
              </div>
            </div>
          </div>
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
        	
          </div>
          <div class="row">
            <div class="col-md-7 grid-margin stretch-card">
              <div class="card">
                <div class="card-body" style="hight:1px">
                  <form>
						<select name="YourLocation">
　					<option value="Taipei">熱門產品</option>
　					<option value="Taoyuan">熱門活動</option>
　					

					</select>
					</form>
                  <div class="table-responsive">
                
                    <table class="table table-hover">
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
                          <td><label class="badge badge-danger">${TPp.value.countTest * TPp.value.price}</label></td>
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
									<h4 class="card-title">等待新增產品</h4>
									<div class="list-wrapper pt-2">
										<ul class="d-flex flex-column-reverse todo-list todo-list-custom">
											<li>
												<div class="form-check form-check-flat">
													<label class="form-check-label">
														<input class="checkbox" type="checkbox">
														Become A Travel Pro In One Easy Lesson
													</label>
												</div>
												<i class="remove ti-trash"></i>
											</li>
											<li class="completed">
												<div class="form-check form-check-flat">
													<label class="form-check-label">
														<input class="checkbox" type="checkbox" checked>
														See The Unmatched Beauty Of The Great Lakes
													</label>
												</div>
												<i class="remove ti-trash"></i>
											</li>
											<li>
												<div class="form-check form-check-flat">
													<label class="form-check-label">
														<input class="checkbox" type="checkbox">
														Copper Canyon
													</label>
												</div>
												<i class="remove ti-trash"></i>
											</li>
											<li class="completed">
												<div class="form-check form-check-flat">
													<label class="form-check-label">
														<input class="checkbox" type="checkbox" checked>
														Top Things To See During A Holiday In Hong Kong
													</label>
												</div>
												<i class="remove ti-trash"></i>
											</li>
											<li>
												<div class="form-check form-check-flat">
													<label class="form-check-label">
														<input class="checkbox" type="checkbox">
														Travelagent India
													</label>
												</div>
												<i class="remove ti-trash"></i>
											</li>
										</ul>
                  </div>
                  <div class="add-items d-flex mb-0 mt-4">
										<input type="text" class="form-control todo-list-input mr-2"  placeholder="Add new task">
										<button class="add btn btn-icon text-primary todo-list-add-btn bg-transparent"><i class="ti-location-arrow"></i></button>
									</div>
								</div>
							</div>
            </div>
          </div>

        </div>
 <script>
 
 xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var members = JSON.parse(xhr.responseText);
			for (var aa in members) {
				if(members[aa][0]!="董事長"){
				member_Department.push(members[aa][0]);
				member_Salary.push(parseInt(members[aa][1]));
			
				}
			}
			}
			}
 </script>

 
 
 
 
  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/dist/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="${pageContext.request.contextPath}/dist/chart.js/Chart.min.js"></script>
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/dist/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/dist/js/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/dist/js/template.js"></script>
  <script src="${pageContext.request.contextPath}/dist/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/dist/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>
</html>