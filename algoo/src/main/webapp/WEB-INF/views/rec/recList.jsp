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
	   runEffect("#effect");
	   //업직종 보여주기
	   $( "#jobTabs" ).tabs({});
//업종 셋팅  (외식음료, 유통판매, ...) 
     $.ajax({
         url:"<c:url value='/json/Job2.json'/>",
         data:"GET",
         dataType:"json",
         success : function(res) {
             for(var i=0;i<10;i++){
             var Jno="J0"+(i+1);
             var Jobno="#job-"+i;
             job2Set(res,Jno,Jobno);
             /* alert(Jno+":"+Jobno); */
             }
             
             for(var i=9;i<13;i++){
              Jno="J"+(i+1);
              Jobno="#job-"+i;
             job2Set(res,Jno,Jobno);
             /* alert(Jno+":"+Jobno); */
             }
          
          },
          error : function(xhr,statust, error) {
          alert(status + ":"+ error);
          }
      });//ajax
    //업종셋팅 셋팅 -2 ( 일반음식점, 레스토랑 ....)
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
      
	   
	   
	   
//지역구 셋팅  (서울,인천,경기..) 탭형식으로 볼수 있게 해줌
      $( "#tabs" ).tabs();
//지역구 셋팅  지역(서울,인천,경기..)에 
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
   
   //3 직종 선택한 지역에 넣기      
   var ff=" ";
   var maxjobLimit=0;
   function asdf(aa) {
   
   
   if(maxjobLimit<5){
     var f =$(aa).text();
     
     var f2=f.replace("전체",f);
     /* alert(aa); */
     ff=$("#test2").html()+"  <label name='jobs'"+
     " onclick='removeJobs(this)' for="+f+
     ">"+f2+"<input type='button' title='"+f+
     " 제거 'id='"+ f2 +"'value='x'>"+"</label>";
     
     ff=ff.replace("지역을 선택하세요 (최대 5개 지역 선택가능)","　");
     
     $("#test2").html(ff);
     
      ff2=$("input[name=jobs]").val()+f+",";
     $("input[name=jobs]").val(ff2);
      alert(ff2);   
     maxjobLimit+=1;
   }else{
      alert("5개 까지만 선택가능합니다");
   }
  }
   
   
   
 //지역구 셋팅 -2
   function areaSet(res,code,tag) {
      var temps="";
         var tw=0;
         var result="";
         $.each(res.DATA,function() {
              if(temps!=this.GU){
               if(this.CODE==code){
                  result+="<div><a href='#' onclick='GU(this)'>"+
                  this.GU
                  +"</a></div>";
               }//if
              }//if 
              temps=this.GU;
         });//for
           $(tag).html(result);
    }//func
  //지역구 셋팅 -3    
   var ddd=""; 
    function GU(aa){
    	ddd =$(aa).text();
    	$(function(ddd) {
			test();
		});
    }
    
//동읍면 셋팅-1
    function dongSet(res,code,tag,SI) {
    	temp="";
           tw=0;
           result="";
           $.each(res.DATA,function() {
                 if(this.GU==code&&this.SI==SI){
                    result+="<div><a href='#' onclick='dong(this)'>"+
                    this.DONG
                    +"</a></div>";
                  }
           });//for
             $(tag).html(result);
      }//func
    function test() {
    	//선택한 지역 표시
        $.ajax({
           url:"<c:url value='/json/areas.json'/>",
              data:"GET",
              dataType:"json",
              success : function(res) {

            	     for(var i=0;i<18;i++){
                         var GUno="#GU"+i;
                         dongSet(res,d,GUno,abc);
                         }
              },
              error : function(xhr,statust, error) {
                  alert(status + ":"+ error);
              }
        });
       }
       
 //선택한 지역에 넣기     
    var dd=" ";
    var maxLimit=0;
   function dong(aa) {
	 if(maxLimit<5){
    	var d =$(aa).text();
    	dd=$("#test").html()+"  <label name='areas'"+
    	" onclick='removeArea(this)' for="+d+
    	">"+d+"<input type='button' title='"+d+
    	" 제거' id='"+d+"' value='x'>"+"</label>";
    	/* alert(dd); */
    	dd=dd.replace("지역을 선택하세요 (최대 5개 지역 선택가능)","　");
    	/* alert(dd); */
    	$("#test").html(dd);
    	
    	dd2=$("input[name=areas]").val()+d+",";
    	$("input[name=areas]").val(dd2);
    	/* alert(dd2); */
    	maxLimit+=1;
	 }else{
		 alert("5개 까지만 선택가능합니다");
	 }
   }
   function removeArea(item) {
	 item.remove();
	 maxLimit-=1;
	 alert($("#test").text());
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
    ㅎ </h3></div>
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
  
  <div id="jtabs-1">
    <p id="job-1">1</p>
  </div>
  <div id="jtabs-2">
    <p id="job-2">2</p>
  </div>
  <div id="jtabs-3">
    <p id="job-3">3</p>
    <p>3</p>
  </div>
  <div id="jtabs-4">
    <p id="job-4">4</p>
  </div>
  <div id="jtabs-5">
    <p id="job-5">5</p>
  </div>
  <div id="jtabs-6">
    <p id="job-6">6</p>
  </div>
  <div id="jtabs-7">
    <p id="job-7">7</p>
  </div>
  <div id="jtabs-8">
    <p id="job-8">8</p>
  </div>
  <div id="jtabs-9">
    <p id="job-9">9</p>
  </div>
  <div id="jtabs-10">
    <p id="job-10">10</p>
  </div>
  <div id="jtabs-11">
    <p id="job-11">11</p>
  </div>
</div>
    <!-- </p> -->
  </div>
</div>
 

     
      <input type="hidden" name="areas" value="">
      <input type="hidden" name="jobs" value=""> 
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
                  ${addr[j] }<br>
               </c:forEach>
            </td>
            <!-- 기업명/모집제목 -->
            <td style="text-align: left">
               <a href="<c:url value='/rec/updateCount.ag?recCode=${vo.recCode}'/>">
                  &nbsp; [${vo.compName }]<br> ${vo.title}</a>
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