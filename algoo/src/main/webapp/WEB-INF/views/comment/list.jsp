<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	function reply(i) {
		if($("#replyB"+i).val() == "N"){
			$("#p"+i).append("<div id='p_"+i+"'><textarea id='content' name='content'"
					+" style='width: 86%;height: 60px;vertical-align: middle;margin-right: 15px;'>"
					+"</textarea><span><input class='button white' type = 'submit' value='등록'" 
					+"	style='height: 68px;text-align: left;'/></span></div>");
			$("#replyB"+i).val("Y");
		}else if($("#replyB"+i).val() == "Y"){
			$("#p_"+i).remove();
			$("#replyB"+i).val("N");
		}
		
	};
	
		function del(no){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href
			="<c:url value='/comment/delete.ag?commentNo="+no+"'/>";
			}
		}
</script>
<div class="commentList">
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
				<input type="hidden" id="replyB${i }" value="N">
				
				<div class="cmtInside" style="border-bottom: 1px solid #fd9e9e;">
				<span id="cmtNick">
					<c:if test="${cmtVo.step>0 }">
							<c:forEach var="a" 
								begin="1" end="${cmtVo.step}">
								&nbsp;&nbsp;
							</c:forEach>
							<img src="<c:url value='/images/rere2.png' />" alt="rere이미지"
								 align=absmiddle style="height: 9px;">
					</c:if>
					<c:if test="${cmtVo.delYn=='Y'}">
						<span style="color:gray;font-size: 0.95em;">
							&nbsp; 삭제된 댓글입니다</span>
					</c:if>
					<c:if test="${cmtVo.delYn!='Y'}">
						${cmtVo.nickName }</span>
					<span id="cmtDate"><fmt:formatDate value="${cmtVo.regdate }" pattern="yyyy.MM.dd HH:mm"/> </span>
					
					<c:if test="${!empty sessionScope.userid}">
						<img alt="답글이미지" src="../images/reply.png" style="height: 10px;padding-left:5px;">
						<span onclick="reply(${i})" style="font-size: 0.9em">답글</span>
					</c:if>
					<p id="p${i}" class="cmtP">
						 <c:if test="${cmtVo.step>0 }">
							<c:forEach var="b" 
								begin="1" end="${cmtVo.step}">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</c:if><span id="cmtCon">${cmtVo.content }</span>
						<c:set var="i" value="${i+1 }"></c:set>
						<span id="conDel">
							<c:if test="${sessionScope.userid == cmtVo.userid }">
								<a href="#" onclick=del(${cmtVo.commentNo })>
									<img src="<c:url value='/images/Delete-Button.png'/>" alt="삭제"
									 align=absmiddle>삭제</a>
							</c:if>
						</span>
					</p>
				</c:if>
				</div >
			</form>
		</c:forEach>		
	</c:if>
</div>