<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css"'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/registerLayout.css'/>"/>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"/>
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#id").click(function(){
			$("#id").css("color","black");
		});
		
		$(".gender_man").click(function(){
			$("#man").val("남자").prop("checked",this.checked);
			$(".gender_man").css("border","1px solid #E70400");
			$("#manRb").css("color","#E70400");
			
			$("#woman").val("")
			$(".gender_woman").css("border","");
			$("#womanRb").css("color","#999");
		});
		
		$(".gender_woman").click(function(){
			$("#woman").val("여자").prop("checked",this.checked);
			$(".gender_woman").css("border","1px solid #E70400");
			$("#womanRb").css("color","#E70400");
			
			$("#man").val("");
			$(".gender_man").css("border","");
			$("#manRb").css("color","#999");
		});
		
		$("#copy_algoo").hover(function(){
			$("#copy_algoo").css("color","red");
		},function(){
			$("#copy_algoo").css("color","");
		});
	});
</script>
<title>회원가입</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<div id="header_logo">
			<a href="/index.do">
				<img alt="로고" src="<c:url value='/images/mainLogo-red.png'/>">
			</a>
		</div>
	</div>
	<div id="content">
		<div class="regi_group">
			<div id="id_div">
				<input type="text" name="id" id="id" placeholder="아이디">
			</div>
			
			<div id="nickName_div">
				<input type="text" name="nickName" id="nickName" placeholder="닉네임">
			</div>
			
			<div id="pwd_div">
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호">
			</div>
			
			<div id="pwd2_div">
				<input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인">
			</div>
			
			
		</div>
		<div class="regi_group">
			<div id="info_div">
				<input type="text" name="name" id="name" placeholder="이름">
			</div>
			
			<div id="gender_div">
			<span class="gender_span">
				<span class="gender_man">
					<input type="radio" id="man" name="gender" value="">
					<label id="manRb" for="man">남자</label>
				</span>
				<span class="gender_woman">
					<input type="radio" id="woman" name="gender" value="">
					<label id="womanRb" for="woman">여자</label>
				</span>
			</span>
			</div>
			
			<div id="birth_div">
				<div class="birth_title">
					<label>성별</label>
				</div>
				<div class="birth_yy">
					<input type="text" name="b_yy" id="b_yy" placeholder="년(4자)">
				</div>
				<div class="birth_mm">
					<select name="b_mm" id="b_mm">
						<option>월</option>
					</select>
				</div>
				<div class="birth_dd">
					<input type="text" name="b_dd" id="b_dd" placeholder="일">
				</div>
			</div>
			
		</div>
		<div class="regi_group">
			<div id="hp_div">
				<input type="text" name="hp1" id="hp1" placeholder="010"> -
				<input type="text" name="hp2" id="hp2"> -
				<input type="text" name="hp3" id="hp3">
				<input type="button" id="btHp" value="인증">
			</div>
			
			<div id="zipcode_div">
				<input type="text" name="zipcode" id="zipcode" placeholder="우편번호">
				<input type="button" name="bt_zipcode" id="bt_zipcode"
				value="검색">
			</div>
			
			<div id="address">
				<input type="text" name="address" id="address" placeholder="주소">
			</div>
			<div id="address_detail">
				<input type="text" name="address_detail"
					   id="address_detail" placeholder="상세주소">
			</div>
		</div>
		<div class="regi_group" id="regi_submit" >
			<input type="submit" id="bt_register" value="가입하기">
		</div>
	</div>
	
	<div id="footer">
		<img alt="미니로고" src="<c:url value='/images/simple_Logo.png'/>">
		<address>©<a href="#" id="copy_algoo">Algoo</a> Corp. All rights reserved.</address>
	</div>
</div>
</body>
</html>