<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/member.css'/>" />
<script type="text/javascript" src="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#simple_top span").html("회원정보 수정");
		$("#frm1").submit(function(){
			if($("#password").val().length<1){
				alert("비밀번호를 입력하세요");
				$("#password").focus();
				return false;
			}else if($("#password").val()!=$("#password2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#password2").focus();
				return false;
			}else if(!validate_hp($("#hp2").val()) || 
					!validate_hp($("#hp3").val())){
				alert("휴대폰 번호는 숫자여야 합니다");
				$("#hp2").focus();
				return false;
			}
		});
	});//ready
	
	
	
	
	
	
</script>

<style type="text/css">
	.width_80{
		width:80px;
	}
	.width_350{
		width:350px;
	}
	
		
</style>
<article>
<div class="divForm" id="member">
<div id="memleft">dff</div>
<form name="frm1" id="frm1" method="post" 
	action="<c:url value='/member/memberEdit.ag'/>">
<fieldset>
	<table >
		<tr>    
	        <th>회원ID</th>
	        <td>${memberVo.userid}</td>
   		</tr>
	  	<tr>    
	        <th><span class="sp1">성명</span></th>
	        <td><span>${memberVo.userName}</span></td>
   		</tr>
	    <tr>    
	        <th>닉네임</th>
	        <td><input type="text" name="nickName" id="nickName" class="textBox"
        value="${memberVo.nickName}"></td>
   		</tr>
    	<tr>    
	        <th><span class="sp1">비밀번호</span></th>
	        <td><input type="Password" name="password" id="password" class="textBox"></td>
   		</tr>
    	<tr>    
	        <th>비밀번호 확인</th>
	        <td> <input type="Password" name="password2" id="password2" class="textBox"></td>
   		</tr>
    </table>
   
    
    <div>
        <label for="zipcode">주소</label>
        <input type="text" name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80"
        	value="${memberVo.zipcode}">
        <input type="Button" value="우편번호 찾기" 
        	id="btnZipcode" title="새창열림"
        	><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly 
	        title="주소"  class="width_350"
	        value="${memberVo.address}" class="textBox"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="addressDetail" 
	        title="상세주소"  class="width_350"
	        value="${memberVo.addressDetail}" class="textBox">
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;
        <select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010"
            	<c:if test="${memberVo.hp1=='010' }">            	
            		selected
            	</c:if>
            >010</option>
            <option value="011"            
            	<c:if test="${memberVo.hp1=='011' }">
            		selected
            	</c:if>
            >011</option>
            <option value="016"
            	<c:if test="${memberVo.hp1=='016' }">
            		selected
            	</c:if>
            >016</option>
            <option value="017"
            	<c:if test="${memberVo.hp1=='017' }">
            		selected
            	</c:if>
            >017</option>
            <option value="018"
            	<c:if test="${memberVo.hp1=='018' }">
            		selected
            	</c:if>
            >018</option>
            <option value="019"
            	<c:if test="${memberVo.hp1=='019' }">
            		selected
            	</c:if>
            >019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80" value="${memberVo.hp2}" class="textBox">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80" value="${memberVo.hp3}" class="textBox">
    </div>
    <div>
    	<c:set var="etcYn" value="" />
    	<c:choose>
    		<c:when test="${memberVo.email2=='naver.com' 
    		|| memberVo.email2=='hanmail.net' 
    		|| memberVo.email2=='nate.com'
    		|| memberVo.email2=='gmail.com'
    		|| empty memverVo.email2}">
    		<!-- 직접 입력이 아닌 경우 -->
    			<c:set var="etcYn" value="N" />
    		</c:when>
    		<c:otherwise>
    			<c:set var="etcYn" value="Y" />
    		</c:otherwise>
    	</c:choose>
    	
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" 
        	title="이메일주소 앞자리" value="${memberVo.email1}">@
        <select name="email2" id="email2"  
        title="이메일주소 뒷자리" >
            <option value="naver.com"
            	<c:if test="${memberVo.email2=='naver.com'}">
            		selected
            	</c:if>
            >naver.com</option>
            <option value="hanmail.net"
            	<c:if test="${memberVo.email2=='hanmail.net'}">
            		selected
            	</c:if>
            >hanmail.net</option>
            <option value="nate.com"
            	<c:if test="${memberVo.email2=='nate.com'}">
            		selected
            	</c:if>
            >nate.com</option>
            <option value="gmail.com"
            	<c:if test="${memberVo.email2=='gmail.com'}">
            		selected
            	</c:if>
            >gmail.com</option>
            <option value="etc"
            	<c:if test="${etcYn=='Y'}">
            		selected
            	</c:if>
            >직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" 
        	title="직접입력인 경우 이메일주소 뒷자리"
        	<c:if test="${etcYn=='Y'}">
        		style="visibility:visible"
        		value=${memberVo.email2}
        	</c:if>	
        	<c:if test="${etcYn=='N'}">
        		style="visibility:hidden"
        	</c:if>        	
        	>
    </div>
    <div class="align_center">
         <input class="button white"  type="submit" id="wr_submit" value="수정">
    </div>
</fieldset>
    
</form>
</div>
</article>

<%@ include file="../inc/bottom.jsp"%>











