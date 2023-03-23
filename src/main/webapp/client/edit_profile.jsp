<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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

<style>
.global-container {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f5f5f5;
}

form {
	padding-top: 10px;
	font-size: 14px;
}

.card-title {
	font-weight: 300;
}

.btn {
	font-size: 14px;
	margin-top: 20px;
}

.login-form {
	width: 500px;
	margin: 20px;
}

.sign-up {
	text-align: center;
	padding: 20px 0 0;
}

.alert {
	margin-bottom: -30px;
	font-size: 13px;
	margin-top: 20px;
}

tr td {
  padding-top: 5px; 
}

td {
  display: block;
  width: 100%;
}

table {
	width: 100%;
}

tr {
width: 100%;
}

td input{
  width: 100%;
}

tr td:first-child {
	text-align: left;
}

</style>
	
</head>
<body>
	<div id="main">
		<jsp:include page="header.jsp" />

		<div class="global-container">
			<div class="card login-form">
				<div class="card-body">
					<h3 class="card-title text-center">Chỉnh sửa trang cá nhân</h3>
					<form action="update_profile" method="post" id="customerForm">

						<table>
							<tr>
								<td align="right">E-mail</td>
								<td align="left"><b>${loggedCustomer.email}</b> (Không thể thay đổi)</td>
							</tr>
							<tr>
								<td align="right">Họ và tên</td>
								<td align="left"><input class="form-control" type="text" id="fullName"
									name="fullName" size="45" value="${loggedCustomer.fullname}" /></td>
							</tr>

							<tr>
								<td align="right">SĐT</td>
								<td align="left"><input class="form-control" type="text" id="phone" name="phone"
									size="45" value="${loggedCustomer.phone}" /></td>
							</tr>
							<tr>
								<td align="right">Địa chỉ</td>
								<td align="left"><input class="form-control" type="text" id="address"
									name="address" size="45" value="${loggedCustomer.address}" /></td>
							</tr>
							<tr>
								<td align="right">Thành phố</td>
								<td align="left"><input class="form-control" type="text" id="city" name="city"
									size="45" value="${loggedCustomer.city}" /></td>
							</tr>
							<tr>
								<td align="right">Zip Code</td>
								<td align="left"><input class="form-control" type="text" id="zipCode"
									name="zipCode" size="45" value="${loggedCustomer.zipcode}" /></td>
							</tr>
							<tr>
								<td align="right">Đất nước</td>
								<td align="left"><select class="form-control" name="country" id="country">
										<c:forEach items="${mapCountries}" var="country">
											<option value="${country.value}"
												<c:if test="${loggedCustomer.country eq country.value}">selected='selected'</c:if>>${country.key}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><i>(Để password trống nếu bạn không muốn thay đổi)</i></td>
							</tr>
							<tr>
								<td align="right">Mật khẩu</td>
								<td align="left"><input class="form-control" type="password" id="password"
									name="password" size="45" /></td>
							</tr>
							<tr>
								<td align="right">Nhập lại mật khẩu</td>
								<td align="left"><input type="password"
									id="confirmpassword" name="confirmpassword" class="form-control" size="45" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							
						</table>

						<div class="text-center">
							<button type="submit" class="btn btn-primary btn-block">Cập nhật</button>
							<input type="button" class="btn btn-warning" onclick="history.go(-1);" value="Hủy" />
						</div>
					</form>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp" />

	</div>
</body>
</html>