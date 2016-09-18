<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript">
function pageProc(curPos){
	document.frmPage.currentPage.value = curPos;
	document.frmPage.submit();
}
</script>
<style type="text/css">
	#tr{
		border-bottom: 2px solid silver;
	}
	
	td, th{
		padding: 5px;
	}
	
	.align_center{
		text-align: center;
	}
	
	.align_left{
		text-align: left;
	}
	
	.align_right{
		text-align: right;
	}
	
	#h2{
		font-size: 1.2em;
		font-weight: bold;
		border-bottom: 5px solid black;
		padding-bottom: 20px;
		width: 880px;
	}
	
	a, a:VISITED{
		color: black;
		font-weight: bold;
	}
	
	.divPage{
		text-align:center;		
		padding:5px 0;
	}
	
	.divPage span{
		color:#5b75ff;
		font-weight: bold;
		font-size: 0.9em;
		border: 1px solid #eee;
		padding: 0 9px 0 9px;
		margin: 0 1px 0 1px;"
	}
	
	.divPage a{
		font-size: 0.9em;
		color: black;
		padding: 0 10px 0 10px;
	}
</style>
<form name="frmPage" method="post" action="<c:url value='/resume/list.ag'/>">
	<input type="hidden" name="currentPage">	
</form>
<h2 id="h2">인재 정보 리스트</h2>
<table style="width: 100%">
	<colgroup>
		<col width="15%">
		<col width="50%">
		<col width="15%">
		<col width="10%">
		<col width="10%">
	</colgroup>
	<tr id="tr" style="background: silver">
		<th>이름</th>
		<th>이력서 제목</th>
		<th>경력/자격증</th>
		<th>희망지역</th>
		<th>등록일</th>
	</tr>
	<c:if test="${empty alist }">
		<tr id="tr" class="align_center">
			<td colspan="5">	
				데이터가 없습니다!!
			</td>
		</tr>
	</c:if>
	<c:if test="${!empty alist }">
		<c:forEach var="vo" items="${alist }">
			<tr id="tr" class="align_center">
				<td>
					<c:if test="${empty vo.photo }">
						<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>"
							width="50px" height="60px" align="absmiddle">
					</c:if>
					<c:if test="${!empty vo.photo }">
						<img alt="회원이미지" src="/algoo/algoo_images/${vo.photo }"
							width="50px" height="60px" align="absmiddle">
					</c:if>
					<span>
						${vo.username }<br>
						(${vo.gender }, ${vo.birth })
					</span>
				</td>
				<td class="align_left">
					<a href="<c:url value='/resume/detail.ag?hisCode=${vo.hisCode }'/>">
						<span style="font-size: 1.1em">${vo.title }</span></a><br>
					<span style="font-size: 0.8em">${vo.category }</span>
				</td>
				<td class="align_left" style="font-size: 0.7em">
					<table>
						<colgroup>
							<col width="43%">
							<col width="57%">
						</colgroup>
						<tr>
							<td class="align_right">
								경력 : 
							</td>
							<td class="align_left" style="color: blue">
								<c:if test="${empty vo.period }">
									신입
								</c:if>
								<c:if test="${!empty vo.period }">
									${vo.period }
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="align_right">
								자격증 : 
							</td>
							<td class="align_left" style="color: blue">
								<c:if test="${empty vo.licenseName }">
									${vo.licenseName }
								</c:if>
								<c:if test="${!empty vo.licenseName }">
									${vo.licenseName }
								</c:if>
							</td>
						</tr>
					</table>
				</td>
				<td style="font-size: 0.6em">
					${vo.area }
				</td>
				<td>
					<fmt:formatDate value="${vo.regdate }" pattern="MM/dd"/>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<div class="divPage">
	<!-- 이전 블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/images/first.JPG'/>" 
					alt="이전블럭으로">
		</a>	
	</c:if>
	
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">	 
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight: bold">
				${i }</span>
		</c:if>		
		<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageProc(${i})">
				[${i}]</a>
		</c:if>
	</c:forEach>	
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">	
		<a href="#" 
		onclick="pageProc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/images/last.JPG'/>" 
					alt="다음블럭으로">
		</a>
	</c:if>
</div>
<%@ include file="../inc/bottom.jsp"%>