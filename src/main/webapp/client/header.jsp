<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<div class="header" id="header">
	<div class="container">
		<div class="middle-wrap">
			<div class="middle-left-container">
				<div class="logo-menu">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/"> <img
							src="${pageContext.request.contextPath}/assets/client/img/header/logo_tiki.png"
							alt="logo-tiki" />
						</a>
					</div>
					<div class="section-menu">
						<a href="#" class="menu-btn"> <img
							src="${pageContext.request.contextPath}/assets/client/img/header/hambuger.png"
							alt="" class="hambuger" />
							<div class="wrap">
								<span>Danh sách</span> <span class="text-icon"> Sản phẩm<img
									src="${pageContext.request.contextPath}/assets/client/img/header/arrow_icon.png"
									alt="arrow-icon" />
								</span>
							</div>
						</a>
						<div class="nav-container">
							<ul class="navigation-wrapper">
								<c:forEach var="category" items="${listCategory}">
									<li class="menu-item"><a
										href="view_category?id=${category.categoryId}"
										class="main-navigation-item"> <span class="icon-wrap">
												<img
												src="${pageContext.request.contextPath}/assets/client/img/icon_menu_header/telephone.png"
												alt="img" />
										</span><span class="text"><c:out value="${category.name}" /></span>
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<form action="search" method="GET">
					<div class="form-search" id="form-search">
						<div class="form-search-content">
							<input type="text" placeholder="Tìm kiếm sản phẩm mong muốn" id="search-auto-show" name="keyword"/>
							<button type="submit">
								<img
									src="${pageContext.request.contextPath}/assets/client/img/header/icon_search.png"
									alt="icon-search" class="icon-search" /> Tìm kiếm
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="header-user">
			  <c:if test="${loggedCustomer == null}"> 
				  <div class="header-account">
						<img
							src="${pageContext.request.contextPath}/assets/client/img/header/profile_icon.png"
							alt="profile-icon" class="profile-icon" />
							<span class="item-text"> <span class="log-in">Đăng nhập/Đăng ký </span> 
							<span class="account-label"><span>Tài khoản</span> 
							<img
								src="${pageContext.request.contextPath}/assets/client/img/header/arrow_icon.png"
								alt="" class="arrowIcon" />
						</span>
						</span>
						<div class="user-dropdown">
							<button class="log-in" id="log-in" onclick="location.href = '${pageContext.request.contextPath}/login';">Đăng nhập</button>
							<button class="register" id="register" onclick="location.href = '${pageContext.request.contextPath}/register';">Tạo tài khoản</button>
							<button class="facebook">
								<span> <i class="fa fa-facebook-square" aria-hidden="true"></i>
								</span> Đăng nhập bằng facebook
							</button>
							<button class="google">
								<span> <i class="fa fa-google-plus" aria-hidden="true"></i>
								</span> Đăng nhập bằng Google
							</button>
						</div>
				</div>
			  </c:if>
			  
			  <c:if test="${loggedCustomer != null}">
			  <div class="header-account">
			  	<img
							src="${pageContext.request.contextPath}/assets/client/img/header/profile_icon.png"
							alt="profile-icon" class="profile-icon" />
					<span class="item-text"> <span class="log-in">${loggedCustomer.fullname}</span> 
		    	</span>
		    	<div class="user-dropdown">
						 <a href="view_profile">Chi tiết tài khoản</a> 
				     <a href="view_orders">Đơn đặt hàng của tôi</a> 
				     <a href="logout">Đăng xuất</a> 
					</div>
			   </div>
			 </c:if>
				
				
				<div class="cart-item">
					<a href="view_cart">
						<div class="cart-item-content" id="cart-item-content">
							<div class="cart-wrapper">
								<img
									src="${pageContext.request.contextPath}/assets/client/img/header/cart_icon.png"
									alt="cart-icon" class="cart-icon" /> 
								<%-- 	<span class="quantity">
									${sessionScope.cart.totalQuantity}
									</span> --%>
							</div>
							<span class="cart-text"> Giỏ hàng </span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		<div class="container">
			<a href="#"> <img
				src="${pageContext.request.contextPath}/assets/client/img/header/free_ship.png"
				alt="free-ship" />
			</a>
			<div class="header-quicklinks-container">
				<a href="#" class="header-quicklinks">Sách văn học</a> <a href="#"
					class="header-quicklinks">Sách trinh thám</a> <a href="#"
					class="header-quicklinks">Nguồn cội</a> <a href="#"
					class="header-quicklinks">Sự im lặng của bầy cừu</a> <a href="#"
					class="header-quicklinks"></a>
			</div>
			<a href="#" class="tiki-seller"> <img
				src="https://frontend.tikicdn.com/_desktop-next/static/img/icon-seller.svg"
				alt="" /> <span class="text">Bán hàng cùng tiki</span>
			</a>
		</div>
	</div>
</div>
<div class="bg-dark" id="bg-dark"></div>
<div class="category-tabbar-wrapper">
	<div class="container">
		<div class="simple-slider">
			<span class="icon icon-prev" id="icon-prev"><i
				class="fa fa-chevron-left" aria-hidden="true"></i></span>
			<div class="content" id="content">
				<span class="slider"> <c:forEach var="category"
						items="${listCategory}">
						<a href="view_category?id=${category.categoryId}">
							<div class="catename">
								<c:out value="${category.name}" />
							</div>
						</a>
					</c:forEach>
				</span>
			</div>
			<span class="icon icon-next" id="icon-next"><i
				class="fa fa-chevron-right" aria-hidden="true"></i></span>
		</div>
	</div>
</div>