<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style type="text/css">
.review-comment__check-icon {
	display: block;
	width: 14px;
	height: 14px;
	background-color: rgb(0, 171, 86);
	border-radius: 50%;
	position: relative;
	z-index: 1;
	margin: 0px 6px 0px 0px;
}

.review-comment__check-icon::before {
	content: "";
	width: 6px;
	height: 3px;
	border-left: 1px solid rgb(255, 255, 255);
	border-bottom: 1px solid rgb(255, 255, 255);
	position: absolute;
	display: block;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -70%) rotate(-45deg);
}
</style>
</head>
<body>
	<div id="main">
		<jsp:directive.include file="header.jsp" />

		<div
			style="width: 1270px; padding-left: 15px; padding-right: 15px; margin-right: auto; margin-left: auto; margin-top: 15px">
			<div
				style="display: flex; margin-bottom: 16px; background-color: rgb(255, 255, 255); border-radius: 4px;">
				<div style="padding: 16px 0px 16px 16px; position: relative;">
					<div
						style="display: flex; flex-direction: column; position: relative;">
						<div class="thumbnail"
							style="text-align: center; position: relative;">
							<div
								style="position: relative; display: flex; -webkit-box-pack: center; justify-content: center; -webkit-box-align: center; align-items: center; width: 444px; height: 444px; cursor: pointer;">
								<div
									style="position: relative; display: flex; width: 444px; height: 444px;">
									<div style="postion: relative">
										<img style="width: 444px; height: 444px; z-index: 0"
											src="data:image/jpg;base64, ${book.base64Image}" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div
					style="margin: 0px 12px; width: 1px; background: rgb(242, 242, 242); flex-shrink: 0;">
				</div>

				<div style="flex: 1 1 0%;">
					<div style="padding: 16px 28px 16px 0px; position: relative;">
						<div class="brand" style="display: flex; margin-top: 8px;">
							<span class="brand-and-author no-after"
								style="display: flex; -webkit-box-align: baseline; align-items: baseline;">
								<h6
									style="margin: 0px; color: rgb(36, 36, 36); font-size: 13px; font-weight: 400; line-height: 20px;">
									Tác giả:&nbsp;<a
										style="font-size: 13px; line-height: 20px; color: rgb(13, 92, 182);">${book.author}</a>
								</h6>
							</span>
						</div>
						<h1
							style="margin: 0px 0px 4px; color: rgb(36, 36, 36); font-size: 21px; font-weight: 200; line-height: 32px; word-break: break-word;">
							${book.title}</h1>
						<jsp:directive.include file="book_rating.jsp" />
					</div>

					<!-- right body -->
					<div style="display: flex; padding: 0px 24px 0px 0px;">
						<div class="left" style="flex: 1 1 0%; padding-right: 12px;">
							<div class="price-and-icon"
								style="display: flex; flex-direction: column; border-radius: 4px; background-color: rgb(250, 250, 250); padding: 0px 16px 12px;">
								<div class="style__StyledProductPrice-sc-15mbtqi-0 hlBZfh">
									<div class="product-price has-discount"
										style="color: rgb(255, 66, 78); padding-top: 12px; display: flex; align-items: flex-end;">
										<div class="product-price__current-price"
											style="font-size: 32px; line-height: 40px; margin-right: 8px; font-weight: 600;">
											<fmt:setLocale value="vi_VN" />
											<fmt:formatNumber value="${book.price}" type="currency" />
										</div>
										<!-- 	<div class="product-price__list-price"
											style="color: rgb(128, 128, 137); text-decoration: line-through; font-size: 14px; line-height: 20px;">0
											₫</div>
										<div class="product-price__discount-rate"
											style="font-weight: 500; margin-left: 4px; color: rgb(255, 66, 78); margin-top: 3px; line-height: 18px; font-size: 14px; padding: 0px 4px;">-0%</div> -->
									</div>
								</div>
							</div>

							<div
								class="styles__StyledAddToCart-sc-sq1a9n-0 cLYFvN add-to-cart"
								style="display: flex; flex-direction: column; margin: 16px 0px 0px; padding: 16px 0px; border-top: 1px solid rgb(242, 242, 242);">
								<div class="qty-and-message"
									style="display: flex; align-items: flex-end;">
									<!-- <div class="QuantityInput__Wrapper-sc-h67rf2-0 hhVFoh">
										<p class="label" style="font-size: 15px; line-height: 1.6;">Số
											Lượng</p>
										<div class="group-input"
											style="display: flex; -webkit-box-align: center; align-items: center; margin-top: 8px;">
											<button class="disable"
												style="border-right: none; border-radius: 4px 0px 0px 4px; padding: 4px;">
												<img
													src="https://frontend.tikicdn.com/_desktop-next/static/img/pdp_revamp_v2/icons-remove.svg"
													alt="remove-icon" width="20" height="20">
											</button>
											<input type="text" value="1" class="input"
												style="overflow: visible;width: 40px; border: 1px solid rgb(236, 236, 236); height: 30px; color: rgb(36, 36, 36); font-size: 14px; text-align: center; outline: none; transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;" />
											<button>
												<img
													src="https://frontend.tikicdn.com/_desktop-next/static/img/pdp_revamp_v2/icons-add.svg"
													alt="add-icon" width="20" height="20">
											</button>
										</div>
									</div> -->
								</div>
								<div class="group-button"
									style="margin-top: 16px; flex: 1 1 0%; display: flex;">
									<button id="buttonAddToCart" type="button"
										class="btn btn-add-to-cart"
										style="color: rgb(255, 255, 255); background-color: rgb(255, 57, 69); cursor: pointer; display: flex; -webkit-box-align: center; align-items: center; -webkit-box-pack: center; justify-content: center; min-width: 190px; width: 100%; max-width: 300px; height: 48px; font-size: 15px; line-height: 24px; font-weight: 500; text-transform: capitalize; border: none; border-radius: 4px; outline: none;">Chọn mua</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Reviews  -->
			<div>
				<div
					class="style__StyledCustomerReviews-sc-10ol6xi-0 hyphpd customer-reviews"
					style="word-break: break-word; opacity: 1; color: rgb(36, 36, 36); margin: 0px 0px 16px; min-height: auto; background-color: rgb(255, 255, 255); border-radius: 4px;">
					<div style="display: flex; justify-content: space-between;align-items: center"">
						<div class="customer-reviews__heading"
						style="font-size: 20px; line-height: 32px; font-weight: 400; text-transform: capitalize; padding: 8px 16px;">Đánh
						Giá - Nhận Xét Từ Khách Hàng</div>
						<div class="group-button"
									style="margin-right: 20px;">
									<button id="buttonWriteReview" type="button"
										class="btn btn-add-to-cart"
										style="color: rgb(255, 255, 255); background-color: #04AA6D; cursor: pointer; display: flex; -webkit-box-align: center; align-items: center; -webkit-box-pack: center; justify-content: center; min-width: 180px; width: 100%; max-width: 270px; height: 38px; font-size: 16px; font-weight: 500; border: none; border-radius: 4px; outline: none;">Viết nhận xét</button>
						</div>
					</div>
				
						
					<div class="customer-reviews__inner" style="padding-bottom: 16px;">
						<div></div>
						<c:forEach items="${book.reviews}" var="review">
							<div
								class="style__StyledComment-sc-10ol6xi-5 dOzoKz review-comment"
								style="padding: 32px 48px; display: flex; border-top: 1px solid rgb(242, 242, 242);">
								<div class="review-comment__user"
									style="flex-basis: 335px; flex-shrink: 0;">
									<div class="review-comment__user-inner"
										style="display: flex; -webkit-box-align: center; align-items: center; word-break: break-word; opacity: 1; color: rgb(36, 36, 36);">
										<div class="review-comment__user-avatar"
											style="margin: 0px 12px 0px 0px; width: 48px; height: 48px; background-size: cover; border-radius: 50%; position: relative; z-index: 1;">
											<div
												class="Avatar__StyledAvatar-sc-13o0emo-0 lfujih has-character"
												style="background-image: url('https%3A%2F%2Fsalt.tikicdn.com%2Fcache%2F512x512%2Fts%2Favatar%2Fd7%2F2a%2F1e%2Ff172b094f4e5098779ca086a30a67527.png');">
												<img src="" alt=""
													style="border-radius: 50%; overflow: hidden; width: inherit; height: inherit; position: relative; padding-top: 100%; background-color: rgb(242, 242, 242); position: absolute; inset: 0px; display: flex; -webkit-box-pack: center; justify-content: center; -webkit-box-align: center; align-items: center; font-size: 100%; font-weight: 500; color: rgb(153, 153, 153);"><span></span>
											</div>
										</div>
										<div>
											<div class="review-comment__user-name"
												style="font-size: 15px; line-height: 24px; font-weight: 500; text-transform: capitalize;">${review.customer.fullname}</div>
											<div class="review-comment__user-date"
												style="font-size: 13px; line-height: 20px; color: rgb(128, 128, 137);">
												<fmt:formatDate value="${review.reviewTime}"
													pattern="dd/MM/yyyy" />
											</div>
										</div>
									</div>
								</div>
								<div style="flex-grow: 1;">
									<div class="review-comment__rating-title"
										style="display: flex; -webkit-box-align: center; align-items: center; margin: 0px 0px 4px;">
										<div>
											<c:forTokens items="${review.stars}" delims="," var="star">
												<c:if test="${star eq 'on'}">
													<img
														src="${pageContext.request.contextPath}/assets/images/rating_on.png" />
												</c:if>
												<c:if test="${star eq 'off'}">
													<img
														src="${pageContext.request.contextPath}/assets/images/rating_off.png" />
												</c:if>
											</c:forTokens>
										</div>

										<div class="review-comment__title"
											style="word-break: break-word; margin: 0px 0px 0px 12px; font-size: 15px; line-height: 24px; font-weight: 500; color: rgb(36, 36, 36); overflow: hidden; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 1;">
											${review.headline}</div>
									</div>



									<div class="review-comment__seller-name-attributes"
										style="display: flex; -webkit-box-align: center; align-items: center; margin: 0px 0px 16px; word-break: break-word; opacity: 1; color: rgb(36, 36, 36);">
										<div class="review-comment__seller-name"
											style="display: flex; -webkit-box-align: center; align-items: center; font-size: 13px; font-weight: 400; line-height: 20px; color: rgb(0, 171, 86);">
											<span class="review-comment__check-icon"></span>Đã mua hàng
										</div>
									</div>
									<div class="review-comment__content"
										style="word-break: break-word; font-size: 13px; font-weight: 400; line-height: 20px; margin: 0px 0px 8px; white-space: pre-wrap;">${review.comment}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
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
			$("#buttonWriteReview").click(function() {
				window.location = "write_review?book_id=" + ${book.bookId};
			});

			$("#buttonAddToCart").click(function() {
				window.location = "add_to_cart?book_id=" + ${book.bookId};
			});
		});
	</script>
</body>
</html>