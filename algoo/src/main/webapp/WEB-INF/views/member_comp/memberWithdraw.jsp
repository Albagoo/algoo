<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberinfo.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<script	type="text/javascript">
	$(document).ready(function(){
		$("#sub").click(function(){
			if(${sessionScope.authCode==1}){
				$("#frmOut").prop("action","<c:url value='/member/memberWithdraw.ag'/>");
				$("#frmOut").submit();
			}else{
				$("#frmOut").prop("action","<c:url value='/member_comp/commemWithdraw.ag'/>");
				$("#frmOut").submit();
			}
		});
	});
	
	
</script>
<style>
	#memInfo{
		height:300px;
	}
	#memInfo #bt_div{
		padding:15px;
	}
</style>
<div id="naviDiv">
	<nav>
		<dl id="leftNavi">
			<dt><a href="<c:url value='/member/memInfo.ag'/>">회원페이지</a></dt>
			<dd><a href="<c:url value='/login/mypageType.ag'/>">내정보관리</a></dd>
			<c:if test="${sessionScope.authCode==2 }">
				<dd><a href="<c:url value='/company/compRegister.ag'/>">기업정보 등록 및 수정</a></dd>
				<dd><a href="<c:url value='/apply/applyListComp.ag'/>">채용 공고 관리</a></dd>
			</c:if>
			<c:if test="${sessionScope.authCode==1 }">
				<dd><a href="<c:url value='/apply/applyList.ag'/>">지원 현황</a></dd>
				<dd><a href="#">이력서 관리</a></dd>
			</c:if>
			<dd><a href="<c:url value='/member_comp/memberWithdraw.ag'/>">회원탈퇴</a></dd>
		</dl>
	</nav>
</div>
<div id="memInfo">
	<form name="frmOut" id="frmOut" method="post"
		action="<c:url value=''/>">
		<fieldset>
			<div>
			${sessionScope.userName }님<br>
			회원 탈퇴하시겠습니까?
			</div>

			<div>
				<label for="pwd">비밀번호</label> 
				<input type="password" name="password"id="pwd">
			</div>
			<div id="bt_div" style="text-align: center">
				<input type="submit" id="sub" class="button white" value="회원탈퇴">
				<input type="button" class="button white" value="취소">
			</div>
		</fieldset>
	</form>
</div>

<%@ include file="../inc/bottom.jsp" %>