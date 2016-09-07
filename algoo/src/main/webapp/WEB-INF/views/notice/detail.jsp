<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
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
			<th width="120px" style="border-bottom:1px solid white">
				<span class="sp1">제목</span></th> 
			<td id="titleTd" colspan="5" width="200px"><span>${noticeVo.title}</span></td>
		</div>
		</tr><tr>
		<div>
			<th width="120px">
				<span class="sp1">작성자</span></th> 
			<td id="sp1" width="200px"><span>${noticeVo.writer}</span></td>
		</div>
		<div>
			<th width="120px">
				<span class="sp1">조회수</span></th> 
			<td id="sp1" width="200px"><span>${noticeVo.readCount}</span></td>
		</div>
		<div>
			<th width="120px">
				<span class="sp1">등록일</span></th>
			<td id="sp1"><span><fmt:formatDate value="${noticeVo.regdate }"
			 pattern="yyyy-MM-dd"></fmt:formatDate></span></td>
		</div>
		</tr><tr>
		<div class="lastDiv">
			<td id="contentTd" colspan="6" height="220px">
			<hr>
				<p id="content">${noticeVo.content}</p><td>
		</div>
		</tr>
	</table>
		<div id="bottomDiv">
		<hr>
			<div class="bottomBox">
				<a href
				="<c:url value='/notice/edit.ag?no=${noticeVo.mainNo}'/>">
				수정</a> |
	        	<a href="#" onclick="del(${noticeVo.mainNo})">삭제</a> |
	        	<a href="<c:url value='/notice/list.ag'/>">목록</a>
        	</div>
		</div>
	</div>
</div>
</section>

<%@ include file="../inc/bottom.jsp" %> 