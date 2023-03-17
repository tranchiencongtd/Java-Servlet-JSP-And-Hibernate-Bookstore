<div align="center">
		<h2>Chi tiết hóa đơn:</h2>
		<table>
		    <tr>
		        <td><b>Người đặt: </b></td>
		        <td>${order.customer.fullname}</td>
		    </tr>
		    <tr>
		        <td><b>Trạng thái: </b></td>
		        <td>${order.status}</td>
		    </tr>
		     <tr>
		        <td><b>Ngày đặt: </b></td>
		        <td>${order.orderDate}</td>
		    </tr>
		    <tr>
		        <td><b>Phương thức thanh toán: </b></td>
		        <td>${order.paymentMethod}</td>
		    </tr>
		    <tr>
		        <td><b>Số lượng: </b></td>
		        <td>${order.bookCopies}</td>
		    </tr>
		     <tr>
		        <td><b>Tổng: </b></td>
		        <td><fmt:formatNumber value="${order.total}" type="currency"/></td>
		    </tr>
		</table>
		<h2>Thông tin người nhận:</h2>
		<table>
		     <tr>
		        <td><b>Người nhận: </b></td>
		        <td>${order.recipientName}</td>
		    </tr>
		     <tr>
		        <td><b>SĐT: </b></td>
		        <td>${order.recipientPhone}</td>
		    </tr>
		     <tr>
		        <td><b>Địa chỉ: </b></td>
		        <td>${order.shippingAddress}</td>
		    </tr>
		</table>
	</div>
	<div align="center">
	   <h2>Ordered Books</h2>
	   <table border="1">
	       <tr>
	           <th>STT</th>
	           <th>Tên sách</th>
	           <th>Tác giả</th>
	           <th>Giá</th>
	           <th>Số lượng</th>
	           <th>Tổng</th>
	       </tr>
	       <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
	       <tr>
	           <td>${status.index + 1}</td>
	           <td>
	               <img style="vertical-align: middle;" src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48" height="64"/>
	               ${orderDetail.book.title}
	           </td>
	           <td>${orderDetail.book.author}</td>
	           <td><fmt:formatNumber value="${orderDetail.book.price}" type="currency"/></td>
	           <td>${orderDetail.quantity}</td>
	           <td><fmt:formatNumber value="${orderDetail.subtotal}" type="currency"/></td>
	       </tr>
	       </c:forEach>
	       <tr>
	           <td colspan="6" align="right">
	              <p>Tổng:<fmt:formatNumber value="${order.total}" type="currency"/></p>
	           </td>
	       </tr>
	   </table>
	</div>
