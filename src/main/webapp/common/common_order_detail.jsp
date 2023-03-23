<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<fmt:setLocale value = "vi_VN"/>
<div>
		<h2 class="display-6 text-left" style="font-size: 28px; padding: 10px 0;">Chi tiết hóa đơn</h2>
		<table class="table table-bordered">
		    <tr>
		        <td>Người đặt</td>
		        <td>${order.customer.fullname}</td>
		    </tr>
		    <tr>
		        <td>Trạng thái</td>
		        <td>${order.status}</td>
		    </tr>
		     <tr>
		        <td>Ngày đặt</td>
		        <td><fmt:formatDate pattern = "dd/MM/yyyy" value = "${order.orderDate}" /></td>
		    </tr>
		    <tr>
		        <td>Phương thức thanh toán: </td>
		        <td>${order.paymentMethod}</td>
		    </tr>
		    <tr>
		        <td>Tổng số lượng</td>
		        <td>${order.bookCopies}</td>
		    </tr>
		     <tr> 
		        <td>Tổng tiền</td>
		        <td><fmt:formatNumber value="${order.total}" type="currency"/></td>
		    </tr>
		</table>
		
		
		<h2 class="display-6 text-left" style="font-size: 28px; padding: 10px 0;">Thông tin người nhận</h2>
		<table class="table table-bordered">
		     <tr>
		        <td>Người nhận</td>
		        <td>${order.recipientName}</td>
		    </tr>
		     <tr>
		        <td>SĐT</td>
		        <td>${order.recipientPhone}</td>
		    </tr>
		     <tr>
		        <td>Địa chỉ</td>
		        <td>${order.shippingAddress}</td>
		    </tr>
		</table>
	</div>
	
	<div>
	   <h2 class="display-6 text-left" style="font-size: 28px; padding: 10px 0;">Sản phẩm</h2>
	   <table class="table table-bordered table-striped">
	       <tr>
	           <th style="width: 10px">STT</th>
	           <th>Tên sách</th>
	           <th>Tác giả</th>
	           <th>Giá</th>
	           <th style="width: 70px">SL</th>
	           <th style="width: 150px">Thành tiền</th>
	       </tr>
	       <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
	       <tr>
	           <td>${status.index + 1}</td>
	           <td>
	               <img style="vertical-align: middle;" src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48" height="64"/>
	               ${orderDetail.book.title}
	           </td>
	           <td>${orderDetail.book.author}</td>
	           <td><fmt:setLocale value = "vi_VN"/><fmt:formatNumber value="${orderDetail.book.price}" type="currency"/></td>
	           <td>${orderDetail.quantity}</td>
	           <td><fmt:setLocale value = "vi_VN"/><fmt:formatNumber value="${orderDetail.subtotal}" type="currency"/></td>
	       </tr>
	       </c:forEach>
	       <tr>
	           <td colspan="6" align="right">
	              <p class="book-price-fix">Tổng tiền: <fmt:setLocale value = "vi_VN"/><fmt:formatNumber value="${order.total}" type="currency"/></p>
	           </td>
	       </tr>
	   </table>
	</div>
