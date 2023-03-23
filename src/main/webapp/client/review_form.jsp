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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<title>Tiki - Mua hàng online giá tốt, hàng chuẩn, ship nhanh</title>
</head>
<body>
	<div id="main">
		<jsp:directive.include file="header.jsp" />

		<div align="center">
			<form id="reviewForm" action="submit_review" method="post">
				<table class="normal" width="60%">
					<tr>
						<td><h2 class="display-6 text-left" style="font-size: 28px; padding: 10px 0;">Đánh giá</h2></td>
					</tr>
					<tr>
						<td colspan="3"><hr /></td>
					</tr>
					<tr>
						<td>
						
						<img
							class="book-large"
							src="data:image/jpg;base64, ${book.base64Image}" style="width: 444px"/>
						<br />
						<span id="book-title">${book.title} - ${book.author}</span>
						<br />
						<jsp:directive.include file="book_rating.jsp" />
							</td>
						<td>
							<div id="rateYo"></div> 
							<input type="hidden" id="rating" name="rating" /> 
							<input type="hidden" name="bookId"
							value="${book.bookId}" /> <br /> <input class="form-control" type="text"
							name="headline" size="60" style="width: 100%;"  placeholder="Tiêu đề review của bạn" />
							<br/>
							<textarea class="form-control" name="comment" style="width: 100%;"
								placeholder="Review của bạn...." rows="4"></textarea>
						</td>
					</tr>
					<tr>
						<td></td>
						<td  align="center">
							<br />
						
							<button type="submit" class="btn btn-primary">Gửi</button> &nbsp;&nbsp;
							<button id="buttonCancel" class="btn btn-warning">Hủy</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<jsp:directive.include file="footer.jsp" />

	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			$("#buttonCancel").click(function() {
				history.go(-1);
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