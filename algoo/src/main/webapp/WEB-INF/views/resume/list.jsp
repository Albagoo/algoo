<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<table style="width: 100%">
	<colgroup>
		<col width="15%">
		<col width="50%">
		<col width="15%">
		<col width="10%">
		<col width="10%">
	</colgroup>
	<tr>
		<th>이름</th>
		<th>이력서 제목</th>
		<th>경력/자격증</th>
		<th>희망지역</th>
		<th>등록일</th>
	</tr>
	<c:if test="${empty alist }">
		<tr>
			<td colspan="5">	
				데이터가 없습니다!!
			</td>
		</tr>
	</c:if>
	<c:if test="${!empty alist }">
		<c:forEach var="vo" items="${alist }">
			<tr>
				<td>
					<c:if test="${empty vo.photo }">
						<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>"
							width="50px" height="60px" align="absmiddle">
					</c:if>
					<c:if test="${!empty vo.photo }">
						<img alt="회원이미지" src="/algoo/algoo_images/${vo.photo }"
							width="50px" height="60px" align="absmiddle">
					</c:if>
					<span>
						${vo.username }<br>
						(${vo.gender }, ${vo.birth })
					</span>
				</td>
				<td>
					<a href="#">${vo.title }</a><br>
					${vo.category }
				</td>
				<td>
					<c:if test="${empty vo.period }">
						경력 : 신입
					</c:if>
					<c:if test="${!empty vo.period }">
						경력 : ${vo.period }
					</c:if><br>
					<c:if test="${empty vo.licenseName }">
						자격증 : ${vo.licenseName }
					</c:if>
					<c:if test="${!empty vo.licenseName }">
						자격증 : ${vo.licenseName }
					</c:if>
				</td>
				<td>
					${vo.area }
				</td>
				<td>
					<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<%@ include file="../inc/bottom.jsp"%>