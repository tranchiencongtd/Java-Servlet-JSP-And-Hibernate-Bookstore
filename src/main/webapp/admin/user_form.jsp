<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/assets/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/sb-admin-2.min.css"
	rel="stylesheet">
	
<style>
	.error {
		color: red; 
		font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    width: 100%;
	}
</style>	
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="topbar.jsp" />
				<!-- End Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
					</div>

					<!-- Content Row -->
					<div class="row">
						<div class="col-xl-3 col-md-6 mb-4"></div>
						<div class="col-xl-3 col-md-6 mb-4"></div>
						<div class="col-xl-3 col-md-6 mb-4"></div>

						<div class="col-xl-3 col-md-6 mb-4 text-right">
							<a href="#" class="btn btn-primary"> <span
								class="icon text-white-50"> </span> <span class="text"></span>
							</a>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Thêm mới</h1>
								</div>
								<form class="user" id="userForm" action="create_user" method="post">
									<div class="form-group">
										<input type="email" class="form-control form-control-user"
											name="email" id="email" aria-describedby="emailHelp" placeholder="Email">
									</div>

									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											name = "fullname" id="fullname" placeholder="Họ và tên">
									</div>

									<div class="form-group">
										<input type="password" class="form-control form-control-user"
											id="password" name="password" placeholder="Mật khẩu">
									</div>

										<button type="submit"
										class="btn btn-primary btn-user btn-block">
										Lưu </button>
										
										<a type="button"
										class="btn btn-primary btn-user btn-block" id="buttonCancel">
										Hủy </a>
									<hr>
								</form>
							</div>
						</div>
					</div>

					<!-- End Content Row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp" />
		</div>
		<!-- End Content Wrapper -->
	</div>
	<!-- End Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/assets/admin/vendor/jquery/jquery.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/assets/admin/vendor/jquery/jquery.validate.min.js">
	</script>
	
	<script
		src="${pageContext.request.contextPath}/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/sb-admin-2.min.js"></script>
	

	<script type="text/javascript">
		$(document).ready(function() {
			$("#userForm").validate({
				rules : {
					email : {
						required : true,
						email : true
					},
					fullname : "required",
					password : "required",
				},
				messages : {
					email : {
						required : "Please enter email",
						email : "Please enter an valid email address"
					},
					fullname : "Please enter full name",
					password : "Please enter password"
				}
			});

			$("#buttonCancel").click(function() {
				history.go(-1);
			});
		});
	</script>

</body>
</html>