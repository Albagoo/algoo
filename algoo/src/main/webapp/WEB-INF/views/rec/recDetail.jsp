<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   <%@ include file="../inc/top.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/recLayout.css'/>" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  
<style>
 .toggler {
    width: 500px;
    height: 200px;
  }
  #button {
    padding: .5em 1em;
    text-decoration: none;
  }
  #effect {
    position: relative;
    width: 240px;
    height: 170px;
    padding: 0.4em;
  }
  #effect h3 {
    margin: 0;
    padding: 0.4em;
    text-align: center;
  }
</style>
<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/recLayout.css'/>"/>
<script type="text/javascript"
src="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript"
src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/simpleButton.css'/>" />
<!--   지도 스크립트            -->

<script type="text/javascript" 
src="//apis.daum.net/maps/maps3.js?apikey=f06943e7a65fb3d3ded3394d978e6b56&libraries=services"></script>

 <!-- 1c57e699ab04456074d086be7fd7be45 --><!-- 정섭API -->
<!-- f06943e7a65fb3d3ded3394d978e6b56 --><!-- 대근API -->
<script type="text/javascript">
   $(document).ready(function(){
      
	   $("#apply").click(function(){
		   window.open("<c:url value='/apply/apply.ag?recCode="+$("#recCode").val()+"&userid="+$("#userid").val()+"'/>", "apply",
				   "width=600,height=420,left=10, top=50,resizable=yes,location=yes");
	   });
      
      $("#simple_top span").html("채용정보");
      //simple_top 이용시 자기가 맡은화면 명칭 innerHTML로 붙여주기
      
      $("#recListBt").click(function() {
          frmList.action
          ="<c:url value='/rec/recList.ag'/>";   
          frmList.submit();
          //나중에 카테고리 추가 예정
      });
      
      // run the currently selected effect
      function runEffect() {
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
        $( "#effect" ).toggle( selectedEffect, options, 500 );
      };
   
      // Set effect from select menu value
      $( "#button" ).on( "click", function() {
        runEffect();
      });
      
     
      $("#btCopy").click(function() {
        var juso =location.href;
        
        $("input[name='homeCopy']").val(juso).select();
         document.execCommand("copy");
         alert('주소가 복사되었습니다.');
      });
      
        //[출처] [AngularJS, Jquery] URL 또는 TEXT 복사하기 |작성자 지니고
      
   }); 
   
   
  
   
</script>
<input type="hidden" value="${param.recCode }" id="recCode">
<input type="hidden" value="${sessionScope.userid }" id="userid">
<div class="Wrap">
   <p class="recDetail">채용정보 상세보기</p>
   <div>
      <div class="detail_right">
         <span class="url"> 
         <input size="1" type="text" 
         readonly="readonly" name="homeCopy" 
         value="${compVo.homepage }"
         style="color:#FFF;backgroun:#FFF;
         width: 0.1px;height: 0.1px;margin: 0;padding: 0;
         border: 0;"></span>
         <input type="button" class="button white small" 
         value="URL주소복사"  id="btCopy" >
      </div>
      <p class="clear_both"></p>
      
       <div class="detail_right"> 
      
      
      
         <input type="button" class="button rosy small" value="스크랩">
         
         <input type="button" class="button rosy small" value="인쇄"
         onclick="window.print()">
         
         <input type="button" class="button rosy small" value="신고">
         <input type="button" class="button rosy small" value="E메일">
         <input type="button" class="button rosy small" value="FaceBook">
         <input type="button" class="button rosy small" value="Twiter">
      <!-- </div> -->
   </div>
   <p class="clearboth" style="margin-bottom: 5px">
   <span style="text-align: left;font-size: 9.3pt;"
    class="bon">등록일 :<fmt:formatDate value="${recVo.regdate }" 
      pattern="yyyy-MM-dd"/> </span></p>
    
   <div class="title" style="padding-top:0" align="absmiddle" >
   <img alt="title" src="http://i.imgur.com/y7wOSNl.png"
   style="width:20px;height:20px;padding-top: 10px">${recVo.title }</div>
   <div class="main_left detail_left">
      <div class="logo bon">
          <img alt="${compVo.compName }" 
         src="<c:url value='algoo/images/${compVo. }'/>"> 
