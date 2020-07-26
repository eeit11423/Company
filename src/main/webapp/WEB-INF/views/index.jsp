<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>付酬者有限公司員工內部網</title>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />

  <section class="container-fluid">
        <div class="row">
            <div id="carouselBanner" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselBanner" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselBanner" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="./images/slider_3.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block text-light">
                        
                            
                     
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="./images/slider_2.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h2>廠房設備</h2>
                            <p style="font-size: 18pt">高專業的製造能力</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselBanner" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselBanner" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>
    
    <!-- 頁腳/start -->
    <footer class="bg-dark">
        <div class="container pt-3 pb-3">
            <div class="row">
                <!-- 版權所有/start -->
                <div class="col-12 mt-3">
                    <p class="text-white text-center" style="font-size: 20pt">© Copyright 2020 付酬者有限公司</p>
                </div>
                <!-- 版權所有/end -->
            </div>
        </div>
    </footer>
</body>
</html>