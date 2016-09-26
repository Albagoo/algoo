<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/top2.jsp"%>
<script type="text/javascript"
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>"
   type="text/css">
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/simpleButton.css'/>" />
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/clear.css'/>" />

<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/recLayout.css'/>" />
<link rel="stylesheet" type="text/css"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script src="<c:url value='/jquery/jquery-ui.js'/>"
   type="text/javascript"></script>


<style>
</style>

<script type="text/javascript">  
//검색조건 정보
function k(wel,index,item,ids,names) {
      
      wel+='<input type="checkbox" id="'+ids;
      wel+=index+'"';
      wel+='name="'+names+'"';
      wel+=' value="'+item.values+'"> <label for="';
      wel+=ids+index;
      wel+='">'+item.values+'</label>';
      return wel;
}

//최저임금셋팅
var minPay=6030;
 function minPaySet(){
   $("#pays").val(minPay);
}



$(document).ready(function(){
	
	$("#tabs a").click(function() {
		var SIDO= $(this).text();
		$("#areaSido").val(SIDO);
	
	
	});
	

	
   var welfareArr=[{name:'보험',values:'국민연금'},{name:'보험',values:'고용보험'},
                   {name:'보험',values:'산재보험'},{name:'보험',values:'건강보험'},
                   {name:'휴가/휴무',values:'연차'},{name:'휴가/휴무',values:'월차'},
                   {name:'휴가/휴무',values:'정기휴가'},{name:'보상제도',values:'인센티브제'},
                   {name:'보상제도',values:'정기보너스'},{name:'보상제도',values:'퇴직금'},
                   {name:'보상제도',values:'장기근속자 포상'},{name:'보상제도',values:'우수사원 표창/포상'},
                   {name:'수당제도',values:'야간근로수당'},{name:'수당제도',values:'휴일근로수당'},
                   {name:'수당제도',values:'연월차수당'},{name:'수당제도',values:'장기근속수당'},
                   {name:'수당제도',values:'위험수당'},{name:'수당제도',values:'연장근로수당'},
                   {name:'수당제도',values:'주휴수당'},{name:'생활안정 지원',values:'기숙사운영'},
                   {name:'생활안정 지원',values:'명절 귀향비 지급'},{name:'생활편의 지원',values:'조식제공'},
                   {name:'생활편의 지원',values:'중식제공'},{name:'생활편의 지원',values:'석식제공'},
                   {name:'생활편의 지원',values:'근무복 제공'},{name:'생활편의 지원',values:'통근버스 운행'},
                   {name:'생활편의 지원',values:'야간교통비 지급'},{name:'생활편의 지원',values:'차량유류보조금'},
                   {name:'생활편의 지원',values:'주차비지원(주차가능)'},{name:'경조사 지원',values:'각종 경조금'},
                   {name:'경조사 지원',values:'경조 휴가제'}];
   
      /* var cnt=0; */
      var wel='<span class="titd">복리후생</span>';
      var welTemp="보험";
      var welCnt=0;
   $.each(welfareArr,function(index,item){
      welCnt+=1;
      if(item.name!=welTemp || welCnt>4){
         wel+='<span class="clearBoth titd">　</span>';
         welCnt=0;
      }
      
      wel=k(wel,index,item,"welfare_","welfares");
      welTemp=item.name;
      
      
   });
   $("#welf").html(wel);
   
   
   
   
   /* frmSearch */
   //검색
   $("#searchBt").click(function() {
        var insertAera="";
        var insertJob="";
        
      $("#test label").each(function(){
          var Ar=$(this).text()+",";
          insertAera+=Ar;
      });
      $("#test2 label").each(function(){
          insertJob+=$(this).text()+",";
      });
   
         $("#areas").val(insertAera); 
         $("#jobs").val(insertJob);
         $("#frmSearch").submit();
   });
   
   
   //임시 검색 추가조건 가리기 
   runEffect("#effect"); 
   runEffect("#effect2");  
   runEffect("#effect3");   
      
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
           options = { to: { width: 10, height: 3 } };
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
       $( "#button3" ).on( "click", function() {
         runEffect("#effect3");
       });
      
      
       /* 상세검색 펼치기-접기 */
       $("#button3").on({ 
           "click": function() { 
                var src = ($(this).attr("src") === "<c:url value='/images/searchDetailOBt.png'/>") 
                   ? "<c:url value='/images/searchDetailCBt.png'/>" 
                   : "<c:url value='/images/searchDetailOBt.png'/>"; 
                $(this).attr("src", src); 
           } 
       });
       
       
      $(".divList .box2 tbody tr")
      .hover(function(){
         $(this).css("background","eee").css("cursor","pointer");
      }, function(){
         $(this).css("background","");
      });
      //상세검색 탭형식으로 보여주기
      $( "#detailTabs" ).tabs({});
      
      
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
                    resultJob+="<div >  <a href='#'"+
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
          url:"<c:url value='/json/areas2.json'/>",
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
   var selectJob="";
   var maxjobLimit=0;
   var jobTemp=""
   function asdf(aa) {
   
   if(maxjobLimit<5){
      
     var JobName =$(aa).text();
     if(jobTemp==JobName){
         return;
      }
     jobTemp=$(aa).text();
     //상세카테고리가 전체인경우 카테코리명도 포함
     var JobName2=JobName.replace(" 전체","");
     selectJob=$("#test2").html()+
     "<label name='jobsed'"+" onclick='removeJobs(this)' for="+
     JobName+">"+JobName+
     "<input type='button' class='white' title='"+JobName+
     " 제거 'id='"+ JobName2 +"'value='x'>"+"</label>";
     
     selectJob
      =selectJob.replace("직종을 선택하세요(최대 5개 직종 선택가능)","　");
     
     //사용자에게 보여지는 값
     $("#test2").html(selectJob);
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
         /* guTemp=$("#areaSido").val(); */
         guTemp="<div><a href='#' onclick='dong(this)'>"+
         "전체"
         +"</a></div>";
         guTemp+=guRes;
           $(gutab).html(guTemp);
    }//func
    
  //선택한 구이름 가져오기 -3    
   var guName=""; 
    function GU(guAtag){
       guName =$(guAtag).text();
      $(function() {
         $("#recListArea p>div>a").css("background-color","#rgba(255, 255, 255, 0.0)").css("color","#000");
         $(guAtag).css("background-color","#687EA7").css("color","#FFF");
         test(guName);
          /* obj.css("background-color","색상"); */
      });
    }
    
    //선택한 구군에 해당하는 동읍면 뿌려주기(광진구-광장동,구의동...)
    function test(guName) {
      //선택한 지역 표시
        $.ajax({
           url:"<c:url value='/json/areas2.json'/>",
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
      if(aeraTemp==areaName 
    		  && areaName!="전체"){
         return;
      }
      var areaToSido=$("#areaSido").val();
      //사용자에게 보여지는 값
      aeraTemp=$(aa).text();
      if(areaName!='전체'){
      
      selectArea=$("#test").html()+"<label name='areased'"+"style='color=#D50C0C'"+
      " onclick='removeArea(this)'  for="+areaName+
      ">"+"<input type='button' class='white2' title='"+areaToSido+
      "' value='"+areaToSido+"'>"+areaName+
      "<input type='button' class='white' title='"+areaName+
      " 제거' id='"+areaName+"' value='x'>"+"</label>";
      selectArea=selectArea.replace("지역을 선택하세요 (최대 5개 지역 선택가능)","　");
      $("#test").html(selectArea);
      
      $("#recListArea p>div>a").css("background-color","#rgba(255, 255, 255, 0.0)").css("color","#000");
      $(aa).css("background-color","#687EA7").css("color","#FFF");
      }else{
    	  selectArea=$("#test").html()+"<label name='areased'"+"style='color=#D50C0C'"+
          " onclick='removeArea(this)'  for="+areaToSido+
          ">"+areaToSido+"<input type='button' class='white2' title='"+       
          areaName+"' value='"+areaName+
          "'>"+"<input type='button' class='white' title='"+areaToSido+
          " 제거' id='"+areaToSido+"' value='x'>"+"</label>";
          selectArea=selectArea.replace("지역을 선택하세요 (최대 5개 지역 선택가능)","　");
          $("#test").html(selectArea);
          
          $("#recListArea p>div>a").css("background-color","#rgba(255, 255, 255, 0.0)").css("color","#000");
          $(aa).css("background-color","#687EA7").css("color","#FFF");
      }
      maxLimit+=1;
    }else{
       alert("5개 까지만 선택가능합니다");
    }
   }
   function removeArea(as) {
    
      var a=as;  
    as.remove(a);
    maxLimit-=1;
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
      <input type="hidden"
         name="searchCondition" value="${param.searchCondition }"> 
      <input
         type="hidden" name="searchKeyword" value="${searchVO.searchKeyword }">
   </form>

   <div class="divList">
      <h2>채용정보 리스트</h2>

      <div class="divSearch">
         <form name="frmSearch" method="post" id="frmSearch"
            action="<c:url value='/rec/recList.ag' />">
            <!-- 지역별검색버튼 -->
            <img id="button" style="width: 140px;height: 45px;
            border: 2px solid #CCC;float: left;" 
            src="<c:url value='/images/searchAreaBt.png'/>" > 
            <div style="display: inline-block;width: 670px;height: 50px;float: left;" 
            id="test">지역을 선택하세요 (최대 5개 지역 선택가능)</div>
                     <p class="clearBoth"></p>

            <div class="toggler">
               <div id="effect" class="ui-widget-content ui-corner-all">


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
                           <c:set var="tabsNo" value="tabs-${i}" />
                           <c:set var="SINo" value="SI${i}" />
                           <c:set var="GUNo" value="GU${i}" />
                           <div id="${tabsNo}" style="margin: 3px; padding: 3px;">
                              <p id="${SINo }" style="margin: 3px; padding: 3px;"></p>
                              <p id="${GUNo }" style="margin-bottom: 5px;"></p>
                           </div>
                        </c:forEach>
                     </div>
                     <!-- <span id="selectArea">선택한 지역:</span> -->
                  </div>
               </div>
            </div>

            <select name="effects" id="effectTypes" style="visibility: hidden;height: 0px;">
               <option value="blind">Blind</option>
               <option value="bounce">Bounce</option>
               <option value="clip">Clip</option>
               <option value="drop">Drop</option>
               <option value="explode">Explode</option>
               <option value="fade">Fade</option>
               <option value="fold">Fold</option>
               <option value="highlight">Highlight</option>
               <option value="puff">Puff</option>
               <option value="pulsate">Pulsate</option>
               <option value="scale">Scale</option>
               <option value="shake">Shake</option>
               <option value="size">Size</option>
               <option value="slide">Slide</option>
            </select>
              <!-- 직종별검색버튼 -->
              <p class="clearBoth"></p>
              <img id="button2" style="width: 140px;height: 45px;float:left;
            border: 2px solid #CCC;float: left;" 
            src="<c:url value='/images/searchJobBt.png'/>" >
              <div style="display: inline-block;width: 670px;height: 50px;float: left;" 
              id="test2">직종을 선택하세요(최대 5개 직종 선택가능)</div> 
              <p class="clearBoth"></p>
            <div class="toggler">
               <div id="effect2" class="ui-widget-content ui-corner-all">
                  <!-- <div style="display: inline-block;" id="test2">직종을 선택하세요(최대
                     5개 직종 선택가능)<br></div> -->
                  <!-- <p> -->
                  <div id="jobTabs">
                     <ul id="jtab">
                        <li><a href="#jtabs-1" onclick="jobSet(this)">외식·음료</a></li>
                        <li><a href="#jtabs-2" onclick="jobSet(this)">유통·판매</a></li>
                        <li><a href="#jtabs-3" onclick="jobSet(this)">문화·여가 생활</a></li>
                        <li><a href="#jtabs-4" onclick="jobSet(this)">서비스</a></li>
                        <li><a href="#jtabs-5" onclick="jobSet(this)">사무직</a></li>
                        <li><a href="#jtabs-6" onclick="jobSet(this)">고객상담·리서치·영업</a></li>
                        <li><a href="#jtabs-7" onclick="jobSet(this)">생산·건설·운송</a></li>
                        <li><a href="#jtabs-8" onclick="jobSet(this)">IT·컴퓨터</a></li>
                        <li><a href="#jtabs-9" onclick="jobSet(this)">교육·강사</a></li>
                        <li><a href="#jtabs-10" onclick="jobSet(this)">디자인</a></li>
                        <li><a href="#jtabs-11" onclick="jobSet(this)">미디어</a></li>
                     </ul>


                     <c:forEach begin="1" end="11" var="i">
                        <c:set var="jtabsNo" value="jtabs-${i}" />
                        <c:set var="jobNo" value="job-${i}" />
                        <div id="${jtabsNo}" style="margin: 3px;">
                           <p id="${jobNo }" style="margin: 3px;"></p>
                        </div>
                     </c:forEach>

                     <!-- </p> -->
               
                  </div>
               </div>
            </div>
            <div class="workConditions bg checks" >
               <dl class="clearBoth borderBlue">
                  <dt class="rence" style="height: 65px;margin-bottom: 0px;border-bottom: 0px">
                     <span class="titd">근무기간</span>
                     <input type="checkbox" id="one"
                     name="workTerms" value="하루(1일)"> 
                     <label for="one"> 하루(1일)</label> 
                     <input type="checkbox" id="week" 
                     name="workTerms"value="1주일이하">
                     <label for="week"> 1주일이하</label>
                     <input type="checkbox" id="month" 
                     name="workTerms" value="1주일~1개월">
                     <label for="month"> 1주일~1개월</label>
                     <input type="checkbox"  id="threeMonth" 
                     name="workTerms" value="1개월~3개월"> 
                     <label for="threeMonth"> 1개월~3개월</label>
                      
                     <input type="checkbox"  id="sixMonth" 
                     name="workTerms" value="3개월~6개월"> 
                     <label for="sixMonth"> 3개월~6개월 </label>
                     <span class="clearBoth titd"> </span>  
                     <input type="checkbox"  id="year" 
                     name="workTerms" value="6개월~1년"> 
                     <label   for="year"> 6개월~1년</label> 
                     <input type="checkbox" id="consult"
                     name="workTerms" value="기간협의">
                     <label for="consult"> 기간협의</label>
                  </dt>
                  <dt class="rence" style="height: 65px;border-bottom: 1px solid #687EA7;">
                     <span class="titd">근무요일</span> 
                     <input type="radio" id="MontoSun"
                     name="workDays" checked="checked" value="월~일"> 
                     <label for="MontoSun"> 월~일</label> 
                     <input type="radio" id="MontoSat"
                     name="workDays" value="월~토"> 
                     <label for="MontoSat">  월~토</label> 
                     <input type="radio" id="MontoFri" 
                     name="workDays"   value="월~금"> 
                     <label for="MontoFri"> 월~금</label>
                     <input   type="radio" id="SatSun" 
                     name="workDays" value="주말(토,일)">
                     <label for="SatSun"> 주말(토,일)</label>
                     <input type="radio"  id="sixDay" 
                     name="workDays" value="주 6일"> 
                     <label   for="sixDay"> 주 6일</label>
                     <span class="clearBoth titd"> </span> 
                     <input type="radio" id="fiveDay"
                     name="workDays" value="주 5일"> 
                     <label for="fiveDay"> 주 5일</label> 
                     <input type="radio" id="fourDay" 
                     name="workDays" value="주 4일"> 
                     <label for="fourDay"> 주 4일</label> 
                     <input type="radio" id="threeDay" 
                     name="workDays" value="주 3일">
                     <label for="threeDay"> 주 3일</label>
                     <input type="radio"  id="twoDay" 
                     name="workDays" value="주 2일"> 
                     <label for="twoDay"> 주 2일</label> 
                     <input type="radio" id="oneDay"
                     name="workDays" value="주 1일"> 
                     <label for="oneDay"> 주 1일</label>
                     
                  </dt>
               </dl>
            </div>
            <div class="toggler">
             <div id="effect3" class="ui-widget-content ui-corner-all">
               <div class="workConditions bg checks ">
                <dl class="clearBoth borderBlue">
                  <dt style="height: 35px">
                     <span class="titd">급여선택</span> <select
                        class="txt_85" name="payTypes"
                        style="margin: 5px 0 5px 0;
                        height: 25px;">
                        <option value="시급">시급</option>
                        <option value="일급">일당</option>
                        <option value="주급">주급</option>
                        <option value="월급">월급</option>
                        <option value="연봉">연봉</option>
                     </select> 
                     <input type="text" class="txt_150" 
                     name="pays" id="pays"   value="0"> 
                     <span class="txt_50">원 이상</span> 
                     <input id="minPay" value="최저임금  6030원" 
                     class="white small"  type="button" 
                     onclick="minPaySet()">
                  </dt>
                  <dt class="rence" style="height: 65px;">
                     <span class="titd">고용형태</span> 
                     <input type="checkbox"  name="recruitTypes" 
                     value="알바" id="alba">
                     <label for="alba">알바</label> 
                     <input type="checkbox" value="정규직"
                     id="jung" name="recruitTypes">
                     <label for="jung">정규직</label> 
                     <input type="checkbox" value="계약직"
                     id="gye" name="recruitTypes"> 
                     <label for="gye"> 계약직</label> 
                     <input type="checkbox" value="파견직" 
                     id="fageon" name="recruitTypes">
                     <label for="fageon">파견직</label> 
                     <input type="checkbox"  value="인턴직" 
                     id="intern" name="recruitTypes"> 
                     <label for="intern">인턴직</label>
                     <span class="clearBoth titd"> </span> 
                     <input type="checkbox" value="위촉직"
                     id="wechock" name="recruitTypes"> 
                     <label for="wechock">위촉직</label>
                  </dt>
                  <dt class="rence" id="welf" style="height: 280px;">
                     <!-- <span class="titd">복리후생</span> --> 
                     
                  </dt>
                  <dt class="rence" style="height:65px ">
                     <span class="titd">학력조건</span> 
                     <input type="radio" id="eduLv"
                     name="educateLv" checked="checked" value="학력무관"> 
                     <label for="eduLv"> 학력무관</label> 
                     <input type="radio" id="middle"
                     name="educateLv" value="중학교졸업"> 
                     <label for="middle"> 중학교졸업 </label> 
                     <input type="radio" id="high" 
                     name="educateLv"  value="고등학교졸업"> 
                     <label for="high"> 고등학교졸업 </label>
                     <input type="radio" id="univ23" 
                     name="educateLv" value="대학(2,3년제)졸업">
                     <label for="univ23"> 대학(2,3년제)졸업 </label> 
                     <input type="radio" id="univ4" name="educateLv" 
                     value="대학(4년제)졸업"> 
                     <label for="univ4"> 대학(4년제)졸업 </label>
                     <span class="clearBoth titd"> </span> 
                     <input type="radio"  id="graduate" 
                     name="educateLv"  value="대학원졸업~"> 
                     <label for="graduate"> 대학원졸업~ </label>
                  </dt>
                  <dt class="rence" style="height: 110px;border-bottom: 1px solid #687EA7;">
                     <span class="clearBoth titd">우대조건</span> 
                     <input type="checkbox" id="expPre" 
                    name="preferences" value="동종업계 경력자"> 
                    <label for="expPre"> 
                                                      동종업계 경력자 </label> 
                    <input type="checkbox" id="licensePre"
                    name="preferences" value="관련자격증 소시자"> 
                    <label for="licensePre"> 
                                                      관련자격증 소지자 </label> 
                    <input type="checkbox" id="pcPre" 
                    name="preferences" value="컴퓨터활용 가능자"> 
                    <label for="pcPre">
                                                      컴퓨터활용 가능자 </label> 
                    <input type="checkbox" id="longPre"
                    name="preferences" value="장기근무 가능자"> 
                    <label for="longPre"> 
                                                     장기근무 가능자 </label> 
                    <input type="checkbox" id="engPre" 
                    name="preferences" value="영어 가능자">
                    <label for="engPre"> 
                                                     영어 가능자 </label>
                    <span class="clearBoth titd"> </span>  
                    <input type="checkbox" id="jpPre" 
                    name="preferences" value="일어 가능자">
                    <label for="jpPre"> 
                                                     일어 가능자 </label> 
                    <input type="checkbox" id="cnPre" 
                    name="preferences" value="중국어 가능자">
                    <label for="cnPre"> 
                                                     중국어 가능자 </label> 
                    <input type="checkbox" id="insidePre" 
                    name="preferences" value="인근 거주자"> 
                    <label for="insidePre">
                                                      인근 거주자 </label> 
                    <input type="checkbox" id="drivePre" 
                    name="preferences"  value="운전면허 소지자"> 
                    <label for="drivePre">
                                                      운전면허 소지자 </label> 
                    <input type="checkbox" id="byclePre"
                    name="preferences" value="원동기면허 소지자"> 
                    <label for="byclePre">
                                                       원동기면허 소지자 </label>
                    <span class="clearBoth titd"> </span>
                    <input type="checkbox" id="carPre" 
                    name="preferences" value="차량 소지자">
                    <label for="carPre"> 
                                                      차량 소지자 </label>
                    <input type="checkbox" id="militaryPre" 
                    name="preferences"   value="군필자"> 
                    <label for="militaryPre">
                                                     군필자 </label> 
                    <input type="checkbox" id="femailPre" 
                    name="preferences" value="여성">
                    <label for="femailPre">
                                                      여성 </label> 
                    <input type="checkbox" id="mrsPre" 
                    name="preferences" value="경력단절여성">
                    <label for="mrsPre"> 
                                                     경력단절여성 </label>
                  </dt>
                </dl>
             </div>
         </div>
         </div>

            <!-- 선택한 지역 정보(서울, 인천, 경기 등..) -->
            <input type="hidden" size="200" id="areaSido"
             name="areaSido" value="서울">
            <!-- 선택한 지역 Controller로 보낼 값 저장 -->
            <input type="hidden" size="200" id="areas"
             name="areas" value="">
            <!-- 선택한 직종 Controller로 보낼 값 저장 -->
            <input type="hidden" size="200" id="jobs"
            name="jobs" value="">

            <p style="text-align: center;">
               <select id="searchCondition" name="searchCondition"
                   style="font-size: 0.75em; border: 3px solid #E70400;
                   padding: 5px; ">
                  <option value="comp_name"
                     <c:if test="${param.searchCondition=='title'}">
                  selected
               </c:if>>기업명</option>
                  <option value="title"
                     <c:if test="${param.searchCondition=='content'}">
                  selected
               </c:if>>채용제목</option>
               </select> <input type="text" id="searchKeyword" 
               name="searchKeyword" title="검색어 입력" size="40"
               style="border: 3px solid #E70400;padding: 5px;"
               
               value="${param.searchKeyword}">
               
               <!-- 일반검색버튼 -->
               <input type="submit" id="searchBt" style="width: 100px;height: 31px;
               border:none; padding: 2px;background: #E70400;color: #FFF;font-weight: bold;" value="검색" > 
                        
               <!-- 상세검색버튼 -->
               
               <img id="button3" style="width: 100px;height: 25px;
               border: 2px solid #CCC;padding: 2px; float: right; " 
               src="<c:url value='/images/searchDetailOBt.png'/>" > 
               
            </p>

         </form>
      </div>


      <div class="list">
         <c:if test="${!empty param.searchKeyword }">
            <p>검색어 : ${param.searchKeyword }, ${pagingInfo.totalRecord }건
               검색되었습니다.</p>
         </c:if>
         <c:if test="${empty searchVO.searchKeyword }">
            <p>전체 조회 결과 - ${pagingInfo.totalRecord }건 조회되었습니다</p>
            <p>
               <c:if test="${!empty recSeachVO.area1 }">
               [검색]지역 - 
               </c:if>
               ${recSeachVO.area1 } ${recSeachVO.area2 } ${recSeachVO.area3 }
               ${recSeachVO.area4 } ${recSeachVO.area5 }

               <c:if test="${!empty recSeachVO.job1 }">
                  <br>[검색]직종 - 
               ${recSeachVO.job1 } ${recSeachVO.job2 } ${recSeachVO.job3 }
               ${recSeachVO.job4 } ${recSeachVO.job5 }
               
               </c:if>
               <c:if test="${!empty recSeachVO.workTerms }">
                  <br>[검색]근무기간-
                  <c:forEach var="WTSearch" items="${recSeachVO.workTerms }">
                    ${WTSearch}    
                  </c:forEach>
               </c:if>
             
               <c:if test="${!empty recSeachVO.recruitTypes }">
                  <br>[검색]고용형태-
                  <c:forEach var="RTSearch" items="${recSeachVO.recruitTypes }">
                    ${RTSearch}    
                  </c:forEach>
               </c:if>
               
               <c:if test="${!empty recSeachVO.welfares }">
                  <br>[검색]복리후생-
                  <c:forEach var="WFSearch" items="${recSeachVO.welfares }">
                    ${WFSearch}    
                  </c:forEach>
               </c:if>
    
               <c:if test="${!empty recSeachVO.preferences }">
                  <br>[검색]우대조건-
                  <c:forEach var="PFSearch" items="${recSeachVO.preferences }">
                    ${PFSearch}    
                  </c:forEach>
               </c:if>
               
            </p>
         </c:if>
      </div>
      <table class="box2 recList" style="border: 1px solid #EEE">
         <colgroup>
            <col style="width: 87px;" />
            <col style="width: 377px;" />
            <col style="width: 113px;" />
            <col style="width: 105px;" />
            <col style="width: 78px;" />
            <col style="width: 116px;" />
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
                  <td colspan="6" class="align_center">검색된 채용정보가 없습니다.</td>
               </tr>
            </c:if>
            <c:if test="${!empty alist}">
               <c:forEach var="vo" items="${alist}">
                  <tr style="text-align: center;">
                     <!-- 근무지 -->
                     <td style="text-align: left">
                     <c:set var="addr" value="${fn:split(vo.address,' ')}" />
                        <c:forEach var="j" begin="0" end="1">
                  ${addr[j] }<br>
                        </c:forEach></td>
                     <!-- 기업명/모집제목 -->
                     <td style="text-align: left"><a
                        href="<c:url value='/rec/updateCount.ag?recCode=${vo.recCode}'/>">
                           &nbsp;&nbsp; [${vo.compName }]<br>&nbsp;&nbsp; ${vo.title}
                     </a></td>
                     <!-- 연령 -->
                     <td><c:set var="ageArr" value="${fn:split(vo.age,',')}" /> <c:forEach
                           var="age1" items="${ageArr }">
                  ${age1 }<br>
                        </c:forEach> <!-- 급여 -->
                     <td style="text-align: right"><c:if
                           test="${vo.payType=='시급' }">
                           <span
                              style="padding: 1px; border: solid 1px CornflowerBlue; border-radius: 3px; font-size: 8px; color: CornflowerBlue">시</span>
                        </c:if> <c:if test="${vo.payType=='일급' }">
                           <span
                              style="padding: 1px; border: solid 1px LimeGreen; border-radius: 3px; font-size: 8px; color: LimeGreen">일</span>
                        </c:if> <c:if test="${vo.payType=='주급' }">
                           <span
                              style="padding: 1px; border: solid 1px OrangeRed; border-radius: 3px; font-size: 8px; color: OrangeRed">주</span>
                        </c:if> <c:if test="${vo.payType=='월급' }">
                           <span
                              style="padding: 1px; border: solid 1px red; border-radius: 3px; font-size: 8px; color: red">월</span>
                        </c:if> <c:if test="${vo.payType=='연봉' }">
                           <span
                              style="padding: 1px; border: solid 1px SaddleBrown; border-radius: 3px; font-size: 8px; color: SaddleBrown">연</span>
                        </c:if> <%-- ${vo.payType } --%> <fmt:formatNumber pattern="#,###"
                           value="${vo.pay }" />원</td>
                     <!-- 근무시간 -->
                     <td>
                        ${vo.workTime}:${vo.workTime2}-${vo.workTime3}:${vo.workTime4}</td>
                     <td>
                        <!-- 등록일 --> <fmt:formatDate value="${vo.regdate}"
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
         <a href="#" onclick="pageProc(${pagingInfo.firstPage-1})"> <img
            src="<c:url value='/images/first.JPG'/>" alt="이전블럭으로">
         </a>
      </c:if>
      <c:forEach var="i" begin="${pagingInfo.firstPage }"
         end="${pagingInfo.lastPage }">
         <c:if test="${i==pagingInfo.currentPage }">
            <span style="color: blue; font-weight: bold"> ${i }</span>
         </c:if>
         <c:if test="${i!=pagingInfo.currentPage }">
            <a href="#" onclick="pageProc(${i})"> [${i}]</a>
         </c:if>
      </c:forEach>

      <!-- 다음 블럭으로 이동 -->
      <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
         <a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> <img
            src="<c:url value='/images/last.JPG'/>" alt="다음블럭으로">
         </a>
      </c:if>
   </div>

   <br>
   <div class="divBtn">
   <c:if test="${sessionScope.authCode==2 }">
      <input type="button" class="button white medium" value="채용공고 등록"
         onclick="location.href='<c:url value="/rec/recWrite.ag"/>';" />
   </c:if>
   </div>
</section>
<%@ include file="../inc/bottom.jsp"%>