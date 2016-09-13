<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script type="text/javascript">
	function del(no){
		if(confirm("공지사항을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/notice/delete.ag?no='/>"+${noticeVo.mainNo};
		}
	}
</script>

<section>
<div class="divForm">
	<legend>공지사항 상세보기</legend>
		<div class="firstDiv2">
			<span class="sp1">[${noticeVo.category }] ${noticeVo.title }</span>
			<span class="sp2">작성일 <fmt:formatDate value="${noticeVo.regdate }" pattern="yyyy-MM-dd"/></span>
		</div>
		<div class="secondDiv">
			<p class="content">${noticeVo.content }</p>
		</div>
		<div class="center">
			<br>
			<input type = "Button" class="button white medium" value="수정" 
	      		onclick="location.href
	      			='<c:url value="/notice/edit.ag?no=${noticeVo.mainNo}" />'"> 
	     	<input type = "Button" class="button white medium" value="삭제" 
	      		onclick="del(${noticeVo.mainNo})" />
	      	<input type = "Button" class="button white medium" value="목록" 
	      		 onclick="location.href
      			='<c:url value="/notice/list.ag" />'"/>
		</div>
		</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %> 