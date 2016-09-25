<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp"%>
<script type="text/javascript" 
	src="<c:url value='/naver/naverLogin_implicit-1.0.2.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/provision.css'/>" />

<div class="provision">	
	<h2>개인정보처리방침</h2>
	<hr>
	<div class="provDay">
		개인정보처리방침 v4.8
	</div>
	
	<div class="provCon">
		<iframe src="<c:url value='/inc/privacy.html'/>"
		 frameborder="0" scrolling=no width="880" height="4700">
</div>

<%@ include file="../inc/simple_bottom.jsp" %> 