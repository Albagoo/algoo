<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<c:if test="${empty clist }">
		<span style="display: none;"></span>
	</c:if>
	<c:if test="${!empty clist }">
		<c:forEach var="cmtVo" items="${clist }">
			<span style="font-weight: bold;">${cmtVo.nickName }</span>
			<span><fmt:formatDate value="${cmtVo.regdate }" pattern="yyyy.MM.dd HH:mm"/> </span>
			<span><img alt="답글이미지" src="../images/reply.png" style="height: 20px;"><a href="#">답글</a></span>
			<p>${cmtVo.content }</p>
		</c:forEach>		
	</c:if>
</div>