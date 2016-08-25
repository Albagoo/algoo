<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
						
					</div>
				</div>
				<div id="header_search">
					<div id="header_logo">
						<img alt="로고" src="<%=request.getContextPath()%>/images/albamonLogo.png">
					</div>
					<div id="header_searchBar">
						<div>
							<a href="#">시간선택제</a> | 
							<a href="#">당일알바</a> |
							<a href="#">임금체불주신고</a>
							<form name="frmSearch" id="frmSearch" action="a.jsp" method="post">
								<fieldset>
									<input type="text" name="keyword" id="keyword">
									<input type="submit" value="검색">
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
			<img style="margin:20px;height:400px;" alt="테스트이미지" src="<%=request.getContextPath()%>/images/mainPic.png">
		</div>
		<!-- container끝 -->
		
		<!-- footer시작 -->
		<div id="footer">
			<div id="footer_div">
				<div id="footer_menu">
					<a href="#">회사소개</a>
					<a href="#">알구안내</a>
					<a href="#">제휴문의</a>
					<a href="#">배너광고안내</a>
					<a href="#">이용약관</a>
					<a href="#">개인정보취급방침</a>
					<a href="#">고객센터</a>
					<a href="#">사이트맵</a>
				</div>
				<div id="footer_main">
					<div id="footer_advertise">
						<a href="index.jsp"><img alt="로고1" src="<%=request.getContextPath()%>/images/albamonLogo.png"></a>
						<a href="#"><img alt="광고2" src="<%=request.getContextPath()%>/images/saraminLogo.png"></a>
					</div>
					<div id="footer_comintro">
						<address>서울시 강남구 역삼동 707-24번지 한신인터밸리24 동관 20층 (주)미디어윌 네트웍스 <br>
								 대표이사: 김정섭 사업자등록번호 617-81-48252 | 통신판매업신고번호 : 제2011-서울강남-03265호 <br>
								 제공사업 신고번호: 서울강남 제2008-30호 | 개인정보보호 책임자: 박기란 Life2@alba.co.kr
						</address>
						<a href="#"><img alt="패밀리1" src="<%=request.getContextPath()%>/images/family_1.png"></a> 
						<a href="#"><img alt="패밀리2" src="<%=request.getContextPath()%>/images/family_2.png"></a> 
						<a href="#"><img alt="패밀리3" src="<%=request.getContextPath()%>/images/family_3.png"></a> 
					</div>
					<div id="footer_customer">
						<h2>고객지원센터</h2>
						<h2>1633-1919</h2>
						<a href="#">
						<span id="span_faq">FAQ</span>
						</a>
						<p>
							<span>FAX</span>
							<span id="span_tel">032-6777-8888</span><br>
							<span><a href="">E-MAIL alba9@alba.co.kr</a></span>
						</p>
					</div>
					<div id="footer_copyright">
						<p>© Alba9 Corp. All rights reserved</p>
					</div>
				</div>
			</div><!-- footer_div -->
		</div><!-- footer -->
		<!-- footer시작 -->
	</div>
</body>
</html>