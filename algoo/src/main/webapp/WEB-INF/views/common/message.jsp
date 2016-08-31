<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>common/message.jsp</title>
</head>
<body>

<script type="text/javascript">
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
		
	location.href="${pageContext.request.contextPath}${url}";
</script>
</body>
</html>