<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberinfo.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<div id="naviDiv">
	<div id="mark">
		<img src="<c:url value='/images/faq-1.png'/>" style="height: 70px;">
	</div>
	<nav>
		<dl id="leftNavi">
			<dt><a href="#">회원페이지</a></dt>
			<dd><a href="#">내정보관리</a></dd>
			<dd><a href="#">이력서 관리 및 활용</a></dd>
			<dd><a href="#">회원탈퇴</a></dd>
			<dd><a href="#">기타문의</a></dd>
		</dl>
	</nav>
</div>
<div id="memInfo">
	<section>
		<div id="photo_div">
			<label for="photo">사진</label>
			<p id="photo_img">
				<img alt="" src="">
			</p>
			<div>
				<input type="button" class="white" value="사진등록">
			</div>
		</div>
		<div id="id_div">
	        <label for="userid">ID</label>
	        <input type="text" class="textBox" name="userid" id="userid" 
	        value="<c:if test='${sessionScope.authcode == 1 }'>
	        	${vo.userid }
	        </c:if>
	        <c:if test='${sessionScope.authcode == 2 }'>
	        	${vo.com_userid }
	        </c:if>">
	    </div>
		<div id="name_div">
	        <label for="userName">이름</label>
	        <input type="text" class="textBox" name="userName" id="userName">
	    </div>
	    <div id="nickName_div">
	        <label for="nickName">닉네임</label>
	        <input type="text" class="textBox" name="nickName" id="nickName">
	    </div>
	    <div id="pwd_div">
	        <label for="pwd">비밀번호</label>
	        <input type="password" class="textBox" name="pwd" id="pwd">
	    </div>
	    <div id="pwd_div">
	        <label for="pwd2">비밀번호 확인</label>
	        <input type="password" class="textBox" name="pwd2" id="pwd2">
	    </div>
	    <div id="email_div">
	    	<label for="email">이메일</label>
			<input type="text" class="textBox" name="email1" id="email1">
			<select name="email2" id="email2" class="textBox">
				<option value="naver.com">naver.com</option>
				<option value="nate.com">nate.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="google.com">google.com</option>
				<option value="etc">직접입력</option>
			</select>
			<input type="text" class="textBox" name="email3" id="email3" placeholder="직접입력"
			style="visibility: hidden">
		</div>
		<div id="zipcode_div">
			<label>우편번호</label>
			<input type="text" name="zipcode" id="zipcode" class="textBox">
			<input type="button" name="bt_zipcode" class="white" id="bt_zipcode"value="검색">
		</div>
		<div>
			<label>주소</label>
			<input type="text" name="address" id="address" class="textBox">
			<input type="text" name="addressDetail" id="address_detail" class="textBox">
		</div>
		<div id="hp_div">
			<label for="hp">핸드폰</label>
			<input type="text" class="textBox" name="hp1" id="hp1" maxlength="3">
			<input type="text" class="textBox" name="hp2" id="hp2" maxlength="4">
			<input type="text" class="textBox" name="hp3" id="hp3" maxlength="4">
		</div>
		<div id="phone_div">
			<label for="phone">전화번호</label>
			<input type="text" class="textBox" name="phone1" id="phone1" maxlength="3">
			<input type="text" class="textBox" name="phone2" id="phone2" maxlength="4">
			<input type="text" class="textBox" name="phone3" id="phone3" maxlength="4">
		</div>
		<div id="fax_div">
			<label for="fax">FAX</label>
			<input type="text" class="textBox" name="fax1" id="fax1" maxlength="3">
			<input type="text" class="textBox" name="fax2" id="fax2" maxlength="4">
			<input type="text" class="textBox" name="fax3" id="fax3" maxlength="4">
		</div>
		<div id="button_div">
			<input type="button" class="white" value="회사정보등록">
			<input type="submit" class="white" value="회원정보수정">
			<input type="reset" class="white" value="취소">
		</div>
	</section>
</div>

<%@ include file="../inc/simple_bottom.jsp" %>