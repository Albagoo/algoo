<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#pwd").focus();
		
		$("#frmOut").submit(function(){
			if($("#pwd").val().length<1){
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}
		});
	});
	
</script>
<article class="simpleForm">
<form name="frmOut" id="frmOut" method="post" action="<c:url value='memberOut.ag'/>">
<fieldset>
<legend>회원 탈퇴</legend>

<p class="p">회원 탈퇴하시겠습니까</p>

<div>
	<label for="pwd">비밀번호</label>
	<input type="password" name="password" id="pwd">
</div>

<div class="align_center">
	<input class="button white" type="submit" id="sub" value="회원탈퇴">
	<input class="button white" type="button" value="취소">
</div>

</fieldset>
</form>
</article>
<%@ include file="../inc/bottom.jsp"%>