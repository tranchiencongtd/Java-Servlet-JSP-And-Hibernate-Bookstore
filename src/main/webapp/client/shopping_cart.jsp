<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
<link
	href="${pageContext.request.contextPath}/assets/client/sass/style.css"
	rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<title>Tiki - Mua hàng online giá tốt, hàng chuẩn, ship nhanh</title>
</head>
<body>
	<div id="main">
		<jsp:directive.include file="header.jsp" />

		<div align="center">
			<h2>Giỏ hàng</h2>

			<c:if test="${message != null}">
				<div align="center">
					<h4 class="message">${message}</h4>
				</div>
			</c:if>

			<c:set var="cart" value="${sessionScope['cart']}" />

			<c:if test="${cart.totalItems == 0}">
				<h2>Không có sản phẩm nào trong giỏ hàng.</h2>
			</c:if>

			<c:if test="${cart.totalItems > 0}">

				<form action="update_cart" method="post" id="cartForm">
					<div>
						<table border="1">
							<tr>
								<th>No</th>
								<th colspan="2">Book</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Subtotal</th>
								<th></th>
							</tr>
							<c:forEach items="${cart.items}" var="item" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td><img class="book-small"
										src="data:image/jpg;base64, ${item.key.base64Image}" /></td>
									<td><span id="book-title">${item.key.title}</span></td>
									<td><input type="hidden" name="bookId"
										value="${item.key.bookId}" /> <input type="text"
										name="quantity${status.index + 1}" value="${item.value}"
										size="5" /></td>
									<td><fmt:formatNumber value="${item.key.price}" type="currency" /></td>
									<td><fmt:formatNumber value="${item.value * item.key.price}" type="currency" /></td>
									<td><a href="remove_from_cart?book_id=${item.key.bookId}">Remove</a></td>
								</tr>
							</c:forEach>

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><b>${cart.totalQuantity} book(s)</b></td>
								<td>Total:</td>
								<td><b><fmt:formatNumber value="${cart.totalAmount}" type="currency" /></b></td>
							</tr>
						</table>
					</div>
					<div>
						<table class="normal">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td></td>
								<td><button type="submit">Update</button></td>
								<td><input type="button" id="clearCart" value="Clear Cart" /></td>
								<td><a href="${pageContext.request.contextPath}/">Continue
										Shopping</a>
								<td>
								<td><a href="checkout">Checkout</a></td>
							</tr>
						</table>
					</div>
				</form>

			</c:if>

		</div>

		<jsp:directive.include file="footer.jsp" /></div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#clearCart").click(function() {
				window.location = "clear_cart";
			});
		});
	</script>
</body>
</html>
</html>