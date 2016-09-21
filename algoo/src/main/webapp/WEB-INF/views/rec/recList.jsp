<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>"
   type="text/css">
<script src="<c:url value='/jquery/jquery-ui.js'/>"
   type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href=
"<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href=
"<c:url value='/css/recLayout.css'/>" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/simpleButton.css'/>" />

 <style>
  
  </style>

<script type="text/javascript">  
$(document).ready(function(){
     //임시 
	  /* runEffect("#effect"); */
      
    
      
      // run the currently selected effect
       function runEffect(effect) {
         // get effect type from
         var selectedEffect = $( "#effectTypes" ).val();
         // Most effect types need no options passed by default
         var options = {};
         // some effects have required parameters
         if ( selectedEffect === "scale" ) {
           options = { percent: 50 };
         } else if ( selectedEffect === "size" ) {
           options = { to: { width: 200, height: 60 } };
         }
    
         // Run the effect
         $( effect ).toggle( selectedEffect, options, 500 );
       };
    
       // Set effect from select menu value
       $( "#button" ).on( "click", function() {
         runEffect("#effect");
       });
       $( "#button2" ).on( "click", function() {
         runEffect("#effect2");
       });
      
      
      $(".divList .box2 tbody tr")
      .hover(function(){
         $(this).css("background","eee").css("cursor","pointer");
      }, function(){
         $(this).css("background","");
      });
     
      //업직종 탭형식으로 보여주기
      $( "#jobTabs" ).tabs({});
      //업종카테코리 셋팅  (외식음료, 유통판매, ...) 
      $.ajax({
         url:"<c:url value='/json/Job2.json'/>",
         data:"GET",
         dataType:"json",
         success : function(res) {
             for(var i=0;i<10;i++){
             var Jno="J0"+(i+1);
             var Jobno="#job-"+i;
             job2Set(res,Jno,Jobno);
             }
             for(var i=9;i<13;i++){
              Jno="J"+(i+1);
              Jobno="#job-"+i;
             job2Set(res,Jno,Jobno);
             }
          },
          error : function(xhr,statust, error) {
          alert(status + ":"+ error);
          }
       });//ajax
      
	    //업종상세카테고리 셋팅 -2 ( 일반음식점, 레스토랑 ....)
	     function job2Set(res,code,tag) {
	        /* var tempJob=""; */
	        var resultJob="";
	        var firsts="";
	        $.each(res.DATA,function() {
	              if(this.JOB_CODE==code){
	                 firsts=this.JOB_FIRST;
	                 resultJob+="<div> <a href='#'"+
	                 "onclick='asdf(this)' title="+
	                 this.JOB_SECOND+">"+ 
	                 this.JOB_SECOND.replace("전체",firsts+" 전체")
	                 +"</a> </div>";
	              }//if
	             
	        });//for
	          $(tag).html(resultJob);
	      }//func     
   
    
  
      
//지역구 셋팅  (서울,인천,경기..) 탭형식 보여주기
      $( "#tabs" ).tabs();
//지역구 셋팅  지역(서울,인천,경기..)
      $.ajax({
          url:"<c:url value='/json/areas.json'/>",
          data:"GET",
          dataType:"json",
          success : function(res) {
              for(var i=0;i<18;i++){
              var SIno="SI"+i;
              var IdSIno="#SI"+i;
              areaSet(res,SIno,IdSIno);
              }
           },
           error : function(xhr,statust, error) {
           alert(status + ":"+ error);
           }
       });//ajax  
});//jquery
   
   //3 선택한 직종 넣기      
   var selectJob=" ";
   var maxjobLimit=0;
   var jobTemp=""
   function asdf(aa) {
   
   if(maxjobLimit<5){
	   
     var JobName =$(aa).text();
     /* alert(JobName); */
     if(jobTemp==JobName){
         return;
      }
     jobTemp=$(aa).text();
     //상세카테고리가 전체인경우 카테코리명도 포함
     var JobName2=JobName.replace("전체","");
     /* alert(JobName2); */
     selectJob=$("#test2").html()+"  <label name='jobs'"+
     " onclick='removeJobs(this)' for="+JobName+
     ">"+JobName+"<input type='button' title='"+JobName+
     " 제거 'id='"+ JobName2 +"'value='x'>"+"</label>";
     
     selectJob
      =selectJob.replace("직종을 선택하세요 (최대 5개 직종 선택가능)","　");
     //사용자에게 보여지는 값
     $("#test2").html(selectJob);
     //실제 들어가는 값
      selectJob2=$("input[name=jobs]").val()+JobName2+",";
     $("input[name=jobs]").val(selectJob2);
     /* alert(selectJob2); */
     maxjobLimit+=1;
   }else{
      alert("5개 까지만 선택가능합니다");
   }
  }
   
   
   
 //탭에 시도에 해당하는 구군 뿌려주기(서울-광진구, 강동구...) -2
   function areaSet(res,areaCode,gutab) {
      var guTemp="";
      var guRes="";
         $.each(res.DATA,function() {
              if(guTemp!=this.GU){
               if(this.CODE==areaCode){
            	   guRes+="<div><a href='#' onclick='GU(this)'>"+
                  this.GU +"</a></div>";
               }//if
              }//if 
              //중복제거용
              guTemp=this.GU;
         });//for
           $(gutab).html(guRes);
    }//func
    
  //선택한 구이름 가져오기 -3    
   var guName=""; 
    function GU(guAtag){
      guName =$(guAtag).text();
      $(function() {
         test(guName);
      });
    }
    
    //선택한 구군에 해당하는 동읍면 뿌려주기(광진구-광장동,구의동...)
    function test(guName) {
      //선택한 지역 표시
        $.ajax({
           url:"<c:url value='/json/areas.json'/>",
              data:"GET",
              dataType:"json",
              success : function(res) {
                    for(var i=0;i<18;i++){
                         var GUno="#GU"+i;
                         dongSet(res,guName,GUno,abc);
                         }
              },
              error : function(xhr,statust, error) {
                  alert(status + ":"+ error);
              }
        });//ajax
       }//func
    
    //동읍면 셋팅-1
    function dongSet(res,code,dongTab,SI) {
           dongRes="";
           $.each(res.DATA,function() {
                 if(this.GU==code&&this.SI==SI){
                	 dongRes+="<div><a href='#' onclick='dong(this)'>"+
                    this.DONG
                    +"</a></div>";
                  }
           });//for
             $(dongTab).html(dongRes);
      }//func

   //선택한 지역 넣기     
    var selectArea=" ";
    var maxLimit=0;
    var aeraTemp="";
   function dong(aa) {
    if(maxLimit<5){
      var areaName =$(aa).text();
    /*   alert("areaName="+areaName+",aeraTemp="+aeraTemp); */
    	if(aeraTemp==areaName){
    		/* alert("a"); */
    		return;
    	}
    	//사용자에게 보여지는 값
    	aeraTemp=$(aa).text();
      selectArea=$("#test").html()+"  <label name='areas'"+
      " onclick='removeArea(this)' for="+areaName+
      ">"+areaName+"<input type='button' title='"+areaName+
      " 제거' id='"+areaName+"' value='x'>"+"</label>";
      selectArea=selectArea.replace("지역을 선택하세요 (최대 5개 지역 선택가능)","　");
      $("#test").html(selectArea);
      //실제 들어가는 값
      selectArea2=$("input[name=areas]").val()+areaName+",";
      $("input[name=areas]").val(selectArea2);
      maxLimit+=1;
    }else{
       alert("5개 까지만 선택가능합니다");
    }
   }
   function removeArea(as) {
    alert(this.text());
    as.remove();
    maxLimit-=1;
    /* alert($("#test").text()); */
    /* $("#areas").val().replace */
    if($("#test").text().equals("")){
       $("#test").text("지역을 선택하세요 (최대 5개 지역 선택가능)");
    }
   }
   function removeJobs(item2) {
    item2.remove();
    maxjobLimit=maxjobLimit-1;
   }
   
   var abc="서울";
   function codeSet(code) {
   abc=$(code).text();
   $("#recListArea div p+p").text("");
   }
   var bcd="외식·음료";
   function jobSet(job) {
   bcd=$(job).text();
    /* $("#jobTabs div p+p").text(""); */ 
   }
   
   function pageProc(curPage){
      document.frmPage.currentPage.value=curPage;
      document.frmPage.submit();
   }
    
