<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/simpleButton.css'/>" />
<style type="text/css">
	.title{
		margin-left: 10px;
		font-size: 1.2em;
		font-weight: bold;
	}
	
	.hope{
		padding: 5px;
		font-size: 0.8em;
		text-align: center;
	}
	
	.hope_table{
		height: 75px; 
		width: 100%;
	}
	
	.hope_title{
		text-align: center;
		font-size: 0.9em;
		color: rgb(130, 130, 130);
	}
	
	#box{
		margin-top: 10px;
		width: 100%;
		margin-bottom: 20px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[type='text']").addClass("textBox");	
	});
</script>
	<div style="width: 700px; height: 70px; border: 3px solid black;
		text-align: center;" >
		<h2 style="margin-top: 10px; font-weight: bold; font-size: 2em">${resumeVo.title }</h2>
	</div>
	<div style="width: 672px; border: 1px solid silver; overflow: hidden;
		padding: 15px">
		<div style="float: right; padding: 5px 15px 5px 5px;">
			<div style="border: 1px solid silver; width: 170px;
				font-size: 0.8em; text-align: center; padding: 5px;">
				연락 가능 시간 : <span style="color: skyblue; font-weight: bold">${resumeVo.contatctHour }</span>
			</div>
		</div>
		<div style="clear: both">
			<table>
				<tr id="tr">
					<td style="text-align: center; padding: 10px; width: 20%">
						<c:if test="${empty memberVo.photo }">
							<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>">
						</c:if>
						<c:if test="${!empty memberVo.photo }">
							<img alt="회원이미지" src="/algoo/algoo_images/${memberVo.photo }"
							width="130" height="150">
						</c:if><br>
					</td>
					<td style="width: 80%">
						<table style="float: left; width: 60%">
							<tr>
								<td id="td1" style="width: 20%; padding-left: 0;font-weight: bold;">이름</td>
								<td id="td2" style="padding: 5px">
								<input type="text" value="${memberVo.userName }" readonly></td>
							</tr>
							<tr>
								<td id="td1" style="width: 20%; padding-left: 0;font-weight: bold;">휴대폰</td>
								<td id="td2" style="padding: 5px">
								<input type="text" 
								value="${memberVo.hp1 }-${memberVo.hp2 }-${memberVo.hp3 }" readonly></td>
							</tr>
							<tr>
								<td id="td1" style="width: 20%; padding-left: 0;font-weight: bold;;">e-메일</td>
								<td id="td2" style="padding: 5px">
								<input type="text" style="width: 70%"
								value="${memberVo.email1 }@${memberVo.email2}" readonly></td>
							</tr>
							<tr>
								<td id="td1" style="width: 20%; padding-left: 0;font-weight: bold;;">주소</td>
								<td id="td2" style="padding: 5px">
								<input type="text" style="width: 180%" 
								value="${memberVo.address } ${memberVo.addressDetail}" readonly></td>
								</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		
		<span class="title">희망근무조건</span>
		<table id="box">
			<tr style="border-top: 2px solid black">
				<td>
					<table class="hope_table">
						<tr>
							<td class="hope_title">근무기간 / 요일 / 시간</td>
						</tr>
						<tr>
							<td class="hope">${hopeVo.day }</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="hope_table">
						<tr>
							<td class="hope_title">근무형태</td>
						</tr>
						<tr>
							<td class="hope">${hopeVo.type }</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="hope_table">
						<tr>
							<td class="hope_title">희망급여</td>
						</tr>
						<tr>
							<td class="hope">${hopeVo.pay }</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="border-bottom: 1px solid silver; border-top: 1px solid silver;">
				<td colspan="3">
					<table class="hope_table">
						<colgroup>
							<col width="15%">
							<col width="85%">
						</colgroup>
						<tr>
							<td class="hope_title" style="text-align: right">희망지역</td>
							<td class="hope" style="text-align: left"><span style="margin-left: 10px">${hopeVo.area }</span></td>
						</tr>
						<tr>
							<td class="hope_title" style="text-align: right">희망직종</td>
							<td class="hope" style="text-align: left"><span style="margin-left: 10px">${hopeVo.category }</span></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		<span class="title">경력</span>
		<table id="box">
			<tr style="border-top: 2px solid black">
				<td></td>
				<td></td>
			</tr>
		</table>
		
	</div>
<%@ include file="../inc/bottom.jsp"%>