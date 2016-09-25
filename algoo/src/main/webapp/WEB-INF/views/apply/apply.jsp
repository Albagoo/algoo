<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>온라인 지원 - algoo</title>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" 
	src="<c:url value='/js/jquery_form.js' />"></script>
<script src="<c:url value='/ckeditor/ckeditor.js'/>"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('memo', {
			uiColor : '#FFFFFF'
		});
		
		$("#bt_apply").click(function(){
			if(confirm("지원 하시겠습니까?")){
				var options = {
					type: "post",
					data : $("#frmApply").serialize(),
					success:function(data){
						if(cnt>0){
							alert("지원성공!");
							self.close();
						}
					}
				};
				$("#frmApply").ajaxSubmit(options);
			}
		});
	});
</script>
</head>
<body>
	<form action="<c:url value='/apply/apply.ag'/>" method="post" id="frmApply">
		<input type="hidden" name="recCode" value="${param.recCode }">
		<input type="hidden" name="userid" value="${param.userid }">
		<h2 style="border-bottom: 3px solid #E70400; padding-bottom: 10px;">지원하기</h2>
		<p>지원하기 전, 마지막으로 고용주에게 보낼 메모를 남겨주세요!</p>
		<textarea cols="5" id="memo" name="memo" 
				    	rows="101" style="width:800px; height:240px; 
				    	margin-left: 30px; margin-top: 10px"></textarea>
		<div style="text-align: center; height: 100px; margin-top: 10px;">
			<input type="button" value="지원하기" id="bt_apply" style="display: inline-block;
					height: 45px; padding: 0 40px 0; font: bold 18px 'Malgun Gothic';
					letter-spacing: -0.1em; vertical-align: top; border: 1px solid #4f585e;
					background: #52575c; color: #fff;">
		</div>
	</form>
</body>
</html>