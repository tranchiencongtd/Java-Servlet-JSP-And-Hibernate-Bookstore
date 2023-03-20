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
								<div align="center">
									<h2 class="pageheading">Mã đơn hàng chỉnh sửa: ${order.orderId}</h2>
								</div>

								<c:if test="${message != null}">
									<div align="center">
										<h4 class="message">${message}</h4>
									</div>
								</c:if>

								<form action="update_order" method="post" id="orderForm">
									<div align="center">
										<table>
											<h2>Order Overview:</h2>
											<tr>
												<td><b>Ordered By: </b></td>
												<td>${order.customer.fullname}</td>
											</tr>
											<tr>
												<td><b>Order Date: </b></td>
												<td>${order.orderDate}</td>
											</tr>
											<tr>
												<td><b>Payment Method: </b></td>
												<td><select name="paymentMethod">
														<option value="Cash On Delivery"
															<c:if test="${order.paymentMethod eq 'Cash On Delivery'}">selected='selected'</c:if>>Cash
															On Delivery</option>
														<option value="paypal"
															<c:if test="${order.paymentMethod eq 'paypal'}">selected='selected'</c:if>>PayPal
															or Credit card</option>
												</select></td>
											</tr>
											<tr>
												<td><b>Order Status: </b></td>
												<td><select name="orderStatus">
														<option value="Processing"
															<c:if test="${order.status eq 'Processing'}">selected='selected'</c:if>>Processing</option>
														<option value="Shipping"
															<c:if test="${order.status eq 'Shipping'}">selected='selected'</c:if>>Shipping</option>
														<option value="Delivered"
															<c:if test="${order.status eq 'Delivered'}">selected='selected'</c:if>>Delivered</option>
														<option value="Completed"
															<c:if test="${order.status eq 'Completed'}">selected='selected'</c:if>>Completed</option>
														<option value="Cancelled"
															<c:if test="${order.status eq 'Cancelled'}">selected='selected'</c:if>>Cancelled</option>
												</select></td>
											</tr>
										</table>
										<h2>Thông tin người nhận</h2>
										<table>
											<tr>
												<td><b>Tên người nhận: </b></td>
												<td><input type="text" name="fullname" id="fullname"
													value="${order.recipientName}" size="45" /></td>
											</tr>
											<tr>
												<td><b>SĐT: </b></td>
												<td><input type="text" name="phone" id="phone"
													value="${order.recipientPhone}" size="45" /></td>
											</tr>
											<tr>
												<td><b>Địa chỉ: </b></td>
												<td><input type="text" name="address" id="address"
													value="${order.shippingAddress}" size="45" /></td>
											</tr>								
										</table>
									</div>
									<div align="center">
										<h2>Ordered Books</h2>
										<table border="1">
											<tr>
												<th>Index</th>
												<th>Book Title</th>
												<th>Author</th>
												<th>Price</th>
												<th>Quantity</th>
												<th>Subtotal</th>
												<th></th>
											</tr>
											<c:forEach items="${order.orderDetails}" var="orderDetail"
												varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td>${orderDetail.book.title}</td>
													<td>${orderDetail.book.author}</td>
													<td><input type="hidden" name="price"
														value="${orderDetail.book.price}" /> <fmt:formatNumber
															value="${orderDetail.book.price}" type="currency" /></td>
													<td><input type="hidden" name="bookId"
														value="${orderDetail.book.bookId}" /> <input type="text"
														name="quantity${status.index + 1}"
														value="${orderDetail.quantity}" size="5" /></td>
													<td><fmt:formatNumber value="${orderDetail.subtotal}"
															type="currency" /></td>
													<td><a
														href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a></td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="7" align="right">
													<%-- <p>
														Subtotal:
														<fmt:formatNumber value="${order.subtotal}"
															type="currency" />
													</p> --%>
													<%-- <p>
														Tax: <input type="text" size="5" name="tax" id="tax"
															value="${order.tax}" />
													</p>
													<p>
														Shipping Fee: <input type="text" size="5"
															name="shippingFee" id="shippingFee"
															value="${order.shippingFee}" />
													</p> --%>
													<p>
														TOTAL:
														<fmt:formatNumber value="${order.total}" type="currency" />
													</p>
												</td>
											</tr>
										</table>
									</div>
									<div align="center">
										<br /> <a href="javascript:showAddBookPopup()"><b>Thêm sách</b></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="submit" value="Lưu" />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="button" value="Hủy" onclick="javascript:window.location.href='list_order';" />
									</div>
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
			$("#buttonCancel").click(function() {
				history.go(-1);
			});
		});

		function submitForm() {
			// Get the first form with the name
			// Usually the form name is not repeated
			// but duplicate names are possible in HTML
			// Therefore to work around the issue, enforce the correct index
			var frm = document.getElementById("orderForm");
			frm.submit(); // Submit the form
			frm.reset(); // Reset all form data
			return false; // Prevent page refresh
		}
		
	 function showAddBookPopup() {
		   var width = 600;
		   var height = 250;
		   var left = (screen.width - width) / 2;
		   var top = (screen.height - height) / 2;
		   
		   window.open('add_book_form', '_blank', 
				   'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
	   }
	</script>
</body>
</html>