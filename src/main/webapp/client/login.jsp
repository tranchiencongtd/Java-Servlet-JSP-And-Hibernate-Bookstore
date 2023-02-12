<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div>
		<h2>Please login: </h2>
		<form action="">
			Email: <input type="text" /> <br />
			Password: <input type="text" />
			<input type="submit" value="Login" />
		</form>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>