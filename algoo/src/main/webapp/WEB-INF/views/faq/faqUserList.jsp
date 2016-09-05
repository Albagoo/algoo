<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>

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
.ui-accordion .ui-accordion-header {
	display: block;
	cursor: pointer;
	position: relative;
	margin: 2px 0 0 0;
	padding: .5em .5em .5em .7em;
	min-height: 0; /* support: IE7 */
	font-size: 100%;
    border:1px solid red;
    background:#E70400;
    color:#fff;
    text-align: left;
}

#container	{
	/*clear: both;*/
	width:96%;margin: 0 auto;

	overflow: auto;
	background: white;
	}
	#container #leftNavi	{
		float: left; /*background:#FFCCCC;*/
		width: 20%;
		padding: 35px 0 0 0;
		}
		#container #leftNavi dt	{
			padding: 7px 5px 25px 20px;
			font-weight: bold;
			}
			
		#container #leftNavi dd	{
			display: block;
			padding: 0 20px;
			}
			#container #leftNavi dd a	{
				text-decoration: none;
				display: block;
				color: #585721;
				border-bottom: 1px solid #ddd;
				padding: 10px 5px;
				}
				#container #leftNavi dd a:hover, #container #leftNavi dd a:focus	{
					background:#EDF2C6 ;
					}
}
</style>

<section>
<div id="container">
	<nav>
		<dl id="leftNavi">
			<dt>자주묻는 질문과 답변</dt>
			<dd><a href="#">회원가입 및 탈퇴</a></dd>
			<dd><a href="#">회원정보관리</a></dd>
			<dd><a href="#">이력서 관리 및 활용</a></dd>
			<dd><a href="#">기타 문의</a></dd>
		</dl>
	</nav>
</div>
<div id="jQuery_accordion">
	<c:forEach var="i" items="${ulist}">
		<h3>[${i.category }] ${i.title}</h3>
  		<div id="answer">
    		<p>
    			${i.content}
			</p>
		</div>
	</c:forEach>  
</div>
</section> 
        
<%@ include file="../inc/simple_bottom.jsp" %>