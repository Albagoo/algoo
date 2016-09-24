<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>알구 - 관리자페이지</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleInc.css'/>" />
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("th").hover(function(){
			$(this).css("background","#E70400").css("cursor","pointer")
			.css("color","white");
		
		},function(){
			$(this).css("background","").css("color","black");
		});
	});
</script>
<style>
	#white{
		width:100%;
		height:30px;
		border:1px solid #ccc;
		box-shadow:2px 5px 5px #ccc;
	}
	#white th{
		border:1px solid #ccc;
		height:30px;
		
	}
	.menu{
		display: inline-block;
	}
	.menu a{
		cursor:pointer;
	}
	.menu .hide{
		display:none;
	}
</style>
<!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>      
    <![endif]-->
</head>
<body>
	<div id="simple_wrap">
		<!-- 헤더영역 -->
		<header>
			<div id="simple_top">
				<a href="<c:url value='/admin/adminIndex.ag'/>"><img alt="로고" src="<c:url value='/images/simple_Logo.png'/> ">
				</a>
				<span>관리자</span>
				<ul>
					<li><a href="<c:url value='/admin/adminIndex.ag'/>">관리자홈</a> |</li>
					<li><a href="<c:url value='/admin/adminIndex.ag'/>">로그인</a></li>
				</ul>
			</div>
		</header>
		<!-- /헤더영역 -->
		
		<div id="container">
