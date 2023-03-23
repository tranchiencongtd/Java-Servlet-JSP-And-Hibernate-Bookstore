<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" type="image/png"
	href="https://salt.tikicdn.com/media/upload/2018/12/03/0054c1410e38f1b9f3609c244974dd9c.png"
	sizes="32x32" />
<link rel="icon" type="image/png"
	href="https://salt.tikicdn.com/media/upload/2018/12/03/8bd2f9756646e32ebb076b2f6b050380.png"
	sizes="16x16" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" />
<link href="${pageContext.request.contextPath}/assets/client/sass/style.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Tiki - Mua hàng online giá tốt, hàng chuẩn, ship nhanh</title>
<style>
	.img-box p {
		margin-bottom: 0 !important;
	}
</style>
</head>
<body>
	<div id="main">
		<jsp:directive.include file="header.jsp" />

  <!-- Product new -->
	<div class="home-deal" style="margin-top: 10px">
      <div class="home-deal-content">
        <div class="header-home-deal">
          <div class="img-box">
            <img src="https://frontend.tikicdn.com/_desktop-next/static/img/giasoc.svg" alt="" class="price_shock"
              style="width: 98px; height: 28px" />
            <img src="https://frontend.tikicdn.com/_desktop-next/static/img/flash.gif" alt="" class="lightning"
              style="max-width: 100%; height: 28px" />
            <img src="https://frontend.tikicdn.com/_desktop-next/static/img/homnay.svg" alt="" class="today"
              style="width: 98px; height: 28px" />
          </div>
        </div>
      </div>
      <div class="body">
        <div class="silder-wrapper">
          <div class="silder-wrapper-content">
            <p href="#" class="slick-prev">
              <span class="icon-wrap">
                <img src="${pageContext.request.contextPath}/assets/client/img/home_deal/next_icon.png" alt="icon-prev"
                  style="width: 32px; height: 56px; transform: rotate(180deg)" />
              </span>
            </p>
            
            <div class="slick-list">
              <div class="slick-track">
	             	 <c:forEach items="${listNewBooks}" var="book">
					          <jsp:directive.include file="book_group.jsp" />
					       </c:forEach>
               </div>
              </div>
   
            <p class="slick-next">
              <span class="icon-wrap">
                <img src="${pageContext.request.contextPath}/assets/client/img/home_deal/next_icon.png" alt="icon-next" style="width: 32px; height: 56px" />
              </span>
            </p>
          </div>
        </div>
      </div>
 	</div>
    
	 <!-- Best selling -->
	<div class="home-deal">
      <div class="home-deal-content">
        <div class="header-home-deal">
          <div class="img-box">
             <p style="font-weight: 700;
									    font-size: 16px;
									    line-height: 150%;
									    color: rgb(39, 39, 42);
									    display: flex;
									    -webkit-box-align: center;
									    align-items: center;">
    				Sách bán chạy</p>
          </div>
        </div>
      </div>
      <div class="body">
        <div class="silder-wrapper">
          <div class="silder-wrapper-content">
            <p href="#" class="slick-prev">
              <span class="icon-wrap">
                <img src="${pageContext.request.contextPath}/assets/client/img/home_deal/next_icon.png" alt="icon-prev"
                  style="width: 32px; height: 56px; transform: rotate(180deg)" />
              </span>
            </p>
            
            <div class="slick-list">
              <div class="slick-track">
	             	 <c:forEach items="${listBestSellingBooks}" var="book">
					          <jsp:directive.include file="book_group.jsp" />
					       </c:forEach>
               </div>
              </div>
   
            <p class="slick-next">
              <span class="icon-wrap">
                <img src="${pageContext.request.contextPath}/assets/client/img/home_deal/next_icon.png" alt="icon-next" style="width: 32px; height: 56px" />
              </span>
            </p>
          </div>
        </div>
      </div>
 	</div>
    
	<!-- Favor book -->
	<div class="home-deal">
      <div class="home-deal-content">
        <div class="header-home-deal">
          <div class="img-box">
            <p style="font-weight: 700;
									    font-size: 16px;
									    line-height: 150%;
									    color: rgb(39, 39, 42);
									    display: flex;
									    -webkit-box-align: center;
									    align-items: center;">
    				Sách yêu thích</p>
          </div>
        </div>
      </div>
      <div class="body">
        <div class="silder-wrapper">
          <div class="silder-wrapper-content">
            <p href="#" class="slick-prev">
              <span class="icon-wrap">
                <img src="${pageContext.request.contextPath}/assets/client/img/home_deal/next_icon.png" alt="icon-prev"
                  style="width: 32px; height: 56px; transform: rotate(180deg)" />
              </span>
            </p>
            
            <div class="slick-list">
              <div class="slick-track">
	             	 <c:forEach items="${listMostFavoredBooks}" var="book">
					          <jsp:directive.include file="book_group.jsp" />
					       </c:forEach>
               </div>
              </div>
   
            <p class="slick-next">
              <span class="icon-wrap">
                <img src="${pageContext.request.contextPath}/assets/client/img/home_deal/next_icon.png" alt="icon-next" style="width: 32px; height: 56px" />
              </span>
            </p>
          </div>
        </div>
      </div>
 	</div>
    

   	<jsp:directive.include file="footer.jsp" />
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script src="./assets/client/js/header.js"></script>
	<script src="./assets/client/js/simple_slider.js"></script>
	<script src="./assets/client/js/sliders.js"></script>
	<!-- <script src="./assets/client/js/timer.js"></script> -->
	<script src="./assets/client/js/slider_deals.js"></script>
	<script src="./assets/client/js/slider_cdn.js"></script>
	<script src="./assets/client/js/sticky.js"></script>
	<script src="./assets/client/js/tabs.js"></script>
	<script src="./assets/client/js/check_tel_log_in.js"></script>
</body>
</html>