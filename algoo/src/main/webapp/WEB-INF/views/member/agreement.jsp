<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>" />
<style type="text/css">
	#divAgree{
		width:700px;
	}
	#divAgreeFirst{
		text-align: right;
		margin: 10px 0;
	}	
	.container{
		margin-left:130px;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmAgree").submit(function(event){
			if(!$("#chkAgree").is(":checked")){
				alert("약관에 동의하셔야 합니다.");
				$("#chkAgree").focus();
				event.preventDefault();
			}
		});
	});
</script>
   <div class="container" > 
	<h2 id="aa">회원약관</h2>
	<iframe src="<c:url value='/inc/provision.html'/>" 
		width="700px" height="300px"></iframe>
	
	<div id="divAgree">
		<form name="frmAgree" id="frmAgree" method="post" 
			action="<c:url value='/member/register.ag'/>">
			<div id="divAgreeFirst">
				<input type="checkbox" name="chkAgree" 
					id="chkAgree">
				<label for="chkAgree">약관에 동의합니다</label>
			</div> 
			<div class="align_center">
				<input class="button white" type="submit" value="확인">
				<input class="button white" type="reset" value="취소">
			</div>
		</form>
	</div>
	</div>
<%@ include file="../inc/simple_bottom.jsp" %>






