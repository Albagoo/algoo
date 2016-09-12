<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>알구 로그인 - 알바(algoo.ag)</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>">
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#type2").click(function(){
			$("#join_google").css("display","none");
			$("#join_naver").css("display","none");
			$("#join_kakao").css("display","none");
			$("#join_facebook").css("display","none");
			$("body").css("height","100%");
		});
		$("#type1").click(function(){
			$("#join_google").css("display","inline-block");
			$("#join_naver").css("display","inline-block");
			$("#join_kakao").css("display","inline-block");
			$("#join_facebook").css("display","inline-block");
		});
	});
</script>
<style>
	body{
		width:370px;
	}
	#login{
		width:370px;
		text-align: center;
	}
	#login .logo{
		height:50px;
		border-bottom:2px solid #E70400;
	}
	#login .logo{
		width:270px;
		margin:0 auto;
		margin-top:5px;
		margin-bottom:5px;
		display: block;
	}
	#login .logo img{
		height:20px;
		margin-top:10px;
	}
	#userid, #pwd{
		width:230px;
		height:30px;
	}
	#type1,#type2,#userid,#pwd{
		margin-top:10px;
		margin-bottom:5px;
	}
	input[type="submit"]{
		margin-top:15px;
		margin-bottom:25px;
		width:240px;
		height:46px;
		background: #E70400;
		border:1px solid #E70400;
		color:white;
		font-size: 1.1em;
		border-radius: 4px;
	}
	div:nth-of-type(2){
		font-size: 0.8em;
	}
	
	.info a{
		color:black;
		font-size: 0.8em;
	}
	.info{
		margin-bottom:30px;
	}
	#join_google,
	#join_naver,
	#join_kakao,
	#join_facebook{
		width:140px;
		display:inline-block;
	}
	#join_google img{
		height:30px;
		float:left;
	}
	#join_naver img{
		height:30px;
		float:left;
	}
	#join_kakao img{
		height:30px;
		float:left;
	}
	#join_facebook img{
		height:30px;
		float:left;
	}
	#bt_google,
	#bt_naver,
	#bt_kakao,
	#bt_facebook{
		display: inline;
		float:left;
		height:30px;
		border:none;
		font-size: 0.7em;
	}
	#join_google,#bt_google{
		border:1px solid #DE4D42;
		background:#DE4D42;
		border-radius: 4px;
		color:white;
	}
	#join_naver,#bt_naver{
		border:1px solid #18CB00;
		background:#18CB00;
		border-radius: 4px;
		color:white;
	}
	#join_kakao,#bt_kakao{
		border:1px solid #F7EF00;
		background:#F7EF00;
		border-radius: 4px;
	}
	#join_facebook,#bt_facebook{
		border:1px solid #395994;
		background:#395994;
		border-radius: 4px;
		color:white;
	}
	#close_div{
		width:270px;
		display:block;
		text-align: right;
		float:right;
	}
	#close{
		margin-top:20px;
		margin-right:60px;
	}
</style>
</head>
<body>
<div id="login">
	<div class="logo">
		<h1><img alt="로고" 
			src="<c:url value='/images/simple_Logo.png'/>"></h1>
	</div>
	<div class="info">
		<form name="frmLogin" action="<c:url value='/login/login.ag'/>"
			method="post">
			<input type="radio" id="type1" name="type" value="personal"checked><label for="type1">개인회원</label>
			<input type="radio" id="type2" name="type" value="company"><label for="type2">기업회원</label>
			<input type="text" class="textBox" name="userid" id="userid" placeholder="아이디">
			<input type="password" class="textBox" name="pwd" id="pwd" placeholder="비밀번호">
			<input type="submit" value="로그인">
		</form>
		<a href="#">아이디 찾기</a> |
		<a href="#">비밀번호 찾기</a> |
		<a href="#">회원가입</a>
	</div>
	<div id="join_google" style="display:inline-block;">
		<img alt="구글로고" src="<c:url value='/images/icon_google.png'/>"/>
		<input type="button" id="bt_google" value="구글로 로그인">
	</div>
	<div id="join_naver" style="display:inline-block;">
		<img alt="네이버로고" src="<c:url value='/images/icon_naver.png'/>"/>
		<input type="button" id="bt_naver" value="네이버로 로그인">
	</div>
	<div id="join_kakao" style="display:inline-block;">
		<img alt="카카오로고" src="<c:url value='/images/icon_kakao.png'/>"/>
		<input type="button" id="bt_kakao" value="카카오로 로그인">
	</div>
	<div id="join_facebook" style="display:inline-block;">
		<img alt="페이스북로고" src="<c:url value='/images/icon_facebook.png'/>"/>
		<input type="button" id="bt_facebook" value="페이스북 로그인">
	</div>
	<div id="close_div">
		<img alt="닫기" id="close" 
		src="<c:url value='/images/close.png'/>">
	</div>
</div>
</body>
</html>