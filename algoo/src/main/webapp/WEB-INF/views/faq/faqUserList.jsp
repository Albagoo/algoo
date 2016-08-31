<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Accordion - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	$("#accordion").accordion();
  });
  </script>
</head>
<body>
<form name="userPage" method="post" action="<c:url value='/faq/faqUserList.ag'/>">

<div id="accordion">
	<c:forEach var="i" items="${ulist}">
		<h3>${i.title}</h3>
  		<div id="answer">
    		<p>
    			${i.content}
			</p>
		</div>
	</c:forEach>
</div>
</form>
</body>
</html>