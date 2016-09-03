<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#grade,#days,#submitBt,input[type="reset"]{
float: left;
}
#submitBt{
clear: both;
margin: 20px 10px 0 40px;
}
input[type="reset"]{
margin: 20px 0 0 10px;

}
</style>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleButton.css'/>" />

<script type="text/javascript"
src= "<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
   $(function() {
	   $("#submitBt").click(function() {
		   if($("#grade").val().length<1){
			   alert("등급을 선택하세요");
			   $("#grade").focus();
			   return false;
		   }else if($("#days").val()==0){
			   alert("기간을 선택하세요");
			   $("#days").focus();
			   return false;
		   }else{
			   var grade=$("#grade option:selected").val();
			   var days=$("#days option:selected").val();
			   $("#grade",opener.document).val(grade);
			   $("#days",opener.document).val(days);
			   self.close();
		   }
			  /*  frmService.action
			   ="<c:url value='/service/serviceWrite.ag'/>";
			   frmService.submit(); */
		   
	   });
});
	 
   
</script>
<div>
<h2>서비스 선택</h2>
   <form method="post" name="frmService" id="frmService"
    action="<c:url value='/service/serviceWrite.ag'/>" >
    <select class="button white" name="grade" id="grade">
               <option value="">등급선택</option>
               <option value="SSS">SSS급</option>
               <option value="SS">SS급</option>
               <option value="S">S급</option>
               <option value="A">A급</option>
               <option value="B">B급</option>
               </select>
    
    <select class="button white" name="days" id="days">
               <option value="0">기간선택</option>
               <option value="1">1일</option>
               <option value="7">7일</option>
               <option value="30"> 30일</option>
               <option value="90">90일</option>
               <option value="180">180일</option>
               </select>
               
    <input class="button white" type="button"
     id="submitBt" value="등록">
    <input class="button white" type="reset" value="취소">
   </form>
</div>