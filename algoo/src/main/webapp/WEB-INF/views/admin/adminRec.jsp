<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="menu/recManagement.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
 <script type="text/javascript">
	$(document).ready(function(){
		//게시글 출력개수		
		$("#num").change(function(){
			var ncount=$("#num").val();
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
		
		//선택한 글 삭제
		$("#btNoticeDel").click(function(){
			var count
			=$(".noticeBody input[type=checkbox]:checked").length;
			
			if(count==0){
				alert("삭제할 공지사항을 먼저 선택하세요");
				return false;
			}
			
			frmNList.action="<c:url value='/admin/selectRecDelete.ag'/>";
			frmNList.submit();
		});
		
		$("#btFaqDel").click(function(){
			var count
			=$(".faqBody input[type=checkbox]:checked").length;
			
			if(count==0){
				alert("삭제할 Rec를 먼저 선택하세요");
				return false;
			}
			
			frmFList.action="<c:url value='/admin/selectRecDelete.ag'/>";
			frmFList.submit();
		});
		
		$("#btFreeDel").click(function(){
			var count
			=$(".freeBody input[type=checkbox]:checked").length;
			
			if(count==0){
				alert("삭제할 게시글을 먼저 선택하세요");
				return false;
			}
			
			frmTList.action="<c:url value='/admin/selectRecDelete.ag'/>";
			frmTList.submit();
		}); 
	});
	
	function delNotice(nNo){
		if(confirm("슈퍼채용을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/rec/recAdminDelete.ag?recCode="+nNo+"'/>"
		}
	}
	
	function delFaq(fNo){
		if(confirm("그랜드채용을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/rec/recAdminDelete.ag?recCode="+fNo+"'/>"
		}
	}
	
	function delFree(tNo){
		if(confirm("스페셜채용을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/rec/recAdminDelete.ag?recCode="+tNo+"'/>"
		}
	}
	
	function delFaq2(fNo){
		if(confirm("스피드채용을 삭제하시겠습니까?")){
			location.href
		="<c:url value='/rec/recAdminDelete.ag?recCode="+fNo+"'/>"
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
		text-align: center;
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
<div class="adminList">
	<div class="boardPrint">
		<form action="<c:url value='/admin/adminRec.ag'/> " method="post" id="frmCount">	
			<span>게시글
			<select id="num" name="num" >
			<option   
			<c:if test="${param.nco==5}">
			selected="selected"
         </c:if> 			
			value="5">5</option>
			<option
			<c:if test="${param.nco==7}">
         selected="selected"
         </c:if>        
			 value="7">7</option>
			<option
			<c:if test="${param.nco==10}">
         selected="selected"
         </c:if>        
			 value="10">10</option>
			<option
			<c:if test="${param.nco==13}">
         selected="selected"
         </c:if>        
			 value="13">13</option>
			<option
			<c:if test="${param.nco==15}">
         selected="selected"
         </c:if>        
			 value="15">15</option>
			</select>
			  
			<%-- (<input type="text" id="num" name="num" value="${param.nco}">)개 보기&nbsp;
			<input type="button" value="확인" id="btNco" name="btNco" class="button white medium"> --%>
			<input type="hidden" name="nco" value="${param.nco }"></span>
		</form>
	</div>
	
	<form name="frmNList" method="post" action="<c:url value='/admin/adminRec.ag'/>" >
	<div class="adminNotice">
		<span><img alt="슈퍼" src="<c:url value='/images/super.jpg'/>"
		style="width: 75px; height: 40px;"></span>
	<span class="talkList">
			<%-- <a href="<c:url value='/notice/list.ag'/>">
			<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle>
				공지사항 목록으로</a> --%>
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
						<c:set var="print" value="5" />
					</c:if>
					<c:if test="${param.nco!=null && param.nco!=0 && !empty param.nco}">
						<c:set var="print" value="${param.nco }" />
					</c:if>
					<c:set var="i" value="0" />
					<c:forEach var="nVo" items="${nlist }" end="${print-1}">
						<tr>
							<td>
								<input type="checkbox" name="rec1List[${i}].recNo"
							id="chk_${i }" value="${nVo.recCode}" >
							</td>
							<td style="text-align: left;padding-left: 10px;">
								<a href="<c:url value='/rec/recDetail.ag?recCode=${nVo.recCode}'/>">
								[${nVo.compName }]<br> 
								<c:if test="${fn:length(nVo.title)>30}">
									${fn:substring(nVo.title, 0,30)}...
								</c:if>
								<c:if test="${fn:length(nVo.title)<=30}">
									${nVo.title }
								</c:if> </a>
							 </td>
							<td>
								<fmt:formatDate value="${nVo.regdate }" pattern="yyyy-MM-dd" /> 
							</td>
							<td><a href="<c:url value='/rec/recEdit.ag?recCode=${nVo.recCode}'/>" >수정</a></td>
							<td><a href="#" onclick="delNotice(${nVo.recCode})">삭제</a></td>
						</tr>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="margin: 10px 0 0 3px;text-align: right;">
			<input type="button" id="btNoticeDel" value="선택한 슈퍼채용 삭제" class="button white medium">   
		</div>
	</div>
	</form>
	
	<form name="frmFList" method="post" action="<c:url value='/admin/adminRec.ag'/>" >
	
	<div class="adminFaq">
		<span><img alt="그랜드" src="<c:url value='/images/grand.jpg'/>"
		style="width: 75px; height: 40px;"></span>
		<span class="talkList">
			<%-- <a href="<c:url value='/faq/faqList.ag'/>">
			<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle>
				FAQ 목록으로</a> --%>
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
				<tbody class="faqBody">
					<c:set var="j" value="0" />
					<c:forEach var="fVo" items="${flist }" end="${print-1}">
						<tr>
							<td>
								<input type="checkbox" name="rec2List[${j}].recNo"
									id="chk2_${j }" value="${fVo.recCode}" >
							</td>
							<td style="text-align: left;padding-left: 10px;">
								<a href="<c:url value='/rec/recDetail.ag?recCode=${fVo.recCode}'/>">
								[${fVo.compName }]<br>
								<c:if test="${fn:length(fVo.title)>30}">
									${fn:substring(fVo.title, 0,30)}...
								</c:if>
								<c:if test="${fn:length(fVo.title)<=30}">
									${fVo.title }
								</c:if>	 </a>
							 </td>
							<td>
								<fmt:formatDate value="${fVo.regdate }" pattern="yyyy-MM-dd" /> 
							</td>
							<td><a href="<c:url value='/Rec/RecEdit.ag?recCode=${fVo.recCode}'/>" >수정</a></td>
							<td><a href="#" onclick="delFaq(${fVo.recCode})">삭제</a></td>
						</tr>
					<c:set var="j" value="${j+1}" />
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="margin: 10px 3px 0 0; text-align: right;">
			<!-- 선택글 삭제-->
			<input type="button" id="btFaqDel" value="선택한 그랜드채용 삭제" class="button white medium">  
		</div>
	</div>
	</form>
	
	<form name="frmTList" method="post" action="<c:url value='/admin/adminRec.ag'/>" >
	<div class="adminFree">
		<span><img alt="스페셜" src="<c:url value='/images/special.jpg'/>"
		style="width: 75px; height: 40px;"></span>
		<span class="talkList">
			<%-- <a href="<c:url value='/freeboard/list.ag'/>">
			<img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle>
				알바톡톡 목록으로</a> --%>
		</span>
		<div>
			<table style="width: 100%;" class="box2">
				<colgroup>
					<col style="width:5%;" /> <!-- 체크박스 -->
               <col style="width:60%;" /> <!-- 제목 -->
               <col style="width:15%;" /> <!-- 등록일 -->
               <col style="width:15%;" /> <!-- 수정 -->
               <col style="width:15%;" /> <!-- 삭제 -->
				</colgroup>
				<thead>
					<th scope="col"><input type="checkbox" name="chkAllFree"></th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</thead>
				<tbody class="freeBody">
					<c:set var="k" value="0" />
					<c:forEach var="tVo" items="${tlist }" end="${print-1}">
						<tr>
							<td>
								<input type="checkbox" name="rec3List[${k}].recNo"
									id="chk3_${k }" value="${tVo.recCode}" >
							</td>
							
							<td style="text-align: left; padding-left: 10px;">
								<!-- 삭제된 글에 대한 처리 -->
								<%-- <c:if test="${tVo.delYn=='Y'}">
									<span style="color:gray">
										삭제된 글입니다</span>
								</c:if>
								<c:if test="${tVo.delYn!='Y' }"> --%>
								<!-- 답변의 경우 화살표 이미지 보여주기 -->
									<%-- <c:if test="${tVo.step>0 }">
										<c:forEach var="i" 
											begin="1" end="${tVo.step}">
											&nbsp;&nbsp;
										</c:forEach>
										<img src
										="<c:url value='/images/re2.png' />" alt="re이미지"
											 align=absmiddle id="reply">
									</c:if> --%>
									<!-- 제목이 긴 경우 일부만 보여주기 -->
									<a href="<c:url value='/rec/recDetail.ag?recCode=${tVo.recCode}'/>">
									   ${tVo.compName }<br>
										<c:if test="${fn:length(tVo.title)>30}">
											${fn:substring(tVo.title, 0,30)}...
										</c:if>
										<c:if test="${fn:length(tVo.title)<=30}">
											${tVo.title}
										</c:if>	
									</a>
									<%-- <c:if test="${tVo.delYn!='Y'}">
										(${tVo.count})
									</c:if> --%>
									<!-- new 이미지 -->
									<%-- <c:if test="${tVo.newImgTerm<24}">
										<img src="<c:url value='/images/new5.png'/>" alt="new 이미지" 
											style="height: 14px;" align=absmiddle >
									</c:if> --%>
								<%-- </c:if> --%>
							</td>
							<%-- <td>
								${tVo.nickName }
							</td> --%>
							<%-- <td>
								${tVo.readCount }
							</td> --%> 
							<td>
								<fmt:formatDate value="${tVo.regdate }" pattern="yyyy-MM-dd" /> 
							</td>
							<td>
								<a href="<c:url value='/rec/recEdit.ag?recCode=${tVo.recCode}'/>" >수정</a>
							</td>
							<td>
								<a href="#" onclick="delFree(${tVo.recCode})">삭제</a>
							</td>
						</tr>
						<c:set var="k" value="${k+1 }" />
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="margin: 10px 0 20px 3px;text-align: right;">
			<input type="button" id="btFreeDel" value="선택한 스페셜채용 삭제" class="button white medium">  
		</div>
	</div>
	</form>
</div>
</div>

   
   <div class="adminFaq">
      <span><img alt="스피드" src="<c:url value='/images/speed.jpg'/>" 
      style="width: 75px; height: 40px;"></span>
      <span class="talkList">
         <%-- <a href="<c:url value='/faq/faqList.ag'/>">
         <img alt="손가락" src="<c:url value='/images/finger.png'/>" align=absmiddle>
            FAQ 목록으로</a> --%>
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
            <tbody class="faqBody">
               <c:set var="j" value="0" />
               <c:forEach var="sVo" items="${slist }" end="${print-1}">
                  <tr>
                     <td>
                        <input type="checkbox" name="rec4List[${j}].recNo"
                           id="chk2_${j }" value="${sVo.recCode}" >
                     </td>
                     <td style="text-align: left;padding-left: 10px;">
                        <a href="<c:url value='/rec/recDetail.ag?recCode=${sVo.recCode}'/>">
                        [${sVo.compName }]<br>
                        <c:if test="${fn:length(sVo.title)>30}">
                           ${fn:substring(sVo.title, 0,30)}...
                        </c:if>
                        <c:if test="${fn:length(sVo.title)<=30}">
                           ${sVo.title }
                        </c:if>   </a>
                      </td>
                     <td>
                        <fmt:formatDate value="${sVo.regdate }" pattern="yyyy-MM-dd" /> 
                     </td>
                     <td><a href="<c:url value='/rec/recEdit.ag?recCode=${sVo.recCode}'/>" >수정</a></td>
                     <td><a href="#" onclick="delFaq2(${sVo.recCode})">삭제</a></td>
                  </tr>
               <c:set var="j" value="${j+1}" />
            </c:forEach>
            </tbody>
         </table>
      </div>
      <div style="margin: 10px 3px 0 0; text-align: right;">
         <!-- 선택글 삭제-->
         <input type="button" id="btFaqDel" value="선택한 스피드채용 삭제" class="button white medium">  
      </div>
   </div>
   </form>
   


</section>

<%@ include file="../inc/admin_bottom.jsp" %>