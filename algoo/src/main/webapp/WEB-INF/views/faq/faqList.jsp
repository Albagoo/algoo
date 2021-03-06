<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/boardManagement.jsp" %>
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
		
		//카테고리 검색
		$("#categoryInput").change(function(){
			$("#categoryName2").val($("#categoryInput").val());
			$("#frmPage").submit();
		});
		
		$("input[name='chkAllFaq']").click(function(){
			$(".faqBody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$("#btFaqDel").click(function(){
			var count
			=$("tbody input[type=checkbox]:checked").length;
			
			if(count==0){
				alert("삭제할 FAQ를 먼저 선택하세요");
				return false;
			}
			
			frmFList.action="<c:url value='/faq/selectDelete.ag'/>";
			frmFList.submit();
		});
	});
	
	function pageProc(curPage){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.submit();
	}
</script>	

<section>
<form name="frmCategory" method="post" action="<c:url value='/faq/faqList.ag'/>"
 id="frmCategory">
 	<!-- 09-12 카테고리 검색 -->
	<input type="hidden" name="categoryName" id="categoryName" value="${param.categoryName }">
	<input type="hidden" name="currentPage" id="currentPage"  >	
</form>

<form name="frmPage" method="post" id="frmPage"
	action="<c:url value='/faq/faqList.ag'/>">
<input type="hidden" name="currentPage" id="currentPage2" value="1">
<input type="hidden" name="categoryName" id="categoryName2" value="${param.categoryName }">
<input type="hidden" name="searchCondition" value="${param.searchCondition }">
<input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword }">	
</form>

<form name="frmFList" method="post"
	action="<c:url value='/faq/faqList.ag'/>" >
<div class="divList">
<div id="Qmark">
	<span><img alt="공지사항" src="<c:url value='/images/faq.png'/>" style="height: 22px;"></span>
</div>
<div class="list">
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword }, ${pagingInfo.totalRecord }건 검색되었습니다.</p>
</c:if>
<c:if test="${empty param.searchKeyword }">
	<p>전체 조회 결과 - ${pagingInfo.totalRecord }건</p>
</c:if>
</div>
<div class="category">
   	<label for="categoryList">카테고리로 찾기</label>
		<select name="categoryInput" id="categoryInput" title="카테고리"
     	 class="button white small" style="font-size: 0.85em; margin-bottom: 5px;">
     		<option value="">선택하세요</option>
     		<option value="개인회원 가입 및 탈퇴"
     		 <c:if test="${param.categoryName=='개인회원 가입 및 탈퇴' }">selected</c:if>>
     		 개인회원 가입 및 탈퇴</option>
     		<option value="기업회원 가입 및 탈퇴"
     		 <c:if test="${param.categoryName=='기업회원 가입 및 탈퇴' }">selected</c:if>>
     		 기업회원 가입 및 탈퇴</option>
     		<option value="회원정보관리"
     		 <c:if test="${param.categoryName=='회원정보관리' }">selected</c:if>>
     		 회원정보관리</option>
     		<option value="기업정보관리"
     		 <c:if test="${param.categoryName=='기업정보관리' }">selected</c:if>>
     		 기업정보관리</option>
     	 	<option value="이력서 관리 및 활용"
     	 	 <c:if test="${param.categoryName=='이력서 관리 및 활용' }">selected</c:if>>
     	 	 이력서 관리 및 활용</option>
     	 	<option value="이력서 검색 및 열람"
     	 	 <c:if test="${param.categoryName=='이력서 검색 및 열람' }">selected</c:if>>
     	 	 이력서 검색 및 열람</option>
     	 	<option value="알바정보 검색 및 열람"
     	 	 <c:if test="${param.categoryName=='알바정보 검색 및 열람' }">selected</c:if>>
     	 	 알바정보 검색 및 열람</option>
     	 	<option value="지원자관리"
     	 	 <c:if test="${param.categoryName=='지원자관리' }">selected</c:if>>
     	 	 지원자관리</option>
     	 	<option value="온라인 지원"
     	 	 <c:if test="${param.categoryName=='온라인 지원' }">selected</c:if>>
     	 	 온라인 지원</option>
     	 	<option value="알바토크"
     	 	 <c:if test="${param.categoryName=='알바토크' }">selected</c:if>>
     	 	 알바토크</option>
     	 	<option value="유료서비스/결제오류"
     	 	 <c:if test="${param.categoryName=='유료서비스/결제오류' }">selected</c:if>>
     	 	 유료서비스/결제오류</option>
     	 	<option value="세금계산서"
     	 	 <c:if test="${param.categoryName=='세금계산서' }">selected</c:if>>
     	 	 세금계산서</option>
     	 	<option value="기타 문의"
     	 	 <c:if test="${param.categoryName=='기타 문의' }">selected</c:if>>
     	 	 기타 문의</option>
     </select>
     <span class="talkList" style="float: right;margin-bottom: 5px;padding-right: 3px;">
		<a href="<c:url value='/admin/adminBoard.ag'/>" 
			style="color: black;text-decoration: none;">
		<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle
			style="height: 15px;">
			관리자 페이지로</a>
</span>
     
</div>
<table class="box2">
	<colgroup>
		<col style="width:5%;" />
		<col style="width:10%;" />
		<col style="width:70%;" />
		<col style="width:15%;" />	
	</colgroup>
	<thead>
	  <tr>
	 	<th scope="col"><input type="checkbox" name="chkAllFaq"></th>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성일</th>
	  </tr>
	</thead> 
	<tbody>  
	<c:if test="${empty alist}">
		<tr>
			<td colspan="4" class="align_center">
				검색된 질문이 없습니다
			</td>
		</tr>
	</c:if>
	<c:if test="${!empty alist}">
		<c:set var="j" value="0" />
		<c:forEach var="vo" items="${alist }">
			<tr style="text-align: center">
				<td class="faqBody">
					<input type="checkbox" name="faqList[${j}].faqNo"
						id="chk_${j }" value="${vo.faqNo}" >
				</td>
				<td>${vo.faqNo}</td>
				<td style="text-align: left;">
					<a href="<c:url value='/faq/faqDetail.ag?faqNo=${vo.faqNo}'/>">
						&nbsp; [${vo.category }] 
						<c:if test="${fn:length(vo.title)>18}">
							${fn:substring(vo.title, 0,18)}...
						</c:if>
						<c:if test="${fn:length(vo.title)<=18}">
							${vo.title }
						</c:if></a>
				</td>
				<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>				
			<c:set var="j" value="${j+1 }" />
		</c:forEach>
	</c:if>
	</tbody>
</table>
<div style="margin: 10px 0 0 3px;">
	<input type="button" id="btFaqDel" value="선택한 FAQ 삭제" class="button white medium">  
	<div class="divBtn">
    <input type = "Button" class="button white medium" value="FAQ 쓰기" 
      	onclick="location.href='<c:url value="/faq/faqWrite.ag"/>';" />
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
   	action="<c:url value='/faq/faqList.ag' />" >
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
        <input type="text" name="searchKeyword" 
        	title="검색어 입력" value="${param.searchKeyword}" class="textBox" >   
		<input type="submit" class="button white medium" value="검색">
    </form>
</div>
<p class="clearboth"></p> 
</section>

<%@ include file="../inc/admin_bottom.jsp" %>