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
<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript"></script>
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
      
      
      
   });
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
			<input type="button" class="button white small" value="인쇄">
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

		채용기업정보
		<input type="button" class="white button small" value="?">
		<a href="" class="detail_right font_11 ">자세히보기></a> <br class="br">
		<div class="">
			<dl style="display: block;" class="clearBoth">
				<dt>${compVo.compName }</dt>
				<dt>
					 <a href="${compVo.homepage }">
					 ${compVo.homepage }</a>
				</dt>
				<br>
				<dt>
					<span class="titd">대표자</span> 
					<span class="txt_180">${compVo.ceo }</span>
				</dt>
				<dt>
					<span class="titd">회사주소</span> 
					<span class="txt_180">${compVo.address }</span>
				</dt>
				<dt>
					<span class="titd">사업내용</span> 
					<span class="txt_180">${compVo.content }</span>
				</dt>

			</dl>
		</div>
	</div>
	<div class="main_right detail_right">
	  <p class="right_title">${compVo.compName }</p>
	  <dl class="clearBoth">
	     <dt>
	     <span class="titd">마감일</span>
	     <span class="txt_400">
	     <fmt:formatDate  value="${serviceVo.deadline}" 
	     pattern="yyyy-MM-dd"/> 
	     (마감일 ${serviceVo.days+1 }일전)</span>
	     </dt>
	     <dt>
	     <span class="titd">모집인원</span>
	     <span class="txt_400">${recVo.recruitMember }</span>
	     </dt>
	     <dt>
	     <span class="titd">성      별</span>
	     <span class="txt_400">${recVo.gender }</span>
	     </dt>
	     <dt>
	     <span class="titd">연      령</span>
	     <span class="txt_400">${recVo.age }</span>
	     </dt>
	     <dt>
	     <span class="titd">학      력</span>
	     <span class="txt_400">${recVo.educateLv }
	     </dt>
	  <p class="right_title">&nbsp;</p>
        <dt>
        <span class="titd">담  당 자</span>
        <span class="txt_400">${compVo.deptName }</span>
        </dt>	     
        <dt>
        <span class="titd">e - 메일</span>
        <span class="txt_400">${compVo.email1}@${compVo.email2 }</span>
        </dt>
        <dt>
        <span class="titd">전화번호</span>
        <span class="txt_400">
         ${compVo.hp1}-${compVo.hp2}-${compVo.hp3}</span>
        </dt>
        <dt>
            <span class="detail_left font_9 margin_left_70 border_radius padding_10_5">
                           알구에서 채용정보 보고 전화드렸습니다. 라고 연락하시면 문의가 쉽습니다.</span>
        </dt>
        <dt>
        <span class="titd">팩스번호</span>
        <span class="txt_400">${compVo.fax1 }-${compVo.fax2 }-${compVo.fax3 }</span>
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
	  <div class="font_13">e-메일 지원 시 자사양식 다운로드후 지원해 주세요.
	  <a href="#"><img
	  src="http://www.albamon.com/monimg/corp/icon_corpform_ft_01.gif"
	  alt="양식다운로드"
	  ></a>
	  </div>
	</div>
	
	<div class="bg clear_both main_board border_tb10 font_11 align_right">
	 <span class="bold">현금카드, 통장비밀번호 요구엔 절대 응대하지 마세요.</span> 
	 취업을 빙자한 사기의 위험이 있습니다.&nbsp;&nbsp;&nbsp;&nbsp;
	 <a href="#" target="_blank">자세히 보기 ></a></div>

	<div class="border_bottom font_13 bold">> 업무조건 및 근무조건</div>
	<div class="detail_content background bg">
		<dl class="clearBoth">
			<dt>
				<span class="titd">고용형태</span> 
				<span class="txt_720">${recVo.recruitType }</span>
			</dt>
			<dt>
				<span class="titd">업직종</span> 
				<span class="txt_720 decoration_none">
				  
               <a href="#">${compVo.compSort }</a>,
             
            </span>
			</dt>
			<dt>
            <span class="titd">근무기간</span> 
            <span class="txt_720">${recVo.workTerm }
            
            </span>
         </dt>
         <dt>
            <span class="titd">근무요일</span> 
            <span class="txt_720">${recVo.workDays }</span>
         </dt>
         <dt>
            <span class="titd">근무시간</span> 
            <span class="txt_720">
            ${recVo.workTime }:${recVo.workTime2 }
            ~
            ${recVo.workTime3 }:${recVo.workTime4 }
            </span>
         </dt>
         <dt>
            <span class="titd">급여</span> 
            <span class="txt_720">

            <fmt:formatNumber value="${recVo.pay }" 
            pattern="#,###" /> 원</span>
         </dt>
         <dt>
            <span class="titd">복리후생</span> 
            <span class="txt_720">${recVo.welfare }</span>
         </dt>
		</dl>
	</div>
	<div class="border_bottom font_13 bold">> 근무지역</div>
	<div class="detail_area background bg">
	<dl class="clearBoth">
      <dt>
         <span class="titd">근무지역</span>
         <span class="txt_720">${recVo.address }<br>[상세정보] ${rec.addressDetail }</span>
      </dt>	
         
	   <dt>
         <span class="titd">인근전철</span>
         <span class="txt_720">
            ${recVo.subRegion }
            ${recVo.subNum }
            ${recVo.subName }
            ${recVo.subInfo }
         </span>
      </dt> 
      <dt>
         <span class="titd">지도</span>
         <span class="txt_720">※ 지도는  <span class="red textBox">근무지 위치</span>를 나타내며 회사 소재지와 일치하지 않을 수 있습니다.</span>
      </dt>
      <div id="map" class="border">지도나올영역 </div> 
	</dl>
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