<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />

<section>
	<div class="divForm">
	<div id="Qmark">
		<img src="<c:url value='/images/faqicon.png'/>" style="height: 50px;">
	</div>
		<div class="firstDiv2">
			<span class="sp1">[${faqVo.category }] ${faqVo.title }</span>
			<span class="sp2">등록일 <fmt:formatDate value="${faqVo.regdate }" pattern="yyyy-MM-dd"/></span>
		</div>
		<div class="secondDiv">
			<p class="content">${faqVo.content }</p>
		</div>
		<div class="center">
			<br><a href
="<c:url value='/faq/faqEdit.ag?faqNo=${faqVo.faqNo}'/>" class="button white medium">
수정</a>
        	<a href
="<c:url value='/faq/faqDelete.ag?faqNo=${faqVo.faqNo}'/>" class="button white medium">
삭제</a>
        	<a href
="<c:url value='/faq/faqList.ag'/>" class="button white medium">목록</a>			
		</div>
		<div class="showContent">
			<table class="contentBox">
				<colgroup>
					<col style="width:15%;" />
					<col style="width:70%;" />
					<col style="width:15%" />
				</colgroup>
				<thead>
					<th class="arrow"></th>
					<th class="ctitle"></th>
					<th class="cdate"></th>
				</thead>
				<tbody>
					<tr style="border-bottom: 1px dashed #ffdddd;">
						<td style="padding-left: 5px;">
							<a href="<c:url value='/faq/faqDetail.ag?faqNo=${preFaqVo.faqNo}' />">
								<img alt="이전글 이미지" src="<c:url value='/images/up.png'/>">&nbsp;이전글
							</a>
						</td>
						<td>
							<c:if test="${empty preFaqVo.faqNo}">
								<span style="color: gray">이전 글이 없습니다</span>
							</c:if>
							<a href="<c:url value='/faq/faqDetail.ag?faqNo=${preFaqVo.faqNo}' />">
								${preFaqVo.title}
							</a>
						</td>
						<td class="align_center">
							<fmt:formatDate value="${preFaqVo.regdate }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 5px;">
							<a href="<c:url value='/faq/faqDetail.ag?faqNo=${nextFaqVo.faqNo}' />">
								<img alt="다음글 이미지" src="<c:url value='/images/down.png'/>">&nbsp;다음글
							</a>
						</td>
						<td>
							<c:if test="${empty nextFaqVo.faqNo}">
								<span style="color: gray">다음 글이 없습니다</span>
							</c:if>
							<a href="<c:url value='/faq/faqDetail.ag?faqNo=${nextFaqVo.faqNo}' />">
								${nextFaqVo.title }
							</a>		
						</td>
						<td class="align_center">
							<fmt:formatDate value="${nextFaqVo.regdate }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %>