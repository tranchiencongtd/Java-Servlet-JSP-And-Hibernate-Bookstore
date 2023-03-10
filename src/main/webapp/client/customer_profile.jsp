<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
</head>
<body>
	<div id="main">
		<jsp:include page="header.jsp" />

<div align="center">
         <h2>Welcome, ${loggedCustomer.fullname}</h2>
     </div>
     
     <table class="normal">
        <tr>
            <td><b>E-mail:</b></td>
            <td>${loggedCustomer.email}</td>
        </tr>
        <tr>
            <td><b>Họ và tên:</b></td>
            <td>${loggedCustomer.fullname}</td>
        </tr>
        <tr>
            <td><b>SĐT:</b></td>
            <td>${loggedCustomer.phone}</td>
        </tr>
        <tr>
            <td><b>Địa chỉ:</b></td>
            <td>${loggedCustomer.address}</td>
        </tr>
       
        <tr>
            <td><b>Thành phố:</b></td>
            <td>${loggedCustomer.city}</td>
        </tr>
        <tr>
            <td><b>Zip Code:</b></td>
            <td>${loggedCustomer.zipcode}</td>
        </tr>
        <tr>
            <td><b>Đất nước:</b></td>
            <td>${loggedCustomer.country}</td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td colspan="2" align="center"><b><a href="edit_profile">Chỉnh sửa profile</a></b></td>
        </tr>
     </table>

		<jsp:include page="footer.jsp" />

	</div>
</body>
</html>