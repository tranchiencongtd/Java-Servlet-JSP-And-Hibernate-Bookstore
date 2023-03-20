<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
<link href="${pageContext.request.contextPath}/assets/client/sass/style.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Tiki - Mua hàng online giá tốt, hàng chuẩn, ship nhanh</title>
</head>
<body>
	<div id="main">
		<jsp:directive.include file="header.jsp" />

 <div align="center">
         <h2>Shopping Cart</h2>
         
        <c:if test="${message != null}">
	        <div align="center">
	           <h4 class="message">${message}</h4>
	        </div>
	    </c:if>
         
        <c:set var="cart" value="${sessionScope['cart']}"/>
        
        <c:if test="${cart.totalItems == 0}">
            <h2>Không có sản phẩm nào trong giỏ hàng.</h2>
        </c:if>
        
        <c:if test="${cart.totalItems > 0}">
          
                 <div>
                    <h2>Chi tiết đơn hàng <a href="view_cart">Chỉnh sửa</a></h2>
                    <table border="1">
                        <tr>
                            <th>STT</th>
                            <th colspan="2">Tên sách</th>
                            <th>Tác giả</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                        </tr>
                        <c:forEach items="${cart.items}" var="item" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>
                            <img class="book-small" src="data:image/jpg;base64, ${item.key.base64Image}" />
                            </td>
                            <td><span id="book-title">${item.key.title}</span></td>
                            <td>${item.key.author}</td>
                             <td><fmt:formatNumber value="${item.key.price}" type="currency" /></td>
                            <td>
                               <input type="text" name="quantity${status.index + 1}" value="${item.value}" size="5" readonly="readonly"/>
                            </td>
                            <td><fmt:formatNumber value="${item.value * item.key.price}" type="currency" /></td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="7" align="right">
                               <p>SL: ${cart.totalQuantity}</p>
                               <%-- <p>Tổng: <fmt:formatNumber value="${cart.totalAmount}" type="currency" /></p>
                               <p>Tax: <fmt:formatNumber value="${tax}" type="currency" /></p>
                               <p>Giá ship: <fmt:formatNumber value="${shippingFee}" type="currency" /></p> --%>
                               <p>Tổng tiền: <fmt:formatNumber value="${total}" type="currency" /></p>
                            </td>
                        </tr>
                    </table>
                    <h2>Thông tin người nhận</h2>
                    <form id="orderForm" action="place_order" method="post">
                    <table>
                        <tr>
                           <td>Họ và tên:</td>
                           <td><input type="text" name="fullname" value="${loggedCustomer.fullname}"/></td>
                        </tr>
                        
                        <tr>
                           <td>SĐT:</td>
                           <td><input type="text" name="phone" value="${loggedCustomer.phone}"/></td>
                        </tr>
                        <tr>
                           <td>Địa chỉ:</td>
                           <td><input type="text" name="address" value="${loggedCustomer.address}"/></td>
                        </tr>
                        <tr>
                           <td>Thành phố:</td>
                           <td><input type="text" name="city" value="${loggedCustomer.city}"/></td>
                        </tr>
                         <tr>
                           <td>Đất nước:</td>
                           <td>
                           <select name="country" id="country"> 
				             <c:forEach items="${mapCountries}" var="country">
				                <option value="${country.value}"<c:if test="${loggedCustomer.country eq country.value}">selected='selected'</c:if>>${country.key}</option>
				             </c:forEach>
				           </select>
                           </td>
                        </tr>
                    </table>
                    <div>
                        <h2>Thanh toán</h2>
                        Chọn phương thức thanh toán:
                        &nbsp;&nbsp;&nbsp;
                        <select name="paymentMethod">
                             <option value="Cash On Delivery">Thanh toán khi nhận hàng</option>
                             <option value="paypal">PayPal or Credit card</option>
                        </select>
                    </div>
                   <div>
                      <table class="normal">
                         <tr><td>&nbsp;</td></tr>
                         <tr>
                             <td><button type="submit">Đặt hàng</button></td>
                             <td><a href="${pageContext.request.contextPath}/">Tiếp tục mua sắm</a><td>
                         </tr>
                      </table>
                   </div>  
                    </form>
                   </div>
        </c:if>
         
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
</body>
</html>