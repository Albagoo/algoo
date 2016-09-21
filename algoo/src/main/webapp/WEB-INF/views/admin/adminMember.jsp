<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>
<html>
<head>

<title>Insert title here</title>
<script type="text/javascript" 
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
   
   $(function() {
	   $("#RecordCountPerPage").change(function () {
		 
		   frmPage.submit();
	});
	});
   
   function pageProc(curPage){
      document.frmPage.currentPage.value=curPage;
      document.frmPage.submit();
   } 
   
   
</script>
</head>
<body>
<form name="frmPage" id="frmPage" method="post" 
   action="<c:url value='/admin/adminMember.ag'/>">
   <input type="hidden" name="currentPage" value="1" >
   <input type="hidden" name="searchCondition" 
      value="${param.searchCondition }">
   <input type="hidden" name="searchKeyword" 
      value="${searchVO.searchKeyword }"> 

   <select name="RecordCountPerPage" id="RecordCountPerPage">
      
      <option value="20"
      <c:if test="${searchVO.recordCountPerPage==20 }" > 
      selected </c:if>>   전체보기</option>
      <option value="10"
      <c:if test="${searchVO.recordCountPerPage==10 }" > 
      selected </c:if>>
         10개보기</option>
      <option value="3"
      <c:if test="${searchVO.recordCountPerPage==3 }" > 
      selected </c:if>>3개보기</option>
   </select>
   
      </form>
	<table>
		<thead>
			<tr>
				<th>회원코드</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>생일</th>
				<th>성별</th>
				<th>이메일</th>
				<th>휴대폰번호</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty alist }">
				<tr>
					<td>회원 내역이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${!empty alist}">
				<c:forEach var="vo" items="${alist }">
					<tr>
						<td>${vo.memberCode }</td>
						<td>${vo.userid }</td>
						<td>${vo.nickName}</td>
						<td>${vo.userName}</td>
						<td>${vo.birth}</td>
						<td>${vo.gender}</td>
						<td>${vo.email1}@${vo.email2}</td>
						<td>${vo.hp1}-${vo.hp2}-${vo.hp3}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>


	<div class="divPage">
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${pagingInfo.firstPage>1}">
			<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})"> <img
				src="<c:url value='/images/past.png'/>" alt="이전블럭으로"></a>
		</c:if>

		<!-- 페이지 번호 추가 -->
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage}"
			end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color: blue; font-weight: bold"> ${i}</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageProc(${i})"> [${i}]</a>
			</c:if>
		</c:forEach>
		<!--  페이지 번호 끝 -->

		<!-- 다음 블럭으로 이동 -->
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
			<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> 
			<img src
			="<c:url value='/images/next.png'/>" alt="다음블럭으로">
			</a>
		</c:if>
	</div>
	<div class="divSearch">
      <form name="frmSearch" method="post" 
      action="<c:url value='/admin/adminMember.ag' />" >
        <select name="searchCondition">
            <option value="userid"
               <c:if test="${param.searchCondition=='userid' }">
                  selected
               </c:if>
            >아이디</option>
            <option value="userName" 
               <c:if test="${param.searchCondition=='userName' }">
                  selected
               </c:if>
            >이름</option>
            <option value="nickName" 
               <c:if test="${param.searchCondition=='nickName' }">
                  selected
               </c:if>
            >닉네임</option>
        </select>   
        <input type="text" name="searchKeyword" 
         title="검색어 입력" value="${param.searchKeyword }">   
      <input type="submit" value="검색">
    </form>
</div>
</body>
</html>