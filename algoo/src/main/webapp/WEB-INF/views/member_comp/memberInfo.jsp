<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberinfo.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<script	type="text/javascript">
	$(document).ready(function(){
		$("#bt_zipcode").click(function(){
			getZipcode();
		});
		
		$("#bt_picture").click(function(){
    		window.open("<c:url value='/resume/imageUp.ag?memberCode="+
    				$("#memberCode").val()+"&photo="+$("#photo").val()+"'/>",
    				"imageUp",
    			"width=550,height=400,left=10, top=50,resizable=yes,location=yes");	
    	});
		
		if(${sessionScope.authCode==1}){
			$("#phone_div").css("display","none");
			$("#fax_div").css("display","none");
			$("#BtCompanyInfo").css("display","none");
		}else{
			$("#photo_div").css("display","none");
			$("#zipcode_div").css("display","none");
			$("#address_div").css("display","none");
		};
		
		$("#email2").change(function(){
			if($(this).val()=="etc"){
				$("#email3").css("visibility","visible");
				$("#email3").focus();
				$("#email3").val("");
			}else{
				$("#email3").css("visibility","hidden");
			}
		});
		
		$("#btEdit").click(function(event){
			if($("#hp1").val().length<1 || $("#hp1").val()==" " ||
				$("#hp2").val().length<1 || $("#hp2").val()==" " ||
				$("#hp3").val().length<1 || $("#hp3").val()==" " ){
				alert("휴대폰번호는 필수입력사항입니다");
				return false;
			}
			
			if(${sessionScope.authCode==1}){
				$("#frm1").prop("action","<c:url value='/member/memberInfoEdit.ag'/>");
				$("#frm1").submit();
			}else{
				$("#frm1").prop("action","<c:url value='/member_comp/commemInfoEdit.ag'/>");
				$("#frm1").submit();
			}
		});
	});
	
	function getZipcode(){
		window.open(
			"<c:url value='/zipcode/zipcode.ag'/>", 
			"zipWin", 
			"left=50, top=20, width=500, height=560, scrollbars=yes, resizable=yes");
	}
</script>
<div id="naviDiv">
	<div id="mark">
		<img src="<c:url value='/images/faq-1.png'/>" style="height: 70px;">
	</div>
	<nav>
		<dl id="leftNavi">
			<dt><a href="#">회원페이지</a></dt>
			<dd><a href="<c:url value='/login/mypageType.ag'/>">내정보관리</a></dd>
			<c:if test="${sessionScope.authCode==2 }">
			<dd><a href="<c:url value='/company/compRegister.ag'/>">기업정보 등록 및 수정</a></dd>
			</c:if>
			<dd><a href="#">이력서 관리 및 활용</a></dd>
			<dd><a href="<c:url value='/member_comp/memberWithdraw.ag'/>">회원탈퇴</a></dd>
			<dd><a href="#">기타문의</a></dd>
		</dl>
	</nav>
