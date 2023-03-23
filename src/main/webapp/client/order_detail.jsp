<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

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
			<c:if test="${order == null}">
				<div class="alert alert-danger" role="alert">Bạn ko có quyền
					để xem đơn đặt hàng này!</div>
			</c:if>

			<c:if test="${order != null}">
				<div class="alert alert-primary" role="alert">Mã đơn hàng:
					${order.orderId}</div>

				<jsp:directive.include file="../common/common_order_detail.jsp" />
			</c:if>
		</div>

		<jsp:directive.include file="footer.jsp" />
	</div>
</body>
</html>