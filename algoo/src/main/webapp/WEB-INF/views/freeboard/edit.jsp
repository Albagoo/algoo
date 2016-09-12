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
		
		if($("#title").val()==""){
			alert("제목을 입력하세요");
			$("#title").focus();
			event.preventDefault();
		}else if(instance.getData()==""){
			alert("내용을 입력하세요");
			$("#content").focus();
			event.preventDefault();
		}
	});
});
</script>

<section>
<div class="divForm">
<form name="frmEdit" id="frmEdit" method="post" 
	action="<c:url value='/freeboard/edit.ag'/>"> 
	<input type="hidden" name="freeNo" value="${freeVo.freeNo}">
	
    <fieldset>
	<legend>
		<img src="<c:url value='/images/albatalk.png'/>" style="height: 48px;" align=absmiddle>
	</legend>
        <div class="firstDiv">
            <label for="title" style="width:10%;">제목</label>
            <input type="text" id="title" name="title" 
            	style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="textBox" value="${freeVo.title }" />
        </div>
        <div>	       
 			<textarea id="content" name="content">${freeVo.content }</textarea>
        </div>
        <br>
        <div class="center">
            <input type = "submit" class="button white medium" value="수정하기"/>
            <input type = "Button" class="button white medium" value="목록" 
            onclick="location.href='<c:url value="/freeboard/list.ag"/>'" />     
        </div>
	</fieldset>
</form>    
</div>
</section>
<%@ include file="../inc/simple_bottom.jsp" %> 