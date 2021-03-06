<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript" 
src="<c:url value='/jquery/jquery-3.1.0.min.js' />"></script>
<script src="<c:url value='/ckeditor/ckeditor.js'/>" 
type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('content', {uiColor: '#ffffff'});
		
		
		$("#frmWrite").submit(function(event){
			var instance = CKEDITOR.instances.content;
			instance.updateElement();
			
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$("#title").focus();
				event.preventDefault();
			}else if($("#password").val()==""){
					alert("비밀번호를 입력하세요");
					$("#password").focus();
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
<form name="frmWrite" id="frmWrite" method="post" 
  action="<c:url value='/freeboard/reply.ag'/>" >
<input type="hidden" name="groupNo" value="${freeVo.groupNo}">
<input type="hidden" name="step" value="${freeVo.step}">
<input type="hidden" name="sortNo" value="${freeVo.sortNo}">
<input type="hidden" name="userid" value="${sessionScope.userid }">
<input type="hidden" name="nickName" value="${sessionScope.nickName }">
 <fieldset>
	<legend> 
		<img src="<c:url value='/images/albatalk.png'/>" style="height: 25px;" align=absmiddle>
	</legend>
    <div class="firstDiv">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" 
        	style="width: 400px;font-size: 0.75em;text-align: left" 
        	class="textBox" value="${freeVo.title }"/>
    </div>
     <div>    
		<textarea id="content" name="content"></textarea>
	</div>
	<br>
    <div class="center">
         <input class="button white medium" type = "submit" value="등록하기" style="margin-right: 10px"/>
         <input class="button white medium" type = "button" value="목록" 
   			onclick="location.href='<c:url value="/freeboard/list.ag"/>';" />         
    </div>
    </fieldset>
</form>
</div>
</section>
<%@ include file="../inc/bottom.jsp" %>