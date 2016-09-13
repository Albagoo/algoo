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
			
			if($("#category").val()=="" || $("#category").val()=="-----"){
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
<form name="frmWrite" id="frmWrite" method="post" 
  action="<c:url value='/faq/faqWrite.ag'/>" >
 <fieldset>
	<legend>FAQ 작성</legend>
        <div class="category">
        	<label for="category">카테고리 분류</label>
        	<select name="category" id="category" title="카테고리" class="textBox" style="font-size: 0.85em;">
        		<option value="">선택하세요</option>
        		<option value="-----">-----------------------------</option>
        		<option value="개인회원 가입 및 탈퇴">개인회원 가입 및 탈퇴</option>
        		<option value="회원정보관리">회원정보관리</option>
        	 	<option value="이력서 관리 및 활용">이력서 관리 및 활용</option>
        	 	<option value="알바정보 검색 및 열람">알바정보 검색 및 열람</option>
        	 	<option value="온라인 지원">온라인 지원</option>
        	 	<option value="알바토크">알바토크</option>
        	 	<option value="-----">-----------------------------</option>
        		<option value="기업회원 가입 및 탈퇴">기업회원 가입 및 탈퇴</option>
        		<option value="기업정보관리">기업정보관리</option>
        	 	<option value="이력서 검색 및 열람">이력서 검색 및 열람</option>
        	 	<option value="지원자관리">지원자관리</option>
        	 	<option value="유료서비스/결제오류">유료서비스/결제오류</option>
        	 	<option value="세금계산서">세금계산서</option>
        	 	<option value="-----">-----------------------------</option>
        	 	<option value="기타 문의">기타 문의</option>
        	 </select>	
        </div>
        <div class="firstDiv">
            <label for="title">질문</label>
            <input type="text" id="title" name="title" style="width: 300px;font-size: 0.75em;text-align: left" 
            	class="textBox" placeholder="질문을 입력하세요"/>
        </div>
        <div>    
 			<textarea id="content" name="content"></textarea>
 		</div>
 		<br>
        <div class="center">
            <input class="button white medium" type = "submit" value="FAQ 등록" style="margin-right: 10px"/>
            <input class="button white medium" type = "button" value="FAQ 목록" 
      			onclick="location.href='<c:url value="/faq/faqList.ag"/>';" />         
        </div>
    </fieldset>
</form>
</div>
</section>
<%@ include file="../inc/simple_bottom.jsp" %>