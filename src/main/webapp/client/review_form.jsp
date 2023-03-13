<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<form id="reviewForm" action="submit_review" method="post">
				<table class="normal" width="60%">
					<tr>
						<td><h2>Đánh giá</h2></td>
						<td>&nbsp;</td>
						<td><h2>${loggedCustomer.fullname}</h2></td>
					</tr>
					<tr>
						<td colspan="3"><hr /></td>
					</tr>
					<tr>
						<td><span id="book-title">${book.title}</span><br /> <img
							class="book-large"
							src="data:image/jpg;base64, ${book.base64Image}" /></td>
						<td>
							<div id="rateYo"></div> <input type="hidden" id="rating"
							name="rating" /> <input type="hidden" name="bookId"
							value="${book.bookId}" /> <br /> <input type="text"
							name="headline" size="60"
							placeholder="Tiêu đề review của bạn" /> <br />
							<br /> <textarea name="comment" style="width: 100%;"
								placeholder="Review của bạn...."></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<button type="submit">Gửi</button> &nbsp;&nbsp;
							<button id="buttonCancel">Hủy</button>
						</td>
					</tr>
				</table>
			</form>
		</div>


	</div>

	<jsp:directive.include file="footer.jsp" />


	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script src="./assets/client/js/header.js"></script>
	<script src="./assets/client/js/simple_slider.js"></script>
	<script src="./assets/client/js/sliders.js"></script>
	<!-- <script src="./assets/client/js/timer.js"></script> -->
	<script src="./assets/client/js/slider_deals.js"></script>
	<script src="./assets/client/js/slider_cdn.js"></script>
	<script src="./assets/client/js/sticky.js"></script>
	<script src="./assets/client/js/tabs.js"></script>
	<script src="./assets/client/js/check_tel_log_in.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#buttonCancel").click(function() {
				history.go(-1);
			});

			$("#reviewForm").validate({
				rules : {
					headline : "required",
					comment : "required"
				},
				messages : {
					headline : "Please enter headline",
					comment : "Please enter review details"
				}
			});

			$("#rateYo").rateYo({
				starWidth : "40px",
				fullStar : true,
				onSet : function(rating, rateYoInstance) {
					$("#rating").val(rating);
				}
			});

		});
	</script>
</body>
</html>