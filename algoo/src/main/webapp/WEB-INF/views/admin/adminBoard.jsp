<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//게시글 출력개수		
		$("#btNco").click(function(){
			var ncount=$("input[name='num']").val();
			$("input[name='nco']").val(ncount);
			$("#frmCount").submit(); 
		});
		
		//전체선택
		$("input[name='chkAllNotice']").click(function(){
			$(".noticeBody input[type=checkbox]").prop("checked", this.checked);
		});

		$("input[name='chkAllFaq']").click(function(){
			$(".faqBody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$("input[name='chkAllFree']").click(function(){
			$(".freeBody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$(".adminNotice .box1 tbody td:nth-of-type(2)")
		.hover(function(){
			$(this).css("background","#fff7f7").css("cursor","pointer");
		}, function(){
			$(this).css("background","");
		});
		
		$(".adminFaq .box1 tbody td:nth-of-type(2)")
		.hover(function(){
			$(this).css("background","#fff7f7").css("cursor","pointer");
		}, function(){
			$(this).css("background","");
		});
		
		$(".adminFree .box2 tbody td:nth-of-type(2)")
		.hover(function(){
			$(this).css("background","#fff7f7").css("cursor","pointer");
		}, function(){
			$(this).css("background","");
		});
		
		//선택한 상품 삭제
		$("#btDel").click(function(){
			var count
			=$("tbody input[type=checkbox]:checked").length;
			
			if(count==0){
				alert("삭제할 상품을 먼저 체크하세요");
				return false;
			}
			
			frmList.action="<c:url value='/admin/product/productDeleteMulti.do'/>";
			frmList.submit();
		});
	});
	
	function delNotice(nNo){
		if(confirm("공지사항을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/notice/noticeAdminDelete.ag?no="+nNo+"'/>"
		}
	}
	
	function delFaq(fNo){
		if(confirm("FAQ를 삭제하시겠습니까?")){
			location.href
		="<c:url value='/faq/faqAdminDelete.ag?faqNo="+fNo+"'/>"
		}
	}
	
	function delFree(tNo){
		if(confirm("게시글을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/freeboard/freeAdminDelete.ag?freeNo="+tNo+"'/>"
		}
	}
</script>
<style type="text/css">
	.adminBoard{
		color: black;
	}
	.adminSearch{
		border: 5px dashed #eee;
		width: 99%;
		margin-top: 30px;
		padding: 20px 0 20px 0; 
		text-align: center;
	}
	.adminSearch input[type="button"]{
		vertical-align: middle;
	}
	.adminList{
		margin-top: 40px;
	}
	.adminNotice img{
		height: 18px;
		margin-bottom: 5px;
	}
	.adminFaq{
		margin-top: 60px;
	}
	.adminFaq img{
		height: 18px;
		margin-bottom: 5px;
	}
	.adminFree{
		margin-top: 60px;
	}
	.adminFree img{
		height: 18px;
		margin-bottom: 5px;
	}
	.adminFree span a{
		text-decoration: none;
		color: black;
		font-size: 0.8em;
		padding-right: 3px;
	}
	.adminFaq span a{
		text-decoration: none;
		color: black;
		font-size: 0.8em;
		padding-right: 3px;
	}
	.adminNotice span a{
		text-decoration: none;
		color: black;
		font-size: 0.8em;
	}
	.talkList{
		float: right;
	}
	.talkList img{
		height: 15px;
	}
	.box1{
		
	}
	.box1 tr{
		text-align: center;
		border: 1px solid #ffeaea;
		border-left: none;
		border-right: none;
	}
	.box1 th{
		background-color: #ffeaea;
		height: 35px;
		font-size: 0.95em;
	}
	.box1 a{
		color:black;
	}
	.box1 td:nth-of-type(2) a, .box1 td:nth-of-type(4) a, .box1 td:nth-of-type(5) a{
		text-decoration: none;
	}
	.box1 td{
		padding: 3px 0 3px 0;
		font-size: 0.9em;
	}
	.box2 th{
		background-color: #ffeaea;
		height: 35px;
		font-size: 0.95em;
	}
	.box2 tr{
		text-align: center;
		border: 1px solid #ffeaea;
		border-left: none;
		border-right: none;
	}
	.box2 td{
		padding: 3px 0 3px 0;
		font-size: 0.9em;
	}
	.box2 a{
		color:black;
		
	}
	.box2 td:nth-of-type(2) a, .box2 td:nth-of-type(6) a, .box2 td:nth-of-type(7) a{
		text-decoration: none;
	}
	input[name="num"]{
		width: 20px;
		border: none;
	}
	input[name="btNco"]{
		vertical-align: middle;
	}
	.boardPrint{
		text-align: right;
		margin-bottom: 30px;
	}
	#frmCount span{
		font-size: 0.9em;
	}
</style>
<section>
<div class="adminBoard">
<div class="adminSearch">
		<select class="button white medium">
			<option>통합검색</option>
			<option>제목</option>
			<option>내용</option>
			<option>작성자</option>
		</select>
		<input type="text" id="search" class="textBox">
		<input type="button" value="검색" class="button white medium">
</div>
<div class="adminList">
	<div class="boardPrint">
		<form action="<c:url value='/admin/adminBoard.ag'/> " method="post" id="frmCount">	
			<span>게시글  
			(<input type="text" id="num" name="num">)개 보기&nbsp;
			<input type="button" value="확인" id="btNco" name="btNco" class="button white medium">
			<input type="hidden" name="nco" value="${param.nco }"></span>
		</form>
	</div>
	<div class="adminNotice">
	<span><img alt="공지사항" src="<c:url value='/images/notice11.png'/>"></span>
	<span class="talkList">
			<a href="<c:url value='/notice/list.ag'/>">
			<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle>
				공지사항 목록으로</a>
	</span>
		<div>
			<table style="width: 100%;" class="box1">
				<colgroup>
					<col style="width:5%;" /> <!-- 체크박스 -->
					<col style="width:60%;" /> <!-- 제목 -->
					<col style="width:15%;" /> <!-- 등록일 -->
					<col style="width:15%;" /> <!-- 수정 -->
					<col style="width:15%;" /> <!-- 삭제 -->
				</colgroup>
				<thead>
					<th scope="col"><input type="checkbox" name="chkAllNotice"></th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</thead>
				<tbody class="noticeBody">
					<c:if test="${param.nco==null || param.nco==0 || empty param.nco}">
						<c:set var="print" value="7" />
					</c:if>
					<c:if test="${param.nco!=null && param.nco!=0 && !empty param.nco}">
						<c:set var="print" value="${param.nco }" />
					</c:if>
					<c:set var="i" value="0" />
					<c:forEach var="nVo" items="${nlist }" end="${print-1}">
						<tr>
							<td>
								<input type="checkbox" name="notice[${i}].mainNo"
									id="chkN_${i }" value="${nVo.mainNo}" >
							</td>
							<td style="text-align: left;padding-left: 10px;">
								<a href="<c:url value='/notice/detail.ag?no=${nVo.mainNo}'/>">
								[${nVo.category }] ${nVo.title } </a>
							 </td>
							<td>
								<fmt:formatDate value="${nVo.regdate }" pattern="yyyy-MM-dd" /> 
							</td>
							<td><a href="<c:url value='/notice/edit.ag?no=${nVo.mainNo}'/>" >수정</a></td>
							<td><a href="#" onclick="delNotice(${nVo.mainNo})">삭제</a></td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="margin-top: 4px;padding-left: 10px;">
			<!-- 선택글 삭제-->

		</div>
	</div>
	<div class="adminFaq">
		<span><img alt="FAQ" src="<c:url value='/images/faq.png'/>"></span>
		<span class="talkList">
			<a href="<c:url value='/faq/faqList.ag'/>">
			<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle>
				FAQ 목록으로</a>
		</span>
		<div>
			<table style="width: 100%;" class="box1">
				<colgroup>
					<col style="width:5%;" /> <!-- 체크박스 -->
					<col style="width:60%;" /> <!-- 제목 -->
					<col style="width:15%;" /> <!-- 등록일 -->
					<col style="width:15%;" /> <!-- 수정 -->
					<col style="width:15%;" /> <!-- 삭제 -->
				</colgroup>
				<thead>
					<th scope="col"><input type="checkbox" name="chkAllFaq"></th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</thead>
				<tbody>
					<c:set var="j" value="0" />
					<c:forEach var="fVo" items="${flist }" end="${print-1}">
						<tr>
							<td class="faqBody">
								<input type="checkbox" name="faq[${j}].faqNo"
									id="chk2_${j }" value="${fVo.faqNo}" >
							</td>
							<td style="text-align: left;padding-left: 10px;">
								<a href="<c:url value='/faq/faqDetail.ag?faqNo=${fVo.faqNo}'/>">
								[${fVo.category }] ${fVo.title } </a>
							 </td>
							<td>
								<fmt:formatDate value="${fVo.regdate }" pattern="yyyy-MM-dd" /> 
							</td>
							<td><a href="<c:url value='/faq/faqEdit.ag?faqNo=${fVo.faqNo}'/>" >수정</a></td>
							<td><a href="#" onclick="delFaq(${fVo.faqNo})">삭제</a></td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<!-- 선택글 삭제-->
			
		</div>
	</div>
	<div class="adminFree">
		<span><img alt="알바톡톡" src="<c:url value='/images/talk.png'/>"></span>
		<span class="talkList">
			<a href="<c:url value='/freeboard/list.ag'/>">
			<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle>
				알바톡톡 목록으로</a>
		</span>
		<div>
			<table style="width: 100%;" class="box2">
				<colgroup>
					<col style="width:5%;" /> <!-- 체크박스 -->
					<col style="width:52%;" /> <!-- 제목 -->
					<col style="width:9;"/> <!-- 작성자 -->
					<col style="width:6;"/> <!-- 조회수 -->
					<col style="width:12%;" /> <!-- 등록일 -->
					<col style="width:8%;" /> <!-- 수정 -->
					<col style="width:8%;" /> <!-- 삭제 -->
				</colgroup>
				<thead>
					<th scope="col"><input type="checkbox" name="chkAllFree"></th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">등록일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</thead>
				<tbody>
					<c:set var="k" value="0" />
					<c:forEach var="tVo" items="${tlist }" end="${print-1}">
						<tr>
							<td class="freeBody">
								<input type="checkbox" name="free[${k}].freeNo"
									id="chk3_${k }" value="${tVo.freeNo}" >
							</td>
							<td style="text-align: left; padding-left: 10px;">
								<a href="<c:url value='/freeboard/detail.ag?freeNo=${tVo.freeNo}'/>">
								${tVo.title } </a>
							</td>
							<td>
								${tVo.nickName }
							</td>
							<td>
								${tVo.readCount }
							</td> 
							<td>
								<fmt:formatDate value="${tVo.regdate }" pattern="yyyy-MM-dd" /> 
							</td>
							<td><a href="<c:url value='/freeboard/edit.ag?freeNo=${tVo.freeNo}'/>" >수정</a></td>
							<td><a href="#" onclick="delFree(${tVo.freeNo})">삭제</a></td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<!-- 선택글 삭제 -->
			
		</div>
	</div>
</div>
</div>

</section>

<%@ include file="../inc/simple_bottom.jsp" %>