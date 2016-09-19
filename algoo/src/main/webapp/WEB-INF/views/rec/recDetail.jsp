<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../inc/simple_top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/recLayout.css'/>" />

<style>

</style>
<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/recLayout.css'/>"/>
<script type="text/javascript"
src="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript"
src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript"
src="<c:url value='/api/jQuery-printPage-plugin-master/jquery-1.4.4.min.js'/>"></script>
<script type="text/javascript"
src="<c:url value='/api/jQuery-printPage-plugin-master/jquery.printPage.js'/>"></script>




<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/simpleButton.css'/>" />
<!--   지도 스크립트            -->
<!-- 
<script type="text/javascript" 
src="//apis.daum.net/maps/maps3.js?apikey=&libraries=services"></script>
-->
 <!-- 1c57e699ab04456074d086be7fd7be45 --><!-- 정섭API -->
<!-- f06943e7a65fb3d3ded3394d978e6b56 --><!-- 대근API -->
<script type="text/javascript">
   $(document).ready(function(){
      $("#simple_top span").html("채용정보");
      //simple_top 이용시 자기가 맡은화면 명칭 innerHTML로 붙여주기
      
      $("#recListBt").click(function() {
          frmList.action
          ="<c:url value='/rec/recList.ag'/>";   
          frmList.submit();
          //나중에 카테고리 추가 예정
      });
      
      $(".btnPrint").printPage();
      
   });
  /*    
   // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
      var infowindow = new daum.maps.InfoWindow({zIndex:1});

      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  

      // 지도를 생성합니다    
      var map = new daum.maps.Map(mapContainer, mapOption); 

      // 장소 검색 객체를 생성합니다
      var ps = new daum.maps.services.Places(); 

      // 키워드로 장소를 검색합니다
      var kwd = $("#keyworldMap").val();
      
      var kwdArr=kwd.split("("); 
      // alert(kwdArr[0]); 
      //ps.keywordSearch(kwdArr[0], placesSearchCB);
      
      // alert($("#keyworldMap").val()); 
      // 키워드 검색 완료 시 호출되는 콜백함수 입니다
      function placesSearchCB (status, data, pagination) {
          if (status === daum.maps.services.Status.OK) {

              // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
              // LatLngBounds 객체에 좌표를 추가합니다
              var bounds = new daum.maps.LatLngBounds();

              for (var i=0; i<data.places.length; i++) {
                  displayMarker(data.places[i]);    
                  bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
              }       

              // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
              map.setBounds(bounds);
          } 
      }

      // 지도에 마커를 표시하는 함수입니다
      function displayMarker(place) {
          
          // 마커를 생성하고 지도에 표시합니다
          var marker = new daum.maps.Marker({
              map: map,
              position: new daum.maps.LatLng(place.latitude, place.longitude) 
          });

          // 마커에 클릭이벤트를 등록합니다
          daum.maps.event.addListener(marker, 'click', function() {
              // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
              infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
              infowindow.open(map, marker);
          });
      }   
      
   }); */
</script>
<div class="Wrap">
	<p class="recDetail">채용정보 상세보기</p>
	<div>
		<span>등록일 :<fmt:formatDate value="${recVo.regdate }" 
		pattern="yyyy-MM-dd"/> </span>
		<div class="detail_right">
			<span class="url"> <a href="#">http://www.algoo.com/</a></span>
			<input type="button" class="button white medium" value="단축키 URL복사"></button>
		</div>
		<p class="clear_both"></p>
		<div class="detail_right">
			<input type="button" class="button white small" value="스크랩">
			<a href="localhost:9090/algoo/rec/recDeail.ag?recCode=${recVo.recCode }" 
			class="btnPrint"><input type="button" class="button white small " value="인쇄"></a>
			<input type="button" class="button white small" value="신고">
			<input type="button" class="button white small" value="E메일">
			<input type="button" class="button white small" value="FaceBook">
			<input type="button" class="button white small" value="Twiter">
		</div>
	</div>
	<p class="clear_both"></p>
	<div class="title"> ${recVo.title }</div>
	<div class="main_left detail_left">
		<div class="logo">
			<img alt="${compVo.compName }" 
			src="${recVo.imgURL }">
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
	  <p class="right_title">${compVo.compName }</p>
	  <dl class="clearBoth">
	     <dt>
	     <span class="titc">마감일</span>
	     <span class="txt_300">
	     <fmt:formatDate  value="${serviceVo.deadline}" 
	     pattern="yyyy-MM-dd"/> 
	     (마감일 ${serviceVo.days+1 }일전)</span>
	     </dt>
	     <dt>
	     <span class="titc">모집인원</span>
	     <span class="txt_300">${recVo.recruitMember }</span>
	     </dt>
	     <dt>
	     <span class="titc">성      별</span>
	     <span class="txt_300">${recVo.gender }</span>
	     </dt>
	     <dt>
	     <span class="titc">연      령</span>
	     <span class="txt_300">${recVo.age }</span>
	     </dt>
	     <dt>
	     <span class="titc">학      력</span>
	     <span class="txt_300">${recVo.educateLv }
	     </dt>
	  <p class="right_title">&nbsp;</p>
        <dt>
        <span class="titc">담  당 자</span>
        <span class="txt_300">${compVo.deptName }</span>
        </dt>	     
        <dt>
        <span class="titc">e - 메일</span>
        <span class="txt_300">${compVo.email1}@${compVo.email2 }</span>
        </dt>
        <dt>
        <span class="titc">전화번호</span>
        <span class="txt_300">
         ${compVo.hp1}-${compVo.hp2}-${compVo.hp3}</span>
        </dt>
        <dt>
            <span class="detail_left font_9 margin_left_70 border_radius padding_10_5 bon">
                           알구에서 채용정보 보고 전화드렸습니다.<br> 라고 연락하시면 문의가 쉽습니다.</span>
        </dt>
        <dt>
        <span class="titc">팩스번호</span>
        <span class="txt_300">${compVo.fax1 }-${compVo.fax2 }-${compVo.fax3 }</span>
        </dt>

	  </dl>
	  <br class="br"><br class="br">
	  <a href="#" class="detail_left"><img 
	  src="http://www.albamon.com/monimg/list/gi_skin/skin_v1_00/btn_app_online.gif"
	  alt="온라인지원"></a>
	  
	  <a href="#" class="detail_left decoration_none">&nbsp;<img 
     src="http://www.albamon.com/monimg/list/gi_skin/skin_v1_00/btn_app_email.gif"
     alt="e-메일지원"></a>
	  <br class="clear_both">
	  <div class="font_10 bon bold">e-메일 지원 시 자사양식 다운로드후 지원해 주세요.
	  <a href="#"><img
	  src="http://www.albamon.com/monimg/corp/icon_corpform_ft_01.gif"
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
				  
               <a href="#">${compVo.compSort }</a>,
             
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
	<div class="detail_area background bg">
	<dl class="clearBoth">
      <dt>
         <span class="titc">근무지역</span>
         <input id="keyworldMap" type="hidden" value="${recVo.address }">
         <span class="txt_300">${recVo.address }<br>[상세정보] ${rec.addressDetail }</span>
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
      <div id="map" class="border">

      
      <!-- * Daum 지도 --->
<!--  지도 노드 -->
<div id="map" style="width:100%;height:350px;"></div>
      
      </div> 
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

<%@ include file="../inc/simple_bottom.jsp" %>