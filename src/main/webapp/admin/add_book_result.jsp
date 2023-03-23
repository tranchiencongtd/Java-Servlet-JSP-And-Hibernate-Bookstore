<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book to Order</title>
</head>
<body>
     <div align="center">
         <h2>
             Sách <i>${book.title}</i> đã được thêm vào đơn hàng có ID <b>${order.orderId}</b>
         </h2>
         <input type="button" value="Đóng" onclick="javascript: self.close();"/>
     </div>
     <script>
         window.onunload = function() {
        	 window.opener.location.reload();
         }
     </script>
</body>
</html>