<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#userid").focus();
		
		$("#frmLogin").submit(function(){
			if($("#userid").val().length<1){
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return false;
			}else if($("#password").val().length<1){
				alert("비밀번호를 입력하세요");
				$("#password").focus();
				return false;
			}
			
		});
	});

</script>
	<div class="simpleForm">
		<form name="frmLogin" id="frmLogin" method="post" 
			action="<c:url value='/member/login.ag'/>" >
			
			<fieldset>
				<legend>로그인</legend>
				<div>
					<label for="userid" class="label">
						아이디</label>
					<input type="text" name="userid"
						id="userid" 
						value="${cookie.ck_userid.value}">
				</div>
				<div>	
					<label for="password"  class="label">
						비밀번호</label>
					<input type="password" name="password"
						id="password">
				</div>	
				<div class="align_center">
					<input type="submit" value="로그인">
					<input type="checkbox" name="chkSave"
						id="chkSave"
						<c:if test="${!empty cookie.ck_userid}">
							checked
						</c:if>
						>
					<label for="chkSave">아이디 저장하기</label>
				</div>
			</fieldset>
		</form>
	</div>
<%@ include file="../inc/simple_bottom.jsp" %>