</script>   

<section>
<form name="frmPage" method="post" 
   action="<c:url value='/rec/recList.ag'/>">
<input type="hidden" name="currentPage">
<input type="hidden" name="searchConditionz" value="${param.searchCondition }">
<input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword }"> 
</form>

<div class="divList">
<h2>채용정보 리스트</h2>

<div class="divSearch" style="border:1.5px solid #38F;
      margin: 2px;text-align: left;">
      <form name="frmSearch" method="post" 
      action="<c:url value='/rec/recList.ag' />" >
<input type="button" id="button" 
class="ui-state-default ui-corner-all" value="지역별검색">
      
<input type="button" id="button2" 
class="ui-state-default ui-corner-all" value="직종별검색">
      
         <div class="toggler">
  <div id="effect" class="ui-widget-content ui-corner-all">
     <div style="display: inline-block" id="test">
     <h3 class="ui-widget-header ui-corner-all">
     지역을 선택하세요 (최대 5개 지역 선택가능)</h3></div>
    
      <div id="tabs" style="padding: 10px;">
         <ul class="li_font">
          <li><a href="#tabs-0" onclick="codeSet(this)">서울</a></li>
          <li><a href="#tabs-1" onclick="codeSet(this)">인천</a></li>
          <li><a href="#tabs-2" onclick="codeSet(this)">경기</a></li>
          <li><a href="#tabs-3" onclick="codeSet(this)">강원</a></li>
          <li><a href="#tabs-4" onclick="codeSet(this)">대전</a></li>
          <li><a href="#tabs-5" onclick="codeSet(this)">세종</a></li>
          <li><a href="#tabs-6" onclick="codeSet(this)">충남</a></li>
          <li><a href="#tabs-7" onclick="codeSet(this)">충북</a></li>
          <li><a href="#tabs-8" onclick="codeSet(this)">부산</a></li>
          <li><a href="#tabs-9" onclick="codeSet(this)">울산</a></li>
          <li><a href="#tabs-10" onclick="codeSet(this)">경남</a></li>
          <li><a href="#tabs-11" onclick="codeSet(this)">경북</a></li>
          <li><a href="#tabs-12" onclick="codeSet(this)">대구</a></li>
          <li><a href="#tabs-13" onclick="codeSet(this)">광주</a></li>
          <li><a href="#tabs-14" onclick="codeSet(this)">전남</a></li>
          <li><a href="#tabs-15" onclick="codeSet(this)">전북</a></li>
          <li><a href="#tabs-16" onclick="codeSet(this)">제주</a></li>
          <li><a href="#tabs-17" onclick="codeSet(this)">전국</a></li>
        </ul>
       
      <div class="recListArea" id="recListArea">
      

