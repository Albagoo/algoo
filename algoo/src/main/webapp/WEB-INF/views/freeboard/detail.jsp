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
				<c:if test="${sessionScope.userid==freeVo.userid}">
				| <a href="<c:url value='/freeboard/edit.ag?freeNo=${freeVo.freeNo}'/>">수정</a>
				| <a href="#" onclick="del(${freeVo.freeNo})">삭제</a>
				</c:if>
				<c:if test="${sessionScope.userid!=freeVo.userid}">
				| <a href="<c:url value='/freeboard/write.ag'/>">글쓰기</a>
				| <a href="<c:url value='/freeboard/list.ag' />">목록</a>	
				</c:if>
			</span>
		</div>
		<div class="secondDiv">
			<p class="writer">${freeVo.nickName }(${fn:substring(freeVo.userid, 0,3)}***)</p>
			<p class="content">${freeVo.content }</p>
		</div>
		<div class="comments">
			<div class="cmtList" style="margin: 0 0 20px 0;">
				<c:import url="/comment/list.ag">
					<c:param name="freeNo" value="${param.freeNo }"></c:param>
				</c:import>
				<%@ include file="../comment/write.jsp" %>
			</div>
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
		<c:if test="${sessionScope.userid==freeVo.userid}">
	      	<input type = "Button" class="button white medium" value="수정" 
	      		onclick="location.href
	      			='<c:url value="/freeboard/edit.ag?freeNo=${freeVo.freeNo}" />'"> 
     	<input type = "Button" class="button white medium" value="삭제" 
      		onclick="del(${freeVo.freeNo})" />
      	</c:if>	
      	<input type = "Button" class="button white medium" value="목록" 
      		 onclick="location.href
      			='<c:url value="/freeboard/list.ag" />'"/>		
		</div>
		<div class="showContent">
			<table class="contentBox">
				<colgroup>
					<col style="width:10%;" />
					<col style="width:70%;" />
					<col style="width:10%;" />
					<col style="width:10%" />
				</colgroup>
				<thead>
					<th class="arrow"></th>
					<th class="ctitle"></th>
					<th class="cnick"></th>
					<th class="cdate"></th>
				</thead>
				<tbody>
					<tr style="border-bottom: 1px dashed #ffdddd;">
						<td style="padding-left: 5px;">
							<a href="<c:url value='/freeboard/detail.ag?freeNo=${preFreeVo.freeNo}' />">
								<img alt="이전글 이미지" src="<c:url value='/images/up.png'/>">&nbsp;이전글
							</a>
						</td>
						<td>
							<c:if test="${empty preFreeVo.freeNo}">
								<span style="color: gray;font-size: 0.9em;">이전 글이 없습니다</span>
							</c:if>
							<a href="<c:url value='/freeboard/detail.ag?freeNo=${preFreeVo.freeNo}' />">
								${preFreeVo.title}
							</a>
						</td>
						<td>${preFreeVo.nickName }</td>
						<td class="align_center"><fmt:formatDate value="${preFreeVo.regdate }" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<td style="padding-left: 5px;">
							<a href="<c:url value='/freeboard/detail.ag?freeNo=${nextFreeVo.freeNo}' />">
								<img alt="다음글 이미지" src="<c:url value='/images/down.png'/>">&nbsp;다음글
							</a>
						</td>
						<td>
							<c:if test="${empty nextFreeVo.freeNo}">
								<span style="color: gray;font-size: 0.9em;">다음 글이 없습니다</span>
							</c:if>
							<a href="<c:url value='/freeboard/detail.ag?freeNo=${nextFreeVo.freeNo}' />">
								${nextFreeVo.title }
							</a>		
						</td>
						<td>${nextFreeVo.nickName }</td>
						<td class="align_center"><fmt:formatDate value="${nextFreeVo.regdate }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %>