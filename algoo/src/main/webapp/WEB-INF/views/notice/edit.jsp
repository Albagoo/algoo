<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<script src="<c:url value='/ckeditor/ckeditor.js'/>" 
type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('content');	
		
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
<div class="divForm" style="width:1024px">
<form name="frmEdit" id="frmEdit" method="post"
  enctype="multipart/form-data" 
  action="<c:url value='/notice/edit.ag'/>" >
  <input type="hidden" name="mainNo" value="${noticeVo.mainNo }">
  
 <fieldset>
	<span class="title">공지 수정</span>
		<div class="cgDiv">
			<label for="category">구분</label>
			<select id="category" name="category">
				<option value="공지"
				 <c:if test="${noticeVo.category=='공지' }">
            		selected
            	</c:if>>공지</option>
				<option value="이벤트"
				 <c:if test="${noticeVo.category=='이벤트' }">
            		selected
            	</c:if>>이벤트</option>
				<option value="점검"
				 <c:if test="${noticeVo.category=='점검' }">
            		selected
            	</c:if>>점검</option>
			</select>
		<!-- </div>
        <div class="firstDiv"> -->|
            <label for="title">제목</label>
            <input type="text" id="title" name="title" size="80" 
             value="${noticeVo.title }"/>
        <!-- </div>
        <div> -->|
            <label for="writer">작성자</label>
            <input type="text" id="writer" name="writer"
             value="${noticeVo.writer }"/>
        	<hr>
        <!-- </div>
        <div>
        	<label for="content">내용</label> -->
        </div>
        <div>	        
 			<textarea id="content" name="content" 
 			rows="12" cols="40"
 			value=${noticeVo.content } 
 			></textarea>
        </div>
        <div class="center" style="text-align:center">
        <hr>
            <input type = "submit" value="수정"/>
            <input type = "Button" value="공지목록" 
      			onclick
	="location.href='<c:url value="/notice/list.ag"/>'" />         
        </div>
    </fieldset>
</form>
</div>
</div>
</section>

<%@ include file="../inc/bottom.jsp" %> 