<%--        src="<c:url value='/images/${compVo.imageURL1 }'/>"> - --%>
      </div>

      <span class="titd">
      기업정보
      </span>
      <input type="button" class="white button small" value="?">
      <!-- <a href="" class="detail_right font_11 ">자세히보기></a> <br class="br"> -->
      <div class="">
         <dl style="display: block;" class="clearBoth">
            <dt>
              <span class="titd">회사명</span> 
              <span class="txt_170 ">
              ${compVo.compName }
              </span>
            </dt>
            <dt>
            <span class="titd">홈페이지</span> 
                <a class="txt_170"
                 href="${compVo.homepage }">
                ${compVo.homepage }</a>
            </dt>
            <br>
            <dt>
               <span class="titd">대표자</span> 
               <span class="txt_100">${compVo.ceo }</span>
            </dt>
            <dt>
               <span class="titd">회사주소</span> 
               <span class="txt_170">${compVo.address }</span>
            </dt>
            <dt>
               <span class="titd">사업내용</span> 
               <span class="txt_100">${compVo.content }</span>
            </dt>

         </dl>
      </div>
   </div>
   <div class="main_right detail_right">
     <p class="right_title">${recVo.compName }</p>
     <dl class="clearBoth">
        <dt>
        <span class="titd">마감일</span>
        <span class="txt_300">
        <fmt:formatDate  value="${serviceVo.deadline}" 
        pattern="yyyy-MM-dd"/> 
        (마감일 ${serviceVo.days+1 }일전)</span>
        </dt>
        <dt>
        <span class="titd">모집인원</span>
        <span class="txt_300">
        <c:set value="${recVo.recruitMember }" var="recruitMember" />
        <c:set value="," var="comar" />
         ${fn:replace(recruitMember,comar,"")}
        </span>
        </dt>
        <dt>
        <span class="titd">성      별</span>
        <span class="txt_300">${recVo.gender }</span>
        </dt>
        <dt>
        <span class="titd">연      령</span>
        <span class="txt_300">${recVo.age }</span>
        </dt>
        <dt>
        <span class="titd">학      력</span>
        <span class="txt_300">${recVo.educateLv }</span>
        </dt>
     <p class="right_title">&nbsp;</p>
        <dt>
        <span class="titd">담  당 자</span>
        <span class="txt_300">${compVo.deptName }</span>
        </dt>       
        <dt>
        <span class="titd">e - 메일</span>
        <span class="txt_300">${compVo.email1}@${compVo.email2 }</span>
        </dt>
        <dt>
        <span class="titd">전화번호</span>
        <span class="txt_300">
         ${compVo.hp1}-${compVo.hp2}-${compVo.hp3}</span>
        </dt>
        <dt>
            <span class="detail_left font_9 margin_left_70 border_radius padding_10_5 bon">
                           알구에서 채용정보 보고 전화드렸습니다.<br> 라고 연락하시면 문의가 쉽습니다.</span>
        </dt>
        <dt>
        <span class="titd">팩스번호</span>
        <span class="txt_300">${compVo.fax1 }-${compVo.fax2 }-${compVo.fax3 }</span>
        </dt>

     </dl>
     <br class="br"><br class="br">
     <a href="#" class="detail_left" id="apply"><img  
     src="http://i.imgur.com/tu0kFGD.png" style="width: 100px;height: 30px"
     alt='온라인지원'></a>
     <a href="#" class="detail_left decoration_none">&nbsp;<img  
     src="http://i.imgur.com/7p0pSoh.png" style="width: 100px;height: 30px"
     alt="e-메일지원"></a>
     <br class="clearBoth">
     <!-- <div class="font_10 bon bold">e-메일 지원 시 자사양식 다운로드후 지원해 주세요.
     <a href="#" id="downBt"><img style="width: 20px;height: 20px"
     src="http://icons.iconarchive.com/icons/graphicloads/100-flat-2/256/arrow-download-icon.png"
     alt="양식다운로드"
     ></a> -->
     </div>
   </div>
   
   <div class="bg clear_both main_board border_tb10 font_11 align_right">
    <span class="bold bon font_9">현금카드, 통장비밀번호 요구엔 절대 응대하지 마세요.</span> 
    취업을 빙자한 사기의 위험이 있습니다.&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="#" target="_blank">자세히 보기 ></a></div>

   <div class="border_bottom font_13 bold">> 업무조건 및 근무조건</div>
   <div class="detail_content background bg">
      <dl class="clearBoth">
         <dt>
            <span class="titc">고용형태</span> 
            <span class="txt_150">${recVo.recruitType }</span>
         </dt>
         <dt>
            <span class="titc">업직종</span> 
            <span class="txt_150 decoration_none">
              <c:set var="jobName2"  value="${recVo.jobName2 }"/>
              <c:set var="jobName2"  value="${fn:split(jobName2,',')}"/>
              
              <c:forEach var="jobN2" items="${jobName2 }">
               <a href
               ="<c:url value='/rec/recList.ag?jobs=${jobN2 }'/>">
               ${jobN2 }</a>,
              </c:forEach>
             
            </span>
         </dt>
         <dt>
            <span class="titc">근무기간</span> 
            <span class="txt_150">${recVo.workTerm }
            
            </span>
         </dt>
         <dt>
            <span class="titc">근무요일</span> 
            <span class="txt_150">${recVo.workDays }</span>
         </dt>
         <dt>
            <span class="titc">근무시간</span> 
            <span class="txt_150">
            ${recVo.workTime }:${recVo.workTime2 }
            ~
            ${recVo.workTime3 }:${recVo.workTime4 }
            </span>
         </dt>
         <dt>
            <span class="titc">급여</span> 
            <span class="txt_150">
            ${recVo.payType }
            <fmt:formatNumber value="${recVo.pay }" 
            pattern="#,###" /> 원</span>
         </dt>
         <dt>
            <span class="titc">복리후생</span> 
            <span class="txt_150">
            <c:if test="${!empty recVo.welfare }">
            ${recVo.welfare }
            </c:if>
            <c:if test="${empty recVo.welfare }">
                            없음
            </c:if>
            </span>
         </dt>
      </dl>
   </div>
   <div class="border_bottom font_13 bold">> 근무지역</div>
   <div class="detail_area background bg" style="height: 500px">
   <dl class="clearBoth">
      <dt>
         <span class="titc">근무지역</span>
         <input id="keyworldMap" type="hidden" value="${recVo.address }">
         <span class="txt_500">${recVo.address }<br>[상세정보] ${rec.addressDetail }</span>
      </dt> 
         
      <dt>
         <span class="titc">인근전철</span>
         <span class="txt_300">
            <c:if test="${recVo.subRegion=='null' }">
                           없음
            </c:if>
            <c:if test="${recVo.subRegion!='null' }">
            ${recVo.subRegion }
            </c:if>
            ${recVo.subNum }
            ${recVo.subName }
            ${recVo.subInfo }
         </span>
      </dt> 
      <dt>
         <span class="titc">지도</span>
         <span class="txt_100" style="width: 600px">※ 지도는  <span class="red">근무지 위치</span>를 나타내며 회사 소재지와 일치하지 않을 수 있습니다.</span>
      </dt> 
     <p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" style="font-size: 9pt;
        float: left;" 
        onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>
<input type="hidden" id="recCompName" value="${recVo.compName }">

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
var kwd = $("#keyworldMap").val();
geocoder.addr2coord(kwd, function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var recCompName = $("#recCompName").val();
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+recCompName+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

   </dl>
   </div>
   </div>
   <div class="border_bottom font_13 bold">> 상세 모집 요강</div>
   <div class="detail_rec bg">
     <dl class="dt_20">
        ${recVo.detailRecruit }
   </div>
     <div align="center">
   <input class="white button" type="button" 
      id="recListBt" value="목록">
      </div>
   </div>
   <form name="frmList"></form>
</div>

<%@ include file="../inc/bottom.jsp" %>