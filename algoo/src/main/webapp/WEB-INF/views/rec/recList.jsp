<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/recLayout.css'/>" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<script type="text/javascript" src="<c:url value='/scrollup-master/dist/jquery.scrollUp.min.js'/>"></script>
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/simpleButton.css'/>" />
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>"
   type="text/css">
<script src="<c:url value='/jquery/jquery-ui.js'/>"
   type="text/javascript"></script>



<script type="text/javascript">  
   $(document).ready(function(){
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
          url:"<c:url value='/json/area.json'/>",
          data:"GET",
          dataType:"json",
          success : function(res) {
            areaSet(res,"SI0","#SI0");
            areaSet(res,"SI1","#SI1");
            areaSet(res,"SI2","#SI2");
            areaSet(res,"SI3","#SI3");
            areaSet(res,"SI4","#SI4");
            areaSet(res,"SI5","#SI5");
            areaSet(res,"SI6","#SI6");
            areaSet(res,"SI7","#SI7");
            areaSet(res,"SI8","#SI8");
            areaSet(res,"SI9","#SI9");
            areaSet(res,"SI10","#SI10");
            areaSet(res,"SI11","#SI11");
            areaSet(res,"SI12","#SI12");
            areaSet(res,"SI13","#SI13");
            areaSet(res,"SI14","#SI14");
            areaSet(res,"SI15","#SI15");
            areaSet(res,"SI16","#SI16");
            areaSet(res,"SI17","#SI17");
           },
           error : function(xhr,statust, error) {
           alert(status + ":"+ error);
           }
       });//ajax  
   });//jquery
   
 //지역구 셋팅 -2
   function areaSet(res,code,tag) {
      var temp="";
         var tw=0;
         var result="";
         $.each(res.DATA,function() {
              if(temp!=this.GU){
               if(this.CODE==code){
                  result+="<div><a href='#' onclick='GU(this)'>"+
                  this.GU
                  +"</a></div>";
               }//if
              }//if 
              temp=this.GU;
         });//for
           $(tag).html(result);
    }//func
  //지역구 셋팅 -3    
   var d=""; 
    function GU(aa){
    	d =$(aa).text();
    	$(function(d) {
			test();
		});
    }
    
//동읍면 셋팅-1
    function dongSet(res,code,tag,SI) {
    	var temp="";
           var tw=0;
           var result="";
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
           url:"<c:url value='/json/area.json'/>",
              data:"GET",
              dataType:"json",
              success : function(res) {
            	  var glist=["#GU0","#GU1"];
            	  
            	  dongSet(res,d,"#GU0",abc);
            	  dongSet(res,d,"#GU1",abc);
            	  dongSet(res,d,"#GU2",abc);
            	  dongSet(res,d,"#GU3",abc);
            	  dongSet(res,d,"#GU4",abc);
            	  dongSet(res,d,"#GU5",abc);
            	  dongSet(res,d,"#GU6",abc);
            	  dongSet(res,d,"#GU7",abc);
            	  dongSet(res,d,"#GU8",abc);
            	  dongSet(res,d,"#GU9",abc);
            	  dongSet(res,d,"#GU10",abc);
            	  dongSet(res,d,"#GU11",abc);
            	  dongSet(res,d,"#GU12",abc);
            	  dongSet(res,d,"#GU13",abc);
            	  dongSet(res,d,"#GU14",abc);
            	  dongSet(res,d,"#GU15",abc);
            	  dongSet(res,d,"#GU16",abc);
            	  dongSet(res,d,"#GU17",abc);
            	  
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
    	dd=$("#test").html()+"<label name='ares'"+
    	" onclick='removeArea(this)' for="+d+
    	">"+d+"<input type='button' title='"+d+
    	" 제거' id='"+d+"' value='x'>"+"</label>";
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
	}
   
   var abc="서울";
   function codeSet(code) {
	abc=$(code).text();
	$("#recListArea div p+p").text("");
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
<legend>채용정보 리스트</legend>

<div class="divSearch" style="border:1px solid gray;">
      <form name="frmSearch" method="post" 
      action="<c:url value='/rec/recList.ag' />" >
      
      <div id="tabs" >
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
        <div id="tabs-0"  >
          <p id="SI0">시도 지역이 나올 영역</p>
          
          <p id="GU0"></p>
         
        </div>    
        <div id="tabs-1">
          <p id="SI1"></p>
          <p id="GU1"></p>
        </div>
        <div id="tabs-2">
          <p id="SI2">지역이 나올 영역</p>
          <p id="GU2"></p>
        </div>
        <div id="tabs-3">
          <p id="SI3">지역이 나올 영역</p>
          <p id="GU3"></p>
        </div>
        <div id="tabs-4">
          <p id="SI4">지역이 나올 영역</p>
          <p id="GU4"></p>
        </div>
        <div id="tabs-5">
          <p id="SI5">지역이 나올 영역</p>
          <p id="GU5"></p>
        </div>
        <div id="tabs-6">
          <p id="SI6">지역이 나올 영역</p>
          <p id="GU6"></p>
        </div>
        <div id="tabs-7">
          <p id="SI7">지역이 나올 영역</p>
          <p id="GU7"></p>
        </div>
        <div id="tabs-8">
          <p id="SI8">지역이 나올 영역</p>
          <p id="GU8"></p>  
        </div>
        <div id="tabs-9">
          <p id="SI9">지역이 나올 영역</p>
          <p id="GU9"></p>
        </div>
        <div id="tabs-10">
          <p id="SI10">지역이 나올 영역</p>
          <p id="GU10"></p>
        </div>
        <div id="tabs-11">
          <p id="SI11">지역이 나올 영역</p>
          <p id="GU11"></p>
        </div>
        <div id="tabs-12">
          <p id="SI12">지역이 나올 영역</p>
          <p id="GU12"></p>
        </div>
        <div id="tabs-13">
          <p id="SI13">지역이 나올 영역</p>
          <p id="GU13"></p>
        </div>
        <div id="tabs-14">
          <p id="SI14">지역이 나올 영역</p>
          <p id="GU14"></p>
        </div>
        <div id="tabs-15">
          <p id="SI15">지역이 나올 영역</p>
          <p id="GU15"></p>
        </div>
        <div id="tabs-16">
          <p id="SI16">지역이 나올 영역</p>
          <p id="GU16"></p>
        </div>
        <div id="tabs-17">
          <p id="SI17">지역이 나올 영역</p>
          <p id="GU17"></p>
        </div>
      </div>
      <span id="selectArea">선택한 지역:</span>
      <div style="display: inline-block;"
       id="test"></div>  
     </div> 
     
      <input type="hidden" name="areas" value="">
        
        <select name="searchCondition" class="button white small"
         style="font-size: 0.75em;">
            <option value="title"
               <c:if test="${param.searchCondition=='title'}">
                  selected
               </c:if>
            >기업명</option>
            <option value="content" 
               <c:if test="${param.searchCondition=='content'}">
                  selected
               </c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" 
         title="검색어 입력" value="${param.searchKeyword}" >   
      <input type="submit" class="button white medium" value="검색">
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
               <c:forEach var="i" begin="0" end="1">
                  ${addr[i] }<br>
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
<p class="clearboth"></p> 
</section>

<%@ include file="../inc/simple_bottom.jsp" %>