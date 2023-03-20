<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
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
									<h2>Thêm sách cho đơn hàng có mã: ${order.orderId}</h2>
									<form action="add_book_to_order" method="post">
										<table>
											<tr>
												<td>Chọn sách:</td>
												<td><select name="bookId">
														<c:forEach items="${listBook}" var="book"
															varStatus="status">
															<option value="${book.bookId}">${book.title}-
																${book.author}</option>
														</c:forEach>
												</select></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>Số lượng</td>
												<td><select name="quantity" style="width: 100%">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
												</select></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td colspan="2" align="center"><input type="button"
													value="Lưu" class="btn btn-primary btn-user btn-block"
													id="btnsubmit" onclick="submitForm()"> <a
													type="button" class="btn btn-primary btn-user btn-block"
													id="buttonCancel"> Hủy </a></td>
											</tr>
										</table>
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
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
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
				$("#buttonCancel").click(function() {
					window.close();
				});
			});

			function submitForm() {
				// Get the first form with the name
				// Usually the form name is not repeated
				// but duplicate names are possible in HTML
				// Therefore to work around the issue, enforce the correct index
				var frm = document.getElementById("add_book_to_order");
				frm.submit(); // Submit the form
				frm.reset(); // Reset all form data
				return false; // Prevent page refresh
			}
		</script>
</body>
</html>