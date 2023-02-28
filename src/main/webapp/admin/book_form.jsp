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
								  <c:if test="${ book  != null }">
								  	<h1 class="h4 text-gray-900 mb-4">Chỉnh sửa</h1>
								  </c:if>
									 <c:if test="${ book  == null }">
								  	<h1 class="h4 text-gray-900 mb-4">Thêm mới</h1>
								  </c:if>
								</div>
									<c:if test="${ book != null }">
										<form class="user" id="bookForm" action="update_book" method="post" autocomplete="off" enctype="multipart/form-data">
										<input type="hidden" name="bookId" value="${book.bookId}">
									</c:if>
									<c:if test="${book == null}">
											<form class="user" id="bookForm" action="create_book" method="post" autocomplete="off" enctype="multipart/form-data">
									</c:if>

									<div class="form-group">
									 	 <label for="category" class="form-label">Danh mục</label>
										 <select name="category" class="form-control">
			                 <c:forEach items="${listCategory}" var="category">
			                 <c:if test="${category.categoryId eq book.category.categoryId}">
			                       <option value ="${category.categoryId}" selected>
			                 </c:if>
			                 <c:if test="${category.categoryId ne book.category.categoryId}">
			                       <option value ="${category.categoryId}">
			                 </c:if>
			                        ${category.name}
			                 </option>
			                 </c:forEach>
		            		</select>
									</div>
									
									<div class="form-group">
											 <label for="title" class="form-label">Tiêu đề</label>
											 <input type="text" id="title" name="title" size="20" value="${book.title}" class="form-control"/>
									</div>
									
									<div class="form-group">
											 <label for="author" class="form-label">Tác giả</label>
											 <input type="text" id="author" name="author" size="20" value="${book.author}" class="form-control"/>
									</div>
									
									<div class="form-group">
											 <label for="isbn" class="form-label">ISBN</label>
											 <input type="text" id="isbn" name="isbn" size="20" value="${book.isbn}" class="form-control"/>
									</div>
									
									<div class="form-group">
											 <label for="publishDate" class="form-label">Ngày xuất bản</label>
											 <input type="date" id="publishDate" name="publishDate" size="20" class="form-control"
												value="<fmt:formatDate pattern='dd/MM/yyyy' value='${book.publishDate}'/>" />
									</div>
									
									<div class="form-group">
											  <label for="bookImage" class="form-label">Ảnh</label>
											  <input type="file" id="bookImage" name="bookImage" size="20"  class="form-control"/>
										    <img id = "thumbnail" alt="Image Preview" style="width:20%; margin-top:10px"
										      src="data:image/jpg;base64, ${book.base64Image}"
										    />
									</div>
									
									<div class="form-group">
											 <label for="price" class="form-label">Giá</label>
											 <input type="text" id="price" name="price" size="20" value="${book.price}" class="form-control"/>
									</div>
									
										<div class="form-group">
											  <label for="description" class="form-label">Mô tả</label>
											  <textarea rows="5" cols="50" name="description" id="description" class="form-control">${book.description}</textarea>
									</div>

									<div>
										<input type="button" value="Lưu" class="btn btn-primary btn-user btn-block" id="btnsubmit" onclick="submitForm()">
										<a type="button" class="btn btn-primary btn-user btn-block" id="buttonCancel"> Hủy </a>
									</div>
									
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
		
		
	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/jquery-ui.min.js"></script>
		
		
	
	

	<script type="text/javascript">
		$(document).ready(function() {
			$("#publishDate").change(function() {
				formatDate(this);
			});
			
			$("#bookImage").change(function() {
				showImageThumbnail(this);
			});
			
			$("#bookForm").validate({
				rules: {
					
					category: "required",
					title: "required",
					author: "required",
					isbn:"required",
					publishDate: "required",
					
					<c:if test="${book == null}">
					bookImage: "required",
					</c:if>
					
					price: "required",
					description: "required"
					
				},
				
				messages: {
					
					category:"Please select a category for the book",
					title: "Please enter title of the book",
					author:"Please enter author of the bool",
					isbn:"Please enter ISBN of the book",
					publishDate:"Please enter publish date of the bool",
					bookImage:"Please choose an image of the book",
					price:"Please enter price of the book",
					description:"Please enter description of the book"
					
				}
			});

			$("#buttonCancel").click(function() {
				history.go(-1);
			});
		});
		
		function submitForm() {
			   // Get the first form with the name
			   // Usually the form name is not repeated
			   // but duplicate names are possible in HTML
			   // Therefore to work around the issue, enforce the correct index
			   var frm = document.getElementById("bookForm");
			   frm.submit(); // Submit the form
			   frm.reset();  // Reset all form data
			   return false; // Prevent page refresh
			}
		
		function showImageThumbnail(fileInput) {
			var file = fileInput.files[0];
			
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$("#thumbnail").attr("src", e.target.result);
			};
			
			reader.readAsDataURL(file, "UTF-8");
		}
		
		function formatDate(dateInput) {
			const selectedDate = new Date(dateInput.value);
	    const formattedDate = selectedDate.toLocaleDateString('en-GB', { day: 'numeric', month: 'numeric', year: 'numeric' });
	    $(dateInput).val(formattedDate);
		}
	</script>

</body>
</html>