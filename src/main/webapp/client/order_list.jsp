<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
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
			<h2 class="pageheading">Đơn đặt hàng của tôi</h2>
		</div>

		<c:if test="${fn:length(listOrders) == 0}">
			<div align="center">
				<h3>Bạn không có đơn đặt hàng nào.</h3>
			</div>
		</c:if>
		<c:if test="${fn:length(listOrders) > 0}">
			<div align="center">
				<table border="1" cellpadding="5">
					<tr>
						<th>STT</th>
						<th>Mã hóa đơn</th>
						<th>Số lượng</th>
						<th>Tổng</th>
						<th>Ngày đặt</th>
						<th>Trạng thái</th>
						<th>Hành động</th>
					</tr>
					<c:forEach var="order" items="${listOrders}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${order.orderId}</td>
							<td>${order.bookCopies}</td>
							<td><fmt:formatNumber value="${order.total}" type="currency" /></td>
							<td>${order.orderDate}</td>
							<td>${order.status}</td>
							<td><a href="show_order_detail?id=${order.orderId}">Xem chi tiết</a> &nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:if>

		<jsp:directive.include file="footer.jsp" />
	</div>
</body>
</html>