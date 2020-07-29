<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>RoyalUI Admin</title>
   
 

<link href="${pageContext.request.contextPath}/dist/css/vendor.bundle.base.css" rel="stylesheet"  media="all" />
<link href="${pageContext.request.contextPath}/dist/css/style.css" rel="stylesheet"  media="all" />
<link href="${pageContext.request.contextPath}/dist/css/themify-icons.css" rel="stylesheet"  media="all" />
 
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/dist/images/favicon.png" />
</head>
<body>
 <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" ><img src="${pageContext.request.contextPath}/dist/images/logo.svg" class="mr-2" alt="logo"/></a>
    <a class="navbar-brand brand-logo-mini" ><img src="${pageContext.request.contextPath}/dist/images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="ti-view-list"></span>
        </button>
        </div>
    </nav>
    
    </div>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper" >
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">

        
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link" href="index.html"> -->
<!--               <i class="ti-shield menu-icon"></i> -->
<!--               <span class="menu-title">曲線圖</span> -->
<!--             </a> -->
<!--           </li> -->

          <li class="nav-item">
           <i class="menu-arrow"></i>
            <a class="nav-link" href="${pageContext.request.contextPath}/">
     <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">回首頁</span> 
            </a>
          </li>
     
         <li class="nav-item">
      <a class="nav-link" data-toggle="collapse" href="#index1" aria-expanded="false" aria-controls="index1">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">首頁圖片管理</span>
              <i class="menu-arrow"></i>
            </a>
             <div class="collapse" id="index1">
              <ul class="nav flex-column sub-menu">
             
               <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/index/add1">新增輪播圖面</a></li>
                <li class="nav-item"> <a  class="nav-link"  href="${pageContext.request.contextPath}/index/allindexUpdateDelete">修改編輯index資料</a></li>               
              </ul>
            </div>
              </li>
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic2">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">人員維護</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic2">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link"  href="${pageContext.request.contextPath}/register/add3">註冊會員</a></li>
                <li class="nav-item"> <a class="nav-link"  href="${pageContext.request.contextPath}/members">查詢所有會員</a></li>
                <li class="nav-item"> <a  class="nav-link"  href="${pageContext.request.contextPath}/Resignup">查詢離職會員</a></li>               
              </ul>
            </div>
          </li>
           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="ti-palette menu-icon"></i>
              <span class="menu-title">曲線圖</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/orderprice">數據分析</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/rearend/allSalary">人員分佈曲線圖</a></li>
              </ul>
            </div>
             	 </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic1">
              <i class="ti-view-list-alt menu-icon"></i>
              <span class="menu-title">商品類</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic1">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link"  href="${pageContext.request.contextPath}/products/add2">新增產品資料</a></li>
                <li class="nav-item"> <a  class="nav-link"  href="${pageContext.request.contextPath}/shopping/allProductsUpdateDelete">後台修改編輯產品資料</a></li>               
              </ul>
            </div>
              </li>            
 		  <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#attendance" aria-expanded="false" aria-controls="attendance">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">出勤管理</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="attendance">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/attendance/punch/insertPunchTime"> 新增打卡紀錄 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/attendance/punch/queryPunchTime"> 打卡記錄管理</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/attendance/leave/insertLeave"> 新增請假紀錄 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/attendance/leave/queryLeave"> 請假記錄管理</a></li>
              </ul>
            </div>
          </li>
           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#Training" aria-expanded="false" aria-controls="Training">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">課程</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="Training">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/trainProduct/add"> 新增課程 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/train/trainAllProductsDelete"> 修改與刪除 </a></li>
              
              </ul>
            </div>
          </li> 
                    
          
          
     
      </nav>

</body>
<script src="${pageContext.request.contextPath}/dist/base/vendor.bundle.base.js"></script>
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
</html>