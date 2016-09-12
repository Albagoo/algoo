<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script type="text/javascript">
	function del(no){
		if(confirm("삭제하시겠습니까?")){
			location.href
		="<c:url value='/notice/delete.ag?no='/>"+${noticeVo.mainNo};
		}
	}
</script>

<section>
<div class="divListAll" align="center">
	<p id="firstTitle">공지 상세</p>
	<div class="divForm">
	<table class="detailTable" width="1024px">
		<tr>
		<div class="firstDiv">
			<th width="662px" id="align_left">
				<span class="sp1">[${noticeVo.category}] ${noticeVo.title}</span>
			</th>
			<th width="120px" id="align_right" style="font-weight:normal;">
				<span class="sp1">작성자: ${noticeVo.writer}</span>
			</th> 
			<th width="120px" id="align_right" style="font-weight:normal;">
				<span class="sp1">조회수: ${noticeVo.readCount}</span>
			</th>
			<th width="120px" id="align_right" style="font-weight:normal;">
				<span class="sp1"><fmt:formatDate value="${noticeVo.regdate }"
			 pattern="yyyy-MM-dd"/></span>
			</th>
		</div>
		</tr><tr>
		<div class="lastDiv">
			<td id="contentTd" colspan="6" height="220px">
				<br>
				<p id="content">${noticeVo.content}</p><td>
		</div>
		</tr>
	</table>
	</div>
		<div id="bottomDiv">
				<input type = "Button" class="button white medium" value="수정" 
      	onclick="location.href='/algoo/notice/edit.ag?no=${noticeVo.mainNo}';" />
      		<input type = "Button" class="button white medium" value="삭제" 
      	onclick="del(${noticeVo.mainNo})" />
      		<input type = "Button" class="button white medium" value="목록" 
      	onclick="location.href='<c:url value="/notice/list.ag"/>';" />
	</div>
</div>
</section>

<%@ include file="../inc/bottom.jsp" %> 