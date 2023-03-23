
<div class="slick-slide">
	<div>
		<a href="view_book?id=${book.bookId}" class="deals-item">
			<div class="img-box">
				<div class="thumbnail-wrapper">
					<img src="data:image/jpg;base64, ${book.base64Image}" alt="img-slide"
						style="width: 183px; height: 183px;" />
				</div>

				<img src="${pageContext.request.contextPath}/assets/client/img/home_deal/free_ship.png" alt=""
					class="icon-bottom" style="width: 124px; height: 24px" />
			</div>
			<div style="color: #333; font-size: 13px;margin-bottom: 10px"> ${book.title} </div>
			<div class="book-price-fix">
				<fmt:setLocale value = "vi_VN"/>
	      <fmt:formatNumber value = "${book.price}" type = "currency"/></div>
			<div>
        <jsp:directive.include file="book_rating.jsp" />
      </div>
		</a>
	</div>
</div>