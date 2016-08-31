<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../inc/simple_top.jsp" %>

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
            <label for="title">질문</label>
            <input type="text" id="title" name="title"  
            	value="${faqVo.title }" />
        </div>
        <div>  
        	<label for="content">제목</label> 
        </div>
        <div>	       
 			<textarea id="content" name="content" 
 			rows="12" cols="40">${faqVo.content }</textarea>
        </div>
        <br>
        <div class="center">
            <input type = "submit" value="FAQ 수정"/>
            <input type = "Button" value="FAQ 목록" 
            onclick="location.href='<c:url value="/faq/faqList.ag"/>'" />     
        </div>
	</fieldset>
</form>    
</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %>