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
				   "width=600,height=550,left=10, top=50,resizable=yes,location=yes");
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
         src="data:image/jpeg;base64,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"> 
<%--        src="<c:url value='/images/${compVo.imageURL1 }'/>"> - --%>
      </div>

      <span class="titd">
      기업정보
      </span>
      <input type="button" class="white button small" value="?">
      <a href="" class="detail_right font_11 ">자세히보기></a> <br class="br">
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
     <div class="font_10 bon bold">e-메일 지원 시 자사양식 다운로드후 지원해 주세요.
     <a href="#" id="downBt"><img style="width: 20px;height: 20px"
     src="http://icons.iconarchive.com/icons/graphicloads/100-flat-2/256/arrow-download-icon.png"
     alt="양식다운로드"
     ></a>
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