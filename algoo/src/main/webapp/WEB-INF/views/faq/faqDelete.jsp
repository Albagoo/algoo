<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ include file="../inc/admin_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />

<script type="text/javascript" 
src="<c:url value='/jquery/jquery-3.1.0.min.js' />"></script>

<section>
<div class="divForm">
<form name="frmDelete" id="frmDelete" method="post" 
action="<c:url value='/faq/faqDelete.ag'/>">
		<input type="hidden" name="faqNo" value="${param.faqNo }">
		
		<fieldset>
		<div id="Qmark">
			<img src="<c:url value='/images/faqicon.png'/>" style="height: 50px;">
		</div>
	        <div>           
	        	<span class="sp">FAQ ${param.faqNo }번 질문을 삭제하겠습니까?</span>                        
	        </div>
	        <div class="center">
	            <input type ="submit" class="button white medium" value="삭제" />
	            <input type = "Button" class="button white medium" value="FAQ 목록" 
                	 onclick="location.href='<c:url value="/faq/faqList.ag" />';" /> 
	        </div>
	    </fieldset>
    </form>
</div>
</section>
<%@ include file="../inc/admin_bottom.jsp" %>