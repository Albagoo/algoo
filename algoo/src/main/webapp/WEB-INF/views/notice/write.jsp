<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
<script src="<c:url value='/ckeditor/ckeditor.js'/>" 
type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('content', {uiColor: '#ff8d8b'});
		
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
			<label for="category">구분</label>
			<select id="category" name="category">
				<option value="공지">공지</option>
				<option value="이벤트">이벤트</option>
				<option value="점검">점검</option>
			</select>
		<!-- </div>
        <div class="firstDiv"> -->|
            <label for="title">제목</label>
            <input type="text" id="title" name="title" size="80" />
        <!-- </div>
        <div> -->|
            <label for="writer">작성자</label>
            <input type="text" id="writer" name="writer"/>
        <!-- </div>
        <div>  
        	<label for="content">내용</label> -->
        </div>
        <div>	        
 			<textarea id="content" name="content" 
 			rows="12" cols="40"></textarea>
        </div>
        <div class="editEndDiv" style="text-align:center">
            <input type = "submit" value="등록"
             style="font-weight:bold;background-color:MistyRose"/>
            <input type = "Button" value="공지목록" 
      			onclick
	="location.href='<c:url value="/notice/list.ag"/>'" 
			 style="font-weight:bold;background-color:MistyRose"/>         
        </div>
    </div>
</form>
</div>
</section>

<%@ include file="../inc/bottom.jsp" %> 