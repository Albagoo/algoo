<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" 
	src="<c:url value='/naver/naverLogin_implicit-1.0.2.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sitemap.css" />

<div class="sitemap">
<span id="smTitle">채용정보</span>
<hr>
<table>
<tr>
<td>
<p id="subTitle">일반 채용정보</p>
<p id="smContent"><a href="<c:url value='/rec/recList.ag'/>">전체 채용정보</a>
<br><br><br><br><br><br><br><br><br><br><br>
</p>
</td>
<td>
<p id="subTitle">지역별 채용정보</p>
<p id="smContent">
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C'/>" >서울</a></span> 
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EA%B8%B0%EB%8F%84'/>">경기</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%9D%B8%EC%B2%9C%EA%B4%91%EC%97%AD%EC%8B%9C'/>">인천</a></span> 
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EA%B0%95%EC%9B%90%EB%8F%84'/>">강원</a></span><br>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EB%8C%80%EC%A0%84%EA%B4%91%EC%97%AD%EC%8B%9C'/>">대전</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%B6%A9%EC%B2%AD%EB%82%A8%EB%8F%84'/>">충남</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%B6%A9%EC%B2%AD%EB%B6%81%EB%8F%84'/>">충북</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EB%B6%80%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C'/>">부산</a></span><br>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%9A%B8%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C'/>">울산</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EC%83%81%EB%82%A8%EB%8F%84'/>">경남</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EC%83%81%EB%B6%81%EB%8F%84'/>">경북</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EB%8C%80%EA%B5%AC%EA%B4%91%EC%97%AD%EC%8B%9C'/>">대구</a></span><br>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EA%B4%91%EC%A3%BC%EA%B4%91%EC%97%AD%EC%8B%9C'/>">광주</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%A0%84%EB%9D%BC%EB%82%A8%EB%8F%84'/>">전남</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%A0%84%EB%9D%BC%EB%B6%81%EB%8F%84'/>">전북</a></span>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%A0%9C%EC%A3%BC%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EB%8F%84'/>">제주</a></span><br>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag?areas=%EC%84%B8%EC%A2%85%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EC%8B%9C'/>">세종</a></span><br>
	<span id="smCC"><a href="<c:url value='/rec/recList.ag'/>"><span style="font-weight:bold">전국</span></a></span></p>
	<br><br><br><br>
</p>
</td>
<td>
	<p id="subTitle">직종별 채용정보</p>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EC%99%B8%EC%8B%9D%C2%B7%EC%9D%8C%EB%A3%8C'/>">
		외식·음료</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EC%9C%A0%ED%86%B5%C2%B7%ED%8C%90%EB%A7%A4'/>">
		유통·판매</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EB%AC%B8%ED%99%94%C2%B7%EC%97%AC%EA%B0%80%EC%83%9D%ED%99%9C'/>">
		문화·여가생활</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EC%84%9C%EB%B9%84%EC%8A%A4'/>">
		서비스</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EC%82%AC%EB%AC%B4%EC%A7%81'/>">
		사무직</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EA%B3%A0%EA%B0%9D%EC%83%81%EB%8B%B4%C2%B7%EB%A6%AC%EC%84%9C%EC%B9%98%C2%B7%EC%98%81%EC%97%85'/>">
		고객상담·리서치·영업</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EC%83%9D%EC%82%B0%C2%B7%EA%B1%B4%EC%84%A4%C2%B7%EC%9A%B4%EC%86%A1'/>">
		생산·건설·운송</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=IT%C2%B7%EC%BB%B4%ED%93%A8%ED%84%B0'/>">
		IT·컴퓨터</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EA%B5%90%EC%9C%A1%C2%B7%EA%B0%95%EC%82%AC'/>">
		교육·강사</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EB%94%94%EC%9E%90%EC%9D%B8'/>">
		디자인</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/rec/recList.ag?jobs=%EB%AF%B8%EB%94%94%EC%96%B4'/>">
		미디어</a></span><br>
	</p>
</td>
<td>
<p id="subTitle">기간별 채용정보</p>
<p id="smContent">
	<a href="<c:url value='/rec/recList.ag'/>">근무기간·요일·시간별</a><br>
	<a href="<c:url value='/rec/recList.ag'/>">날짜별</a><br>
	<a href="<c:url value='/rec/recList.ag'/>">하루알바</a><br>
	<a href="<c:url value='/rec/recList.ag'/>">단기</a><br>
	<a href="<c:url value='/rec/recList.ag'/>">장기</a><br>
	<a href="<c:url value='/rec/recList.ag'/>">주말</a><br>
	<a href="<c:url value='/rec/recList.ag'/>">주5일</a>
	<br><br><br><br><br>
</p>
</td>
</tr>
</table>

<span id="smTitle">인재 정보</span>
<hr>
<table>
<tr>
<td><p id="smContent"><a href="<c:url value='/resume/list.ag'/>">인재 정보</a></p></td>
<td></td>
<td></td>
<td></td>
</tr>
</table>

<span id="smTitle">기업서비스<span id="smTitle">
<hr>
<table>
<tr>
<td>
<p id="smContent">
<span id="smCC">
<a href="<c:url value='/rec/recWrite.ag'/>">채용공고 등록</a></span>
</p><br>
</td>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/resume/list.ag'/>">이력서 목록</a></span>
	</p><br>
</td>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/company/compDetail.ag'/>">기업정보 보기</a></span>
	<br>
	<span id="smCC">
	<a href="<c:url value='/member/memInfo.ag'/>">담당자정보 수정</a></span>
</td>
<td></td>
</tr>
</table>

<span id="smTitle">개인서비스</span>
<hr>
<table>
<tr>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/resume/write.ag'/>">이력서 등록</a></span>
	</p>
</td>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/member/memInfo.ag'/>">개인정보 수정</a></span>
	</p>
</td>
<td></td>
<td></td>
</tr>
</table>

<span id="smTitle">고객지원</span>
<hr>
<table>
<tr>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/notice/list.ag'/>">공지사항</a></span>
	</p>
</td>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/faq/faqList.ag'/>">문의사항</a></span>
	</p>
</td>
<td></td>
<td></td>
</tr>
</table>

<span id="smTitle">회원가입</span>
<hr>
<table>
<tr>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/jj/join.ag'/>">회원가입</a></span>
	</p><br>
</td>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/member/memInfo.ag'/>">회원정보 수정</a></span>
	</p><br>
</td>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/member_comp/memberWithdraw.ag'/>">회원 탈퇴</a></span>
	</p><br>
</td>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/provision/pProvision.ag'/>">회원 이용약관</a></span><br>
	<span id="smCC">
	<a href="<c:url value='/provision/privacy.ag'/>">개인정보취급방침</a></span>
	</p>
</td>
</tr>
</table>

<span id="smTitle">회사소개</span>
<hr>
<table>
<tr>
<td>
	<p id="smContent">
	<span id="smCC">
	<a href="<c:url value='/provision/compinfo.ag'/>">회사 개요</a></span>
	</p>
</td>
<td></td>
<td></td>
<td></td>
</tr>
</table>

</div>

<%@ include file="../inc/bottom.jsp" %> 