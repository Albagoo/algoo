<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberinfo.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<style>
#photo_imga{
	width:175px;
	height:190px;
	display: inline-block;
	margin:0;
}
</style>
<script type="text/javascript">
	

</script>
<div id="naviDiv">
	<div id="mark">
		<img src="<c:url value='/images/faq-1.png'/>" style="height: 70px;">
	</div>
	<nav>
		<dl id="leftNavi">
			<dt><a href="#">회원페이지</a></dt>
			<dd><a href="<c:url value='/login//mypageType.ag'/>">내정보관리</a></dd>
			<c:if test="${sessionScope.authCode==2 }">
			<dd><a href="<c:url value='/company/compRegister.ag'/>">기업정보 등록 및 수정</a></dd>
			</c:if>
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
			<p id="photo_imga">
				<img alt="" src="<c:url value='/images/${companyVo.imageURL }'/>"
				width="150px">
			</p>
			
		</div>
		<form name="frm1" id="frm1" method="post" action="<c:url value='/company/compRegister.ag'/>">
		<div id="compName_div">
	        <label for="compName" >회사명</label>
	        <input type="text" class="textBox" name="compName" id="compName"
	        value="${companyVo.compName }" readonly>
	    </div>
		<div id="ceo_div">
	        <label for="ceo">사업자명</label>
	        <input type="text" class="textBox" name="ceo" id="ceo"
	        value="${companyVo.ceo }" readonly>
	    </div>
	    <div id="compNum_div">
	        <label for="compNum">사업자번호</label>
	        <input type="text" class="textBox" name="compNum" id="compNum"
	        value="${companyVo.compNum }" readonly>
	    </div>
	    <div id="zipcode_div">
			<label>우편번호</label>
			<input type="text" name="zipcode" id="zipcode" class="textBox"
			value="${companyVo.zipcode }" readonly>
		</div>
		<div id="address_div">
			<label>주소</label>
			<input type="text" name="address" id="address" class="textBox"
			value="${companyVo.address }" readonly>
	        <input type="text" name="addressDetail" id="address_detail" class="textBox"
	        value="${companyVo.addressDetail }" readonly>
		</div>
		<div id="deptName_div">
	        <label for="deptName">담당자이름</label>
	        <input type="text" class="textBox" name="deptName" id="deptName"
	        value="${companyVo.deptName }" readonly>
	    </div>
		<div id="hp_div">
			<label for="hp">핸드폰</label>
			<input type="text" class="textBox" name="hp1" id="hp1" maxlength="3"
			value="${companyVo.hp1 }" readonly>
			<input type="text" class="textBox" name="hp2" id="hp2" maxlength="4"
			value="${companyVo.hp2 }" readonly>
			<input type="text" class="textBox" name="hp3" id="hp3" maxlength="4"
			value="${companyVo.hp3 }" readonly>
		</div>
		<div id="phone_div">
			<label for="phone">전화번호</label>
			<input type="text" class="textBox" name="phone1" id="phone1" maxlength="3"
			value="${companyVo.phone1 }" readonly>
			<input type="text" class="textBox" name="phone2" id="phone2" maxlength="4"
			value="${companyVo.phone2 }" readonly>
			<input type="text" class="textBox" name="phone3" id="phone3" maxlength="4"
			value="${companyVo.phone3 }" readonly>
		</div>
		<div id="fax_div">
			<label for="fax">FAX</label>
			<input type="text" class="textBox" name="fax1" id="fax1" maxlength="3"
			value="${companyVo.fax1 }" readonly>
			<input type="text" class="textBox" name="fax2" id="fax2" maxlength="4"
			value="${companyVo.fax2 }" readonly>
			<input type="text" class="textBox" name="fax3" id="fax3" maxlength="4"
			value="${companyVo.fax3 }" readonly>
		</div>
		
		<div id="compSort_div">
			<label for="compSort">회사분류</label>
			<input type="text" class="textBox" readonly 
			value="${companyVo.compSort }"> 
		</div>
		
	    <div id="email_div">
	    		    	
	    	<label for="email">이메일</label>
			<input type="text" class="textBox" name="email1" id="email1"
			value="${companyVo.email1 }" readonly>
			<input type="text" class="textBox" name="email2" id="email2"
			value="${companyVo.email2 }" readonly>
			
		</div>
		
		
		<div id="content_div">
			<label for="content">주요사업내용</label>
			<textarea class="textBox" name="content" id="content"
			cols="50" rows="6" readonly>${companyVo.content}</textarea>
		</div>
		
		<div id="homepage_div">
			<label for="homepage">홈페이지</label>
			<input type="text" class="textBox" name="homepage" id="homepage" 
			value="${companyVo.homepage}" readonly>
		</div>
		<div id="type_div">
			<label for="type">기업형태</label>
			<input type="text" class="textBox" readonly
			value="${companyVo.type}"> 
		</div>
		<div id="cosdac_div">
			<label for="cosdac">상장여부</label>
			<input type="text" class="textBox" readonly
			value="${companyVo.cosdac}"> 
		</div>
		<!-- <p id="button_div">
			<input type="submit" class="white" id="BtWrite" value="등록">
			<input type="submit" class="white" id="BtEdit" value="수정">
			<input type="button" class="white" value="취소">
		</p> -->
		</form>
	</section>
</div>

<%@ include file="../inc/simple_bottom.jsp" %>