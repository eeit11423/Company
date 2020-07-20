<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
  <link rel="shortcut icon" href="/dist/images/favicon.png" />
</head>
<body>
 <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" ><img src="dist/images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" ><img src="dist/images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="ti-view-list"></span>
        </button>
        </div>
    </nav>
    </div>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="ti-shield menu-icon"></i>
              <span class="menu-title">曲線圖</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="ti-palette menu-icon"></i>
              <span class="menu-title">商品類</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="連結">商品1</a></li>
                <li class="nav-item"> <a class="nav-link" href="連結">商品2</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="連結">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">人員維護</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="連結">
              <i class="ti-pie-chart menu-icon"></i>
              <span class="menu-title">金額</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="連結">
              <i class="ti-view-list-alt menu-icon"></i>
              <span class="menu-title">訂單</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="連結">
              <i class="ti-star menu-icon"></i>
              <span class="menu-title">備用</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">備用</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 </a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 2 </a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 3</a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 4 </a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 5</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="documentation/documentation.html">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">備用</span>
            </a>
          </li>
        </ul>
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