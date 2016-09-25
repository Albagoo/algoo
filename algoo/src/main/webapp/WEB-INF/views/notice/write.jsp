<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/boardManagement.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />

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
<form name="frmWrite" id="frmWrite" method="post"  action="<c:url value='/notice/write.ag'/>" > 
<fieldset>
<div id="Qmark">
	<span><img alt="공지사항" src="<c:url value='/images/notice11.png'/>" style="height: 22px;"></span>
</div>
 <div class="divForm">
		<div class="category">
			<label for="category">카테고리 분류</label>
			<select name="category" id="category" title="카테고리" class="textBox" style="font-size: 0.85em;">
				<option value="공지사항">공지사항</option>
				<option value="이벤트">이벤트</option>
				<option value="서비스">서비스</option>
			</select>
		</div>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="textBox" placeholder="제목을 입력하세요"/>
        </div>
        <div>	        
 			<textarea id="content" name="content"></textarea>
        </div>
        <div class="center">
            <input class="button white medium" type = "submit" value="공지등록" style="margin-right: 10px"/>
            <input class="button white medium" type = "button" value="목록" 
      			onclick="location.href='<c:url value="/notice/list.ag"/>'"/>         
        </div>
    </div>
</fieldset>
</form>
</div>
</section>

<%@ include file="../inc/admin_bottom.jsp" %> 