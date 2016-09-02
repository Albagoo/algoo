<%@page import="com.algoo.app.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/css/mainstyle.css'/>">
	
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js' />"></script>	
	
<script type="text/javascript">
	$(document).ready(function(){
		$("#userid").focus();
		
		$("#frmDup").submit(function(){
			if($("#userid").val().length<1){
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return false;
			}			
		}); //submit
		
		$("#btUse").click(function(){
			//아이디 사용하기 버튼 클릭시 처리
			$(opener.document).find("#userid")
				.val("${param.userid}");
			$(opener.document).find("#chkId").val("Y");
			
			self.close();
		});//click
		
	});

</script>	
</head>
<body>
	<h2>아이디 중복 검사</h2>
	<form name="frmDup" id="frmDup" method="post" 
		action="<c:url value='/member/checkUserid.ag'/>">
		<label for="userid">아이디 : </label>
		<input type="text" name="userid" id="userid"
			value=${param.userid }>
		<input type="submit" value="아이디 확인">
			<c:set var="existId" value="<%=MemberService.EXIST_ID %>"/>
		<c:set var="noneExistId" value="<%=MemberService.NONE_EXIST_ID %>"/>	
		<c:if test="${result==existId }">
			<!-- 해당 아이디가 이미 존재하는 경우 -->
			<p>
				이미 등록된 아이디입니다. 
				다른 아이디를 입력하세요
			</p>
		</c:if>
		<c:if test="${result==noneExistId}">
			<!-- 해당 아이디가 존재하지 않는 경우 -->
			<input type="button" id="btUse" value="사용하기" >
			<p>	
				사용가능한 아이디입니다. 
				[사용하기]버튼을 클릭하세요.
			</p>
		</c:if>
	</form>
	
	
</body>
</html>










