<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainPage.css'/>" />
	<%-- <!-- 메인 컨테이너 페이지 -->
	<br>
	<img src="<c:url value='${pageContext.request.contextPath}/images/console.png'/>" 
		alt="메인테스트">
	<br><br> --%>
	
	<section>
		<div class="divMain">
			<div class="divCategory">
				<!-- 광고 및 기본 기능 -->
				<div class="divCAD">
				<div class="divCmHeader">
					<!-- 광고배너(2개) -->
					<table>
					<td><img src="<c:url value='/images/banner1.jpg'/>"></td>
					<td><img src="<c:url value='/images/banner2.jpg'/>"></td>
					</table>
				</div>
				<div class="divDivision">
					<!-- 알바 분류 -->
					<div class="divJob">
						<!-- 지역별 알바 -->
					</div>
					<div class="divJob">
						<!-- 업종별 알바 -->
					</div>
					<div class="divJob">
						<!-- 테마별 알바 -->
					</div>
				</div>
				</div>
				<div class="divFunction">
					<!-- 로그인상자 및 광고 -->
					<div class="loginBox">
						<!-- 로그인상자 -->
					</div>
					<div class="divCommercial2">
						<!-- 다른 사이즈의 광고 -->
					</div>
				</div>
				<div class="divBrand">
					<!-- 브랜드 알바(페이지 슬라이드) -->
				</div>
			</div>
			<div class="divSpecial">
				<span id="divTitle">슈퍼 채용공고</span>
				<!-- 슈퍼 채용공고 리스트 -->
				<table class="tableSpecial">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="divGrand">
				<span id="divTitle">그랜드 채용공고</span>
				<table class="tableGrand">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="divOther">
				<!-- 일반 공고 리스트(게시판형) -->
			</div>
			<div class="divCmFooter">
				<!-- 광고배너(2개) -->
			</div>
		</div>
	</section>
	
<%@ include file="inc/bottom.jsp" %> 