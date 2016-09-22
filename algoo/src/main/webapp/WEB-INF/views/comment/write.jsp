<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(document).ready(function(){
	
		$("#cmtWrite").submit(function(event){
			if($("#content").val().length<1){
				alert("댓글을 입력하세요");
				$("#content").focus();
				event.preventDefault();
			}
		});
	});
</script>
<div class="cmtWrite">
<form name="cmtWrite" id="cmtWrite" method="post" 
  action="<c:url value='/comment/write.ag'/>" >
<input type="hidden" id="userid" name="userid" value="${sessionScope.userid }">
<input type="hidden" id="nickName" name="nickName" value="${sessionScope.nickName }">
<input type="hidden" id="freeNo" name="freeNo" value="${param.freeNo }">
	<div class="cmtWrite" style="padding-left:30px;">    
		<div>
			<textarea id="content" name="content" 
				style="width: 83%;height: 60px;margin-right: 15px;vertical-align: middle;">
			</textarea>
			<span>
			<input class="button white" type = "submit" value="등록" 
				style="height: 68px;text-align: left;"/>
			</span>
		</div>
	</div>
</form>
</div>