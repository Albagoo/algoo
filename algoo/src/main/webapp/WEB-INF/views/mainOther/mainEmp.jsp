<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mainOther/mainEmp</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#specialEmp .specialEmp tr")
			.hover(function(){
				$(this).css("background","ivory")
					.css("cursor","pointer");
			},function(){
				$(this).css("background","");
			});
	});
</script>
</head>
<body>

<div id="specialEmp">
	<br><br>
	<p id="divTitle">스페셜 채용공고</p>
	
	<table class="specialEmp" summary="스페셜 공고 리스트">
		<c:if test="${empty alist}">
			<tr>
				<td class="align_center">
					공고가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${empty alist}">
		</c:if>
		<!-- 반복 시작 -->
		<c:forEach var="vo" items="${alist}">
			<tr>
				<td>
	               <c:set var="addr" value="${fn:split(vo.address,' ')}"/>
	               <c:forEach var="i" begin="0" end="1">
	                  ${addr[i] }
	               </c:forEach>
	            </td>
	            
	            <td style="text-align: left">
	               <a href="<c:url value='/rec/updateCount.ag?recCode=${vo.recCode}'/>">
	                  &nbsp; ${vo.title}</a>
	            </td>
	            
	            <td style="text-align: left">
	               <a href="<c:url value='/rec/updateCount.ag?recCode=${vo.recCode}'/>">
	                  &nbsp; [${vo.compName }]</a>
	            </td>
	            
	            <td style="text-align: right">
	               <fmt:formatNumber pattern="#,###"
	               value="${vo.pay }"/>원
	               <c:if test="${vo.payType=='시급' }">
	                <span style="padding:1px;border:solid 1px CornflowerBlue;border-radius:3px;font-size:8px;color:CornflowerBlue">시</span></c:if>
	               <c:if test="${vo.payType=='일급' }">
	                <span style="padding:1px;border:solid 1px LimeGreen;border-radius:3px;font-size:8px;color:LimeGreen">일</span></c:if>
	               <c:if test="${vo.payType=='주급' }">
	                 <span style="padding:1px;border:solid 1px OrangeRed;border-radius:3px;font-size:8px;color:OrangeRed">주</span></c:if>
	               <c:if test="${vo.payType=='월급' }">
	                 <span style="padding:1px;border:solid 1px red;border-radius:3px;font-size:8px;color:red">월</span></c:if>
	               <c:if test="${vo.payType=='연봉' }">
	                 <span style="padding:1px;border:solid 1px SaddleBrown;border-radius:3px;font-size:8px;color:SaddleBrown">연</span></c:if>
	               <%-- ${vo.payType } --%>
	            </td>
			</tr>
		</c:forEach>
		<!-- 반복 끝 -->
	</table>
</div>

</body>
</html>