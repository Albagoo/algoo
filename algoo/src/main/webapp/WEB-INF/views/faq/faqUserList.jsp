<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
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
    background:#fffafa;
    color:black;
    text-align: left;

}
</style>

<section>
<div id="userList">
	<div id="Qmark">
	<img src="<c:url value='/images/faq-1.png'/>" style="height: 70px;">
	</div>
	<div id="naviDiv">
		<nav>
			<dl id="leftNavi">
				<dt><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=개인회원'/>">개인회원</a></dt>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=개인회원 가입 및 탈퇴'/>">개인회원 가입 및 탈퇴</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=회원정보관리'/>">회원정보관리</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=이력서 관리 및 활용'/>">이력서 관리 및 활용</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=온라인지원'/>">온라인지원</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=알바토크'/>">알바토크</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기타 문의'/>">기타 문의</a></dd>
				<br><br>
				<dt><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기업회원'/>">기업회원</a></dt>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기업회원 가입 및 탈퇴'/>">기업회원 가입 및 탈퇴</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기업정보관리'/>">기업정보관리</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=이력서 검색 및 열람'/>">이력서 검색 및 열람</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=유료서비스/결제오류'/>">유료서비스/결제오류</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=세금계산서'/>">세금계산서</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기타 문의'/>">기타 문의</a></dd>
			</dl>
		</nav>
	</div>
	<div id="faqBody">
		<div id="faqinfo">
			<p> FAQ > <a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=${param.searchKeyword}'/>">${param.searchKeyword}</a> </p>
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
</div>
</section> 
        
<%@ include file="../inc/simple_bottom.jsp" %>