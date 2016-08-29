<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>FAQ 삭제</title>
<script type="text/javascript" 
src="<c:url value='/jquery/jquery-3.1.0.min.js' />"></script>
</head>
<body>
<div class="divForm">
<form name="frmDelete" id="frmDelete" method="post" 
action="<c:url value='/faq/faqDelete.ag'/>">
		<input type="text" name="faqNo" value="${param.faqNo }">
		
		<fieldset>
		<legend>FAQ 삭제</legend>
	        <div>           
	        	<span class="sp">${param.faqNo } FAQ를 삭제하겠습니까?</span>                        
	        </div>
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	            <input type = "Button" value="FAQ 목록" 
                	 onclick="location.href='<c:url value="/faq/faqList.ag" />';" /> 
	        </div>
	    </fieldset>
    </form>
</div>
</body>
</html>