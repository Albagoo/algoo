<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="top.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainPage.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainPage.css'/>" />

<section>

	<a href="<c:url value='/rec/recList.ag'/>">
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
			<p id="areaLink">
			<a href="<c:url value='/rec/recList.ag?areas=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C'/>" >서울 | 
			<a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EA%B8%B0%EB%8F%84'/>">경기</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EC%9D%B8%EC%B2%9C%EA%B4%91%EC%97%AD%EC%8B%9C'/>">인천</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EA%B0%95%EC%9B%90%EB%8F%84'/>">강원</a><br>
			<a href="<c:url value='/rec/recList.ag?areas=%EB%8C%80%EC%A0%84%EA%B4%91%EC%97%AD%EC%8B%9C'/>">대전</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EC%B6%A9%EC%B2%AD%EB%82%A8%EB%8F%84'/>">충남</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EC%B6%A9%EC%B2%AD%EB%B6%81%EB%8F%84'/>">충북</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EB%B6%80%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C'/>">부산</a><br>
			<a href="<c:url value='/rec/recList.ag?areas=%EC%9A%B8%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C'/>">울산</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EC%83%81%EB%82%A8%EB%8F%84'/>">경남</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EC%83%81%EB%B6%81%EB%8F%84'/>">경북</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EB%8C%80%EA%B5%AC%EA%B4%91%EC%97%AD%EC%8B%9C'/>">대구</a><br>
			<a href="<c:url value='/rec/recList.ag?areas=%EA%B4%91%EC%A3%BC%EA%B4%91%EC%97%AD%EC%8B%9C'/>">광주</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EC%A0%84%EB%9D%BC%EB%82%A8%EB%8F%84'/>">전남</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EC%A0%84%EB%9D%BC%EB%B6%81%EB%8F%84'/>">전북</a> | 
			<a href="<c:url value='/rec/recList.ag?areas=%EC%A0%9C%EC%A3%BC%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EB%8F%84'/>">제주</a><br>
			<a href="<c:url value='/rec/recList.ag?areas=%EC%84%B8%EC%A2%85%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EC%8B%9C'/>">세종</a><br>
			<a href="<c:url value='/rec/recList.ag'/>">전국</a></p><br>
			<!-- <a href="#">지도로 찾는 알바</a><br>
			<a href="#">역세권 알바</a><br>
			<a href="#">대학가 알바</a> -->
		</td></tr>
		<tr><td id="sideTitle">업직종별</td></tr>
		<tr><td id="sideContent">
			<p id="subTit">
			<a href="<c:url value='/rec/recList.ag'/>">업직종별 알바</a></p>
			<a href="<c:url value='/rec/recList.ag?jobs=고객상담·리서치·영업'/>">
			<span id="pro">전문</span>텔레마케팅</a><br>
			<a href="<c:url value='/rec/recList.ag?jobs=생산·건설·운송'/>">
			<span id="pro">전문</span>생산직</a><br>
			<a href="<c:url value='/rec/recList.ag?jobs=사무직'/>">
			<span id="pro">전문</span>사무직</a><br>
			<a href="<c:url value='/rec/recList.ag?jobs=외식·음료'/>">
			<span id="pro">전문</span>바(Bar)</a><span id="adult">19</span><br>
		</td></tr>
		<tr><td id="sideTitle">기간별</td></tr>
		<tr><td id="sideContent">
			<p id="subTit">
			<a href="<c:url value='/rec/recList.ag'/>">근무기간·요일·시간별</a></p>
			<a href="<c:url value='/rec/recList.ag'/>">날짜별</a> | 
			<a href="<c:url value='/rec/recList.ag?workDays=%EC%A3%BC1%EC%9D%BC'/>">하루알바</a><br>
			<a href="<c:url value='/rec/recList.ag?workTerm=1%EC%A3%BC%EC%9D%BC~1%EA%B0%9C%EC%9B%94'/>">단기</a> | 
			<a href="<c:url value='/rec/recList.ag?workTerm=6%EA%B0%9C%EC%9B%94~1%EB%85%84'/>">장기</a> | 
			<a href="<c:url value='/rec/recList.ag?workDays=%EC%A3%BC%EB%A7%90'/>">주말</a> | 
			<a href="<c:url value='/rec/recList.ag?workDays=%EC%A3%BC5%EC%9D%BC'/>">주5일</a>
		</td></tr>
	</table>
	<div id="ani">
	<img src="<c:url value='/images/banner/bannera.gif'/>">
	</div>

</section>