</div>
<div id="memInfo">
	<input type="hidden" id="memberCode" name="memberCode" value="${memberVo.memberCode }">
	<input type="hidden" id="photo" name="photo" value="${memberVo.photo }">
	<section>
		<div id="photo_div">
			<label for="photo">사진</label>
			<p id="photo_img">
				<c:if test="${empty memberVo.photo }">
					<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>"
						width="100%" height="100%">
				</c:if>
				<c:if test="${!empty memberVo.photo }">
					<img alt="회원이미지" src="/algoo/algoo_images/${memberVo.photo }"
					 width="100%" height="100%">
				</c:if>
			</p>
			<div>
				<input type="button" class="white" 
					id="bt_picture" value="사진등록">
			</div>
		</div>
		
		<form name="frm1" id="frm1" method="post" action="">
		<div id="id_div">
	        <label for="userid">ID</label>
	        <input type="text" class="textBox" name="userid" id="userid" 
	        value="<c:if test='${sessionScope.authCode==1}'>${memberVo.userid }</c:if><c:if test='${sessionScope.authCode==2}'>${commemVo.userid }</c:if>" readonly>
	    </div>
		<div id="name_div">
	        <label for="userName">이름</label>
	        <input type="text" class="textBox" name="userName" id="userName"
	        value="<c:if test='${sessionScope.authCode==1}'>${memberVo.userName }</c:if><c:if test='${sessionScope.authCode==2}'>${commemVo.userName }</c:if>" readonly>
	    </div>
	    <div id="nickName_div">
	        <label for="nickName">닉네임</label>
	        <input type="text" class="textBox" name="nickName" id="nickName"
	        value="<c:if test='${sessionScope.authCode==1}'>${memberVo.nickName } </c:if><c:if test='${sessionScope.authCode==2}'>${commemVo.nickName }</c:if>">
	    </div>
	   <!--  <div id="pwd_div">
	        <label for="pwd">비밀번호</label>
	        <input type="password" class="textBox" name="pwd" id="pwd">
	    </div>
	    <div id="pwd_div">
	        <label for="pwd2">비밀번호 확인</label>
	        <input type="password" class="textBox" name="pwd2" id="pwd2">
	    </div> -->
	    <div id="email_div">
	    	<c:set var="etcYn" value=""/>
	    	<c:if test="${sessionScope.authCode==1}">
		    	<c:choose>
			    		<c:when test="${memberVo.email2=='naver.com' || 
			    			memberVo.email2=='hanmail.net' || 
			    			memberVo.email2=='nate.com' ||
			    			memberVo.email2=='gmail.com' ||
			    			empty memberVo.email2}">
			    			<!-- 직접 입력이 아닌 경우 -->
			    			<c:set var="etcYn" value="N"/>
			    		</c:when>
			    		<c:otherwise>
			    			<c:set var="etcYn" value="Y"/>
			    		</c:otherwise>
		    	</c:choose>
		    	<c:set var="email2" value="${memberVo.email2 } "/>
	    	</c:if>
	    	<c:if test="${sessionScope.authCode==2}">
		    	<c:choose>
			    		<c:when test="${commemVo.email2=='naver.com' || 
			    			commemVo.email2=='hanmail.net' || 
			    			commemVo.email2=='nate.com' ||
			    			commemVo.email2=='gmail.com' ||
			    			empty commemVo.email2}">
			    			<!-- 직접 입력이 아닌 경우 -->
			    			<c:set var="etcYn" value="N"/>
			    		</c:when>
			    		<c:otherwise>
			    			<c:set var="etcYn" value="Y"/>
			    		</c:otherwise>
		    	</c:choose>
		    	<c:set var="email2" value="${commemVo.email2 } "/>
	    	</c:if>
	    	
	    	<label for="email">이메일</label>
			<input type="text" class="textBox" name="email1" id="email1"
			value="<c:if test='${sessionScope.authCode==1}'>${memberVo.email1 }</c:if><c:if test='${sessionScope.authCode==2}'>${commemVo.email1 }</c:if>">
			<select name="email2" id="email2" class="textBox">
				<option value="naver.com"
					<c:if test="${email2=='naver.com' }">
            		selected
            		</c:if>
				>naver.com</option>
				<option value="nate.com"
					<c:if test="${email2=='nate.com' }">
            		selected
            		</c:if>
				>nate.com</option>
				<option value="hanmail.net"
					<c:if test="${email2=='hanmail.net' }">
            		selected
            		</c:if>
				>hanmail.net</option>
				<option value="gmail.com"
					<c:if test="${email2=='gmail.com' }">
            		selected
            		</c:if>
				>gmail.com</option>
				<option value="etc"
					<c:if test="${etcYn=='Y'}">
            		selected
            		</c:if>
				>직접입력</option>
			</select>
			<input type="text" class="textBox" name="email3" id="email3" placeholder="직접입력"
				style="visibility:hidden"
				<c:if test="${etcYn=='Y'}">
	        		style="visibility:visible"
	        		value=${email2 }
	        	</c:if>
	        	<c:if test="${etcYn=='N'}">
	        		style="visibility:hidden"
	        	</c:if> >
		</div>
		<div id="zipcode_div">
			<label>우편번호</label>
			<input type="text" name="zipcode" id="zipcode" class="textBox"
			value="<c:if test='${sessionScope.authCode==1}'>${memberVo.zipcode }</c:if>" readonly>
			<input type="button" name="bt_zipcode" class="white" id="bt_zipcode" value="검색">
		</div>
		<div id="address_div">
			<label>주소</label>
			<input type="text" name="address" id="address" class="textBox" 
			value="<c:if test='${sessionScope.authCode==1}'>${memberVo.address } </c:if>" readonly><br>
	        <input type="text" name="addressDetail" id="address_detail" class="textBox"
	        value="<c:if test='${sessionScope.authCode==1}'>${memberVo.addressDetail }</c:if>">
		</div>
		<div id="hp_div">
			<label for="hp">핸드폰</label>
			<input type="text" class="textBox" name="hp1" id="hp1" maxlength="3"
			value="<c:if test='${sessionScope.authCode==1}'>${memberVo.hp1 }</c:if><c:if test='${sessionScope.authCode==2}'>${commemVo.hp1 }</c:if>">
			<input type="text" class="textBox" name="hp2" id="hp2" maxlength="4"
			value="<c:if test='${sessionScope.authCode==1}'>${memberVo.hp2 } </c:if><c:if test='${sessionScope.authCode==2}'>${commemVo.hp2 }</c:if>">
			<input type="text" class="textBox" name="hp3" id="hp3" maxlength="4"
			value="<c:if test='${sessionScope.authCode==1}'>${memberVo.hp3 }</c:if><c:if test='${sessionScope.authCode==2}'>${commemVo.hp3 }</c:if>">
		</div>
		<div id="phone_div">
			<label for="phone">전화번호</label>
			<input type="text" class="textBox" name="phone1" id="phone1" maxlength="3"
			value="<c:if test='${sessionScope.authCode==2}'>${commemVo.phone1 }</c:if>">
			<input type="text" class="textBox" name="phone2" id="phone2" maxlength="4"
			value="<c:if test='${sessionScope.authCode==2}'>${commemVo.phone2 }</c:if>">
			<input type="text" class="textBox" name="phone3" id="phone3" maxlength="4"
			value="<c:if test='${sessionScope.authCode==2}'>${commemVo.phone3 }</c:if>">
		</div>
		<div id="fax_div">
			<label for="fax">FAX</label>
			<input type="text" class="textBox" name="fax1" id="fax1" maxlength="3"
			value="<c:if test='${sessionScope.authCode==2}'>${commemVo.fax1 }</c:if>">
			<input type="text" class="textBox" name="fax2" id="fax2" maxlength="4"
			value="<c:if test='${sessionScope.authCode==2}'>${commemVo.fax2 }</c:if>">
			<input type="text" class="textBox" name="fax3" id="fax3" maxlength="4"
			value="<c:if test='${sessionScope.authCode==2}'>${commemVo.fax3 }</c:if>">
		</div>
		<p id="button_div">
			<input type="submit" id="btEdit" class="white" value="회원정보수정">
			<input type="reset" class="white" value="취소">
		</p>
		</form>
	</section>
</div>

<%@ include file="../inc/simple_bottom.jsp" %>