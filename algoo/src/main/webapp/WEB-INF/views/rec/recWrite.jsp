<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/recLayout.css'/>" />
   
<script type="text/javascript" src
="<c:url value='../api/scrollup-master/dist/jquery.scrollUp.min.js'/>"></script>
<script type="text/javascript" src
="<c:url value='../api/scrollup-master/src/jquery.scrollUp.js'/>"></script>
<script type="text/javascript" src
="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript" src
="<c:url value='/js/recWrite.js'/>"></script>
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/simpleButton.css'/>" />
<script src="<c:url value='/ckeditor/ckeditor.js'/>"
   type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>"
   type="text/css">
<script src="<c:url value='/jquery/jquery-ui.js'/>"
   type="text/javascript"></script>

<script type="text/javascript">
 
   $(document).ready(function() {
	   
	   //모집인원 입력시 체크해제되도록
	   $("#writeMember").keyup(function() {
        $("#tenPeople").attr('checked',false);
        $("#hundredPeople").attr('checked',false);
		
        var abc=$("#writeMember").val().length;
	         
		 if(abc>=1){
			 if($("#tenPeople").is(":checked")){
			 $("#tenPeople").trigger('click');
			 }
			 if($("#hundredPeople").is(":checked")){
			 $("#hundredPeople").trigger('click');
			 }
			   $("#tenPeople").attr('disabled',true); 
			   $("#hundredPeople").attr('disabled',true);
		 }else{
			
			   $("#tenPeople").attr('disabled',false); 
			   $("#hundredPeople").attr('disabled',false);
		 }
		});
	   
	   //스크롤업
	   $(function(){
		   $.scrollUp();
		 });
	   
	   
   $("#simple_top span").html("채용공고 등록");
   //simple_top 이용시 자기가 맡은화면 명칭 innerHTML로 붙여주기

   //서비스 등록 버튼을 눌렀을때
   $("#submitBt").click(function() {
            $("#grade").val($("#gradeSel option:selected").val())
            $("#days").val($("#daysSel option:selected").val())
            $("#divService").html("");
            $("#submitBt").hide();
            $("#serviceInfo").show();
            $("#serviceBt").show();
   });
   var res = "";

   //서비스기간설정버튼을 눌렀을때   
   $("#serviceBt").click(function() {
      $("#submitBt").show();
      $("#serviceInfo").hide();
      $("#serviceBt").hide();

         $.ajax({
            url : "<c:url value='/service/serviceWrite.ag'/>",
            type : "GET",
            success : function(res) {
            res = '<form method="post" name="frmService" id="frmService" ';
            res += 'action="<c:url value='/service/serviceWrite.ag'/>" style="display:inline" >';
            res += '<select class="button small white"  id="gradeSel">';
            res += '<option value="슈퍼">슈퍼</option>';
            res += '<option value="그랜드">그랜드</option>';
            res += '<option value="프리미엄">프리미엄</option>';
            res += '<option value="일반">일반</option></select>';
            res += '<select class="button small white"  id="daysSel">';
            res += '<option value="1">1일</option>';
            res += '<option value="7">7일</option>';
            res += '<option value="30">30일</option>';
            res += '<option value="90">90일</option>';
            res += '<option value="180">180일</option></select>';
            res += ' </form>';
            $("#divService").html(res);
         },
         error : function(xhr,status, error) {
            alert(status + ":"+ error);
         },
      });//aj
   }); //click  

   $("#regBt").click(function() {
      if ($("#grade").val().length < 1) {
         alert("서비스기간을 설정해주세요");
         $("#serviceBt").focus();
      } else if ($("#title").val().length < 1) {
         alert("채용 제목을 설정해주세요");
         $("#title").focus();
      } else if ($("#grade").val().length < 1) {
         alert("등급을 선택하세요");
         $("#grade").focus();
      return false;
      } else if ($("#days").val() == 0) {
         alert("기간을 선택하세요");
         $("#days").focus();
      return false;
      } else {
         frm1.action = "<c:url value='/rec/recWrite.ag'/>";
         frm1.submit();
      }
      });//click

   $("#recListBt").click(function() {
      frmList.action = "<c:url value='/rec/recList.ag'/>";
      frmList.submit();
   //나중에 카테고리 추가 예정
   });//click

   //호선별 역정보   
   $("#subNum").change(function() {
      $("#subName").html("");
      var subway2 = "";
      var result2 = "";
      var sw = $(
      "#subNum > option:selected").val();
      $.ajax({
         url : "<c:url value='/json/Subway.json'/>",
         type : "GET",
         dataType : "json",
         success : function(res2) {
         $.each(res2.DATA,function() {
            if (sw == this.LINE_NUM) {
               subway2 += "<option value="+this.STATION_NM+">";
               subway2 += this.STATION_NM + "</option>";
            }//if 
      });

         result2 += subway2
         $("#subName").html(result2);
      },
         error : function(xhr,statust, error) {
            alert(status + ":"+ error);
         }
      });
   }); //change

   //지역별 호선 정보 
   $("#subRegion").change(function() {
      $("#subNum").html("");
      $("#subName").html("");
      var subway = "";
      var result = "";
      $.ajax({
         url : "<c:url value='/json/SubwayRegion.json'/>",
         type : "GET",
         dataType : "json",
         success : function(res) {
            $.each(res.DATA,function() {
               if ($("#subRegion option:selected").val() == this.REGION_NM) {
                  subway += "<option value="+this.LINE_NUM+">";
                  subway += this.LINE_NM
                        + "</option>";
               }//if 
            });
               result += subway
               $("#subNum").html(result);

         },
            error : function(xhr,statust, error) {
                  alert(status + ":"+ error);
            }
         });

   });//change

   //직업 정보1 
   $("#jobName").ready(function() {
      $("#jobName").html("");
      var jobN = "";
      $.ajax({
         url : "<c:url value='/json/Job.json'/>",
         type : "GET",
         dataType : "json",
         success : function(res) {
         $.each(res.DATA,function() {
         jobN += "<option value="+this.JOB_CODE+">";
         jobN += this.JOB_FIRST+ "</option>";
      });
         $("#jobName").html(jobN);
      },
         error : function(xhr,statust, error) {
            alert(status + ":"+ error);
        }
      });
   });
   
   
   //직업 정보2
   $("#jobName").change(function() {
      $("#jobName2").html("");
      var jobN2 = "";
      var sw = $("#jobName option:selected").val();
      $.ajax({
         url : "<c:url value='/json/Job2.json'/>",
         type : "GET",
         dataType : "json",
         success : function(res) {
            $.each(res.DATA,function() {
               if (sw == this.JOB_CODE) {
                  jobN2 += "<option value="+this.JOB_SECOND+">";
                  jobN2 += this.JOB_SECOND+ "</option>";
               }//if 
            });
         $("#jobName2").html(jobN2);

         },
            error : function(xhr,statust, error) {
               alert(status + ":"+ error);
            }
         });
   });//change
});
   
   
	   //최저임금셋팅
	   var minPay=6030;
	   function minPaySet(){
		   $("#pay").val(minPay);
	   }
	   
	
