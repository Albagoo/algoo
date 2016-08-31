<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>

<section>
	<h2>FAQ 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">[${faqVo.category }] Q.</span> 
			<span>${faqVo.title }</span>
		</div>
		<div>
			<span class="sp1">등록일</span> 
			<span><fmt:formatDate value="${faqVo.regdate }" pattern="yyyy-MM-dd"/></span>
		</div>
		<div>
			<span class="sp1">조회수</span> 
			<span>${faqVo.readCount }</span>
		</div>
		<div class="lastDiv">			
			<p class="content">${faqVo.content }</p>
		</div>
		<div class="center">
			<a href
="<c:url value='/faq/faqEdit.ag?faqNo=${faqVo.faqNo}'/>">
수정</a> |
        	<a href
="<c:url value='/faq/faqDelete.ag?faqNo=${faqVo.faqNo}'/>">
삭제</a> |
        	<a href
="<c:url value='/faq/faqList.ag'/>">목록</a>			
		</div>
	</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %>