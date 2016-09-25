<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</div>
		<!-- container끝 -->
		
		<!-- footer시작 -->
		<div id="footer">
			<div id="footer_div">
				<div id="footer_menu">
					<a href="<c:url value='/provision/compinfo.ag'/>">회사소개</a>
					<a href="#">알구안내</a>
					<a href="#">제휴문의</a>
					<a href="#">배너광고안내</a>
					<a href="<c:url value='/provision/pProvision.ag'/>">이용약관</a>
					<a href="<c:url value='provision/privacy.ag'/>">개인정보취급방침</a>
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
						<a href="<%=request.getContextPath()%>/faq/faqList.ag">
						<span id="span_faq">FAQ</span>
						</a>
						<p>
							<span>FAX</span>
							<span id="span_tel">032-6777-8888</span><br>
							<span><a href="">E-MAIL alba9@alba.co.kr</a></span>
						</p>
					</div>
					<div id="footer_copyright">
						<a href="/index.ag"><img alt="로고이미지" src="<c:url value='/images/simple_Logo.png'/>"></a>
						<span>© ALGOO Corp. All rights reserved</span>
					</div>
				</div>
			</div><!-- footer_div -->
		</div><!-- footer -->
		<!-- footer시작 -->
	</div>
</body>
</html>