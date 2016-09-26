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
		$("#white th").hover(function(){
			$(this).css("background","#E70400").css("cursor","pointer");
		
		},function(){
			$(this).css("background","");
		});
	});
</script>
<style>
	#white{
		width:100%;
		height:25px;
		border:1px solid #ccc;
		box-shadow:2px 5px 5px #ccc;
		margin:0;
	}
	#white .menuStyle{
		border:1px solid #ccc;
		height:30px;
		background: white;
	}
	.menu{
		width:100%;
		height:25px;
		display: inline-block;
	}
	.menu a{
		cursor:pointer;
		
	}
	.menu .hide{
		display:none;
	}
	.menuStyle a{
		color:black;
		font-size: 16px;
		font-weight: bold;
		text-decoration: none;
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
				<c:if test="${empty sessionScope.userid }">
					<ul>
						<li><a href="<c:url value='/admin/adminIndex.ag'/>">홈</a> |</li>
						<li><a href="<c:url value='/admin/login/adminLogin.ag'/>">로그인</a></li>
					</ul>
				</c:if>
				<c:if test="${!empty sessionScope.userid }">
					<ul>
						<li><span style="font-size:1.0em;color:black;font-weight:bold;margin-right: 10px;"> ${sessionScope.userName}님</span></li>
						<li><a href="<c:url value='/admin/adminIndex.ag'/>">홈</a> |</li>
						<li><a href="<c:url value='/admin/login/adminLogout.ag'/>">로그아웃</a> |</li>
						<li><a href="<c:url value='/admin/adminMember.ag'/>">관리자메뉴</a></li>
					</ul>
				</c:if>
				
			</div>
		</header>
		<!-- /헤더영역 -->
		
		<div id="container">
