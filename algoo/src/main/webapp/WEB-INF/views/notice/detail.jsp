<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>공지사항 상세보기</title>
<script type="text/javascript">
	function del(no){
		if(confirm("삭제하시겠습니까?")){
			location.href
		="<c:url value='/notice/delete.ag?no='/>"+${noticeVo.mainNo};
		}
	}
</script>
</head>
<body>
	<h2>공지사항 상세내용</h2>
	<div class="divForm">
	<table style="border:1px solid;width:1024px">
		<tr>
		<div class="firstDiv">
			<th width="120px" style="background-color:#d0d0d0">
				<span class="sp1">제목</span></th> 
			<td width="200px"><span>${noticeVo.title}</span></td>
		</div>
		</tr><tr>
		<div>
			<th width="120px" style="background-color:#d0d0d0">
				<span class="sp1">작성자</span></th> 
			<td><span>${noticeVo.writer}</span></td>
		</div>
		<div>
			<th width="120px" style="background-color:#d0d0d0">
				<span class="sp1">조회수</span></th> 
			<td width="200px"><span>${noticeVo.readCount}</span></td>
		</div>
		<div>
			<th width="120px" style="background-color:#d0d0d0">
				<span class="sp1">등록일</span></th> 
			<td><span>${noticeVo.regdate}</span></td>
		</div>
		</tr><tr>
		<div class="lastDiv">			
			<td colspan="6"><hr>
				<p class="content">${noticeVo.content}</p><td>
		</div>
		</tr>
	</table>
		<div class="center" style="text-align:center;width:1024px">
		<hr>
			<a href
			="<c:url value='/notice/edit.ag?no=${noticeVo.mainNo}'/>">
			수정</a> |
        	<a href="#" onclick="del(${noticeVo.mainNo})">삭제</a> |
        	<a href="<c:url value='/notice/list.ag'/>">목록</a>
		</div>
	</div>
</body>
</html>