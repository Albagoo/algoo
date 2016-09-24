<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />
<style type="text/css">
	#loginDiv{
		margin:0 auto;
		width:50%;
		text-align:center;
	}
	#frmAdmin div{
		margin:10px 0 10px 0;
	}
	#frmAdmin div label{
		display:inline-block;
		width:100px;
	}
</style>
<%@ include file="../../inc/admin_top.jsp" %>
	<div id="loginDiv">
		<form name="frmAdmin" id="frmAdmin" 
		action="<c:url value='/admin/login/adminLogin.ag' />" method="post">
			<fieldset>
				<div>
					<label for="userid">아이디</label>
					<input type="text" class="textBox" name="userid" id="userid">
				</div>
				<div>
					<label for="password">비밀번호</label>
					<input type="password" class="textBox" name="password" id="password">
				</div>
				<div>
					<input type="submit" class="white" value="로그인">
					<input type="button" class="white" value="홈으로">
				</div>
			</fieldset>
		</form>
	</div>
<%@ include file="../../inc/admin_bottom.jsp" %>