<c:forEach begin="0" end="17" var="i">
<c:set var="tabsNo" value="tabs-${i}"/>
<c:set var="SINo" value="SI${i}"/>
<c:set var="GUNo" value="GU${i}"/>
        <div id="${tabsNo}" style="margin: 3px;" >
          <p id="${SINo }" style="margin: 3px;"></p>
          <p id="${GUNo }" style="margin-bottom: 5px;"></p>
        </div>
</c:forEach>
      </div>
      <!-- <span id="selectArea">선택한 지역:</span> -->
     </div> 
  </div>
</div>
  
<select name="effects" id="effectTypes" style="visibility: hidden;">
  <option value="blind">Blind</option>
  <option value="bounce">Bounce</option>
  <option value="clip">Clip</option>
  <option value="drop">Drop</option>
  <option value="explode" selected="selected">Explode</option>
  <option value="fade" >Fade</option>
  <option value="fold" >Fold</option>
  <option value="highlight">Highlight</option>
  <option value="puff">Puff</option>
  <option value="pulsate" >Pulsate</option>
  <option value="scale">Scale</option>
  <option value="shake">Shake</option>
  <option value="size" >Size</option>
  <option value="slide">Slide</option>
</select>
 
     <div class="toggler">
  <div id="effect2" class="ui-widget-content ui-corner-all">
