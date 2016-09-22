<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />

<script type="text/javascript">	
	$(document).ready(function(){
	
		 //09-06
		$(".divList .box2 tbody td:nth-of-type(3)")
		.hover(function(){
			$(this).css("background","#fff7f7").css("cursor","pointer");
		}, function(){
			$(this).css("background","");
		});
		
		//09-02 searching category
		$("#categoryInput").change(function(){
			$("#categoryName2").val($("#categoryInput").val());
			$("#frmPage").submit();
		});
		
		$("input[name='chkAllNotice']").click(function(){
			$("tbody input[type=checkbox]").prop("checked", this.checked);
		});
		
		//선택글 삭제
		$("#btDel").click(function(){
			var count
			=$("tbody input[type=checkbox]:checked").length;
			
			if(count==0){
				alert("삭제할 공지사항을 먼저 선택하세요");
				return false;
			}
			
			frmList.action="<c:url value='/notice/selectDelete.ag'/>";
			frmList.submit();
		});
		
	});
	
	function pageProc(curPage){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.submit();
	}
	</script>

<section>
<!-- 08-31 paging form start-->
<form name="frmPaging" method="post" action="<c:url value='/notice/list.ag'/>" id="frmPaging">
	<input type="hidden" name="categoryName" id="categoryName" value="${param.categoryName }">
	<input type="hidden" name="currentPage" id="currentPage"  >	
</form>
<!-- paging form end -->

<!-- 09-05 search for category -->
<form name="frmPage" id="frmPage" method="post" 
action="<c:url value='/notice/list.ag'/>">
	<input type="hidden" name="categoryName" id="categoryName2" value="${param.categoryName }">
	<input type="hidden" name="currentPage" id="currentPage2" value="1" >	
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword }">	
</form>

<form name="frmList" method="post"
	action="<c:url value='/notice/list.ag'/>" >
<div class="divList">
<div id="Qmark">
		<img src="<c:url value='/images/notice.png'/>" style="height: 48px;" align=absmiddle>
</div>
<div class="list">
	<c:if test="${!empty param.searchKeyword }">
		<!-- search case -->
		<p class="searchResult">검색어 ${param.searchKeyword}(으)로  
			${pagingInfo.totalRecord}건 검색되었습니다.</p>
	</c:if>
	<c:if test="${empty param.searchKeyword }">
		<!-- whole case -->
		<p class="searchResult">등록된 공지사항은 ${pagingInfo.totalRecord}건 입니다</p>
	</c:if>
</div>
<!-- 09-06 -->
<div class="divList">
	<span class="talkList" style="float: right;margin-bottom: 10px;padding-right: 3px;">
		<a href="<c:url value='/admin/adminBoard.ag'/>" 
			style="font-size: 0.8em;color: black;text-decoration: none;">
		<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle
			style="height: 15px;">
			관리자 페이지로</a>
	</span>
	<table class="box2">
		<colgroup>
			<col style="width:5%;" />
			<col style="width:15%;" />
			<col style="width:65%" />
			<col style="width:15%" />
		</colgroup>
		<thead>
	  <tr>
	  	<th scope="col"><input type="checkbox" name="chkAllNotice"></th>
	    <th scope="col">
	    	<select name="categoryInput" id="categoryInput"
			class="button white small"
		       	style="font-size: 0.9em;">
		    <!--  onchange="location.href=this.value"> -->
			<option value="">구분</option>
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
	    </th>
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
				<c:set var="i" value="0" />
				<c:forEach var="vo" items="${noticeList }">
		
				<tr>
					<td class="align_center">
						<input type="checkbox" name="noticeList[${i}].mainNo"
							id="chk_${i }" value="${vo.mainNo}" >
					</td>
					<td  class="align_center">
						${vo.category }
					</td>
					<td class="align_left" style="padding-left:10px">
						<a href="<c:url value='/notice/detail.ag?no=${vo.mainNo}'/>">
						<c:if test="${fn:length(vo.title)>18}">
							${fn:substring(vo.title, 0,18)}...
						</c:if>
						<c:if test="${fn:length(vo.title)<=18}">
							${vo.title }
						</c:if> </a>
					 </td>
					<td  class="align_center">
						<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /> 
					</td>
				</tr>
				<c:set var="i" value="${i+1}" />
				</c:forEach>
			</c:if>
		</tbody>	
	</table>
	<br>
	<input type="button" id="btDel" value="선택한 공지사항 삭제">
</div>
</div>
</form>
<!-- 08-31 Paging-->
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
<br>
<div class="divSearch">
   	<form name="frmSearch" method="post" 
   	action="<c:url value='/faq/faqList.ag' />" >
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
        </select>   
        <input type="text" name="searchKeyword" 
        	title="검색어 입력" value="${param.searchKeyword}" class="textBox" >   
		<input type="submit" class="button white medium" value="검색">
    </form>
</div>
	
	<br>
	<div class="divBtn">
	    <input type = "Button" class="button white medium" value="공지 등록" 
	      	onclick="location.href='<c:url value="/notice/write.ag"/>';" />
	</div>
<p class="clearboth"></p> 
</section>

<%@ include file="../inc/simple_bottom.jsp" %> 