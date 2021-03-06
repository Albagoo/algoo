<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">	
	$(document).ready(function(){
		$(".divList .box2 tbody td:nth-of-type(3)")
		.hover(function(){
			$(this).css("background","#fff7f7").css("cursor","pointer");
		}, function(){
			$(this).css("background","");
		});
		
		$("input[name='chkAllFree']").click(function(){
			$(".freeBody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$("#btFreeDel").click(function(){
			var count
			=$("tbody input[type=checkbox]:checked").length;
			
			if(count==0){
				alert("삭제할 게시글을 먼저 선택하세요");
				return false;
			}
			
			frmTList.action="<c:url value='/freeboard/selectDelete.ag'/>";
			frmTList.submit();
		});
	});
	
	function pageProc(curPage){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.submit();
	}
</script>	

<section>
<form name="frmPage" method="post" action="<c:url value='/freeboard/list.ag'/>">
<input type="hidden" name="currentPage">
<input type="hidden" name="searchCondition" value="${param.searchCondition }">
<input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword }">	
</form>

<form name="frmTList" method="post"
	action="<c:url value='/freeboard/list.ag'/>" >
<div class="divList">
<div class="list">
<legend>
	<img src="<c:url value='/images/albatalk.png'/>" style="height: 25px;" align=absmiddle>
</legend>
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword }, ${pagingInfo.totalRecord }건 검색되었습니다.</p>
</c:if>
<c:if test="${empty searchVO.searchKeyword }">
	<p>전체 조회 결과 - ${pagingInfo.totalRecord }건 조회되었습니다</p>
</c:if>
</div>
<c:if test="${sessionScope.authCode==3 }">
	<span class="talkList" style="float: right;margin-bottom: 10px;padding-right: 3px;">
		<a href="<c:url value='/admin/adminBoard.ag'/>" 
			style="font-size: 0.8em;color: black;text-decoration: none;">
		<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle
			style="height: 15px;">
			관리자 페이지로</a>
	</span>
</c:if>
<table class="box2">
	<colgroup>
		<col stype="width:5%;" />
		<col style="width:5%;" />
		<col style="width:55%;" />
		<col style="width:14%;" />
		<col style="width:14%" />
		<col style="width:7%" />
	</colgroup>
	<thead>
	  <tr>
	  	<th scope="col"><input type="checkbox" name="chkAllFree"></th>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody>  
	<c:if test="${empty freeList}">
		<tr>
			<td colspan="6" class="align_center">
				검색된 글이 없습니다
			</td>
		</tr>
	</c:if>
	<c:if test="${!empty freeList}">
		<!--게시판 내용 반복문 시작  -->		
		<c:set var="k" value="0" />
		<c:forEach var="fList" items="${freeList }">
			<tr style="text-align: center">
				<td class="freeBody">
					<input type="checkbox" name="freeList[${k}].freeNo"
						id="chk3_${k }" value="${fList.freeNo}" >
				</td>
				<td>${fList.freeNo}</td>
				<td style="text-align: left;">
					<!-- 삭제된 글에 대한 처리 -->
					<c:if test="${fList.delYn=='Y'}">
						<span style="color:gray">
							&nbsp; 삭제된 글입니다</span>
					</c:if>
					<c:if test="${fList.delYn!='Y'}">					
						<!-- 답변의 경우 화살표 이미지 보여주기 -->
						<c:if test="${fList.step>0 }">
							<c:forEach var="i" 
								begin="1" end="${fList.step}">
								&nbsp;&nbsp;
							</c:forEach>
							<img src
							="<c:url value='/images/re2.png' />" alt="re이미지"
								 align=absmiddle id="reply">
						</c:if>
						<a href="<c:url value='/freeboard/updateCount.ag?freeNo=${fList.freeNo}'/>">
							<!-- 제목이 긴 경우 일부만 보여주기 -->
							<c:if test="${fn:length(fList.title)>20}">
								&nbsp; ${fn:substring(fList.title, 0,20)}...
							</c:if>
							<c:if test="${fn:length(fList.title)<=20}">
								&nbsp; ${fList.title}
							</c:if>
						</a>
						<c:if test="${fList.delYn!='Y'}">
							(${fList.count})
						</c:if>
						<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
						<c:if test="${fList.newImgTerm<24}">
							<img src="<c:url value='/images/new5.png'/>" alt="new 이미지" 
								style="height: 14px;" align=absmiddle >
						</c:if>
					</c:if>
				</td>
				<td>${fList.nickName}</td>
				<td><fmt:formatDate value="${fList.regdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>${fList.readCount}</td>
			</tr>
			<c:set var="k" value="${k+1 }" />				
		</c:forEach>
		<!--반복처리 끝  -->
	</c:if>
	</tbody>
</table>	   
</div>

<div style="margin: 10px 0 0 3px;">
	<c:if test="${sessionScope.authCode==3 }">
		<input type="button" id="btFreeDel" value="선택한 게시글 삭제" class="button white medium">
	</c:if>
	<div class="divBtn">
    <input type = "Button" class="button white medium" value="글쓰기" 
      	onclick="location.href='<c:url value="/freeboard/write.ag"/>';" />
	</div> 
</div>
</form>
<div class="divPage">
	<c:if test="${onePage.firstPage>1 }">	
		<c:if test="${pagingInfo.firstPage>1 }">	
			<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
				<img src="<c:url value='/images/pastone.png'/>" alt="이전블럭으로" align=absmiddle
				style="height: 15px;">
			</a>	
		</c:if>
		<a href="#" onclick="pageProc(${onePage.firstPage-1})">
			<img src="<c:url value='/images/past.png'/>" alt="이전페이지로" align=absmiddle>
		</a>	
	</c:if>
	
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">	 
		<c:if test="${i==pagingInfo.currentPage }">
			<span>${i }</span>
		</c:if>		
		<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageProc(${i})" >
				${i}</a>
		</c:if>
	</c:forEach>	
	
	<!-- 다음 블럭으로 이동 -->
	<c:if test="${onePage.lastPage<onePage.totalPage }">	
		<a href="#" 
		onclick="pageProc(${onePage.lastPage+1})">
			<img src="<c:url value='/images/next.png'/>" alt="다음페이지로" align=absmiddle>
		</a>
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">	
			<a href="#" 
			onclick="pageProc(${pagingInfo.lastPage+1})">
				<img src="<c:url value='/images/nextone.png'/>" alt="다음블럭으로" align=absmiddle
				 style="height: 15px;">
			</a>
		</c:if>
	</c:if>
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" 
   	action="<c:url value='/freeboard/list.ag' />" >
        <select name="searchCondition" class="button white small"
        	style="font-size: 0.75em;">
            <option value="title"
           	   <c:if test="${param.searchCondition=='title'}">
            		selected
               </c:if>
            >제목</option>
            <option value="content" 
            	<c:if test="${param.searchCondition=='content'}">
            		selected
               </c:if>
            >내용</option>
            <option value="nickName" 
            	<c:if test="${param.searchCondition=='nickName'}">
            		selected
               </c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" 
        	title="검색어 입력" value="${param.searchKeyword}" >   
		<input type="submit" class="button white medium" value="검색">
    </form>
</div>
<p class="clearboth"></p> 
</section>

<%@ include file="../inc/bottom.jsp" %>