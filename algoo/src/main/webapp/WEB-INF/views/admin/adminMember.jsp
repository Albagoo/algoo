<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<title>Insert title here</title>
<style type="text/css">
input[type=text]{
	width: 50px;
}	
input[type=text], td{
	font-size:0.75em;
}
</style>
<script type="text/javascript" 
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
   
   $(function() {
	   $("#RecordCountPerPage").change(function () {
		 
		   frmPage.submit();
		});
	  
	});//document
   
   function pageProc(curPage){
      document.frmPage.currentPage.value=curPage;
      document.frmPage.submit();
   } 
   
	function del(userid){
		if(confirm("회원을 삭제 하시겠습니까?")){
			location.href="<c:url value='/admin/adminMemberDelete.ag?userid="+userid+"'/>";
		}
	}
   
	function edit(userid){
		if(confirm("회원 정보를 수정하시겠습니까?")){
			location.href="<c:url value='/admin/adminMember.ag?userid='/>"+userid;
		}
	}
	
	function editCon(){
		if(confirm("취소하겠습니까")){
		location.href="<c:url value='/admin/adminMember.ag'/>";
		}else{
			return;
		}
	}
</script>
</head>
<body>
<input type="hidden" value="" name="edith" id="edith">
<form name="frmPage" id="frmPage" method="post" 
   action="<c:url value='/admin/adminMember.ag'/>" >
   <input type="hidden" name="currentPage" value="1" >
   <input type="hidden" name="searchCondition" 
      value="${param.searchCondition }">
   <input type="hidden" name="searchKeyword" 
      value="${searchVO.searchKeyword }"> 
<div class="divListAll" align="right">
   <select name="RecordCountPerPage" id="RecordCountPerPage"
   	class="button white small">
	  <option value="${searchVO.recordCountPerPage }">개수선택</option>
      <option value="2"
      <c:if test="${searchVO.recordCountPerPage==2 }"> 
      selected </c:if>>
         2개 보기</option>
      <option value="3"
      <c:if test="${searchVO.recordCountPerPage==3 }" > 
      selected </c:if>>
         3개 보기</option>
      <option value="20"
      <c:if test="${searchVO.recordCountPerPage==20 }" > 
      selected </c:if>>20개보기</option>
   </select>
</div>
</form><!-- frmPage  -->
<div class="divList">
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
				<th>회원정보수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty alist }">
				<tr>
					<td>회원 내역이 없습니다</td>
				</tr>
			</c:if>
			<form action="<c:url value='/admin/adminMemEdit.ag'/>">
			<c:if test="${!empty alist}">
				<c:forEach var="vo" items="${alist }">
					<tr>
						<td>${vo.memberCode }</td>
						<td>${vo.userid }</td>
						
						<c:if test="${user!=vo.userid}">
							<td>${vo.nickName}</td>
							<td>${vo.userName}</td>
							<td>${vo.birth}</td>
							<td>${vo.gender}</td>
							<td>${vo.email1}@${vo.email2}</td>
							<td>${vo.hp1}-${vo.hp2}-${vo.hp3}</td>
							<td>
							<input type="button" class="button white small" value="회원정보수정"
							onclick="edit('${vo.userid}')">
							</td>
						</c:if>
						<c:if test="${user==vo.userid}">
							<td><input type="text" value="${vo.nickName}" name="nickName"></td>
							<td><input type="text" value="${vo.userName}" name="userName"></td>
							<td><c:set var="birthArr" value="${fn:split(vo.birth,'-')}"/>
								<input type="text" value="${birthArr[0]}" name="bi1">-
								<input type="text" value="${birthArr[1]}" name="bi2">-
								<input type="text" value="${birthArr[2]}" name="bi3">
								
							</td>
							<td><input type="text" value="${vo.gender}" name="gender"></td>
							<td><input type="text" value="${vo.email1}" name="email1">@
								<input type="text" value="${vo.email2}" name="email2"></td>
							<td><input type="text" value="${vo.hp1}" name="hp1">-
								<input type="text" value="${vo.hp2}" name="hp2">-
								<input type="text" value="${vo.hp3}" name="hp3">
							</td>
							<td>
							<input type="hidden" value="${vo.userid}" name="userid">
							<input type="submit" class="button white small" value="수정">
							<input type="button" class="button white small" value="취소"
								onclick="editCon()">
							</td>
						</c:if>
						
						<td><input type="button" class="button white small" value="삭제하기" 
						onclick="del('${vo.userid}')"> </td>
					</tr>
				</c:forEach>
			</c:if>
				</form>
		</tbody>
	</table>

	<div class="divPage">
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${pagingInfo.firstPage>1}">
			<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})"> 
			<img src="<c:url value='/images/past.png'/>" alt="이전블럭으로"></a>
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
        <select name="searchCondition" 	class="button white small">
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
         title="검색어 입력" value="${param.searchKeyword }"  style="width:200px">   
      <input type="submit" value="검색" 	class="button white small" >
   	 </form><!--search  -->
</div>
</div>
</body>
</html>