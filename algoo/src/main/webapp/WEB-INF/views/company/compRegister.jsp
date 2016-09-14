<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="info">
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
		<div id="compName_div">
	        <label for="compName">ID</label>
	        <input type="text" class="textBox" name="compName" id="compName">
	    </div>
		<div id="ceo_div">
	        <label for="ceo">이름</label>
	        <input type="text" class="textBox" name="ceo" id="ceo">
	    </div>
	    <div id="compNum_div">
	        <label for="compNum">닉네임</label>
	        <input type="text" class="textBox" name="compNum" id="compNum">
	    </div>
	    <div id="zipcode_div">
			<label>우편번호</label>
			<input type="text" name="zipcode" id="zipcode" class="textBox">
			<input type="button" name="bt_zipcode" class="white" id="bt_zipcode" value="검색">
		</div>
		<div id="address_div">
			<label>주소</label>
			<input type="text" name="address" id="address" class="textBox">
	        <input type="text" name="addressDetail" id="address_detail" class="textBox">
		</div>
		<div id="deptName_div">
	        <label for="deptName">이름</label>
	        <input type="text" class="textBox" name="deptName" id="deptName">
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
	    <div id="email_div">
	    	<%-- <c:set var="etcYn" value=""/>
	    	<c:choose>
	    		<c:if test="${sessionScope.authCode=='1'}">
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
	    		</c:if>
	    		<c:if test="${sessionScope.authCode=='2'}">
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
	    		</c:if>
	    	</c:choose> --%>
	    	<c:if test="${sessionScope.authCode==1}">
	    		<c:set var="email2" value="${memberVo.email2 } "/>
	    	</c:if>
	    	
	    	<label for="email">이메일</label>
			<input type="text" class="textBox" name="email1" id="email1">
			<select name="email2" id="email2" class="textBox">
				<option value="naver.com"
					<c:if test="">
            		selected
            		</c:if>
				>naver.com</option>
				<option value="nate.com"
					<c:if test="">
            		selected
            		</c:if>
				>nate.com</option>
				<option value="hanmail.net"
					<c:if test="">
            		selected
            		</c:if>
				>hanmail.net</option>
				<option value="gmail.com"
					<c:if test="">
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
				<c:if test="${etcYn=='Y'}">
	        		style="visibility:visible"
	        		value=${email2 }
	        	</c:if>
	        	<c:if test="${etcYn=='N'}">
	        		style="visibility:hidden"
	        	</c:if> >
		</div>
		
		<div id="compSort_div">
			<label for="compSort">회사분류</label>
			<select class="textBox" id="compSort" name="compSort">
				<option value="">직종선택</option>
				<option value="외식·음료">외식·음료</option>
				<option value="유통·판매">유통·판매</option>
				<option value="문화·여가 생활">문화·여가 생활</option>
				<option value="서비스">서비스</option>
				<option value="사무직">사무직</option>
				<option value="고객상담·리서치·영업">고객상담·리서치·영업</option>
				<option value="생산·건설·운송">생산·건설·운송</option>
				<option value="IT·컴퓨터">IT·컴퓨터</option>
				<option value="교육·강사<">교육·강사</option>
				<option value="디자인">디자인</option>
				<option value="미디어">미디어</option>
			</select>
		</div>
		<div id="content_div">
			<label for="content">주요사업내용</label>
			<textarea class="textBox" name="content" id="content"
			cols="6" rows="12">
			</textarea>
		</div>
		
		<div id="homepage_div">
			<label for="homepage">홈페이지</label>
			<input type="text" class="white" name="homepage" id="homepage">
		</div>
		<div id="type_div">
			<label for="type">기업형태</label>
			<select class="textBox" id="type" name="type">
				<option value="대기업">대기업</option>
				<option value="중견기업">중견기업</option>
				<option value="중소기업">중소기업</option>
			</select>
		</div>
		<div id="cosdac_div">
			<label for="cosdac">기업형태</label>
			<select class="textBox" id="cosdac" name="cosdac">
				<option value="상장">상장</option>
				<option value="비상장">비상장</option>
			</select>
		</div>
		<div id="button_div">
			<input type="submit" class="white" id="BtWrite" value="등록">
			<input type="submit" class="white" id="BtEdit" value="수정">
			<input type="button" class="white" value="취소">
		</div>
	</section>
</div>

<%@ include file="../inc/simple_bottom.jsp" %>