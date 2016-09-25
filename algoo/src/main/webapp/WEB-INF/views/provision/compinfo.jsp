<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" 
	src="<c:url value='/naver/naverLogin_implicit-1.0.2.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/provision.css'/>" />
<style type="text/css">
	.compinfo #compTb tr td{
		color:#333;
	}
	#cpt{
		font-size: 0.9em;
	}
	#cpc{
		font-size: 0.8em;
	}
</style>
<div class="compinfo">
	<h2 id="cpTitle">회사소개</h2>
	<hr>
	<table id="compTb">
		<tr>
			<td id="cpt">· 법인명</td>
			<td id="cpc">서울현대직업전문학교</td>
		</tr>
		<tr>
			<td id="cpt">· 대표이사</td>
			<td id="cpc">김남경</td>
		</tr>
		<tr>
			<td id="cpt">· 회사주소</td>
			<td id="cpc">서울시 영등포구 당산6가 343-3</td>
		</tr>
		<tr>
			<td id="cpt">· 대표전화/팩스</td>
			<td id="cpc">T. 02-2637-0123 / F. 02-2677-7582</td>
		</tr>
		<tr>
			<td id="cpt">· 이메일</td>
			<td id="cpc">helpdesk@algoo.com</td>
		</tr>
		<tr>
			<td id="cpt">· 사업자등록번호</td>
			<td id="cpc">111-22-33333</td>
		</tr>
		<tr>
			<td id="cpt">· 직업정보제공사업</td>
			<td id="cpc">소울청 제2016-04호</td>
		</tr>
		<tr>
			<td id="cpt">· 통신판매업</td>
			<td id="cpc">2016-서울영등포-0287호</td>
		</tr>
	</table>
</div>

<%@ include file="../inc/bottom.jsp" %> 