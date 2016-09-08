<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script src="<c:url value='/ckeditor/ckeditor.js'/>" 
type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('content', {uiColor: '#ffffff'});
		
		$("#frmWrite").submit(function(event){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$("#title").focus();
				event.preventDefault();
			}else if($("#writer").val().length<1){
				alert("이름을 입력하세요");
				$("#writer").focus();
				event.preventDefault();
			}
		});
	});
</script>

<style type="text/css">
	section{
		padding:5px;
		margin:5px;
	}
	.title{
		font-size:24px;
		text-align:left;
	}
</style>

<section>
<div class="divListAll" align="center">
<form name="frmWrite" id="frmWrite" method="post"
  enctype="multipart/form-data" 
  action="<c:url value='/notice/write.ag'/>" >
 <p id="firstTitle">공지등록</p>
 <div class="funcDiv">
		<div class="editCgDiv">
			<select name="category" class="button white small"
        	 style="font-size: 0.75em;">
				<option value="공지">공지</option>
				<option value="이벤트">이벤트</option>
				<option value="점검">점검</option>
			</select>
            <input type="text" id="title" name="title" size="80" />
            <input type="text" id="writer" name="writer"/>
        </div>
        <div>	        
 			<textarea id="content" name="content" 
 			rows="12" cols="40"></textarea>
        </div>
        <div class="editEndDiv" style="text-align:center">
            <input type = "submit" value="등록"
             class="button white medium" />
            <input type = "Button" value="공지목록"
             class="button white medium"
      			onclick
	="location.href='<c:url value="/notice/list.ag"/>'"/>         
        </div>
    </div>
</form>
</div>
</section>

<%@ include file="../inc/bottom.jsp" %> 