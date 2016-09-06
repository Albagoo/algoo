<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">	
	$(document).ready(function(){
		$(".divList .box2 tbody tr")
			.hover(function(){
				$(this).css("background","azure")
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

<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	}
	
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
</head>
<body>

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
<h2>공지사항</h2>
<p>
	<c:if test="${!empty param.searchKeyword }">
		<!-- search case -->
		<p>검색어 ${param.searchKeyword}(으)로  
			${pagingInfo.totalRecord}건 검색되었습니다.</p>
	</c:if>
	<c:if test="${empty param.searchKeyword }">
		<!-- whole case -->
		<p>등록된 공지사항은 ${pagingInfo.totalRecord}건 입니다</p>
	</c:if>
</p>

<%-- <p>등록된 공지사항은 ${pagingInfo.totalRecord }건입니다.</p> --%>
<div class="divList">
<table class="box2"
	 	summary="공지사항에 관한 표"
	 	style="border:1px solid;
	 	 		width:1024px">
	<thead>
	  <tr style="background-color:#d0d0d0">
	    <th scope="col" style="width: 53px;">
	    <select name="categoryInput" id="categoryInput">
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
	    <th scope="col" style="width: 370px; ">제목</th>
	    <th scope="col" style="width: 130px; ">작성자</th>
	    <th scope="col" style="width: 130px; ">작성일</th>
	    <th scope="col" style="width: 70px; ">조회수</th>
	  </tr>
	</thead>
	<tbody>
	<c:if test="${empty noticeList}">
		<tr>
			<td colspan="5" style="text-align:center">
				등록된 공지사항이 없습니다
			</td>
		</tr>
	</c:if>
	
	<c:if test="${!empty noticeList}">
	<!-- repeat start -->
	<c:forEach var="vo" items="${noticeList }">
		<tr>
			<td style="text-align:center">${vo.category }</td>
			<td><a href="<c:url value='/notice/updateReadCount.ag?no=${vo.mainNo}'/>">
				${vo.title }</a></td>
			<td style="text-align:center">${vo.writer }</td>
			<td style="text-align:center">
			 <fmt:formatDate value="${vo.regdate }"
			 pattern="yyyy-MM-dd"></fmt:formatDate></td>
			<td style="text-align:center">${vo.readCount }</td>
		</tr>
	</c:forEach>
	<!-- repeat end -->
	</c:if>
	</tbody>
</table>
</div>

<div class="divBtn" style="text-align:right;width:1024px">
<hr>
	<a href="<c:url value='/notice/write.ag'/>" >
	공지 등록</a>
</div>

<!-- 08-31 Paging-->
<div style="clear:both;text-align:center;width:1024px">
	<!-- move to last block -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			<%-- <img src="<c:url value='/images/first.JPG'/>" 
					alt="이전블럭으로"> --%>&lt;&lt;
		</a>
	</c:if>
	<!-- add page number -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" 
		begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">					
			<span style="color:blue;font-weight: bold">
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
			<%-- <img src="<c:url value='/images/last.JPG'/>" 
					alt="다음블럭으로"> --%>&gt;&gt;
		</a>
	</c:if>
</div>
<!-- 09-01 search part -->
<div class="divSearch" style="text-align:center;width:1024px">
	<form name="frmSearch" method="post" 
   	 action="<c:url value='/notice/list.ag' />" >
        <select name="searchCondition">
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
		<input type="submit" value="검색">
    </form>
</div>
</body>
</html>