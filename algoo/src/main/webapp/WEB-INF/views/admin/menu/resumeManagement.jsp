<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	#white th:nth-of-type(3){
		background:#E70400;
	}
	#white th:nth-of-type(3) a{
		color:white;
	}
	
	.adminResume img{
		height: 18px;
		margin-bottom: 5px;
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
</style>
<%@ include file="../../inc/admin_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#btOk").click(function(){
			$("#num").val($("#num_s :selected").val());
			$("#frmCount").submit();
		});
		
		$("input[name='chkAllResume']").click(function(){
			$(".resumeBody input[type=checkbox]").prop("checked", this.checked);
		});
	});
</script>
	<div id="menu" style="margin-bottom: 30px;">
		<table id="white">
			<colgroup>
				<col style="width: 25%;" />
				<col style="width: 25%;" />
				<col style="width: 25%;" />
				<col style="width: 25%;" />
			</colgroup>
			<thead>
				<tr>
					<th class="menuStyle" scope="col"><a href="<c:url value='/admin/adminMember.ag'/> ">회원관리</a></th>
					<th class="menuStyle" scope="col"><a href="<c:url value='/admin/adminRec.ag'/> ">채용공고관리</a></th>
					<th class="menuStyle" scope="col"><a href="<c:url value='/admin/menu/resumeManagement.ag'/> ">인재정보관리</a></th>
					<th class="menuStyle" scope="col"><a href="<c:url value='/admin/adminBoard.ag'/> ">게시판관리</a></th>
				</tr>
			</thead>
		</table>
	</div>
	
	<div class="boardPrint" style="float: right;">
		<form action="<c:url value='/admin/menu/resumeManagement.ag'/> " method="post" id="frmCount">	
			<span>게시글  
			<select id="num_s" class="button white medium">
				<option value="5"
					<c:if test="${param.num == 5 }">
						selected
					</c:if>>5개</option>
				<option value="10"
					<c:if test="${param.num == 10 }">
						selected
					</c:if>>10개</option>
				<option value="20"
					<c:if test="${param.num == 20 }">
						selected
					</c:if>>20개</option>
			</select> 보기&nbsp;</span>
			<input type="button" value="확인" id="btOk" name="btOk" class="button white medium">
			<input type="hidden" name="num" id="num">
		</form>
	</div>
	
	<div style="clear: both;">
	<form>
	<div class="adminResume">
		<span><img alt="인재정보" src="<c:url value='/images/resume_title.png'/>"></span>
		<div>
			<table style="width: 100%;" class="box1">
				<colgroup>
					<col style="width:5%;" /> <!-- 체크박스 -->
					<col style="width:60%;" /> <!-- 제목 -->
					<col style="width:15%;" /> <!-- 등록일 -->
					<col style="width:15%;" /> <!-- 수정 -->
					<col style="width:15%;" /> <!-- 삭제 -->
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox" name="chkAllResume"></th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
				<tbody class="resumeBody">
					<c:forEach var="vo" items="${alist }">
						<tr>
							<td>
								<input type="checkbox">
							</td>
							<td style="text-align: left;padding-left: 10px;">
								<a href="<c:url value='/resume/detail.ag?hisCode=${vo.hisCode }'/>">
								<c:if test="${fn:length(vo.title)>30}">
									${fn:substring(vo.title, 0,30)}...
								</c:if>
								<c:if test="${fn:length(vo.title)<=30}">
									${vo.title }
								</c:if> </a>
							 </td>
							<td>
								<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /> 
							</td>
							<td><a href="#">수정</a></td>
							<td><a href="#">삭제</a></td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="margin: 10px 0 0 3px;text-align: right;">
			<input type="button" id="btNoticeDel" value="선택한 인재정보 삭제" class="button white medium">   
		</div>
	</div>
	</form>
	</div>
<%@ include file="../../inc/admin_bottom.jsp" %>