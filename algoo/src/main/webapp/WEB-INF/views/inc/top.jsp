<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/clear.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/includeLayout.css" />
</head>
<body>
	<div id="wrap">
		<!-- header시작 -->
		<div id="header">
			<div id="header_div">
				<div id="header_top">
					<div id="header_action">
						<a href="#">로그인</a> |
						<a href="#">회원가입</a> |
						<a href="#">고객센터</a> |
						<a href="#">FAQ</a> |
						<a href="#">이벤트</a>
					</div>
				</div>
				<div id="header_search">
					<div id="header_logo">
						<img alt="로고" src="<%=request.getContextPath()%>/images/mainLogo-red.png">
					</div>
					<div id="header_searchBar">
						<div>
							<a href="#">시간선택제</a> | 
							<a href="#">당일알바</a> |
							<a href="#">임금체불주신고</a>
							<form name="frmSearch" id="frmSearch" action="a.jsp" method="post">
								<fieldset>
									<span id="span_keyword">
									<input type="text" name="keyword" id="keyword"></span>
									<input type="submit" id="bt_search" value="검색">
								</fieldset>
							</form>
						</div>
					</div>
					<div id="header_advertise">
						<img alt="광고" src="<%=request.getContextPath()%>/images/findjobLogo.png">
					</div>
				</div>
				
				<div id="header_menu">
					<a href="#">채용정보 </a> 
					<a href="#">브랜드알바 </a> 
					<a href="#">굿잡 </a> 
					<a href="#">신입공채 </a> 
					<a href="#">알바토크 </a> 
					<a href="#">인재정보	</a> 
					<a href="#">개인서비스 </a>
					<a href="#">기업서비스 </a>
				</div>
			</div><!-- header_div -->
		</div><!-- header -->
		<!-- header끝 -->
		
		<!-- container시작 -->
		<div id="container">