</script>


<form name="frm1" method="post"
   action="<c:url value='/rec/recWrite.ag'/>">
   <div id="divService" style="margin-left: 50px;"></div> 
       <input class="button small white" type="button" id="submitBt" 
        value="서비스 설정" >  
        
   
   <div class="recWrite">
      <div id="serviceInfo">

         <span class="txt_85">서비스등급</span> 
         <input class="txth_35" type="text" size="30"
          id="grade" name="grade" readonly="readonly"
          value="일반"> 
        <span class="txt_85">서비스기간</span> 
        <input class="txt_35" type="text" id="days" 
          name="days" readonly="readonly" value="1">
        </div>
      <input type="button" value="서비스 선택" id="serviceBt" 
        title="보여주기" class="white small button "> 
    

      <input type="hidden" value="${compVo.compCode }" 
        name="compCode" readonly="readonly">


      <div id="div1"></div>
      <h2>기업 정보</h2>
      <div class="companyInfo bg">
         <dl class="clearBoth">
            <dt>
               <span class="tit">회사/점포명</span> <input type="text" class="txt_150"
                  readonly="readonly" value="${compVo.compName }">
            </dt>
            <dt>
               <span class="tit">대표자명(ceo)</span> <input type="text"
                  class="txt_150" readonly="readonly" value="${compVo.ceo }">
            </dt>
            <dt>
               <span class="tit">사업자등록번호</span> <input type="text" class="txt_150"
                  readonly="readonly" value="${compVo.compNum }">
            </dt>
            <dt>
               <span class="tit">회사/점포주소</span> <input type="text" class="txt"
                  readonly="readonly"
                  value="${compVo.address } 
                         ${compVo.addressDetail}">
            </dt>
            <!--  <dt>
               <span class="tit">회사이미지</span>
               <img alt="회사이미지1" src="#" 
