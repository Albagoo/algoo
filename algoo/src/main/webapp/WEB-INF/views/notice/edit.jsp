<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/admin_top.jsp" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />

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
				alert("공지를 입력하세요");
				$("#content").focus();
				event.preventDefault();
			}
		});
	});
</script>

<style type="text/css">
	section{
		padding:5px;
		margin:5px;
	}
	.title{
		font-size:24px;
		text-align:left;
	}
</style>

<section>
<div class="divForm">
<form name="frmEdit" id="frmEdit" method="post" 
	action="<c:url value='/notice/edit.ag'/>"> 
<input type="hidden" name="mainNo" value="${noticeVo.mainNo}">
<fieldset>
	<div id="Qmark">
		<img src="<c:url value='/images/notice.png'/>" style="height: 50px;">
	</div>
	<div class="category">
        	<label for="category">카테고리 분류</label>
			<select name="category" id="category" title="카테고리" class="textBox" style="font-size: 0.8em;">
				<option value="공지"
				 <c:if test="${noticeVo.category=='공지' }">
            		selected
            	</c:if>>공지</option>
				<option value="이벤트"
				 <c:if test="${noticeVo.category=='이벤트' }">
            		selected
            	</c:if>>이벤트</option>
				<option value="점검"
				  <c:if test="${noticeVo.category=='점검' }">
            		selected
            	</c:if>>점검</option>
			</select>
	    </div>
	    <div class="firstDiv">
            <label for="title" style="width:12%;">제목</label>
            <input type="text" id="title" name="title" 
            	style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="textBox" value="${noticeVo.title }" />
        </div>
      	<div>	       
 			<textarea id="content" name="content">${noticeVo.content }</textarea>
        </div>
        <br>
        <div class="center">
            <input type = "submit" class="button white medium" value="수정하기"/>
            <input type = "Button" class="button white medium" value="목록" 
            onclick="location.href='<c:url value="/notice/list.ag"/>'" />     
        </div>
	</fieldset>
</form>    
</div>
</section>

<%@ include file="../inc/admin_bottom.jsp" %>