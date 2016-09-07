<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js' />"></script>
<script src="<c:url value='/ckeditor/ckeditor.js'/>" 
type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('content');		
	});
</script>

<section>
<div class="divForm">
<form name="frmEdit" id="frmEdit" method="post" 
	action="<c:url value='/faq/faqEdit.ag'/>"> 
	<input type="hidden" name="faqNo" value="${faqVo.faqNo}">
	
    <fieldset>
	<legend>FAQ 수정</legend>
        <div class="firstDiv">
            <label for="title" style="width:7%;">질문</label>
            <input type="text" id="title" name="title" style="width: 500px;" 
            	value="${faqVo.title }" />
        </div>
        <div>	       
 			<textarea id="content" name="content" 
 			rows="12" cols="40">${faqVo.content }</textarea>
        </div>
        <br>
        <div class="center">
            <input type = "submit" class="button white medium" value="FAQ 수정"/>
            <input type = "Button" class="button white medium" value="FAQ 목록" 
            onclick="location.href='<c:url value="/faq/faqList.ag"/>'" />     
        </div>
	</fieldset>
</form>    
</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %>