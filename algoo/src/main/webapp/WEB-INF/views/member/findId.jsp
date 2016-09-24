<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기 - algoo</title>
</head>
<body>
	<c:if test="${empty param.userid }">
		입력하신 정보와 일치하는 아이디가 없습니다!!
	</c:if>
	<c:if test="${!empty param.userid}">
		회원님의 아이디는 ${param.userid } 입니다.
	</c:if>
</body>
</html>