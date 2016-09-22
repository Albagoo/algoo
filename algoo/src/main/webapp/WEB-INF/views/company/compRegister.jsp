<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberinfo.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#bt_zipcode").click(function(){
			getZipcode();
		});
		
		if(${companyVo.compCode==0 }){
			$("#BtEdit").css("display","none");
		}else{
			$("#BtWrite").css("display","none");
		}
		
		$("#BtEdit").click(function(){
			$("#frm1").prop("action","<c:url value='/company/compEdit.ag' />");
			$("#frm1").submit();
		});
		
		$("#frm1").submit(function(){
			
			var imageUrl1= $("#imageUrl_1").val().split(".");
			if(!(imageUrl1[1] == "jpg" || imageUrl1[1] == "png"
					|| imageUrl1[1] == "gif" || imageUrl1[1] == "jpeg"
					|| imageUrl1[1] == "JPG" || imageUrl1[1] == "PNG"
					|| imageUrl1[1] == "JPEG" || imageUrl1[1] == "GIF")){
				alert("사진 파일은 jpg, png, gif, jpeg 파일만 가능합니다!!!");
				return false;
			}
			var imageUrl2= $("#imageUrl_2").val().split(".");
			if(!(imageUrl2[1] == "jpg" || imageUrl2[1] == "png"
					|| imageUrl2[1] == "gif" || imageUrl2[1] == "jpeg"
					|| imageUrl2[1] == "JPG" || imageUrl2[1] == "PNG"
					|| imageUrl2[1] == "JPEG" || imageUrl2[1] == "GIF")){
				alert("사진 파일은 jpg, png, gif, jpeg 파일만 가능합니다!!!");
				return false;
			}
			var imageUrl3= $("#imageUrl_3").val().split(".");
			if(!(imageUrl3[1] == "jpg" || imageUrl3[1] == "png"
					|| imageUrl3[1] == "gif" || imageUrl3[1] == "jpeg"
					|| imageUrl3[1] == "JPG" || imageUrl3[1] == "PNG"
					|| imageUrl3[1] == "JPEG" || imageUrl3[1] == "GIF")){
				alert("사진 파일은 jpg, png, gif, jpeg 파일만 가능합니다!!!");
				return false;
			}
			var imageUrl4= $("#imageUrl_1").val().split(".");
			if(!(imageUrl4[1] == "jpg" || imageUrl4[1] == "png"
					|| imageUrl4[1] == "gif" || imageUrl4[1] == "jpeg"
					|| imageUrl4[1] == "JPG" || imageUrl4[1] == "PNG"
					|| imageUrl4[1] == "JPEG" || imageUrl4[1] == "GIF")){
				alert("사진 파일은 jpg, png, gif, jpeg 파일만 가능합니다!!!");
				return false;
			}
		});
	});
	
	function getZipcode(){
		window.open(
			"<c:url value='/zipcode/zipcode.ag'/>", 
			"zipWin", 
			"left=50, top=20, width=500, height=560, scrollbars=yes,resizable=yes");
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
	<section>
		<c:if test="${companyVo.compCode != 0 }">
			<div id="photo_div">
				<label for="photo">사진</label>
				<p id="photo_img">
					<img alt="" src="<c:url value='/algoo_images/${companyVo.imageUrl1 }'/>">
				</p>
				<div>
					<input type="button" class="white" value="사진등록">
				</div> 
			</div>
		</c:if>
		<form name="frm1" id="frm1" method="post" 
			action="<c:url value='/company/compRegister.ag'/>"
			enctype="multipart/form-data">
		<div id="compName_div">
	        <label for="compName">회사명</label>
	        <input type="text" class="textBox" name="compName" id="compName"
	        	value="${companyVo.compName }">
	    </div>
		<div id="ceo_div">
	        <label for="ceo">사업자명</label>
	        <input type="text" class="textBox" name="ceo" id="ceo"
	        value="${companyVo.ceo }">
	    </div>
	    <div id="compNum_div">
	        <label for="compNum">사업자번호</label>
	        <input type="text" class="textBox" name="compNum" id="compNum"
	        value="${companyVo.compNum }">
	    </div>
	    <div id="zipcode_div">
			<label>우편번호</label>
			<input type="text" name="zipcode" id="zipcode" class="textBox"
			value="${companyVo.zipcode }">
			<input type="button" name="bt_zipcode" class="white" id="bt_zipcode" value="검색">
		</div>
		<div id="address_div">
			<label>주소</label>
			<input type="text" name="address" id="address" class="textBox"
			value="${companyVo.address }">
	        <input type="text" name="addressDetail" id="address_detail" class="textBox"
	        value="${companyVo.addressDetail }">
		</div>
		<div id="deptName_div">
	        <label for="deptName">담당자이름</label>
	        <input type="text" class="textBox" name="deptName" id="deptName"
	        value="${companyVo.deptName }">
	    </div>
		<div id="hp_div">
			<label for="hp">핸드폰</label>
			<input type="text" class="textBox" name="hp1" id="hp1" maxlength="3"
			value="${companyVo.hp1 }">
			<input type="text" class="textBox" name="hp2" id="hp2" maxlength="4"
			value="${companyVo.hp2 }">
			<input type="text" class="textBox" name="hp3" id="hp3" maxlength="4"
			value="${companyVo.hp3 }">
		</div>
		<div id="phone_div">
			<label for="phone">전화번호</label>
			<input type="text" class="textBox" name="phone1" id="phone1" maxlength="3"
			value="${companyVo.phone1 }">
			<input type="text" class="textBox" name="phone2" id="phone2" maxlength="4"
			value="${companyVo.phone2 }">
			<input type="text" class="textBox" name="phone3" id="phone3" maxlength="4"
			value="${companyVo.phone3 }">
		</div>
		<div id="fax_div">
			<label for="fax">FAX</label>
			<input type="text" class="textBox" name="fax1" id="fax1" maxlength="3"
			value="${companyVo.fax1 }">
			<input type="text" class="textBox" name="fax2" id="fax2" maxlength="4"
			value="${companyVo.fax2 }">
			<input type="text" class="textBox" name="fax3" id="fax3" maxlength="4"
			value="${companyVo.fax3 }">
		</div>
	    <div id="email_div">
	    	<c:set var="etcYn" value=""/>
	    	<c:choose>
		    		<c:when test="${companyVo.email2=='naver.com' || 
		    			companyVo.email2=='hanmail.net' || 
		    			companyVo.email2=='nate.com' ||
		    			companyVo.email2=='gmail.com' ||
		    			empty companyVo.email2}">
		    			<!-- 직접 입력이 아닌 경우 -->
		    			<c:set var="etcYn" value="N"/>
		    		</c:when>
		    		<c:otherwise>
		    			<c:set var="etcYn" value="Y"/>
		    		</c:otherwise>
	    	</c:choose>
	    	
	    	<label for="email">이메일</label>
			<input type="text" class="textBox" name="email1" id="email1"
			value="${companyVo.email1 }">
			<select name="email2" id="email2" class="textBox">
				<option value="naver.com"
					<c:if test="${companyVo.email2=='naver.com' }">
            		selected
            		</c:if>
				>naver.com</option>
				<option value="nate.com"
					<c:if test="${companyVo.email2=='nate.com' }">
            		selected
            		</c:if>
				>nate.com</option>
				<option value="hanmail.net"
					<c:if test="${companyVo.email2=='hanmail.net' }">
            		selected
            		</c:if>
				>hanmail.net</option>
				<option value="gmail.com"
					<c:if test="${companyVo.email2=='gmail.com' }">
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
	        		value=${companyVo.email2 }
	        	</c:if>
	        	<c:if test="${etcYn=='N'}">
	        		style="visibility:hidden"
	        	</c:if> >
		</div>
		
		<div id="compSort_div">
			<label for="compSort">회사분류</label>
			<select class="textBox" id="compSort" name="compSort">
				<option value=""
					<c:if test="${companyVo.compSort==''}">
            		selected
            		</c:if>
				>직종선택</option>
				<option value="외식·음료"
					<c:if test="${companyVo.compSort=='외식·음료'}">
            		selected
            		</c:if>
				>외식·음료</option>
				<option value="유통·판매"
					<c:if test="${companyVo.compSort=='유통·판매'}">
            		selected
            		</c:if>
				>유통·판매</option>
				<option value="문화·여가 생활"
					<c:if test="${companyVo.compSort=='문화·여가 생활'}">
            		selected
            		</c:if>
				>문화·여가 생활</option>
				<option value="서비스"
					<c:if test="${companyVo.compSort=='서비스'}">
            		selected
            		</c:if>
				>서비스</option>
				<option value="사무직"
					<c:if test="${companyVo.compSort=='사무직'}">
            		selected
            		</c:if>
				>사무직</option>
				<option value="고객상담·리서치·영업"
					<c:if test="${companyVo.compSort=='고객상담·리서치·영업'}">
            		selected
            		</c:if>
				>고객상담·리서치·영업</option>
				<option value="생산·건설·운송"
					<c:if test="${companyVo.compSort=='생산·건설·운송'}">
            		selected
            		</c:if>
				>생산·건설·운송</option>
				<option value="IT·컴퓨터"
					<c:if test="${companyVo.compSort=='IT·컴퓨터'}">
            		selected
            		</c:if>
				>IT·컴퓨터</option>
				<option value="교육·강사"
					<c:if test="${companyVo.compSort=='교육·강사'}">
            		selected
            		</c:if>
				>교육·강사</option>
				<option value="디자인"
					<c:if test="${companyVo.compSort=='디자인'}">
            		selected
            		</c:if>
				>디자인</option>
				<option value="미디어"
					<c:if test="${companyVo.compSort=='미디어'}">
            		selected
            		</c:if>
				>미디어</option>
			</select>
		</div>
		<div id="content_div">
			<label for="content">주요사업내용</label>
			<textarea class="textBox" name="content" id="content"
			cols="50" rows="6">${companyVo.content}</textarea>
		</div>
		
		<div id="homepage_div">
			<label for="homepage">홈페이지</label>
			<input type="text" class="textBox" name="homepage" id="homepage" 
			value="${companyVo.homepage}">
		</div>
		<div id="type_div">
			<label for="type">기업형태</label>
			<select class="textBox" id="type" name="type">
				<option value=""
					<c:if test="${companyVo.type==''}">
            		selected
            		</c:if>
				>기업형태</option>
				<option value="대기업"
					<c:if test="${companyVo.type=='대기업'}">
            		selected
            		</c:if>
				>대기업</option>
				<option value="중견기업"
					<c:if test="${companyVo.type=='중견기업'}">
            		selected
            		</c:if>
				>중견기업</option>
				<option value="중소기업"
					<c:if test="${companyVo.type=='중소기업'}">
            		selected
            		</c:if>
				>중소기업</option>
			</select>
		</div>
		<div id="cosdac_div">
			<label for="cosdac">상장여부</label>
			<select class="textBox" id="cosdac" name="cosdac">
				<option value=""
					<c:if test="${companyVo.cosdac==''}">
            		selected
            		</c:if>
				>선택하세요</option>
				<option value="상장"
					<c:if test="${companyVo.cosdac=='상장'}">
            		selected
            		</c:if>
				>상장</option>
				<option value="비상장"
					<c:if test="${companyVo.cosdac=='비상장'}">
            		selected
            		</c:if>
				>비상장</option>
			</select>
		</div>
		<c:if test="${companyVo.compCode == 0 }">
			<div style="height: 100px;">
				<label>사진1</label>
				<input type="file" name="imageUrl_1" id="imageUrl_1"><br>
				<label>사진2</label>
				<input type="file" name="imageUrl_2" id="imageUrl_2"><br>
				<label>사진3</label>
				<input type="file" name="imageUrl_3" id="imageUrl_3"><br>
				<label>사진4</label>
				<input type="file" name="imageUrl_4" id="imageUrl_4">
			</div>
		</c:if>
		<p id="button_div">
			<input type="submit" class="white" id="BtWrite" value="등록">
			<input type="submit" class="white" id="BtEdit" value="수정">
			<input type="button" class="white" value="취소">
		</p>
		</form>
	</section>
</div>

<%@ include file="../inc/simple_bottom.jsp" %>