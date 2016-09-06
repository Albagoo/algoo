<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script type="text/javascript">
  $(document).ready(function() {
    $( "#jQuery_accordion" ).accordion({
      collapsible: true
    });
  });
</script>
<style type="text/css">
.ui-accordion{
    width:100%;	
}
.ui-accordion .ui-accordion-header {
	display: block;
	cursor: pointer;
	position: relative;
	margin: 2px 0 0 0;
	padding: .5em .5em .5em .7em;
	min-height: 0; /* support: IE7 */
	font-size: 0.8em;
    border:1px solid lightgray;
    background:#eee;
    color:black;
    text-align: left;

}
</style>

<section>
<div id="userList">
	<div id="container">
		<nav>
			<dl id="leftNavi">
				<dt>자주묻는 질문과 답변</dt>
				<dd><a href="#">회원가입 및 탈퇴</a></dd>
				<dd><a href="#">회원정보관리</a></dd>
				<dd><a href="#">이력서 관리 및 활용</a></dd>
				<dd><a href="#">기타문의</a></dd>
			</dl>
		</nav>
	</div>
	<div id="jQuery_accordion">
		<c:forEach var="i" items="${ulist}">
			<h3>&nbsp; [${i.category }] ${i.title}</h3>
	  		<div id="answer">
	    		<p>
	    			${i.content}
				</p>
			</div>
		</c:forEach>  
	</div>
</div>
</section> 
        
<%@ include file="../inc/simple_bottom.jsp" %>