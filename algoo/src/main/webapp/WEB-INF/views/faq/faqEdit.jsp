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
	CKEDITOR.replace('content', {uiColor: '#ffffff'});	
	
	$("#frmEdit").submit(function(event){
		var instance = CKEDITOR.instances.content;
		instance.updateElement();
		
		if($("#category").val()==""){
			alert("카테고리를 선택하세요");
			$("#category").focus();
			event.preventDefault();
		}else if($("#title").val()==""){
			alert("질문을 입력하세요");
			$("#title").focus();
			event.preventDefault();
		}else if(instance.getData()==""){
			alert("답변을 입력하세요");
			$("#content").focus();
			event.preventDefault();
		}
	});
});
</script>

<section>
<div class="divForm">
<form name="frmEdit" id="frmEdit" method="post" 
	action="<c:url value='/faq/faqEdit.ag'/>"> 
	<input type="hidden" name="faqNo" value="${faqVo.faqNo}">
	
    <fieldset>
	<legend>FAQ 수정</legend>
		<div class="category">
        	<label for="category">카테고리 분류</label>
        	<select name="category" id="category" title="카테고리" class="textBox" style="font-size: 0.75em;">
        		<option value="">선택하세요</option>
        		<option value="회원가입탈퇴" 
        			<c:if test="${faqVo.category=='회원가입탈퇴' }">
        				selected
        			</c:if>>회원가입 및 탈퇴</option>
        		<option value="회원정보관리"
        			<c:if test="${faqVo.category=='회원정보관리' }">
        				selected
        			</c:if>>회원정보관리</option>
        	 	<option value="이력서관리활용"
        			<c:if test="${faqVo.category=='이력서관리활용' }">
        				selected
        			</c:if>>이력서 관리 및 활용</option>
        	 	<option value="기타문의" 
        			<c:if test="${faqVo.category=='기타문의' }">
        				selected
        			</c:if>>기타문의</option>
        	 </select>	
        </div>
        <div class="firstDiv">
            <label for="title" style="width:12%;">질문</label>
            <input type="text" id="title" name="title" 
            	style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="textBox" value="${faqVo.title }" />
        </div>
        <div>	       
 			<textarea id="content" name="content">${faqVo.content }</textarea>
        </div>
        <br>
        <div class="center">
            <input type = "submit" class="button white medium" value="수정하기"/>
            <input type = "Button" class="button white medium" value="목록" 
            onclick="location.href='<c:url value="/faq/faqList.ag"/>'" />     
        </div>
	</fieldset>
</form>    
</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %>