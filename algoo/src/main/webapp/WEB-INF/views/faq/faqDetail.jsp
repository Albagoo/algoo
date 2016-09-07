<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />

<section>
	<div class="divForm">
	<legend>FAQ 상세보기</legend>
		<div class="firstDiv2">
			<span class="sp1">[${faqVo.category }] ${faqVo.title }</span>
			<span class="sp2">등록일 <fmt:formatDate value="${faqVo.regdate }" pattern="yyyy-MM-dd"/></span>
		</div>
		<div class="secondDiv">
			<p class="content">${faqVo.content }</p>
		</div>
		<div class="center">
			<br><a href
="<c:url value='/faq/faqEdit.ag?faqNo=${faqVo.faqNo}'/>" class="button white medium">
수정</a>
        	<a href
="<c:url value='/faq/faqDelete.ag?faqNo=${faqVo.faqNo}'/>" class="button white medium">
삭제</a>
        	<a href
="<c:url value='/faq/faqList.ag'/>" class="button white medium">목록</a>			
		</div>
	</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %>