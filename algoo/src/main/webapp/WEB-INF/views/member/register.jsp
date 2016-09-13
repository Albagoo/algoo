<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/registerLayout.css' />" />
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-3.1.0.min.js">
</script>
<script type="text/javascript" src="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#userid").keyup(function(){
		//1 <= 해당 아이디가 존재하는 경우
		//2 <= 존재하지 않는 경우
	if($("#userid").val().length<8 || $("#userid").val().length>16 ){
		$("#message").html("아이디는 8~16자 사이로 입력하세요");
	}else{
		if(validate_userid($("#userid").val()) && 
			$("#userid").val().length>=2){
			$.ajax({
				url:"<c:url value='/member/ajaxCheckUserid.ag'/>",
				type:"GET",
				data:"userid="+$("#userid").val(),
				success:function(res){
					var result="";
					if(res==1){
						result="이미 등록된 아이디입니다.";
						$("#chkId").val("N");
					}else if(res==2){
						result = "사용가능한 아이디입니다.";
						$("#chkId").val("Y");
					}
					$("#message").html(result);
				},
				error:function(xhr, status, error){
					alert(status+":"+error);
				}
			});
		}else{
			//유효성 검사를 통과하지 못한 경우
			$("#message").html("아이디 규칙에 맞지 않습니다");
			$("#chkId").val("N");
		}
	}	
		
	});//id
	
	
	$("#bt_zipcode").click(function(){
		getZipcode();
	});
});

function getZipcode(){
	//우편번호 찾기 창 띄우기
	//window.open("url", "name", "option");
	window.open(
		"${pageContext.request.contextPath}/zipcode/zipcode.ag", 
		"zipWin", 
		"left=50, top=20, width=500, height=560, scrollbars=yes,resizable=yes");
}

</script>
<style type="text/css">
	.width_80{
		width:80px;
	}
	.width_350{
		width:350px;
	}
	#message, #message2{
		color:red;
		font-size:13px;
	}	
</style>
<title>회원가입</title>
</head>
<body>
<form name="frm1" method="post" 
	action="<c:url value='/member/memberAdd.ag'/>" >
<div id="wrap">
	<div id="header">
		<div id="header_logo">
			<a href="/index.ag">
				<img alt="로고" src="<%=request.getContextPath()%>/images/mainLogo-red.png">
			</a>
		</div>
	</div>
	<div id="content">
		
		<div class="regi_group">
			<div id="id_div">
				<input type="text" name="userid" id="userid" placeholder="아이디" style="width:180px"
					style="ime-mode:inactive">&nbsp;
					<span id="message"></span>
			</div>
			
			<div id="nickName_div">
				<input type="text" name="nickName" id="nickName" placeholder="닉네임" style="width:180px">
			</div>
			
			<div id="pwd_div">
				<input type="password" name="password" id="pwd" placeholder="비밀번호" style="width:180px">
				<span id="message2"></span>
			</div>
			
			<div id="pwd2_div">
				<input type="password" name="password2" id="pwd2" placeholder="비밀번호 확인" style="width:180px"
					style="width:220px">
			</div>
		</div>
		<div class="regi_group">
			<div id="info_div">
				<input type="text" name="userName" id="userName" placeholder="이름">
			</div>
			
			<div id="gender_div">
			<span class="gender_span">
				<span class="gender_man">
					
					<input type="radio" id="man" name="gender">
					<label id="manRb" for="man">남자</label>
				</span>
				<span class="gender_woman">
					<input type="radio" id="woman" name="gender">
					<label id="womanRb" for="woman">여자</label>
				</span>
			</span>
			</div>
			
			<div id="email_div">
				<div>
					<input type="text" name="email1" id="email1" placeholder="이메일" width="10px">
				</div>
				<div>
					<select name="email2" id="email2">
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="google.com">google.com</option>
						<option value="etc">직접입력</option>
					</select>
				
					<input type="text" name="email3" id="email3" placeholder="직접입력"
					style="visibility:hidden">
				</div>
			</div>
			
			<div id="birth_div" >
				<div class="birth_title">
					<label>생일</label>
				</div>
				<div class="birth_yy">
					<input type="text" name="bi1" id="b_yy" placeholder="년(4자)" maxlength="4">
				</div>
				<div class="birth_mm">
					<select name="bi2" id="b_mm">
						<option value="">월</option>
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i }">${i }</option>
						
						</c:forEach>
					</select>
				</div>
				<div class="birth_dd">
					<input type="text" name="bi3" id="b_dd" placeholder="일" maxlength="2">
				</div>
			</div>
			
		</div>
		<div class="regi_group">
			<div id="hp_div">
				<input type="text" name="hp1" id="hp1" placeholder="ex) 010" maxlength="3"> -
				<input type="text" name="hp2" id="hp2" maxlength="4"> -
				<input type="text" name="hp3" id="hp3" maxlength="4">
				<input type="button" id="btHp" value="인증">
			</div>
			<div id="zipcode_div">
				<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" readonly="readonly">
				<input type="button" name="bt_zipcode" id="bt_zipcode"
				value="검색">
			</div>
			
			<div id="address">
				<input type="text" name="address" id="address" placeholder="주소" style="width:100%" readonly="readonly">
			</div>
			<div id="address_detail">
				<input type="text" name="addressDetail"
					   id="address_detail" placeholder="상세주소" style="width:100%;">
			</div>
		</div>
	<input type ="hidden" name="chkId" id="chkId" value="N">
	<input type ="hidden" name="chkPw" id="chkPw" value="N">
		<div class="regi_group" id="regi_submit" >
			<input type="submit" id="bt_register" value="가입하기">
		</div>
	</div>
	
	<div id="footer">
		<img alt="미니로고" src="<%=request.getContextPath()%>/images/simple_Logo.png">
		<address>©<a href="#" id="copy_algoo">Algoo</a> Corp. All rights reserved.</address>
	</div>
	<input type="hidden" name="authcode" value="1">
</div>
</form>
</body>
</html>