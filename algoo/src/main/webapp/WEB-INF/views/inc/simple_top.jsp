<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleInc.css'/>" />
<!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>      
    <![endif]-->
</head>
<body>
	<div id="simple_wrap">
		<!-- 헤더영역 -->
		<header>
			<div id="simple_top">
				<a href=""><img alt="로고" src="<c:url value='/images/simple_Logo.png'/> ">
				</a>
				<span>로그인</span>
				<ul>
					<li><a href="#">홈</a> |</li>
					<li><a href="#">채용정보</a> |</li>
					<li><a href="#">인재정보</a> |</li>
					<li><a href="#">알바토크</a> |</li>
					<li><a href="<c:url value='/faq/faqList.ag'/>">FAQ</a> |</li>
					<li><a href="#">캠페인</a></li>
				</ul>
			</div>
		</header>
		<!-- /헤더영역 -->
		
		<div id="container">