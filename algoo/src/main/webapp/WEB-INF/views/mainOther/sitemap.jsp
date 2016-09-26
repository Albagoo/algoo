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
</p>
</td>
<td>
<p id="subTitle">지역별 채용정보</p>
</td>
<td>
<p id="subTitle">직종별 채용정보</p>
</td>
<td>
<p id="subTitle">기간별 채용정보</p>
</td>
</tr>
</table>

<span id="smTitle">인재 정보</span>
<hr>

<span id="smTitle">기업서비스<span id="smTitle">
<hr>

<span id="smTitle">개인서비스</span>
<hr>

<span id="smTitle">고객지원</span>
<hr>

<span id="smTitle">회원가입</span>
<hr>

<span id="smTitle">회사소개</span>
<hr>

</div>

<%@ include file="../inc/bottom.jsp" %> 