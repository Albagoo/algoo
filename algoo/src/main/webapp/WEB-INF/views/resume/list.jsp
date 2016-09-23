<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" 
	src="<c:url value='/naver/naverLogin_implicit-1.0.2.js'/>" charset="utf-8"></script>
<script type="text/javascript">
	function pageProc(curPos){
		document.frmPage.currentPage.value = curPos;
		document.frmPage.submit();
	}
	
	$.getPeriod = function(period_1, period_2){
		var period1 = period_1.split("년");
		var period2 = period_2.split("년");
		
		var period_b = new Date(period1[0], period1[1]-1, 1);
		var period_a = new Date(period2[0], period2[1]-1, 1);
		
		var period_c = (period_a.getTime()-period_b.getTime())/1000/60/60/24/30;
		
		var period = Math.floor(period_c);
		
		return period;
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
	#tdName{
		font-weight: bold;
		text-align: left;
		font-size: 0.8em;
		padding-left: 5px;
	}
	#tdGender{
		font-size: 0.7em;
		text-align: left;
		padding-left: 5px;
	}
	#spanName{
		padding-left: 5px;
	}
	td{
		padding: 10px 0 10px 0;
	}

</style>
<form name="frmPage" method="post" action="<c:url value='/resume/list.ag'/>">
	<input type="hidden" name="currentPage">	
</form>
<h2 id="h2">인재 정보 리스트</h2>
<table style="width: 100%">
	<colgroup>
		<col width="8%">
		<col width="10%">
		<col width="46%">
		<col width="15%">
		<col width="11%">
		<col width="10%">
	</colgroup>
	<thead>
		<tr id="tr" style="background: silver">
			<th class="photo">이름</th>
			<th class="name"></th>
			<th>이력서 제목</th>
			<th>경력/자격증</th>
			<th>희망지역</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty alist }">
			<tr id="tr" class="align_center">
				<td colspan="5">	
					데이터가 없습니다!!
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty alist }">
			<c:set var="i" value="1"/>
			<c:forEach var="vo" items="${alist }">
				<tr id="tr" class="align_center">
					<td scope="row">
						<c:if test="${empty vo.photo }">
							<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>"
								height="60px" align="absmiddle">
						</c:if>
						<c:if test="${!empty vo.photo }">
							<img alt="회원이미지" src="/algoo/algoo_images/${vo.photo }"
								height="60px" align="absmiddle">
						</c:if>
					</td>
					<td scope="row">
							<p id="tdName">${vo.username }</p>
							<p id="tdGender">
								<c:if test="${vo.gender=='남자' }">
									<font style="color:#5b75ff">(${vo.gender}</font>/${vo.birth }세)
								</c:if>
								<c:if test="${vo.gender=='여자' }">
									<font style="color:#ff7373">(${vo.gender}</font>/${vo.birth }세)
								</c:if>
							</p>
					</td>
					<td class="align_left">
						<a href="<c:url value='/resume/detail.ag?hisCode=${vo.hisCode }'/>">
							<span>
								<c:if test="${fn:length(vo.title)>20}">
									${fn:substring(vo.title, 0,20)}...
								</c:if>
								<c:if test="${fn:length(vo.title)<=20}">
									${vo.title}
								</c:if>
							</span>
						</a><br>
						<span style="font-size: 0.8em">${vo.category }</span>
					</td>
					<td class="align_left" style="font-size: 0.7em">
							<span>
								<span class="align_right">
									경력 : 
								</span>
								<span class="align_left" style="color: #5b75ff" id="period${i}">
									<c:if test="${empty vo.period }">
										신입
									</c:if>
									<c:if test="${!empty vo.period }">
										<c:if test="${vo.period.indexOf('부터') == -1 }">
											<c:if test="${vo.period.indexOf('일') != -1 }">
												1개월 미만
											</c:if>
											<c:if test="${vo.period.indexOf('일') == -1 }">
												<script type="text/javascript">
													$("#period"+${i}).html($.getPeriod("${fn:substringBefore(vo.period,'월')}","${fn:substringBefore(fn:substringAfter(vo.period ,'~'),'월')}")+"개월");
												</script>
											</c:if>
										</c:if>
										<c:if test="${vo.period.indexOf('부터') != -1 }">
											재직중
										</c:if>
									</c:if>
								</span>
							</span>
							<br>
							<span>
								<span class="align_right">
									자격증 : 
								</span>
								<span class="align_left" style="color: #5b75ff">
									<c:if test="${empty vo.licenseName }">
										${vo.licenseName }
									</c:if>
									<c:if test="${!empty vo.licenseName }">
										${vo.licenseName }
									</c:if>
								</span>
							</span>

					</td>
					<td style="font-size: 0.7em">
						${vo.area }
					</td>
					<td style="font-size: 0.8em">
						<fmt:formatDate value="${vo.regdate }" pattern="MM/dd"/>
					</td>
				</tr>
				<c:set var="i" value="${i+1}"></c:set>
			</c:forEach>
		</c:if>
	</tbody>
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
			<span style="color:blue; font-weight: bold">
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
<div id="naver_id_login"></div>


<script type="text/javascript">
	var naver_id_login = new naver_id_login("auJlpwcbWWsD_1mAuGmP", "http://localhost:9090/algoo/resume/list.ag");
	var state = naver_id_login.getUniqState();
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
</script>

<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
		
		opener.location.href = "/algoo/resume/list.ag";
		self.close();
	}

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>

<%@ include file="../inc/bottom.jsp"%>