<div style="display: inline-block;"id="test2">  
    <h3 class="ui-widget-header ui-corner-all">
    직종을 선택하세요(최대 5개 직종 선택가능) </h3></div>
    <!-- <p> -->
      <div id="jobTabs">
  <ul id="jtab">
    <li><a href="#jtabs-1" onclick="jobSet(this)">외식·음료</a></li>
    <li><a href="#jtabs-2" onclick="jobSet(this)">유통·판매</a></li>
    <li><a href="#jtabs-3" onclick="jobSet(this)">문화·여가 생활</a></li>
    <li><a href="#jtabs-4" onclick="jobSet(this)">서비스</a></li>
    <li><a href="#jtabs-5" onclick="jobSet(this)">사무직</a></li>
    <li><a href="#jtabs-6" onclick="jobSet(this)" >고객상담·리서치·영업</a></li>
    <li><a href="#jtabs-7" onclick="jobSet(this)">생산·건설·운송</a></li>
    <li><a href="#jtabs-8" onclick="jobSet(this)">IT·컴퓨터</a></li>
    <li><a href="#jtabs-9" onclick="jobSet(this)">교육·강사</a></li>
    <li><a href="#jtabs-10" onclick="jobSet(this)">디자인</a></li>
    <li><a href="#jtabs-11" onclick="jobSet(this)">미디어</a></li>
  </ul>
  
  
  <c:forEach begin="1" end="11" var="i">
<c:set var="jtabsNo" value="jtabs-${i}"/>
<c:set var="jobNo" value="job-${i}"/>
        <div id="${jtabsNo}" style="margin: 3px;" >
          <p id="${jobNo }" style="margin: 3px;"></p>
        </div>
</c:forEach>
  
    <!-- </p> -->
  </div>
</div>
 </div>

      <!-- 선택한 지역 Controller로 보낼 값 저장 -->
      <input type="text" size="200" name="areas" value="">
      <!-- 선택한 직종 Controller로 보낼 값 저장 -->
      <input type="text" size="200" name="jobs" value=""> 
      
        <p style="text-align: center;">
        <select name="searchCondition" class="button white small"
         style="font-size: 0.75em;">
            <option value="comp_name"
               <c:if test="${param.searchCondition=='title'}">
                  selected
               </c:if>
            >기업명</option>
            <option value="title" 
               <c:if test="${param.searchCondition=='content'}">
                  selected
               </c:if>
            >채용제목</option>
        </select>   
        <input type="text" name="searchKeyword" 
         title="검색어 입력" value="${param.searchKeyword}" >   
      <input type="submit" class="button white medium" value="검색">
      </p>
    </form>
</div>


<div class="list">
<c:if test="${!empty param.searchKeyword }">
   <p>검색어 : ${param.searchKeyword }, ${pagingInfo.totalRecord }건 검색되었습니다.</p>
</c:if>
<c:if test="${empty searchVO.searchKeyword }">
   <p>전체 조회 결과 - ${pagingInfo.totalRecord }건 조회되었습니다</p>
   <p>
   <c:if test="${!empty recSeachVO.area1 }">
       검색지역 - 
   </c:if>
   ${recSeachVO.area1 }
   ${recSeachVO.area2 }
   ${recSeachVO.area3 }
   ${recSeachVO.area4 }
   ${recSeachVO.area5 }
   </p>
   <c:if test="${!empty recSeachVO.job1 }">
       검색직종 - 
   </c:if>
   ${recSeachVO.job1 }
   ${recSeachVO.job2 }
   ${recSeachVO.job3 }
   ${recSeachVO.job4 }
   ${recSeachVO.job5 }
   </p>
