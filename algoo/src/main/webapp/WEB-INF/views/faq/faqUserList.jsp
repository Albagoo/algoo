<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script type="text/javascript">
  $(document).ready(function() {
    $( "#jQuery_accordion" ).accordion({
      collapsible: true
    });
  });
  
  function pageProc(curPage){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.submit();
	}
</script>
<style type="text/css">
.ui-accordion{
    width:100%;	
}
.ui-accordion .ui-accordion-header {
	display: block;
	cursor: pointer;
	position: relative;
	margin: 2px 0 0 0;
	padding: .5em .5em .5em .7em;
	min-height: 0; /* support: IE7 */
	font-size: 0.8em;
    border:1px solid lightgray;
    background:#fffafa;
    color:black;
    text-align: left;

}
</style>

<section>
<form name="frmPage" id="frmPage" method="post" 
action="<c:url value='/faq/faqUserList.ag'/>">
	<input type="hidden" name="categoryName" id="categoryName2" value="${param.categoryName }">
	<input type="hidden" name="currentPage" id="currentPage2" value="1" >	
	<input type="hidden" name="searchKeyword" id="currentPage2" value="${listFaqVO.searchKeyword}" >	
</form>
<div id="userList">
	<div id="naviDiv">
		<nav>
			<dl id="leftNavi">
				<dt><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=개인회원'/>">개인회원</a></dt>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=개인회원 가입 및 탈퇴'/>">개인회원<br> 가입 및 탈퇴</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=회원정보관리'/>">회원정보관리</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=이력서 관리 및 활용'/>">이력서 관리 및 활용</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=알바정보 검색 및 열람'/>">알바정보<br> 검색 및 열람</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=온라인지원'/>">온라인지원</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=알바토크'/>">알바토크</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기타 문의'/>">기타 문의</a></dd>
				<br><br>
				<dt><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기업회원'/>">기업회원</a></dt>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기업회원 가입 및 탈퇴'/>">기업회원<br> 가입 및 탈퇴</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기업정보관리'/>">기업정보관리</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=이력서 검색 및 열람'/>">이력서 검색 및 열람</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=지원자관리'/>">지원자관리</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=유료서비스/결제오류'/>">유료서비스<br>/결제오류</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=세금계산서'/>">세금계산서</a></dd>
				<dd><a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=기타 문의'/>">기타 문의</a></dd>
			</dl>
		</nav>
	</div>
	<div class="faqSearch">
	<form name="frmSearch" method="post" action="<c:url value='/faq/faqUserList.ag' />" >
		<span>질문검색</span>
		<input type="text" name="searchKeyword" title="검색어 입력" style="width: 200px;height: 25px;">
		<input type="image" src="<c:url value='/images/search.png'/>" value="검색" align=absmiddle>
	</form>
	</div>
	<div id="faqBody">
		<div id="faqinfo">
			<p> <a href="<c:url value='/faq/faqUserList.ag'/>">FAQ</a> 
			 >  <a href="<c:url value='/faq/faqUserList.ag?searchCondition=category&searchKeyword=${param.searchKeyword}'/>">
			${param.searchKeyword}</a> 
			</p>
		</div>
		<div id="jQuery_accordion" style="margin-bottom: 20px;">
			<c:forEach var="i" items="${ulist}">
				<h3>&nbsp; [${i.category }] ${i.title}</h3>
		  		<div id="answer">
		    		<p>
		    			${i.content}
					</p>
				</div>
			</c:forEach>  
		</div>
	</div>
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
		
		<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">	 
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
	<div class="divFSearch">
   	<form name="frmSearch" method="post" 
   	action="<c:url value='/faq/faqUserList.ag' />" >
        <select name="searchCondition" class="button white small"
        	style="font-size: 0.75em;">
            <option value="title"
           	   <c:if test="${param.searchCondition=='title'}">
            		selected
               </c:if>
            >질문</option>
            <option value="content" 
            	<c:if test="${param.searchCondition=='content'}">
            		selected
               </c:if>
            >답변</option>
        </select>   
        <input type="text" name="searchKeyword" style="font-size: 0.8em;"
        	title="검색어 입력" placeholder="검색어를 입력하세요" class="textBox">   
		<input type="submit" class="button white medium" value="검색">
    </form>
	</div>
</div>
</section> 
        
<%@ include file="../inc/bottom.jsp" %>