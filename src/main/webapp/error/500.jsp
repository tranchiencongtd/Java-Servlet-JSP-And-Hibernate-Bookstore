<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/assets/admin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
		<div class="container-fluid mt-5">
          <!-- 500 Error Text -->
          <div class="text-center">
              <div class="error mx-auto" data-text="500">500</div>
              <p class="lead text-gray-800 mb-5">Well, this is unexpected</p>
              <p class="text-gray-500 mb-0">It looks like you found a glitch in the matrix...</p>
              <a  href="javascript:history.go(-1);">← Quay trở lại</a>
          </div>
     </div>
</body>
</html>