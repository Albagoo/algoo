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
		<div class="firstDiv">
			<span class="sp1">제목</span> 
			<span>${noticeVo.title}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> 
			<span>${noticeVo.writer}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> 
			<span>${noticeVo.regdate}</span>
		</div>
		<div>
			<span class="sp1">조회수</span> 
			<span>${noticeVo.readCount}</span>
		</div>
		<div class="lastDiv">			
			<p class="content">${noticeVo.content}</p>
		</div>
		<div class="center">
			<a href
			="<c:url value='/notice/edit.ag?no=${noticeVo.mainNo}'/>">
			수정</a> |
        	<a href="#" onclick="del(${noticeVo.mainNo})">삭제</a> |
        	<a href="<c:url value='/notice/list.ag'/>">목록</a>			
		</div>
	</div>
</body>
</html>