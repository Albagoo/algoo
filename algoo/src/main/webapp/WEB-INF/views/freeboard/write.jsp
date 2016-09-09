<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/simple_top.jsp" %>
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
			}else if($("#writer").val()==""){
				alert("이름을 입력하세요");
				$("#writer").focus();
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
  action="<c:url value='/freeboard/write.ag'/>" >
 <fieldset>
	<legend> 
		<img src="<c:url value='/images/bubble-talk.jpg'/>" style="height: 55px;" align=absmiddle>
		알바토크 글 쓰기</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="button white" placeholder="제목을 입력하세요"/>
        </div>
     	<div>
     		<label for="writer">작성자</label>
     		<input type="text" id="writer" name="writer" style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="button white" placeholder="이름을 입력하세요"/>
     	</div>
     	<div>
     		<label for="password">비밀번호</label>
     		<input type="password" id="password" name="password" 
     			style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="button white" placeholder="비밀번호를 입력하세요"/>
     	</div>
        <div>    
 			<textarea id="content" name="content"></textarea>
 		</div>
 		<br>
        <div class="center">
            <input class="button white medium" type = "submit" value="글 등록" style="margin-right: 10px"/>
            <input class="button white medium" type = "button" value="글 목록" 
      			onclick="location.href='<c:url value="/freeboard/list.ag"/>';" />         
        </div>
    </fieldset>
</form>
</div>
</section>
<%@ include file="../inc/simple_bottom.jsp" %>