style="width: 150px;height: 100px;border: 1px solid gray"> 
               <img alt="회사이미지2" src="#" 
style="width: 150px;height: 100px;border: 1px solid gray"> 
               <img alt="회사이미지3" src="#" 
style="width: 150px;height: 100px;border: 1px solid gray"> 
      </dt>
      <dt>
      <form><input class="textBox" type="file"
       value="파일업로드"></form>
      </dt> -->
         </dl>
      </div>
      <!-- 담당자 정보 -->
      <h2 class="clearBoth">담당자 정보</h2>
      <div class="personInfo bg">
         <dl class="clearBoth">
            <dt>
               <span class="tit">담당자명</span> <input type="text" class="txt_60"
                  placeholder="이름" name="detpName" value="${compVo.deptName }">
            </dt>
            <dt>
               <span class="tit">전화번호</span> 
               <input type="text" class="phone1"
                 name="phone1" placeholder="02" maxlength="3"
                 value="${compVo.phone1 }"> 
               <input type="text" class="phone2" name="phone2" 
                 placeholder="0000" maxlength="4"
                 value="${compVo.phone2 }"> 
               <input type="text" class="phone3" name="phone3" 
                 placeholder="0000" maxlength="4"
                 value="${compVo.phone3 }">
            </dt>
            <dt class="clearBoth">
               <span class="tit">휴대폰</span> <input type="text" class="phone1"
                  name="hp1" placeholder="010" maxlength="3" value="${compVo.hp1 }">
               <input type="text" class="phone2" name="hp2" placeholder="0000"
                  maxlength="4" value="${compVo.hp2 }"> <input type="text"
                  class="phone3" name="hp3" placeholder="0000" maxlength="4"
                  value="${compVo.hp3 }">
            </dt>
            <dt>
               <span class="tit">팩스번호</span> <input type="text" class="phone1"
                  name="fax1" placeholder="010" maxlength="3"
                  value="${compVo.fax1 }"> <input type="text" class="phone2"
                  name="fax2" placeholder="0000" maxlength="4"
                  value="${compVo.fax2 }"> <input type="text"
                  class="phone3" name="fax3" placeholder="0000" maxlength="4"
                  value="${compVo.fax3 }">
            </dt>
            <dt>
               <span class="tit">e-mail</span> 
               <input type="text" class="email1"
                 placeholder="exam123" value="${compVo.email1 }"> 
               <span style="margin-top: 7px;float: left">
               @</span> 
               <select class="floatLeft small button white" id=email2
               style="margin-top: 10px">
                  <option value="naver">naver.com</option>
                  <option value="hanmail">hanmail.net</option>
                  <option value="google">google.com</option>
                  <option value="nate">nate.com</option>
                  <option value="etc">직접입력</option>
               </select>
               <input type="text" class="email3" placeholder=naver.com
                 id="email3" value="${compVo.email2 }">
               
               
            </dt>
         </dl>
      </div>
      <!-- 근무지 정보 -->
      <h2>근무지정보</h2>
      <div class=" workInfo bg">
         <dl class="clearBoth">
            <dt>
               <span class="tit">근무회사/점포명</span> <input type="text"
                  class="txt_200" placeholder="회사명(지점명)" maxlength="30"
                  name="compName">
            </dt>
            <dt>
               <span class="tit">채용제목</span> <input type="text" class="txt"
                  placeholder="성실하게 함께할 가족 구합니다" name="title" id="title"
                  maxlength="33">
            </dt>
            <dt>
               <span class="tit">업직종</span>
               <select class="white small button"  
                name="jobName" id="jobName"> </select>
                <select  class="white small button"
                name="jobName2" id="jobName2">
                <option value="null">직종선택</option>
               </select>
               
            </dt>
            <dt>
               <span class="tit">근무지주소</span> <input type="text" class="txt_70"
                  placeholder="우편번호" name="zipcode" id="zipcode" readonly="readonly">
               <input type="text" class="txt_500" placeholder="주소" name="address"
                  id="address" readonly="readonly">
            </dt>
            <dt>
               <span class="tit">상세주소</span> <input type="text" class="txt_500"
                  placeholder="상세주소" name="addressDetail" id="addressDetail">

               <input type="button" class="white textBox" value="우편번호 찾기"
                  id="btnZipcode">
            </dt>
            <dt>
               <span class="tit">인근지하철</span> <select
                  class="txt_100 white small textBox" name="subRegion"
                  id="subRegion">
                  <option value="null">지역</option>
                  <option value="서울">서울</option>
                  <option value="인천">인천</option>
                  <option value="대전">대전</option>
                  <option value="광주">광주</option>
                  <option value="부산">부산</option>
               </select> <select class="txt_150 white small textBox" name="subNum"
                  id="subNum">
               </select> <select class="txt_150 white small textBox" name="subName"
                  id="subName">

               </select> <input type="text" class="txt_200" name="subInfo" id="subInfo"
               placeholder="1번출구  500m이내" >
            </dt>
         </dl>
      </div>
      <!-- 근무조건 -->
      <h2>근무조건</h2>
      <div class="workCondition bg checks">
         <dl class="clearBoth">
            <dt>
               <span class="tit">근무기간</span> <input type="radio" id="one"
                  name="workTerm" value="하루(1일)" checked="checked"> <label
                  for="one"> 하루(1일)</label> <input type="radio" id="week"
                  name="workTerm" value="1주일이하"> <label for="week">
                  1주일이하</label> <input type="radio" id="month" name="workTerm"
                  value="1주일~1개월"> <label for="month"> 1주일~1개월</label> <input
                  type="radio" id="threeMonth" name="workTerm" value="1개월~3개월">
               <label for="threeMonth"> 1개월~3개월</label> <input type="radio"
                  id="sixMonth" name="workTerm" value="3개월~6개월"> <label
                  for="sixMonth"> 3개월~6개월 </label> <input type="radio" id="year"
                  name="workTerm" value="6개월~1년"> <label for="year">
                  6개월~1년</label> <input type="radio" id="consult" name="workTerm"
                  value="기간협의"> <label for="consult"> 기간협의</label>

            </dt>
            <dt>
               <span class="tit">근무요일</span> <input type="radio" id="MontoSun"
                  name="workDays" checked="checked" value="월~일"> <label
                  for="MontoSun"> 월~일</label> <input type="radio" id="MontoSat"
                  name="workDays" value="월~토"> <label for="MontoSat">
                  월~토</label> <input type="radio" id="MontoFri" name="workDays" value="월~금">
               <label for="MontoFri"> 월~금</label> <input type="radio" id="SatSun"
                  name="workDays" value="주말(토,일)"> <label for="SatSun">
                  주말(토,일)</label> <input type="radio" id="sixDay" name="workDays"
                  value="주 6일"> <label for="sixDay"> 주 6일</label> <input
                  type="radio" id="fiveDay" name="workDays" value="주 5일"> <label
                  for="fiveDay"> 주 5일</label> <input type="radio" id="fourDay"
                  name="workDays" value="주 4일"> <label for="fourDay">
                  주 4일</label> <input type="radio" id="threeDay" name="workDays"
                  value="주 3일"> <label for="threeDay"> 주 3일</label> <input
                  type="radio" id="twoDay" name="workDays" value="주 2일"> <label
                  for="twoDay"> 주 2일</label> <input type="radio" id="oneDay"
                  name="workDays" value="주 1일"> <label for="oneDay">
                  주 1일</label>


            </dt>
            <dt>
               <span class="tit" style="height: 20px;">근무시간 </span><select
                  class="txt_85 white textBox small" 
                  name="workTime">
                  <c:forEach var="i" begin="0" end="24" step="1">
                     <c:if test="${i<10 }">
                        <c:set var="j" value="0${i}" />

                        <option value="${j}">${j}시</option>
                     </c:if>
                     <c:if test="${i>=10}">

                        <option value="${i}">${i}시</option>
                     </c:if>
                  </c:forEach>
               </select> <select class="txt_85 white textBox small" name="workTime2">
                  <c:forEach var="i" begin="0" end="60" step="10">
                     <c:if test="${i<10 }">
                        <c:set var="j" value="0${i}" />

                        <option value="${j}">${j}분</option>
                     </c:if>
                     <c:if test="${i>=10}">

                        <option value="${i}">${i}분</option>
                     </c:if>
                  </c:forEach>
               </select> <span style="float: left;">~ </span><select
                  class="txt_85 white textBox small" name="workTime3">
                  <!-- <option value="null">종료</option> -->
                  <c:forEach var="i" begin="0" end="24" step="1">
                     <c:if test="${i<10 }">
                        <c:set var="j" value="0${i}" />
                        <option value="${j}">${j}시</option>
                     </c:if>
                     <c:if test="${i>=10}">

                        <option value="${i}">${i}시</option>
                     </c:if>
                  </c:forEach>
               </select> <select class="txt_85 white textBox small" name="workTime4">
                  <!-- <option value="null">시간</option> -->
                  <c:forEach var="i" begin="0" end="60" step="10">
                     <c:if test="${i<10 }">
                        <c:set var="j" value="0${i}" />
                        <option value="${j}">${j}분</option>
                     </c:if>
                     <c:if test="${i>=10}">
                        <option value="${i}">${i}분</option>
                     </c:if>
                  </c:forEach>
               </select>

            </dt>
            <dt>
               <span class="tit" >급여선택</span> 
               <select class="txt_85 white textBox small" 
                  name="payType" style="margin-top: 10px">
                  <option value="시급">시급</option>
                  <option value="일급">일당</option>
                  <option value="주급">주급</option>
                  <option value="월급">월급</option>
                  <option value="연봉">연봉</option>
               </select> 
               <input type="text" class="txt_150" 
               name="pay" id="pay" value="0">
               <span class="txt_30">원</span> 
              
                <input id="minPay" value="최저임금  6030원"
                class="white small"
                type="button" onclick="minPaySet()"> 
            </dt>
            <dt >
               <span class="tit">근무형태</span> <input type="checkbox"
                  name="recruitType" value="알바" id="alba"> <label for="alba">알바</label>


               <input type="checkbox" value="J" id="jung"> <label
                  for="jung"> 정규직</label> <input type="checkbox" value="G" id="gye">
               <label for="gye"> 계약직</label> <input type="checkbox" value="F"
                  id="fageon"> <label for="fageon">파견직</label> <input
                  type="checkbox" value="I" id="intern"> <label for="intern">인턴직</label>


               <input type="checkbox" value="W" id="wechock"> <label
                  for="wechock">위촉직</label>

            </dt>
            <dt>
               <span class="tit">복리후생</span> <input type="text" class="txt"
                  name="welfare" id="welfare">

            </dt>
         </dl>
      </div>
      <h2>지원조건</h2>
      <div class="requestCondition bg checks">
         <dl class="clearBoth">
            <dt>
               <span class="titc">성별 </span> 
               <input type="radio" id="gender" name="gender" 
                checked="checked" value="성별무관"> 
               <label for="gender">성별무관</label> 
               <input type="radio" id="male"
                name="gender" value="남성"> 
               <label for="male">남성</label> 
               <input type="radio" id="female" 
                name="gender" value="여성"> 
               <label for="female"> 여성</label>

            </dt>
            <dt>
               <span class="titc">연령</span> 
               <input type="radio" id="donAge"
                name="age" checked="checked" value="연령무관"> 
               <label for="donAge">연령무관</label> 
               <input type="radio" id="dontAge"
                  name="age" value="">
               <label for="dontAge">연령제한 있음</label>

               <input type="checkbox" id="oldAge" 
                name="age" value="고연령자(65세이상)">
               <label for=oldAge> 고연령자 가능(65세이상)</label> 
               <input type="checkbox" id="youngAge" 
                name="age" value="청소년(만 18세이상)"> 
               <label for=youngAge> 청소년가능(만18세 이상)</label>
               <input type="checkbox" id="housewife" 
                name="age" value="주부"> 
               <label for=housewife> 주부 가능</label> 
            </dt>
            <dt>
               <span class="titc">학력조건</span> 
               <input type="radio" id="eduLv" name="educateLv" 
                checked="checked" value="학력무관"> 
               <label for="eduLv"> 학력무관</label> 
               <input type="radio" id="middle"
                name="educateLv" value="중학교졸업"> 
               <label for="middle"> 중학교졸업 </label> 
               <input type="radio" id="high" name="educateLv"
                value="고등학교졸업"> 
               <label for="high"> 고등학교졸업 </label> 
               <input type="radio" id="univ23" name="educateLv" 
                value="대학(2,3년제)졸업">
               <label for="univ23"> 대학(2,3년제)졸업 </label> 
               <input type="radio" id="univ4" name="educateLv" 
                value="대학(4년제)졸업"> 
               <label for="univ4"> 대학(4년제)졸업 </label> 
               <input type="radio" id="graduate" name="educateLv" 
                value="대학원졸업~"> 
               <label for="graduate"> 대학원졸업~ </label>
            </dt>
            <dt>
               <span class="titc">경력사항</span> 
               <input type="radio" id="work" name="career" 
                checked="checked"> 
               <label for="work"> 경력무관 </label> 
               <input type="radio" id="newcomer" name="career">
               <label for="newcomer"> 신입 </label> 
               <input type="radio" id="experience"
                name="career"> 
               <label for="experience"> 경력 </label>
            </dt>
            <dt>
               <div style="height: 110px;">
                 <span class="clearBoth titc">우대조건</span> 
                 <input type="checkbox" id="expPre" 
                  name="preference" value="동종업계 경력자"> 
                 <label class="rence" for="expPre"> 
                                        동종업계 경력자 </label> 
                 <input type="checkbox" id="licensePre" 
                  name="preference" value="관련자격증 소시자"> 
                 <label class="rence" for="licensePre">
                                        관련자격증 소지자 </label> 
                 <input type="checkbox" id="pcPre" 
                  name="preference" value="컴퓨터활용 가능자"> 
                 <label class="rence" for="pcPre">
                                        컴퓨터활용 가능자 </label> 
                 <input type="checkbox" id="longPre" 
                  name="preference" value="장기근무 가능자"> 
                 <label class="rence" for="longPre">
                                        장기근무 가능자 </label> 
                 <span class="clearBoth titc"> </span> 
                 <input type="checkbox" id="engPre" 
                  name="preference" value="영어 가능자">
                 <label class="rence" for="engPre"> 
                                        영어 가능자 </label> 
                 <input type="checkbox" id="jpPre" 
                  name="preference" value="일어 가능자">
                 <label class="rence" for="jpPre"> 
                                         일어 가능자 </label> 
                 <input type="checkbox" id="cnPre" 
                  name="preference" value="중국어 가능자">
                 <label class="rence" for="cnPre"> 
                                         중국어 가능자 </label> 
                 <input type="checkbox" id="insidePre" 
                  name="preference" value="인근 거주자">
                 <label class="rence" for="insidePre"> 
                                         인근 거주자 </label> 
                 <span class="clearBoth titc"> </span> 
                 <input type="checkbox" id="drivePre" 
                  name="preference" value="운전면허 소지자"> 
                 <label class="rence" for="drivePre"> 
                                        운전면허 소지자 </label> 
                 <input type="checkbox" id="byclePre" 
                  name="preference" value="원동기면허 소지자">
                 <label class="rence" for="byclePre"> 
                                         원동기면허 소지자 </label> 
                 <input type="checkbox" id="carPre" 
                  name="preference" value="차량 소지자">
                 <label class="rence" for="carPre"> 
                                        차량 소지자 </label> 
                 <input type="checkbox" id="militaryPre" 
                  name="preference" value="군필자">
                 <label class="rence" for="militaryPre"> 
                                        군필자 </label> 
                 <span class="clearBoth titc"> </span> 
                 <input type="checkbox" id="femailPre" 
                  name="preference" value="여성"> 
                 <label class="rence" for="femailPre"> 
                                          여성 </label> 
                 <input type="checkbox" id="mrsPre" 
                  name="preference" value="경력단절여성"> 
                 <label class="rence" for="mrsPre"> 
                                        경력단절여성 </label>
               </div>
            </dt>
         </dl>
      </div>
      <h2>모집내용</h2>
      <div class="recContent bg checks">
         <dl class="clearBoth">
            <dt>
               <span class="titc">모집인원 </span> 
               <input type="text" class="txt_35"
                placeholder="00명" name="recruitMember"
                id="writeMember"> 
               <input type="checkbox" id="tenPeople" 
                name="recruitMember" value="0명">
               <label id="tenxone" for="tenPeople"> 0명 </label> 
               <input type="checkbox" id="hundredPeople" 
                name="recruitMember" value="00명"> 
                <label id="tenxten" for="hundredPeople">00명 </label>
            </dt>
            <dt>
               <span class="titc">모집대상</span> 
               <input type="checkbox" id="youth"
                  name="recruitPerson" value="청소년"> 
               <label for="youth">청소년</label>


               <input type="checkbox" id="univSt" name="recruitPerson" value="대학생">
               <label for="univSt">대학생</label> <input type="checkbox"
                  id="homemaker" name="recruitPerson" value="주부"> <label
                  for="homemaker">주부</label> <input type="checkbox" id="senior"
                  name="recruitPerson" value="장년"> <label for="senior">장년</label>

               <input type="checkbox" id="disabled" name="recruitPerson"
                  value="장애인"> <label for="disabled">장애인</label> <input
                  type="checkbox" id="novice" name="recruitPerson" value="초보자">
               <label for="novice">초보자</label> <input type="checkbox"
                  id="homeWork" name="recruitPerson" value="재택가능"> <label
                  for="homeWork">재택가능</label>
            </dt>
            <dt>
               <span class="titc">모집종료일</span>
                 <input type="hidden" id="calText" size="10"
                 name="recruitDeadline">
                 <input type="text" id="calText" size="10"
                 name="recruitDeadlineView">
                 <input type="button" id="weekCal"
                   value="일주일동안" class="white small textBox"> 
                 <input type="button" id="monthCal"
                   value="한달동안" class="white small textBox">
                 <input type="button" id="completeCal"
                   value="채용시까지" class="white small textBox">
            </dt>
            <dt>
               <span class="titc">접수방법</span> 
               <input type="checkbox" id="onlineRec"
                  name="recruitMethod" value="온라인지원"> <label class="rence"
                  for="onlineRec"> 온라인지원 </label> <input type="checkbox"
                  id="emailRec" name="recruitMethod" value="e-메일지원"> <label
                  class="rence" for="emailRec"> e-메일지원 </label> <input
                  type="checkbox" id="phoneRec" name="phoneRec" value="전화연락">
               <label class="rence" for="phoneRec"> 전화연락 </label> <input
                  type="checkbox" id="offlineRec" name="offlineRec" value="방문접수">
               <label class="rence" for="offlineRec"> 방문접수 </label>
               
               <p class="titc">　　</p>
               <span class="clearBoth titc">　　</span>
               <input type="checkbox" id="postRec" 
                 value="우편">
               <label class="rence" for="postRec"> 우편 </label> 
               <input type="checkbox" id="faxRec" 
                 value="팩스"> 
               <label class="rence" for="faxRec"> 팩스 </label> 
               <input type="checkbox" id="homepageRec" 
                 value="홈페이지"> 
               <label class="rence" for="homepageRec"> 홈페이지 </label> 
               <input type="checkbox" id="recForm" 
                 value="자사지원양식"> 
                 
               <label for="recForm">자사지원양식</label> 
               <span style="font-size: 8pt">
                 ( <input type="radio"  
                 name="recForm" id="FormF"> 
                 <label for="FormF">필수 ,</label> 
                 <input type="radio" name="recForm" id="FormS"> 
                 <label for="FormS">선택</label> )
               </span>

            </dt>
            <dt>
               <span class="titc">제출서류</span> <input type="checkbox" id="expDoc"
                  name="documents" value="이력서"> <label class="rence"
                  for="expDoc"> 이력서 </label> <input type="checkbox" id="juminDoc"
                  name="documents" value="주민.등록등본"> <label class="rence"
                  for="juminDoc"> 주민.등록등본 </label> <input type="checkbox"
                  id="mediDoc" name="documents" value="보건증"> <label
                  class="rence" for="mediDoc"> 보건증 </label> <input type="checkbox"
                  id="introDoc" name="documents" value="자기소개서"> <label
                  class="rence" for="introDoc"> 자기소개서 </label> <input
                  type="checkbox" id="parDoc" name="documents" value="부모님동의서">
               <label class="rence" for="parDoc"> 부모님동의서 </label>

            </dt>
         </dl>
      </div>
      <h2>상세모집요강</h2>
      <div class="detailContent">
         <div>
            <textarea id="content" name="detailRecruit" rows="12" cols="40"></textarea>
         </div>
      </div>
   </div>
   <div class="align_center" style="margin-top: 50px;">
      <input class="white button " id="regBt" type="button" value="확인">
      <input class="white button " type="reset" value="취소"> <input
         class="white button" type="button" id="recListBt" value="목록">
   </div>
   
</form>
<form name="frmList" method="post"></form>

<%@ include file="../inc/simple_bottom.jsp"%>