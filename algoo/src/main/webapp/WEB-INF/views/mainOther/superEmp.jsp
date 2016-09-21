<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mainOther/superEmp</title>
</head>
<body>

<div id="superEmp">
	<br><br>
	<p id="divTitle">슈퍼 채용공고(DB연동부분)</p>
	
	<div class="superEmp" summary="슈퍼 공고 리스트">
		<c:if test="${empty alist}">
			<!-- <tr> -->
				<div class="align_center">
					공고가 없습니다</div>
			<!-- </tr> -->
		</c:if>
		<c:if test="${empty alist}">
		</c:if>
		<!-- 반복 시작 -->
		<c:forEach var="vo" items="${alist}">
			<div class="superCon">
		
			   <a href="<c:url value='/rec/updateCount.ag?recCode=${vo.recCode}'/>">
			   <div class="SpBox">
			   	  <img src="<c:url value='/images/company/000.jpg'/>">
                  <br><p id="title">${vo.compName }</p>
                  <p id="content">${vo.title}</p>
                  <p id="pay">
                  <c:set var="addr" value="${fn:split(vo.address,' ')}"/>
               	  <c:forEach var="i" begin="0" end="1">
                  ${addr[i] }
                  </c:forEach>
                  <span id="timeType">
                   <c:if test="${vo.payType=='시급' }">
	                <span style="margin-top:12px;font-size:12px;color:white;
					 background-color:gray;padding:1px;border-radius:3px;">
					시</span></c:if>
	               <c:if test="${vo.payType=='일급' }">
	                <span style="margin-top:12px;font-size:12px;color:white;
					 background-color:gray;padding:1px;border-radius:3px;">
	                일</span></c:if>
	               <c:if test="${vo.payType=='주급' }">
	                <span style="margin-top:12px;font-size:12px;color:white;
					 background-color:gray;padding:1px;border-radius:3px;">
	                 주</span></c:if>
	               <c:if test="${vo.payType=='월급' }">
	                <span style="margin-top:12px;font-size:12px;color:white;
					 background-color:gray;padding:1px;border-radius:3px;">
	                 월</span></c:if>
	               <c:if test="${vo.payType=='연봉' }">
	                <span style="margin-top:12px;font-size:12px;color:white;
					 background-color:gray;padding:1px;border-radius:3px;">
	                 연</span></c:if>
                  </span>
                  <span id="money"><fmt:formatNumber pattern="#,###"
              		 value="${vo.pay }"/></span>원</p>
               </div></a>
               
            </div>
		</c:forEach>
		<!-- 반복 끝 -->
	</div>
</div>

</body>
</html>