<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript">
	$(document).ready(function(){
		$("input[type='text']").addClass("textBox");
		
		$("#bt_id").click(function(){
			$.ajax({
				url:"<c:url value='/member/findIdDb.ag'/>",
				type:"post",
				data:$("#frmId").serialize(),
				success:function(userid){
					if(userid != null && userid != ""){
						$("#result_id").html("회원님의 아이디는 <span style='font-weight: bold; color: blue'>"+
								userid+"</span> 입니다.");
					}else{
						$("#result_id").html("입력하신 정보와 일치하는 아이디가 없습니다!!");
					}
				},
				error: function(xhr,status, error){
					alert(status + " : " + error);	// AJAX 호출 에러
				}
			});
		});
		
		$("#email2").change(function(){
			if($(this).val() == "etc"){
				$("#email3").css("visibility", "visible");
				$("#email3").focus();
				$("#email3").val();
			}else{
				$("#email3").css("visibility", "hidden");
			}	
		});
	});
</script>
<span style="margin: 0 0 0 15px;
		    font-size: 40px;
		    font-family:  '맑은고딕', 'Malgun Gothic',Dotum, 돋움, sans-serif;
		    color: #494949;
		    letter-spacing: -2px;
		    vertical-align: bottom;
		    font-weight: bold">아이디 / 비밀번호 찾기</span>
<div style="overflow: hidden; margin-bottom: 50px;">
	<div style="overflow: hidden; margin-top: 30px">
		<div style="padding: 20px;
				    float: left;
				    width: 42%;
				    margin-left: 20px;
				    margin-right: 20px;
				    border: 1px solid #e6e6e6;
				    height: 350px;">
			<form action="/member/findIdDb.ag" method="post" name="frmId" id="frmId">
				<fieldset>
					<h2 style="font-size: 16px;
							    color: #222;
							    font-weight: bold;
							    padding-bottom: 20px;">아이디 찾기</h2>
					<p style="color: #787878;
   								 height: 30px;">회원가입시 등록한 휴대폰 번호와 이름을 입력해 주세요</p>
   					<table>
   						<tr>
   							<td style="padding: 10px"><label for="userName">이름</label></td>
   							<td style="padding: 10px"><input type="text" id="userName" name="userName"
   							maxlength="15"></td>
   						</tr>
   						<tr>
   							<td style="padding: 10px"><label for="hp">휴대폰 번호</label></td>
   							<td style="padding: 10px"><input type="text" id="hp1" name="hp1" style="width: 50px"
   							maxlength="3">
		   					<input type="text" id="hp2" name="hp2" style="width: 50px"
		   					maxlength="4">
		   					<input type="text" id="hp3" name="hp3" style="width: 50px"
		   					maxlength="4"></td>
   						</tr>
   					</table>
   					<p id="result_id" style="padding: 5px; margin-top: 15px">
   					
   					</p>
   					<p style="text-align: center; margin: 0 0 10px 0; padding: 30px 0 50px 0;">
   					<input type="button" value="아이디 찾기" id="bt_id"
   						style="width: 100px; height: 40px; background: #494949;
   							color: white" class="textBox">
   					</p>
				</fieldset>
			</form></div>
		<div style="padding: 20px;
				    float: left;
				    width: 42%;
				    height: 350px;
				    border: 1px solid #e6e6e6;">
			<form action="" method="post">
				<fieldset>
					<h2 style="font-size: 16px;
							    color: #222;
							    font-weight: bold;
							    padding-bottom: 20px;">비밀번호 찾기</h2>
					<p style="color: #787878;
   								 height: 30px;">회원정보에 등록된 e-메일, 이름으로
							아이디를 찾을 수 있습니다.</p>
					<table>
   						<tr>
   							<td style="padding: 10px; width: 70px;"><label for="userName">아이디</label></td>
   							<td style="padding: 10px"><input type="text" id="userId" name="userId"
   							maxlength="15"></td>
   						</tr>
   						<tr>
   							<td style="padding: 10px;"><label for="userName">이름</label></td>
   							<td style="padding: 10px"><input type="text" id="userName" name="userName"
   							maxlength="15"></td>
   						</tr>
   						<tr>
   							<td style="padding: 10px"><label for="hp">이메일</label></td>
   							<td style="padding: 10px">
   							<input type="text" id="email1" name="email1" style="width: 100px"
   								>@
		   					<select name="email2" id="email2"  title="이메일주소 뒷자리"
					        	onchange="emailCheck()" class="textBox">
					            <option value="naver.com">naver.com</option>
					            <option value="hanmail.net">hanmail.net</option>
					            <option value="nate.com">nate.com</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="etc">직접입력</option>
					        </select>
		   					<input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        						style="visibility:hidden"></td>
   						</tr>
   					</table>
   					<p style="text-align: center; margin: 0 0 10px 0; padding: 30px 0 50px 0;">
   					<input type="submit" value="비밀번호 찾기" class="textBox"
   						style="width: 100px; height: 40px; background: #494949;
   							color: white">
					</p>	    
				</fieldset>
			</form></div>
	</div>
</div>


<%@ include file="../inc/bottom.jsp"%>