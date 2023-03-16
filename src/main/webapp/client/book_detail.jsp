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

		<div class='center'>
			<table class="book">
				<tr>
					<td colspan="3" align="left">
						<p id="book-title">${book.title}</p> by <span id="author">${book.author}</span>
					</td>
				</tr>
				<tr>
					<td rowspan="2"><img class="book-large"
						src="data:image/jpg;base64, ${book.base64Image}" /></td>
					<td valign="top" align="left"><jsp:directive.include
							file="book_rating.jsp" /> &nbsp;&nbsp; <a hred="#reviews">${fn:length(book.reviews)}
							Reviews</a></td>
					<td valign="top" rowspan="2" width="20%">
						<h2>$${book.price}</h2> <br />
					<br />
						<button id="buttonAddToCart">Thêm vào giỏ hàng</button>
					</td>
				</tr>
				<tr>
					<td id="description">${book.description}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><h2>
							<a id="reviews">Customer Reviews</a>
						</h2></td>
					<td colspan="2" align='center'>
						<button id="buttonWriteReview">Viết review</button>
					</td>
				</tr>

				<tr>
					<td colspan="3" align="left">
						<table class="normal">
							<c:forEach items="${book.reviews}" var="review">
								<tr>
									<td><c:forTokens items="${review.stars}" delims=","
											var="star">
											<c:if test="${star eq 'on'}">
												<img src="${pageContext.request.contextPath}/assets/images/rating_on.png" />
											</c:if>
											<c:if test="${star eq 'off'}">
												<img src="${pageContext.request.contextPath}/assets/images/rating_off.png" />
											</c:if>
										</c:forTokens> - <b>${review.headline}</b></td>
								</tr>
								<tr>
									<td>by ${review.customer.fullname} on ${review.reviewTime}</td>
								</tr>
								<tr>
									<td><i>${review.comment}</i></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>

			</table>
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

	<script type="text/javascript">
		$(document).ready(function() {
			$("#buttonWriteReview").click(function() {
				window.location = "write_review?book_id=" + ${book.bookId};
			});

			$("#buttonAddToCart").click(function() {
				window.location = "add_to_cart?book_id=" + ${book.bookId};
			});
		});
	</script>
</body>
</html>