<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#simple_top span").html("아이디 / 비밀번호 찾기");
		
		$("input[type='text']").addClass("textBox");
	});
</script>

<div style="overflow: hidden; margin-bottom: 50px;">
	<div style="overflow: hidden;">
		<div style="padding: 20px;
				    float: left;
				    width: 45%;
				    margin-right: 20px;
				    border: 1px solid #e6e6e6">
			<form action="" method="post">
				<fieldset>
					<h2 style="font-size: 16px;
							    color: #222;
							    font-weight: bold;
							    padding-bottom: 20px;">아이디 찾기</h2>
					<p style="color: #787878;
   								 height: 30px;">회원가입시 등록한 휴대폰 번호와 이름을 입력해 주세요</p>
   					<table>
   						<tr>
   							<td><label for="userName">이름</label></td>
   							<td><input type="text" id="userName" name="userName"
   							maxlength="15"></td>
   						</tr>
   						<tr>
   							<td><label for="hp">휴대폰 번호</label></td>
   							<td><input type="text" id="hp1" name="hp1" style="width: 50px"
   							maxlength="3">
		   					<input type="text" id="hp2" name="hp2" style="width: 50px"
		   					maxlength="4">
		   					<input type="text" id="hp3" name="hp3" style="width: 50px"
		   					maxlength="4"></td>
   						</tr>
   					</table>
   					<input type="submit" value="아이디 찾기">
				</fieldset>
			</form></div>
		<div style="padding: 20px;
				    float: left;
				    width: 45%;
				    border: 1px solid #e6e6e6">
			<form action="" method="post">
				<fieldset>
					<h2 style="font-size: 16px;
							    color: #222;
							    font-weight: bold;
							    padding-bottom: 20px;">비밀번호 찾기</h2>
					<table>
   						<tr>
   							<td><label for="userName">아이디</label></td>
   							<td><input type="text" id="userId" name="userId"
   							maxlength="15"></td>
   						</tr>
   						<tr>
   							<td><label for="userName">이름</label></td>
   							<td><input type="text" id="userName" name="userName"
   							maxlength="15"></td>
   						</tr>
   						<tr>
   							<td><label for="hp">휴대폰 번호</label></td>
   							<td><input type="text" id="hp1" name="hp1" style="width: 50px"
   							maxlength="3">
		   					<input type="text" id="hp2" name="hp2" style="width: 50px"
		   					maxlength="4">
		   					<input type="text" id="hp3" name="hp3" style="width: 50px"
		   					maxlength="4"></td>
   						</tr>
   					</table>
   					<input type="submit" value="비밀번호 찾기">		    
				</fieldset>
			</form></div>
	</div>
</div>


<%@ include file="../inc/simple_bottom.jsp"%>