<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	#divAgree{
		width:700px;
	}
	#divAgreeFirst{
		text-align: right;
		margin: 10px 0;
	}	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmAgree").submit(function(event){
			if(!$("#chkAgree").is(":checked")){
				alert("약관에 동의하셔야 합니다.");
				$("#chkAgree").focus();
				event.preventDefault();
			}
		});
	});
</script>
    
	<h2>회원약관</h2>
	<iframe src="<c:url value='jj/inc/provision.html'/>" 
		width="700px" height="300px"></iframe>
	
	<div id="divAgree">
		<form name="frmAgree" id="frmAgree" method="post" 
			action="<c:url value='/jj/member/register.do'/>">
			<div id="divAgreeFirst">
				<input type="checkbox" name="chkAgree" 
					id="chkAgree">
				<label for="chkAgree">약관에 동의합니다</label>
			</div> 
			<div class="align_center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>







