<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberinfo.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<style type="text/css">
	td{
		padding: 10px;
	}
	th{
		padding: 10px;
	}
	a, a:VISITED{
		color: black;
		font-weight: bold;
	}
</style>

<div id="naviDiv">
	<nav>
		<dl id="leftNavi">
			<dt><a href="<c:url value='/member/memInfo.ag'/>">회원페이지</a></dt>
			<dd><a href="<c:url value='/login/mypageType.ag'/>">내정보관리</a></dd>
			<c:if test="${sessionScope.authCode==2 }">
				<dd><a href="<c:url value='/company/compRegister.ag'/>">기업정보 등록 및 수정</a></dd>
				<dd><a href="#">채용 공고 관리</a></dd>
			</c:if>
			<c:if test="${sessionScope.authCode==1 }">
				<dd><a href="<c:url value='/apply/applyList.ag'/>">지원 현황</a></dd>
				<dd><a href="#">이력서 관리</a></dd>
			</c:if>
			<dd><a href="<c:url value='/member_comp/memberWithdraw.ag'/>">회원탈퇴</a></dd>
		</dl>
	</nav>
</div>
<div id="memInfo">
	<div style="padding: 10px; height: 100%">
		<h2 style="font-size: 1.4em; font-weight: bold;
					border-bottom: 3px solid #E70400; padding: 10px; ">지원현황</h2>
		<table style="width: 100%;">	
			<colgroup>
				<col width="60%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<tr style="border-bottom: 1px solid #e6e6e6;">
				<th>공고 제목</th>
				<th>지원 날짜</th>
				<th>열람 여부</th>
			</tr>
			<c:forEach var="vo" items="${alist }">
				<tr style="text-align: center; border-bottom: 1px solid #e6e6e6;">
					<td style="text-align: left;">
					<a href="<c:url value='/rec/recDetail.ag?recCode=${vo.recCode }'/>"
						style="text-decoration: none;">${vo.title }</a></td>
					<td><fmt:formatDate value="${vo.days }" pattern="yyyy-MM-dd"/></td>
					<td><span style="font-weight: bold; color: red">${vo.readCheck }</span></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>


<%@ include file="../inc/bottom.jsp"%>