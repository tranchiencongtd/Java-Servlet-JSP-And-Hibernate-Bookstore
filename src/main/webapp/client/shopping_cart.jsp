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

<style>
th {
	color: #38383d;
	font-weight: normal;
}
</style>
</head>
<body>
	<div id="main">
		<jsp:directive.include file="header.jsp" />

		<div class="container-fix">
			<h1 class="display-6 mb-5">Giỏ hàng của bạn</h1>

			<c:if test="${message != null}">
				<div class="alert alert-warning" role="alert">${message}.</div>
			</c:if>

			<c:set var="cart" value="${sessionScope['cart']}" />

			<c:if test="${cart.totalItems == 0}">
				<div class="alert alert-primary" role="alert">Không có sản
					phẩm nào trong giỏ hàng.</div>
			</c:if>

			<c:if test="${cart.totalItems > 0}">

				<form action="update_cart" method="post" id="cartForm">
					<div>
						<table class="table">
							<tr>
								<th>STT</th>
								<th colspan="2">Sản phẩm</th>
								<th>Số lượng</th>
								<th>Giá</th>
								<th>Thành tiền</th>
								<th><span id="clearCart" style="cursor: pointer"><img
										src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/trash.svg"
										alt="deleted"></span></th>
							</tr>
							<c:forEach items="${cart.items}" var="item" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td><img class="book-small"
										style="width: 183px; height: 183px;"
										src="data:image/jpg;base64, ${item.key.base64Image}" /></td>
									<td><span id="book-title">${item.key.title}</span></td>
									<td><input type="hidden" name="bookId"
										value="${item.key.bookId}" /> <input type="text"
										name="quantity${status.index + 1}" value="${item.value}"
										size="5" /></td>
									<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
											value="${item.key.price}" type="currency" /></td>
									<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
											value="${item.value * item.key.price}" type="currency" /></td>
									<td><a href="remove_from_cart?book_id=${item.key.bookId}"><img
											src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/trash.svg"
											alt="deleted"></a></td>
								</tr>
							</c:forEach>

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td>Tổng SL: ${cart.totalQuantity}</td>
								<td>Tổng tiền:</td>
								<td><b class="price-color"><fmt:formatNumber
											value="${cart.totalAmount}" type="currency" /></b></td>
								<td></td>
							</tr>
						</table>
					</div>

					<div
						style="display: flex; justify-content: space-between; align-items: center">
						<div>
							<a class="highlighter-rouge"
								style="font-size: 87.5%; color: #e83e8c; word-break: break-word;"
								href="${pageContext.request.contextPath}/">← Tiếp tục mua sắm</a>
								
							<button style="margin-left: 20px" type="submit" class="btn btn-dark">Cập nhật giỏ
								hàng</button>
						</div>

						<div>
							<a href="checkout"
								style="color: rgb(255, 255, 255); background-color: rgb(255, 57, 69); cursor: pointer; display: flex; -webkit-box-align: center; align-items: center; -webkit-box-pack: center; justify-content: center; min-width: 190px; width: 100%; max-width: 300px; height: 48px; font-size: 15px; line-height: 24px; font-weight: 500; text-transform: capitalize; border: none; border-radius: 4px; outline: none;">THANH
								TOÁN</a>
						</div>

					</div>
				</form>

			</c:if>

		</div>

		<jsp:directive.include file="footer.jsp" /></div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#clearCart").click(function() {
				window.location = "clear_cart";
			});
		});
	</script>
	</ body>
</html>
</html>