<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script type="text/javascript">	
	$(document).ready(function(){
		//09-06
		$(".divList .box tbody tr")
		.hover(function(){
			$(this).css("background","LavenderBlush")
				.css("cursor","pointer");
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
	function pageFunc(curPage){
		document.frmPaging.currentPage.value=curPage;
		frmPaging.submit();
	}
</script>

<section>
<!-- 08-31 paging form start-->
<form name="frmPaging" method="post"
 action="<c:url value='/notice/list.ag'/>"
 id="frmPaging">
 	<!-- 09-02 category searching -->
	<input type="hidden" name="categoryName" id="categoryName" value="${param.categoryName }">
	<input type="hidden" name="currentPage" id="currentPage"  >	
</form>
<!-- paging form end -->

<!-- 09-05 search for category -->
<form name="frmPage" id="frmPage" method="post" 
action="<c:url value='/notice/list.ag'/>">
	<input type="hidden" name="categoryName" id="categoryName2" value="${param.categoryName }">
	<input type="hidden" name="currentPage" id="currentPage2" value="1" >	
</form>
<div class="divListAll" align="center">
<p id="firstTitle">
	공지사항
	<c:if test="${!empty param.searchKeyword }">
		<!-- search case -->
		<p class="searchResult">검색어 ${param.searchKeyword}(으)로  
			${pagingInfo.totalRecord}건 검색되었습니다.</p>
	</c:if>
	<c:if test="${empty param.searchKeyword }">
		<!-- whole case -->
		<p class="searchResult">등록된 공지사항은 ${pagingInfo.totalRecord}건 입니다</p>
	</c:if>
</p>

<!-- 09-06 -->
<div class="divList">
	<table style="background-color:#eeeeee"
		summary="공지사항에 관한 표"
		class="listBox">
		<th width="104px">
		<select name="categoryInput" class="button white small"
        	style="font-size: 0.75em;">
	    <!--  onchange="location.href=this.value"> -->
		<option value="">구분</option>
		<option value="공지"
		 <c:if test="${param.categoryName=='공지' }">selected</c:if>>
		 공지</option>
		<option value="이벤트"
		 <c:if test="${param.categoryName=='이벤트' }">selected</c:if>>
		 이벤트</option>
		<option value="점검"
		 <c:if test="${param.categoryName=='점검' }">selected</c:if>>
		 점검</option>
		</select>
		</th>
		<th width="512px">제목</th>
		<th width="102px">작성자</th>
		<th width="204px">작성일</th>
		<th width="102px">조회수</th>
	</table>
	<c:forEach var="vo" items="${noticeList }">
		<table class="box" style="text-align:center">
		<tr>
		<td width="105px">${vo.category } </td>
		<td width="511px">
		<a href="<c:url value='/notice/updateReadCount.ag?no=${vo.mainNo}'/>">
		${vo.title } </a></td>
		<td width="102px">${vo.writer } </td>
		<td width="204px"><fmt:formatDate value="${vo.regdate }"
			 pattern="yyyy-MM-dd"></fmt:formatDate> </td>
		<td width="102px">${vo.readCount } </td>
		</tr>
		</table>
	</c:forEach>
	</div>

<!-- 08-31 Paging-->
<div style="clear:both;text-align:center;width:1024px">
	<!-- move to last block -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			&lt;&lt;</a>
	</c:if>
	<!-- add page number -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" 
		begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">					
			<span style="color:blue;font-weight:bold">
				${i}</span>
		</c:if>		
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
				[${i}]</a>
		</c:if>		
	</c:forEach>				
	
	<!-- move to next block -->
	<c:if test
	="${pagingInfo.lastPage<pagingInfo.totalPage}">				
		<a href="#" 
	onclick="pageFunc(${pagingInfo.lastPage+1})">
			&gt;&gt;</a>
	</c:if>
</div>
<br>
	<!-- 09-01 search part -->
	<div class="divSearch" style="text-align:center;width:1024px">
		<form name="frmSearch" method="post" 
	   	 action="<c:url value='/notice/list.ag' />" >
	   		<div class="searchBox"> 
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
	            <option value="writer" 
	            	<c:if test="${param.searchCondition=='writer'}">
	            		selected
	               </c:if>
	            >작성자</option>
	        </select>
	        <input type="text" name="searchKeyword" 
	        	title="검색어 입력" value="${param.searchKeyword}" >
			<input type="submit" value="검색"
				 class="button white small"
	        	style="font-size: 0.75em;">
			</div>
	    </form>
	</div>
	
	<div class="divBtn" style="text-align:right;width:1024px">
	<input type = "Button" class="button white medium" value="공지 등록" 
      	onclick="location.href='<c:url value="/notice/write.ag"/>';" />
      	<br><br><br>
	</div>
</div>
</section>

<%@ include file="../inc/bottom.jsp" %> 