<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/simpleButton.css" />

<script src="<c:url value='/ckeditor/ckeditor.js'/>" 
type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('content', {uiColor: '#ffffff'});
		
		$("#frmWrite").submit(function(event){
			var instance = CKEDITOR.instances.content;
			instance.updateElement();
			
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$("#title").focus();
				event.preventDefault();
			}else if(instance.getData()==""){
				alert("공지를 입력하세요");
				$("#content").focus();
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
 <div class="divForm">
		<div class="editCgDiv">
			<select name="category" class="button white small"
        	 style="font-size: 0.85em;">
				<option value="공지">공지</option>
				<option value="이벤트">이벤트</option>
				<option value="서비스">서비스</option>
			</select>
            <input type="text" id="title" class="textBox"
             name="title" size="80" placeholder="제목을 입력하세요" style="font-size: 0.85em;"/>
        </div>
        <div>	        
 			<textarea id="content" name="content" rows="12" cols="40"></textarea>
        </div>
        <div class="editEndDiv" style="text-align:center">
            <input type = "submit" value="등록"
             class="button white medium" />
            <input type = "Button" value="목록"
             class="button white medium"
      			onclick
	="location.href='<c:url value="/notice/list.ag"/>'"/>         
        </div>
    </div>
</form>
</div>
</section>

<%@ include file="../inc/simple_bottom.jsp" %> 