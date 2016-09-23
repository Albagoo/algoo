<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>algoo - 사진 업로드</title>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmImage").submit(function(){
			var imageFile = $("#imageUpfile").val().split(".");
			if(!(imageFile[1] == "jpg" || imageFile[1] == "png"
					|| imageFile[1] == "gif" || imageFile[1] == "jpeg"
					|| imageFile[1] == "JPG" || imageFile[1] == "PNG"
					|| imageFile[1] == "JPEG" || imageFile[1] == "GIF")){
				alert("사진 파일은 jpg, png, gif, jpeg 파일만 가능합니다!!!");
				return false;
			}
		});
		
		$("#imageUp").click(function(){
			var formData = new FormData($('#frmImage')[0]);
			
			$.ajax({
				 url: "<c:url value='/resume/imageUp2.ag'/>",
				 processData: false,
				 contentType: false,
				 data: formData,
				 type: 'POST',
				 success: function(str){
					 if(str==1){
					 	alert("사진 등록 되었습니다!!");
						self.close();
						opener.location.href="<c:url value='/resume/write.ag'/>";
					}else{
						alert("사진 등록 실패!!");
					}
				 },
				 error: function(xhr, status, error){
						alert(status + " : " + error);
				}
			});
		});
	});
</script>
</head>
<body>
	<form action="#" method="post" enctype="multipart/form-data"
		name="frmImage" id="frmImage">
		<input type="hidden" name="memberCode" value="${param.memberCode }">
		<input type="hidden" name="photo" value="${param.photo }">
		<div style="padding: 20px, 28px, 20px, 28px;">
			<div style="height: 35px; border-bottom: 4px solid #666;">
				<h3>사진 올리기</h3>
			</div>
		</div>
		<div style="padding: 18px 0 24px 2px;">
			<ul style="list-style: none; margin: 0">
				<li style="list-style: none; padding: 2px 0 2px 7px;">
					4MB이내의 gif, jpg, jpeg, png 이미지 파일로 등록 가능합니다!
				</li>
			</ul>
		</div>
		<div style="background-color: #f7f7f7; padding: 25px; overflow: hidden;">
			<img alt="image1" src="<c:url value='/images/imageUp1.PNG'/>"
				style="float: left;">
			<dl style="float: left;">
				<dd><img alt="image2" src="<c:url value='/images/imageUp2.PNG'/>"></dd>
				<dd><input type="file" name="imageUpfile" id="imageUpfile"></dd>
			</dl>
		</div>
		<div style="text-align: center; clear: both">
			<img src="<c:url value='/images/imageUp3.PNG'/>"
				style="margin-top: 10px;" id="imageUp">
		</div>
	</form>
</body>
</html>