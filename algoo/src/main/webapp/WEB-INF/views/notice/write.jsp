<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<script type="text/javascript" 
src="<c:url value='/jquery/jquery-3.1.0.min.js' />"></script>
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
<title>공지사항 등록</title>
</head>
<body>
<div class="divForm" style="width:1024px">
<form name="frmWrite" id="frmWrite" method="post"
  enctype="multipart/form-data" 
  action="<c:url value='/notice/write.ag'/>" >
 <fieldset>
	<legend>공지등록</legend>
		<div class="cgDiv">
			<label for="category">구분</label>
			<select id="category" name="category">
				<option value="공지">공지</option>
				<option value="이벤트">이벤트</option>
				<option value="점검">점검</option>
			</select>
		</div>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title"  />
        </div>
        <div>
            <label for="writer">작성자</label>
            <input type="text" id="writer" name="writer" />
        </div>
        <div>  
        	<label for="content">내용</label>
        </div>
        <div>	        
 			<textarea id="content" name="content" 
 			rows="12" cols="40"></textarea>
        </div>
        <div class="center" style="text-align:center">
            <input type = "submit" value="등록"/>
            <input type = "Button" value="공지목록" 
      			onclick
	="location.href='<c:url value="/notice/list.ag"/>'" />         
        </div>
    </fieldset>
</form>
</div>
</body>
</html>