<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

</style>
<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/recLayout.css'/>"/>

<link rel="stylesheet" type="text/css" 
href="<c:url value='/css/simpleButton.css'/>" />
<script type="text/javascript">
   $(document).ready(function(){
      CKEDITOR.replace('content');  
      $("#simple_top span").html("채용공고 등록");
      //simple_top 이용시 자기가 맡은화면 명칭 innerHTML로 붙여주기
      
      $("#serviceBt").click(function() {
        /* var userid
          = $("#userid").val(); */
       window.open(
            "<c:url value='/service/serviceWrite.ag'/>", "serviceWrite",
"width=450, height=200, left=10,top=50,resizable=yes,location=yes");
      });//serviceWrite
      
      $("#regBt").click(function() {
		 
    	  if($("#grade").val().length<1){
    		  alert("서비스기간을 설정해주세요");
    		  $("#serviceBt").focus();
    	  }else{
    		  frmWrite.action
              ="<c:url value='/rec/recWrite.ag'/>";
              frmWrite.submit()
    	  }
	});
      
      
   });
  </script>
  <script src="<c:url value='/ckeditor/ckeditor.js'/>" 
type="text/javascript"></script>




<form name="frmWrite" method="post" 
   action="<c:url value='/rec/recWrite.ag'/>">
	<div class="recWrite">
<div>
<input class="tit" type="text"
id="serviceCode" name="serviceCode"
readonly="readonly">
<span class="txt_85">서비스등급</span>
<input class="txth_35" type="text"
id="grade" name="grade"
readonly="readonly">
<span class="txt_85">서비스기간</span>
<input class="txt_35" type="text"
 id="days" name="days"
 readonly="readonly">
<input type="button" value="서비스기간설정"
 id="serviceBt" title="새창열림" class="white medium button">
 <input type="text" value="${compVo.compCode }"
 name="compCode" readonly="readonly">
 </div>
	<div id="div1"></div>
		<h2>기업 정보</h2>
		<div class="companyInfo bg">
			<dl class="clearBoth">
				<dt>
					<span class="tit">회사/점포명</span> 
					<input type="text" class="txt"
					readonly="readonly" value="${compVo.compName }">				
				</dt>
				<dt>
					<span class="tit">대표자명(ceo)</span>
					<input type="text" class="txt"
					readonly="readonly" value="${compVo.ceo }"
					>
				</dt>
				<dt>
					<span class="tit">사업자등록번호</span>
					<input type="text" class="txt"
					readonly="readonly" value="${compVo.compNum }">
				</dt>
				<dt>
					<span class="tit">회사/점포주소</span>
					<input type="text" class="txt"
					readonly="readonly" value="${compVo.address } 
					${compVo.addressDetail}">
				</dt>
				<dt>
					<span class="tit">회사이미지</span>
					<img alt="회사이미지1" src="#" 
style="width: 150px;height: 100px;border: 1px solid gray"> 
					<img alt="회사이미지2" src="#" 
style="width: 150px;height: 100px;border: 1px solid gray"> 
					<img alt="회사이미지3" src="#" 
