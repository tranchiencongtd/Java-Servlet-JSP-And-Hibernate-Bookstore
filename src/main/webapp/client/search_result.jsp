<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
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
<link
	href="${pageContext.request.contextPath}/assets/client/sass/style.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Tiki - Mua hàng online giá tốt, hàng chuẩn, ship nhanh</title>
</head>
<body>
	<div id="main">
		<jsp:directive.include file="header.jsp" />

		<div align='center'>
			<c:if test="${fn:length(result) == 0}">
				<h2>No Results for "${keyword}"</h2>
			</c:if>
			<c:if test="${fn:length(result) > 0}">
				<div class="book-group">
					<center>
						<h2>Results for "${keyword}":</h2>
					</center>
					<c:forEach items="${result}" var="book">
						<div>
							<div id="search-image">
								<div>
									<a href="view_book?id=${book.bookId}"> <img
										class="book-small"
										src="data:image/jpg;base64, ${book.base64Image}" />
									</a>
								</div>
							</div>
							<div id="search-description">
								<div>
									<h2>
										<a href="view_book?id=${book.bookId}"> <b>${book.title}</b>
										</a>
									</h2>
								</div>
								<div>Rating *****</div>
								<div>
									<i>by ${book.author}</i>
								</div>
								<div>
									<p>${fn:substring(book.description, 0, 100)}...</p>
								</div>
							</div>
							<div id="search-price">
								<h3>$${book.price}</h3>
								<h3>
									<a href="">Add To Cart</a>
								</h3>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
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