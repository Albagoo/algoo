<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainPage.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainPage.css'/>" />

<section>

	<a href="#">
	<div class="leftSideBt">
		채용정보
	</div></a>
	
	<table class="leftSideTb">
		<tr><td id="sideTitle">일반 알바정보</td></tr>
		<tr><td id="sideContent">
				<p id="subTit">
				<a href="<c:url value='/rec/recList.ag'/>">전체 알바</a>
				</p>
			<a href="#">오늘의 알바</a> | 
			<a href="#"><span style="color:red">급구</span> 알바</a><br>
			<a href="#">상세 검색</a>
		</td id="sideContent"></tr>
		<tr><td id="sideTitle">지역별</td></tr>
		<tr><td id="sideContent">
			<p id="subTit">
			<a href="#">우리동네 알바</a></p>
			<p style="color:gray">서울 | 경기 | 인천 | 강원<br>
			대전 | 충남 | 충북 | 부산<br>
			울산 | 경남 | 경북 | 대구<br>
			광주 | 전남 | 전북 | 제주<br>
			전국</p><br>
			<a href="#">지도로 찾는 알바</a><br>
			<a href="#">역세권 알바</a><br>
			<a href="#">대학가 알바</a>
		</td></tr>
		<tr><td id="sideTitle">업직종별</td></tr>
		<tr><td id="sideContent">
			<p id="subTit">
			<a href="#">업직종별 알바</a></p>
			<a href="#">
			<span id="pro">전문</span>텔레마케팅</a><br>
			<a href="#">
			<span id="pro">전문</span>생산직</a><br>
			<a href="#">
			<span id="pro">전문</span>사무직</a><br>
			<a href="#">
			<span id="pro">전문</span>바(Bar)</a><span id="adult">19</span><br>
		</td></tr>
		<tr><td id="sideTitle">기간별</td></tr>
		<tr><td id="sideContent">
			<p id="subTit">
			<a href="#">근무기간·요일·시간별</a></p>
			<a href="#">날짜별</a> | 
			<a href="#">하루알바</a><br>
			<a href="#">단기</a> | 
			<a href="#">장기</a> | 
			<a href="#">주말</a> | 
			<a href="#">주5일</a>
		</td></tr>
		<tr><td id="sideTitle">스펙UP</td></tr>
		<tr><td id="sideContent">
			<a href="#">취업맛보기 알바</a><br>
			<a href="#">능력활용 알바</a><br>
			<a href="#">취업가산점 알바</a><br>
			<a href="#">취업가산점 제공 기업</a><br>
			<a href="#">스펙업 자소서팁</a>
		</td></tr>
		<tr><td id="sideTitle">급여·복지별</td></tr>
		<tr><td id="sideContent">
			<p id="subTit">
			<a href="#">급여별 알바</a></p>
			<a href="#">식대별도</a> | 
			<a href="#">당일지급</a><br>
			<a href="#">주급가능</a><br>
			<a href="#">복리후생별 알바</a>
		</td></tr>
		<tr><td id="sideTitle">대상별</td></tr>
		<tr><td id="sideContent">
			<a href="#">청소년</a> | 
			<a href="#">대학생</a><br>
			<a href="#">주부</a> | 
			<a href="#">장년</a> | 
			<a href="#">장애인</a>
		</td></tr>
		<tr><td id="sideTitle">테마별</td></tr>
		<tr><td id="sideContent">
			<a href="#">우대조건별 알바</a><br>
			<a href="#">초보가능</a> | 
			<a href="#">주목 알바</a><br>
			<a href="#">재택 알바</a> | 
			<a href="#">친구와 함께</a><br>
			<a href="#">접수방법별 알바</a>
		</td></tr>
		<tr><td id="sideTitle">맞춤알바정보</td></tr>
		<tr><td id="sideContent">
			<a href="#">오늘 본 채용정보</a><br>
			<a href="#">스크랩 알바정보</a><span id="star">★</span><br>
			<a href="#">나의 맞춤알바</a>
		</td></tr>
	</table>
	<div id="ani">
	<img src="<c:url value='/images/banner/bannera.gif'/>">
	</div>

</section>