style="width: 150px;height: 100px;border: 1px solid gray"> 
				</dt>
			</dl>
		</div>
		<h2 class="clearBoth">담당자 정보</h2>
		<div class="personInfo bg">
		 <dl>
           <dl class="clearBoth">
            <dt>
               <span class="tit">담당자명</span> 
               <input type="text" class="txt_60" placeholder="이름" name="detpName"
               value="${compVo.deptName }">
            </dt>
            <dt>
               <span class="tit">전화번호</span>
             
               <input type="text" class="phone1"
               name="phone1"
               placeholder="02" maxlength="3"
               value="${compVo.phone1 }">
               <input type="text" class="phone2"
               name="phone2" 
               placeholder="0000" maxlength="4"
               value="${compVo.phone2 }" >
               <input type="text" class="phone3"
               name="phone3"
               placeholder="0000" maxlength="4"
               value="${compVo.phone3 }">
            </dt>
            <dt class="clearBoth">
               <span class="tit">휴대폰</span>
            <input type="text" class="phone1"
               name="hp1"
               placeholder="010" maxlength="3"
               value="${compVo.hp1 }">
               <input type="text" class="phone2"
               name="hp2" 
               placeholder="0000" maxlength="4"
               value="${compVo.hp2 }" >
               <input type="text" class="phone3"
               name="hp3"
               placeholder="0000" maxlength="4"
               value="${compVo.hp3 }">
            </dt>
            <dt>
               <span class="tit">팩스번호</span>
             <input type="text" class="phone1"
               name="fax1"
               placeholder="010" maxlength="3"
               value="${compVo.fax1 }">
               <input type="text" class="phone2"
               name="fax2" 
               placeholder="0000" maxlength="4"
               value="${compVo.fax2 }" >
               <input type="text" class="phone3"
               name="fax3"
               placeholder="0000" maxlength="4"
               value="${compVo.fax3 }">
            </dt>
            <dt>
               <span class="tit">e-mail</span>
               <input type="text" class="email1"
               placeholder="exam123" value="${compVo.email1 }">
               <span class="txt_30">@</span>
               <input type="text" class="email2"
               placeholder=naver.com value="${compVo.email2 }">
               <select class="email3 medium white button"
               id=email3>
               <option value="naver">naver.com</option>
               <option value="hanmail">hanmail.net</option>
               <option value="google">google.com</option>
               <option value="nate">nate.com</option>
               <option value="etc">직접입력</option>
               </select>
            </dt>
         </dl>
         </dl>
		</div>

		<h2>업무내용 및 근무지정보</h2>
		<div class="workInfo bg">
		 <dl class="clearBoth">
            <dt>
               <span class="tit">근무회사/점포명</span> 
               <input type="text" class="txt_200"
               placeholder="회사명(지점명)" 
               name="compName">
            </dt>
            <dt >
               <span class="tit">채용제목</span>
               <input type="text" class="txt"
               placeholder="알바 구할땐? 알구!"
               name="title">
            </dt>
            <dt>
               <span class="tit">업직종</span>
               <select class="txt_180 button white medium"
               name="jobName" id="jobName">
               <option value="">1차직종</option>
               </select>
               <select class="txt_180 button white medium"
               name="jobName2" id="jobName2">
               <option value="">2차직종</option>
               </select>
               <select class="txt_180 button white medium"
               name="jobName3" id="jobName3">
               <option value="">3차직종</option>
               </select>
            </dt>
            <dt>
               <span class="tit">근무지주소</span>
                 <input type="text" class="txt_70"
                 placeholder="우편번호" name="zipcode"
                 id="zipcode" maxlength="5">
               
                   <input type="text" class="txt_100"
                 placeholder="주소" name="address"
                 id="address">
               
                  <input type="text" class="txt_150"
                 placeholder="상세주소" name="addressDetail"
                 id="addressDetail">
               
               <input type="button" class="white medium button txt_120"
               value="우편번호 찾기" id="zipcodeBt">
            </dt>
            <dt>
               <span class="tit">인근지하철</span>
                    <select class="txt_100 white medium button"
                    name="subRegion" id="subRegion">
               <option value="">지역</option>
               <option value="S">서울</option>
               <option value="I">인천</option>
               <option value="D">대전</option>
               <option value="G">광주</option>
               <option value="B">부산</option>
               </select>
                    <select class="txt_100 white medium button"
                    name="subNum" id="subNum">
               <option value="">호선</option>
               <option value="1">1호선</option>
              
               </select>
                    <select class="txt_150 white medium button"
                    name="subName" id="subName">
               <option value="">지하철역</option>
               <option value="c">청량리역</option>
               </select>
               <input type="text" class="txt_200"
               name="subInfo" id="subInfo" value="출구정보">
            </dt>
         </dl>
		</div>
		<h2>근무조건</h2>
		<div class="workCondition bg">
		  <dl class="clearBoth">
            <dt>
               <span class="tit">근무기간</span> 

               <label class="radio" for="one">
               <input type="radio" id="one"
               name="term" ></label>
               <span class="font_11 radio">하루(1일)</span>
               
               <label class="radio" for="week">
               <input type="radio" id="week"
               name="term"></label>
               <span class="font_11 radio">1주일이하</span>
               
               <label class="radio" for="month">
               <input type="radio" id="month"
               name="term"></label>
               <span class="font_11 radio">1주일~1개월
               </span>
               
               <label class="radio" for="threeMonth">
               <input type="radio" id="threeMonth"
               name="term"></label>
               <span class="font_11 radio">1개월~3개월
               </span>
               
               <label class="radio" for="sixMonth">
               <input type="radio" id="sixMonth"
               name="term"></label>
               <span class="font_11 radio">3개월~6개월
               </span>
               
               <label class="radio" for="year">
               <input type="radio" id="year"
               name="term"></label>
               <span class="font_11 radio">6개월~1년
               </span>
               
               <label class="radio" for="consult">
               <input type="radio" id="consult"
               name="term"></label>
               <span class="font_11 radio">기간협의
               </span>
               
            </dt>
            <dt>
               <span class="tit">근무요일</span>
                <label class="radio" for="MontoSun">
               <input type="radio" id="MontoSun" 
               name="days"></label>
               <span class="font_11 radio">월~일</span>
               
               <label class="radio" for="MontoSat">
               <input type="radio" id="MontoSat"
               name="days"></label>
               <span class="font_11 radio">월~토</span>
               
               <label class="radio" for="MontoFri">
               <input type="radio" id="MontoFri"
               name="days"></label>
               <span class="font_11 radio">월~금
               </span>
               
               <label class="radio" for="SatSun">
               <input type="radio" id="threeMonth"
               name="days"></label>
               <span class="font_11 radio">주말(토,일)
               </span>
               
               <label class="radio" for="sixDay">
               <input type="radio" id="sixDay"
               name="days"></label>
               <span class="font_11 radio">주 6일
               </span>
               
               <label class="radio" for="fiveDay">
               <input type="radio" id="fiveDay"
               name="days"></label>
               <span class="font_11 radio">주 5일
               </span>
               
               <label class="radio" for="fourDay">
               <input type="radio" id="fourDay"
               name="days"></label>
               <span class="font_11 radio">주 4일
               </span>
               
               <label class="radio" for="threeDay">
               <input type="radio" id="threeDay"
               name="days"></label>
               <span class="font_11 radio">주 3일
               </span>
               
               <label class="radio" for="twoDay">
               <input type="radio" id="twoDay"
               name="days"></label>
               <span class="font_11 radio">주 2일
               </span>
               
               <label class="radio" for="oneDay">
               <input type="radio" id="oneDay"
               name="days"></label>
               <span class="font_11 radio">주 1일
               </span>
               
            </dt>
            <dt>
               <span class="tit">근무시간</span>
               
               <select class="txt_85 white button medium">
               <option value="">시작</option>
               <c:forEach var="i" begin="0" end="24" step="1">
               <option value="${i} ">
               <c:if test="${i<10 }">
               0${i }시
               </c:if>
               <c:if test="${i>=10 }">
               ${i }시
               </c:if>
               </option>
               </c:forEach>
               </select>
               <select class="txt_85 white button medium">
               <option value="">시간</option>
              <c:forEach var="i" begin="0" end="60" step="10">
               <option value="${i} ">
               <c:if test="${i<10 }">
               0${i }분
               </c:if>
               <c:if test="${i>=10 }">
               ${i }분
               </c:if>
               </option>
               </c:forEach>
               </select>
               <span style="float: left;">~</span>
               
               <select class="txt_85 white button medium">
               <option value="">종료</option>
               <c:forEach var="i" begin="0" end="24" step="1">
               <option value="${i} ">
               <c:if test="${i<10 }">
               0${i }시
               </c:if>
               <c:if test="${i>=10 }">
               ${i }시
               </c:if>
               </option>
               </c:forEach>
               </select>
               <select class="txt_85 white button medium">
               <option value="">시간</option>
                <c:forEach var="i" begin="0" end="60" step="10">
               <option value="${i} ">
               <c:if test="${i<10 }">
               0${i }분
               </c:if>
               <c:if test="${i>=10 }">
               ${i }분
               </c:if>
               </option>
               </c:forEach>
               </select>

            </dt>
            <dt>
               <span class="tit">선택</span>
               <select class="txt_85 white button medium">
               <option value="">급여</option>
               <option value="day">일급</option>
               <option value="week">주급</option>
               <option value="month">월급</option>
               </select>
               <input type="text" class="txt_150"
               name="pay" id="pay" value="0">
                 <span class="txt_30">원</span>
               <span class="txt_150 font_11 pink">최저임금 6030원</span> 
            </dt>
            <dt>
               <span class="tit">근무형태</span>
               
               <span class="txt_70 font_11">
               <input type="checkbox" 
               value="A">알바</span>
               
                <span class="txt_75 font_11">
                <input type="checkbox" 
               value="J">정규직</span>
               
                <span class="txt_75 font_11">
                <input type="checkbox" 
               value="G">계약직</span>
               
                <span class="txt_75 font_11">
                <input type="checkbox" 
               value="F">파견직</span>
               
                <span class="txt_75 font_11">
                <input type="checkbox" 
               value="I">인턴직</span>
               
                <span class="txt_75 font_11">
                <input type="checkbox" 
               value="W">위촉직</span>
               
            </dt>
            <dt>
               <span class="tit">복리후생</span>
               <input type="text" class="txt"
               name="welfare" id="welfare">
             
            </dt>
         </dl>
		</div>
		<h2>지원조건</h2>
		<div class="requestCondition bg">
		   <dl class="clearBoth">
            <dt>
               <span class="tit">성별</span> 
                  
               <label class="radio" for="gender">
               <input type="radio" id="gender"
               name="gender"></label>
               <span class="font_11 radio">성별무관
               </span>
               
               <label class="radio" for="male">
               <input type="radio" id="male"
               name="gender"></label>
               <span class="font_11 radio">남성
               </span>

               <label class="radio" for="female">
               <input type="radio" id="female"
               name="gender"></label>
               <span class="font_11 radio">여성
               </span>
            </dt>
            <dt>
               <span class="tit">연령</span>
               
               <label class="radio" for="gender">
               <input type="radio" id="gender"
               name="gender"></label>
               <span class="font_11 radio">연령무관
               </span>
               
               <label class="radio" for="male">
               <input type="radio" id="male"
               name="gender"></label>
               <span class="font_11 radio">연령제한 있음
               </span>
               
               <label class="radio" for=oldAge>
               <input type="checkbox" id="oldAge"
               name="oldAge"></label>
               <span class="font_11 radio">고연령자 가능(65세이상)
               </span>
               
               <label class="radio" for=housewife>
               <input type="checkbox" id="housewife"
               name="housewife"></label>
               <span class="font_11 radio">주부 가능
               </span>
               
               <label class="radio" for=youngAge>
               <input type="checkbox" id="youngAge"
               name="youngAge"></label>
               <span class="font_11 radio">청소년가능(만18세 이상)
               </span>
            </dt>
            <dt>
               <span class="tit">학력조건</span>
               <label class="radio" for="eduLv">
               <input type="radio" id="eduLv"
               name="eduLv"></label>
               <span class="font_11 radio">학력무관
               </span>
               
               <label class="radio" for="middle">
               <input type="radio" id="middle"
               name="eduLv"></label>
               <span class="font_11 radio">중학교졸업
               </span>
               
               <label class="radio" for="high">
               <input type="radio" id="high"
               name="eduLv"></label>
               <span class="font_11 radio">고등학교졸업
               </span>
               
               <label class="radio" for="university2">
               <input type="radio" id="univ23"
               name="eduLv"></label>
               <span class="font_11 radio">대학(2,3년제)졸업
               </span>
               
               <label class="radio" for="university4">
               <input type="radio" id="univ4"
               name="eduLv"></label>
               <span class="font_11 radio">대학(4년제)졸업
               </span>
               
               <label class="radio" for="graduate">
               <input type="radio" id="graduate"
               name="eduLv"></label>
               <span class="font_11 radio">대학원졸업~
               </span>
               
            </dt>
            <dt>
               <span class="tit">경력사항</span>
                <label class="radio" for="work">
               <input type="radio" id="work"
               name="work"></label>
               <span class="font_11 radio">경력무관
               </span>
               
               <label class="radio" for="newcomer">
               <input type="radio" id="high"
               name="work"></label>
               <span class="font_11 radio">신입
               </span>
               
               <label class="radio" for="experience">
               <input type="radio" id="experience"
               name="work"></label>
               <span class="font_11 radio">경력
               </span>
               
            </dt>
            <dt>
               <span class="titc">우대조건</span>
               
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">동종업계 경력자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">관련자격증 소지자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">컴퓨터활용 가능자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">장기근무 가능자
               </span>
               
               <span class="clearBoth tit"></span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">영어 가능자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">일어 가능자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">중국어 가능자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">인근 거주자
               </span>
               
               <span class="clearBoth tit"></span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">운전면허 소지자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">원동기면허 소지자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">차량 소지자
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">군필자
               </span>
               
               <span class="clearBoth tit"></span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">여성
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">경력단절여성
               </span>
               
            </dt>
         </dl>
		</div>
		<h2>모집내용</h2>
		<div class="recContent bg">
		   <dl class="clearBoth">
            <dt>
               <span class="tit">모집인원</span> 
               <input type="text" class="txt_35"
               placeholder="10">
               <span class="by">명</span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txt_30">0명
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txt_30">00명
               </span>
            </dt>
            <dt>
               <span class="tit">모집대상</span>
               <span class="txt_60 font_11">
               <input type="checkbox" 
               value="A">청소년</span>
               
                <span class="txt_60 font_11">
                <input type="checkbox" 
               value="J">대학생</span>
               
                <span class="txth_50 font_11">
                <input type="checkbox" 
               value="G">주부</span>
               
                <span class="txt_50 font_11">
                <input type="checkbox" 
               value="F">장년</span>
               
                <span class="txt_60 font_11">
                <input type="checkbox" 
               value="I">장애인</span>
               
                <span class="txt_60 font_11">
                <input type="checkbox" 
               value="W">초보자</span>
               
               <span class="txt_75 font_11">
                <input type="checkbox" 
               value="W">재택가능</span>
            </dt>
            <dt>
               <span class="tit">모집종료일</span>
               
               <label class="radio" for="one">
               <input type="radio" id="one"
               name="term" ></label>
               
               <span class="font_11 radio">
               <input type="text" >
               <button>날짜선택</button> </span>
               
               <label class="radio" for="week">
               <input type="radio" id="week"
               name="term"></label>
               <span class="font_11 radio">1주일이하</span>
               
               <label class="radio" for="month">
               <input type="radio" id="month"
               name="term"></label>
               <span class="font_11 radio">1주일~1개월
               </span>
            </dt>
            <dt>
               <span class="tit">접수방법</span>
                <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_70">온라인지원
               </span>
                <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_70">e-메일지원
               </span>
                <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_60">전화연락
               </span>
                <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_60">방문접수
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_30">우편
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_30">팩스
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_60">홈페이지
               </span>
               <span class="tit"></span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_200">자사지원양식
               (<input type="radio">필수,
               <input type="radio">선택 )
               </span>
               
            </dt>
            <dt>
               <span class="tit">제출서류</span>
               
                <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_45">이력서
               </span>
               
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_80">주민등록등본
               </span>
               
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_45">보건증
               </span>
               
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_45">보건증
               </span>
               
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_70">자기소개서
               </span>
               
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 txth_80">부모님동의서
               </span>
            </dt>
         </dl>
		</div>
		<h2>상세모집요강</h2>
		<div class="detailContent">
		<div>
		 <textarea id="content" name="content" 
         rows="12" cols="40"></textarea>
         </div>
		</div>
	</div>
	<div class="align_center">
	<input class="white button "
	id="regBt" 
	type="button" value="확인">
	<input class="white button " type="reset" value="취소">
	</div>
</form>

<%@ include file="../inc/simple_bottom.jsp" %>