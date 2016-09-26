<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />
<style type="text/css">
	#loginDiv{
		margin:0 auto;
		width:50%;
		height:300px;
		text-align:center;
	}
	#frmAdmin{
		margin-top:20px;
	}
	#frmAdmin div{
		margin:10px 0 10px 0;
	}
	#frmAdmin div label{
		display:inline-block;
		width:100px;
	}
	#backgroundLogin{
		width:100%;
		height:300px;
		background: #DE4D84;
	}
	#backgroundLogin div{ 
		margin-left:220px;
		padding-top:180px;
	}
	#backgroundLogin h1{
		font-size: 80px;
		display: inline-block;
		color:white;
	}
	#backgroundLogin span{
		font-size: 25px;
		display: inline;
		color:white;
	}
	#bt_admin{
		background: #DE4D84;
		border:1px solid #DE4D84;
		border-radius:2px;
		color:white;
		height:25px;
		line-height: 5px;
	}
</style>
<%@ include file="../../inc/admin_top.jsp" %>
	<div id="backgroundLogin">
		<div>
			<h1>ALGOO:알구</h1><span>관리자페이지</span>
		</div>
	</div>
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
				<div style="margin-top:20px;">
					<input type="submit" id="bt_admin" class="white" value="로그인">
				</div>
			</fieldset>
		</form>
	</div>
<%@ include file="../../inc/admin_bottom.jsp" %>