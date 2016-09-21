<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	function delNotice(no){
		if(confirm("공지사항을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/notice/delete.ag?no='/>"+${nVo.mainNo};
		}
	}
</script>
<style type="text/css">
	.adminBoard{
		color: black;
	}
	.adminSearch{
		border: 5px dashed #eee;
		width: 100%;
		margin-top: 30px;
		padding: 20px 0 20px 0; 
		text-align: center;
	}
	.adminSearch input[type="button"]{
		vertical-align: middle;
	}
	.adminList{
		margin-top: 30px;
	}
</style>
<section>
<div class="adminBoard">
	<div class="adminSearch">
			<select class="button white medium">
				<option>통합검색</option>
				<option>제목</option>
				<option>내용</option>
				<option>작성자</option>
			</select>
			<input type="text" id="search" class="textBox">
			<input type="button" value="검색" class="button white medium">
	</div>
	<div class="adminList">
		<div class="adminNotice">
			<span>공지사항</span>
			<table style="width: 100%;">
				<colgroup>
					<col style="width:5%;" /> <!-- 체크박스 -->
					<col style="width:60%;" /> <!-- 제목 -->
					<col style="width:15%;" /> <!-- 등록일 -->
					<col style="width:15%;" /> <!-- 수정 -->
					<col style="width:15%;" /> <!-- 삭제 -->
				</colgroup>
				<thead>
					<th scope="col"><input type="checkbox" name="chkAll"></th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</thead>
				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="nVo" items="${nlist }" end="7">
						<tr>
							<td>
								<input type="checkbox" name="notice[${i}].mainNo"
									id="chk1_${i }" value="${nVo.mainNo}" >
							</td>
							<td id="align_left" style="padding-left:10px">
								<a href="<c:url value='/notice/detail.ag?no=${nVo.mainNo}'/>">
								[${nVo.category }] ${nVo.title } </a>
							 </td>
							<td>
								<fmt:formatDate value="${nVo.regdate }" pattern="yyyy-MM-dd" /> 
							</td>
							<td><a href="<c:url value='/notice/edit.ag?no=${nVo.mainNo}'/>" >수정</a></td>
							<td><a href="#" onclick="delNotice(${nVo.mainNo})">삭제</a></td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="adminFaq">
	
		</div>
		<div class="adminFree">
	
		</div>
	</div>
</div>

</section>

<%@ include file="../inc/simple_bottom.jsp" %>