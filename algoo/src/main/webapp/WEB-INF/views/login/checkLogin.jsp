<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		alert("로그인이 필요한 서비스입니다");
		login();
		history.back();
	});
	
	function login(){
		window.open("<c:url value='/login/login.ag'/>",	"login",
		"width=390,height=480,left=700,top=200,resizable=yes,location=yes");
	}
</script>
</head>
<body>

</body>
</html>