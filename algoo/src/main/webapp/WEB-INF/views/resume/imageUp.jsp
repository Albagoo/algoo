<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>algoo - 사진 업로드</title>
</head>
<body>
	<form action="" method="post" enctype="multipart/form-data">
		<div style="padding: 20px, 28px, 20px, 28px;">
			<div style="height: 35px; border-bottom: 4px solid #666;">
				<h3>사진 올리기</h3>
			</div>
		</div>
		<div style="padding: 18px 0 24px 2px;">
			<ul style="list-style: none; margin: 0">
				<li style="list-style: none; padding: 2px 0 2px 7px;">
				4MB이내의 gif, jpg, jpeg, png 이미지 파일로 등록해 주세요
				</li>
			</ul>
		</div>
		<div style="background-color: #f7f7f7; padding: 25px; overflow: hidden;">
			<img alt="image1" src="<c:url value='/images/imageUp1.PNG'/>"
				style="float: left;">
			<dl style="float: left;">
				<dd><img alt="image2" src="<c:url value='/images/imageUp2.PNG'/>"></dd>
				<dd><input type="file"></dd>
			</dl>
		</div>
		<div style="text-align: center; clear: both">
			<input type="image" src="<c:url value='/images/imageUp3.PNG'/>"
				style="margin-top: 10px;">
		</div>
	</form>
</body>
</html>