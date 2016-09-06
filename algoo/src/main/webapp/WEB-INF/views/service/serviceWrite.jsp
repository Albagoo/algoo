<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
get방식으로 들어와서
scode 는 int이므로 
scode = 0 초기화

기간,등급 선택후

등록버튼을 누르면
select등급 과 기간을
input 등급 기간에 넣어주고
서브밋한다

insert 한 서비스 코드를
select 하여 serviceVo를 받아 post 방식으로 돌아온다

input에 등급 기간 code를
받아  부모창으로 보내준다
 -->
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
	   
			   var sCode=$("#serviceCode").val();
			   
	
	   if(sCode!=0){
		   var resGrade=$("input[name=grade]").val();
         var resDays = $("input[name=days]").val();
		   
           $("#grade",opener.document).val(resGrade);
           $("#days",opener.document).val(resDays);
           $("#serviceCode",opener.document).val(sCode);
           self.close();
           }
	   
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
			   
			   if(sCode!=0){
			
			   }
							   
			   
			   if(sCode==0){
			   var grade=$("#grade option:selected").val();
			   var days=$("#days option:selected").val();
			   
			   $("input[name=grade]").val(grade);
			   $("input[name=days]").val(days);
			   
			   frmService.action
			   ="<c:url value='/service/serviceWrite.ag'/>";
			   frmService.submit();
			   }
			   
			   
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
    <select class="button white"  id="grade">
               <option value="">등급선택</option>
               <option value="SSS">SSS급</option>
               <option value="SS">SS급</option>
               <option value="S">S급</option>
               <option value="A">A급</option>
               <option value="B">B급</option>
               </select>
    
    <select class="button white"  id="days">
               <option value="0">기간선택</option>
               <option value="1">1일</option>
               <option value="7">7일</option>
               <option value="30"> 30일</option>
               <option value="90">90일</option>
               <option value="180">180일</option>
               </select>
     <c:if test="${!empty serviceVo.serviceCode }">
     <c:set var="sCode" value="${serviceVo.serviceCode }">
     </c:set>
     </c:if>
     
     <c:if test="${empty serviceVo.serviceCode }">
     <c:set var="sCode" value="0">
     </c:set>
     </c:if>
     
                 
    <input type="hidden" name="serviceCode"
     id="serviceCode" value="${sCode }">
    <input type="hidden" name="grade"
     value="${serviceVo.grade }"> 
    <input type="hidden" name="days"
     value="${serviceVo.days }"> 
    <input class="button white" type="button"
     id="submitBt" value="등록">
    <input class="button white" type="reset" value="취소">
   </form>
</div>