</c:if>
</div>
<table class="box2 recList">
   <colgroup>
      <col style="width:10%;" />
      <col style="width:43%;" />
      <col style="width:13%;" />
      <col style="width:12%;" />    
      <col style="width:9%;" />    
      <col style="width:*;" />    
   </colgroup>
   <thead>
     <tr>
       <th scope="col">근무지</th>
       <th scope="col">회사명/모집제목</th>
       <th scope="col">연령</th>
       <th scope="col">급여</th>
       <th scope="col">근무시간</th>
       <th scope="col">등록일</th>
     </tr>
   </thead> 
   <tbody>  
   <c:if test="${empty alist}">
      <tr>
         <td colspan="6" class="align_center">
         검색된 채용정보가 없습니다.
         </td>
      </tr>
   </c:if>
   <c:if test="${!empty alist}">
      <c:forEach var="vo" items="${alist}">
         <tr style="text-align: center">
            <!-- 근무지 -->
            <td>
               <c:set var="addr" value="${fn:split(vo.address,' ')}"/>
               <c:forEach var="j" begin="0" end="1">
                  ${addr[j] }<br>&nbsp;
               </c:forEach>
            </td>
            <!-- 기업명/모집제목 -->
            <td style="text-align: left">
               <a href="<c:url value='/rec/updateCount.ag?recCode=${vo.recCode}'/>">
                  &nbsp;&nbsp; [${vo.compName }]<br>&nbsp;&nbsp; ${vo.title}<br>&nbsp;</a>
            </td>
            <!-- 연령 -->
            <td>
               <c:set var="ageArr" value="${fn:split(vo.age,',')}"/>
               <c:forEach var="age1" items="${ageArr }">
                  ${age1 }<br>
               </c:forEach>
            <!-- 급여 -->
            <td>
               ${vo.payType }
               <fmt:formatNumber pattern="#,###"
               value="${vo.pay }"/>원</td>
            <!-- 근무시간 -->
            <td>
               ${vo.workTime}:${vo.workTime2}-${vo.workTime3}:${vo.workTime4}
            </td>
            <td>
            <!-- 등록일 -->
               <fmt:formatDate value="${vo.regdate}"
               pattern="yyyy-MM-dd" />                
            </td>
         </tr>          
      </c:forEach>
   </c:if>
   </tbody>
</table>    
</div>
<div class="divPage">
   <c:if test="${pagingInfo.firstPage>1 }">  
      <a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
         <img src="<c:url value='/images/first.JPG'/>" 
         alt="이전블럭으로">
      </a>  
   </c:if>
   <c:forEach var="i" begin="${pagingInfo.firstPage }" 
      end="${pagingInfo.lastPage }">    
      <c:if test="${i==pagingInfo.currentPage }">
         <span style="color:blue;font-weight: bold">
            ${i }</span>
      </c:if>     
      <c:if test="${i!=pagingInfo.currentPage }">
            <a href="#" onclick="pageProc(${i})">
            [${i}]</a>
      </c:if>
   </c:forEach>
   
   <!-- 다음 블럭으로 이동 -->
   <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">  
      <a href="#" 
      onclick="pageProc(${pagingInfo.lastPage+1})">
         <img src="<c:url value='/images/last.JPG'/>" alt="다음블럭으로">
      </a>
   </c:if>
</div>

<br>
<div class="divBtn">
    <input type = "Button" class="button white medium" value="채용공고 등록" 
         onclick="location.href='<c:url value="/rec/recWrite.ag"/>';" />
</div>
</section>
<%@ include file="../inc/simple_bottom.jsp" %>