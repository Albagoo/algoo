<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript" 
src="<c:url value='/jquery/jquery-3.1.0.min.js' />"></script>

<script type="text/javascript">
	function del(no){
		if(confirm("게시물을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/freeboard/delete.ag?freeNo='/>"+${freeVo.freeNo};
		}
	}
</script>
<section>
<div class="divForm">
	<legend> 
		<img src="<c:url value='/images/albatalk.png'/>" style="height: 48px;" align=absmiddle>
	</legend>
		<div class="firstDiv2">
			<span class="sp1">${freeVo.title }</span>
			<span class="sp2">작성일 <fmt:formatDate value="${freeVo.regdate }" pattern="yyyy/MM/dd" />
				| <a href="<c:url value='/freeboard/edit.ag?freeNo=${freeVo.freeNo}'/>">수정</a>
				| <a href="<c:url value='/freeboard/delete.ag?freeNo=${freeVo.freeNo}'/>">삭제</a>
			</span>
		</div>
		<div class="secondDiv">
			<p class="writer">${sessionScope.nickName }(${fn:substring(sessionScope.nickName, 0,3)}***)</p>
			<p class="content">${freeVo.content }</p>
		</div>
		<div class="center">
		<br>
		<input type = "Button" class="button white medium" value="글쓰기" 
      		onclick="location.href
      			='<c:url value="/freeboard/write.ag" />'">
      	<input type = "Button" class="button white medium" value="답글" 
      		onclick="location.href
      			='<c:url value="/freeboard/reply.ag?freeNo=${freeVo.freeNo}" />'">	
		<!-- 로그인 아이디와 글쓴이 아이디가 같을때만 수정 버튼 보이기 -->
		<c:if test="${sessionScope.userid==freeVo.freeNo}">
	      	<input type = "Button" class="button white medium" value="수정" 
	      		onclick="location.href
	      			='<c:url value="/freeboard/edit.ag?freeNo=${freeVo.freeNo}" />'"> 
		</c:if>
     	<input type = "Button" class="button white medium" value="삭제" 
      		onclick="del(${freeVo.freeNo})" />
      	<input type = "Button" class="button white medium" value="목록" 
      		 onclick="location.href
      			='<c:url value="/freeboard/list.ag" />'"/>		
		</div>
	</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %>