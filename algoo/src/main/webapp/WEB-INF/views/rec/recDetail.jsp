<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../inc/simple_top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.Wrap {
	width: 800px;
}
.border{
   border: 1px solid #eee;
}
.recDetail {
	font: 1em;
	font-weight: bold;
}
.detail_content{
   width: 800px;
   height: 220px;
}
.detail_area{
   width: 800px;
   height: 700px;
}
.detail_rec{
   width: 800px;
   height: 500px;
}
.detail_right {
	float: right;
}

.detail_left {
	float: left;
}

.clear_both {
	clear: both;
}

.br {
	padding: 20px 0 20px 0;
}

.title {
	padding: 30px 30px;
   border: 1px solid black;
	text-align: center;
	font-weight: bold;
}

.logo {
border: 1px solid black;
	width: 272px;
	height: 172px;
	padding: 30px 0 30px 0;
}

.logo img {
	width: 200px;
	height: 100px;
	padding: 30px 33px;
}

.main_left {
	width: 274px;
	height: 530px;
	border: 1px solid black;
}

.main_right {
	width: 480px;
	height: 530px;
	border: 1px solid black;
	margin: 0;
}

.tit {
	width: 70px;
	float: left;
	font: 11px dotumn, "돋움";
}

.txt_180 {
	float: left;
	width: 180px;
	font: 11px dotumn, "돋움";
	margin-bottom: 5px;
}
.txt_720 {
	float: left;
	width: 720px;
	font: 15px dotumn, "돋움";
	margin-bottom: 5px;
}

.tit_15 {
	width: 70px;
	float: left;
	font: 15px dotumn, "돋움";
	font-weight:bold; 
}

.txt_400 {
	float: left;
	width: 400px;
	font: 15px dotumn, "돋움";
	margin-bottom: 5px;
}
.txt_30 {
	float: left;
	width: 30px;
	font: 15px dotumn, "돋움";
}

.skip {
	overflow: hidden;
	padding: 0 0 3px 0;
	font: 11px dotumn, "돋움";
}
.decoration_none,.decoration_none a{
   text-decoration: none;
}
.right_title{
   border-bottom: 1px solid #AAA;
   padding-bottom: 5px;
}
.font_9{
   font-size: 9;
}
.font_11{
   font-size: 11;
}
.font_13{
   font-size: 13;
}
.font_15{
   font-size: 15;
}
.margin_left_70{
   margin: 10px 0 10px 70px;
}
.margin_left_20{
   margin-left: 20px;
}
.dt_20 dt{
   margin:20px 0 0 20px; 
}

.border_radius{
   border: 1px solid gray; 
   border-radius: 20px;
}
.padding_10_5{
   padding: 10px 5px;
}
.main_board{
   text-align: center;
   padding: 10px 0;
}
.border_tb10{
   border-top: 10px solid #FFF;
   border-bottom: 10px solid #FFF;
}
.border_bottom{
   border-bottom: 2px solid skyblue;
   padding-bottom: 5px;
}
.bold{
   font-weight: bold;
}
.align_right{
   text-align: right;
}
.align_center{
   text-align: center;
}
.align_left{
   text-align: left;
}
.bg{
   border: 1px solid black;
   padding: 20px;
}
.red{
   color: red;
}
.blue{
   color: blue;
}
.green{
   color: green;
}
#map{
   float:left;
   width: 770px;
   height: 510px;
}
.margin_0{
   margin: 0;
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
<script type="text/javascript">
<script type="text/javascript"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $("#simple_top span").html("채용정보");
      //simple_top 이용시 자기가 맡은화면 명칭 innerHTML로 붙여주기
   });
</script>
<div class="Wrap">
	<p class="recDetail">채용정보 상세보기</p>
	<div>
		<span>등록일 :<fmt:formatDate value="${recVo.regdate }" 
		pattern="yyyy-MM-dd hh:mm:ss"/> </span>
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
			<img alt="로고이미지" 
			src="http://fileco.jobkorea.co.kr/albamon/Co_Logo/Mon_C_Photo_View.asp?FN=2015\5\JK_CO_nuri9.jpg">
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
	     (마감일 ${serviceVo.days }일전)</span>
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
	     <span class="txt_30">${recVo.educateLv }
	     </span><img  alt="우대사항" 
	     src="http://www.albamon.com/monimg/list/gi_skin/skin_v1_comm/icon_univ2.gif">
	     </dt>
	  <p class="right_title"></p>
        <dt>
        <span class="titd">담  당 자</span>
        <span class="txt_400">${compVo.deptName }</span>
        </dt>	     
        <dt>
        <span class="titd">e - 메일</span>
        <span class="txt_400">${email1}@${email2 }</span>
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
               <a href="#"><img alt="초보가능 " 
src="http://www.albamon.com/monimg/list/gi_skin/skin_v1_comm/icon_begin.gif"></a>
               <a href="#"><img alt="동종업종 유경ㅎ엄자 우대 " 
src="http://www.albamon.com/monimg/list/gi_skin/skin_v1_comm/icon_sameex.gif"></a>
            </span>
			</dt>
			<dt>
            <span class="titd">근무기간</span> 
            <span class="txt_720">${recVo.workTerm }
            <img alt="협의가능" 
src="http://www.albamon.com/monimg/list/gi_skin/skin_v1_comm/icon_consult.gif">
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
            <img alt="일" 
src="http://www.albamon.com/monimg/list/gi_skin/skin_v1_comm/fee_w_day.gif">
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
            <img alt="2호선" 
            src="http://www.albamon.com/monimg/list/gi_skin/skin_v1_comm/icon_metro_line2.gif">
            ${recVo.subRegion }
            ${recVo.subNum }
            ${recVo.subName }
            ${recVo.subInfo }
         </span>
      </dt> 
      <dt>
         <span class="titd">지도</span>
         <span class="txt_720">※ 지도는  <span class="red">근무지 위치</span>를 나타내며 회사 소재지와 일치하지 않을 수 있습니다.</span>
      </dt>
      <div id="map" class="border">지도나올영역 </div> 
	</dl>
	</div>
	<div class="border_bottom font_13 bold">> 상세 모집 요강</div>
	<div class="detail_rec bg">
 	  <dl class="dt_20">
	     <dt>■ 업무 내용</dt>
	     <dd>대학교에서 기업행사 업무<br></dd>
	     <dt>■ 근무 시간</dt>
	     <dd>대학교에서 기업행사 업무<br></dd>
	     <dt>■ 근무 기간</dt>
	     <dd>9월 ~ 11월</dd>
	     <dd>(개인 일정에 맞추어 일자 조절 가능, 단 1달 이상 필수 근무)
	     <dt>■ 성별 및 나이 : 무관</dt> 
	     <dt>■ 급여 조건</dt>
	     <dd>지역에 따라,일급: 61,000원 ~ 102,000원</dd>
	     <dd class="margin_left_20">※ 교통비, 중식대 별도 지급</dd>
	     <dt>■ 우대 사항 : 외향적/사교적인 성격</dt>
	     <dt>■ 채용 진행 : 이력서 검토 후 면접 진행(면접 일시 개별 통보)
	     <dt>■ 관련 문의 : 02-710-5377
	     <dt>■ 회사 홈페이지 : www.nurimedia.co.kr
	</div>
	
</div>

<%@ include file="../inc/simple_bottom.jsp" %>