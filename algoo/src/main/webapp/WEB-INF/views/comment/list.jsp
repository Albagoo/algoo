<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	function reply(i) {
		if($("#replyB").val() == "N"){
			$("#p"+i).append("<div id='p_"+i+"'><textarea id='content' name='content'style='width: 83%;height: 60px;margin-right: 15px;'>"
					+"</textarea><span><input class='button white' type = 'submit' value='등록'" 
					+"	style='height: 60px;text-align: left;'/></span></div>");
			$("#replyB").val("Y");
		}else if($("#replyB").val() == "Y"){
			$("#p_"+i).remove();
			$("#replyB").val("N");
		}
	}
</script>
<div>
	<c:if test="${empty clist }">
		<span style="display: none;"></span>
	</c:if>
	<c:if test="${!empty clist }">
		<c:set var="i" value="1"></c:set>
		<c:forEach var="cmtVo" items="${clist }">
			<form action="<c:url value='/comment/reply.ag'/>" method="post">
				<input type="hidden" name="groupNo" value="${cmtVo.groupNo }">
				<input type="hidden" name="step" value="${cmtVo.step }">
				<input type="hidden" name="sortNo" value="${cmtVo.sortNo }">
				<input type="hidden" name="freeNo" value="${cmtVo.freeNo }">
				<input type="hidden" name="nickName" value="${sessionScope.nickName }">
				<input type="hidden" name="userid" value="${sessionScope.userid }">
				<input type="hidden" name="replyB" id="replyB" value="N">
				<span style="font-weight: bold;">${cmtVo.nickName }</span>
				<span><fmt:formatDate value="${cmtVo.regdate }" pattern="yyyy.MM.dd HH:mm"/> </span>
				<span><img alt="답글이미지" src="../images/reply.png" style="height: 20px;">
				<c:if test="${!empty sessionScope.userid}">
					<span id="reply" onclick="reply(${i})">답글</span>
				</c:if>
				</span>
				<p id="p${i}">${cmtVo.content }</p>
				<c:set var="i" value="${i+1 }"></c:set>
			</form>
		</c:forEach>		
	</c:if>
</div>