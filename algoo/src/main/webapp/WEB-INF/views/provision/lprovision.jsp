<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" 
	src="<c:url value='/naver/naverLogin_implicit-1.0.2.js'/>" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".clickProvision").hover(function(){
			$(this).css("background","#E70400");
			$(this).children().css("color","white");
		},function(){
			$(this).css("background","");
			$(this).children().css("color","");
		});
	});
</script>
<style type="text/css">
	.provTitle div:nth-of-type(3){
		background: #E70400;
	}
	.provTitle div:nth-of-type(3) a{
		color:white;
	}
</style>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/provision.css'/>" />

<div class="provision">	
	<div class="provTitle">
		<div class="clickProvision">
		<a href="<c:url value='/provision/pProvision.ag'/>">개인회원</a>
		</div>
		<div class="clickProvision">
		<a href="<c:url value='/provision/cProvision.ag'/>">기업회원</a>
		</div>
		<div class="clickProvision">
		<a href="<c:url value='/provision/lProvision.ag'/>">위치기반서비스</a>
		</div>
		<br>
	</div><br><br>
	
	<h2>&nbsp;&nbsp;&nbsp;· 위치기반서비스</h2>
	<hr>
	<div class="provDay">
		<span id="provDay">개정일자</span> : 2014년 10월 7일
	</div>
	
	<div class="provCon">
		<iframe src="<c:url value='/inc/lprovision.html'/>"
		 frameborder="0" scrolling=no width="880" height="2600"></iframe>
	</div>
</div>
	
<%@ include file="../inc/bottom.jsp" %> 