<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script type="text/javascript">	
	$(document).ready(function(){
	
		 //09-06
		$(".divList .box2 tbody td:nth-of-type(2)")
		.hover(function(){
			$(this).css("background","#eee").css("cursor","pointer");
		}, function(){
			$(this).css("background","");
		});
		
		//09-02 searching category
		$("#categoryInput").change(function(){
			$("#categoryName2").val($("#categoryInput").val());
			$("#frmPage").submit();
		});
	});
	
	//08-31 paging
	function pageProc(curPage){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.submit();
	}
	</script>

<section>
<form name="frmPaging" method="post"
 action="<c:url value='/notice/noticeUserList.ag'/>"
 id="frmPaging">
	<input type="hidden" name="categoryName" id="categoryName" value="${param.categoryName }">
	<input type="hidden" name="currentPage" id="currentPage"  >	
</form>

<form name="frmPage" id="frmPage" method="post" 
action="<c:url value='/notice/noticeUserList.ag'/>">
	<input type="hidden" name="categoryName" id="categoryName2" value="${param.categoryName }">
	<input type="hidden" name="currentPage" id="currentPage2" value="1" >	
</form>
<div class="title">
	<legend>
		<img src="<c:url value='/images/notice.png'/>" style="height: 48px;" align=absmiddle>
	</legend>
</div>
<div class="divListAll" align="center">
<div class="noticeSearch">
	<form name="frmSearch" method="post" action="<c:url value='/notice/noticeUserList.ag' />" >
	<span>공지사항 검색</span>
	<input type="text" name="searchKeyword" title="검색어 입력">
	<input type="image" src="<c:url value='/images/search.png'/>" value="검색" align=absmiddle>
	</form>
</div>
<div class="category">
   	<label for="categoryList">카테고리로 찾기</label>
		<select name="categoryInput" id="categoryInput" title="카테고리"
     	 class="button white small">
     		<option value="">선택하세요</option>
			<option value="공지"
			 <c:if test="${param.categoryName=='공지' }">selected</c:if>>
			 공지</option>
			<option value="이벤트"
			 <c:if test="${param.categoryName=='이벤트' }">selected</c:if>>
			 이벤트</option>
			<option value="서비스"
			 <c:if test="${param.categoryName=='서비스' }">selected</c:if>>
			 서비스</option>
     	</select>
</div>
<div class="divList">
	<table class="box2">
		<colgroup>
			<col style="width:5%;" />
			<col style="width:10%;" />
			<col style="width:70%" />
			<col style="width:15%" />
		</colgroup>
		<thead>
	  <tr>
	  	<th scope="col">번호</th>
	    <th scope="col">분류</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성일</th>
	  </tr>
	</thead> 
		<tbody>
			<c:if test="${empty noticeList}">
				<tr>
					<td colspan="4" class="align_center">
						검색된 질문이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test="${!empty noticeList}">
				<c:forEach var="vo" items="${noticeList }">
		
				<tr>
					<td>
						${vo.mainNo }
					</td>
					<td style="font-weight: bold;color: #ff7373">
						${vo.category }
					</td>
					<td id="align_left" style="padding-left:10px">
						<a href="<c:url value='/notice/detail.ag?no=${vo.mainNo}'/>">
						${vo.title } </a>
					 </td>
					<td>
						<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /> 
					</td>
				</tr>
				
				</c:forEach>
			</c:if>
		</tbody>	
	</table>
</div>

<!-- 08-31 Paging-->
<div class="divPage">
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/images/past.png'/>" alt="이전블럭으로" align=absmiddle>
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
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">	
		<a href="#" 
		onclick="pageProc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/images/next.png'/>" alt="다음블럭으로" align=absmiddle>
		</a>
	</c:if>
</div>
<br>
	<div class="divSearch" style="text-align:center;width:100%">
		<form name="frmSearch" method="post" 
	   	 action="<c:url value='/notice/noticeUserList.ag' />" >
	   		<div class="searchBox"> 
	        <select name="searchCondition" class="button white small"
	        	style="font-size: 0.8em;">
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
	        </select>
	        <input type="text" name="searchKeyword" class="textBox"
	        	title="검색어 입력" value="${param.searchKeyword}" >
			<input type="submit" value="검색"
				 class="button white medium"
	        	style="font-size: 0.85em;">
			</div>
	    </form>
	</div>
</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %> 