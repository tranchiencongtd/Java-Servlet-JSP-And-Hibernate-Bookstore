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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style>
html, body {
	height: 100%;
}

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
	width: 330px;
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
</style>

</head>
<body>
	<div id="main">
		<jsp:include page="header.jsp" />
		<div class="global-container">
			<div class="card login-form">
				<div class="card-body">
					<h3 class="card-title text-center">Đăng nhập</h3>
					<div class="card-text">
						<c:if test="${message != null}">
							<div class="alert alert-primary" role="alert">${message}</div>
						</c:if>
						<form id="loginForm" action="login" method="post">
							<!-- to error: add class "has-danger" -->
							<div class="form-group">
								<label for="email">Email</label> 
								<input name="email" type="email" class="form-control form-control-sm" id="email" aria-describedby="emailHelp" />
							</div>
							<div class="form-group" style="margin-top: 10px">
								<label for="password">Mật khẩu</label> 
								<input name="password" type="password" class="form-control form-control-sm" id="password" />
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
							</div>

							<div class="sign-up">
								Bạn chưa có tài khoản? <a href="register">Tạo mới</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp" />

	</div>
	<script>
		function submitForm() {
			// Get the first form with the name
			// Usually the form name is not repeated
			// but duplicate names are possible in HTML
			// Therefore to work around the issue, enforce the correct index
			var frm = document.getElementById("loginForm");
			frm.submit(); // Submit the form
			frm.reset(); // Reset all form data
			return false; // Prevent page refresh
		}
	</script>

</body>
</html>