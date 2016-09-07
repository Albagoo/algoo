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
		var answer=CKEDITOR.replace('content', {uiColor: '#ffffff'});	
		
		$("#frmWrite").submit(function(event){
			if($("#category").val()==""){
				alert("카테고리를 선택하세요");
				$("#category").focus();
				event.preventDefault();
			}else if($("#title").val()==""){
				alert("질문을 입력하세요");
				$("#title").focus();
				event.preventDefault();
			}else if(answer.val()==""){
				alert("답변을 입력하세요");
				$("#content").focus();
				event.preventDefault();
			}
		});
	});
</script>

<section>
<div class="divForm">
<form name="frmWrite" id="frmWrite" method="post" 
  action="<c:url value='/faq/faqWrite.ag'/>" >
 <fieldset>
	<legend>FAQ 작성</legend>
        <div class="category">
        	<label for="category">카테고리 분류</label>
        	<select name="category" id="category" title="카테고리" class="button white medium">
        		<option value="">선택하세요</option>
        		<option value="회원가입탈퇴">회원가입 및 탈퇴</option>
        		<option value="회원정보관리">회원정보관리</option>
        	 	<option value="이력서관리활용">이력서 관리 및 활용</option>
        	 	<option value="기타문의">기타 문의</option>
        	 </select>	
        </div>
        <div class="firstDiv">
            <label for="title">질문</label>
            <input type="text" id="title" name="title" style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="button white" placeholder="질문을 입력하세요"/>
        </div>
        <div>    
 			<textarea id="content" name="content"></textarea>
 		</div>
 		<br>
        <div class="center">
            <input class="button white" type = "submit" value="FAQ 등록" style="margin-right: 15px"/>
            <input class="button white" type = "button" value="FAQ 목록" 
      			onclick="location.href='<c:url value="/faq/faqList.ag"/>';" />         
        </div>
    </fieldset>
</form>
</div>
</section>
<%@ include file="../inc/simple_bottom.jsp" %>