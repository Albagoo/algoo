<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
  <script src="<c:url value='/ckeditor/ckeditor.js'/>" 
type="text/javascript"></script>


<script type="text/javascript">
   $(document).ready(function(){
	   setAges();
	   setForms();
       $("input[name='age']").click(function() {
    	   setAges();
       });
	   $("#recForm").click(function() {
		   setForms()
	});
	   $("#submitBt").hide(); 
   
	   CKEDITOR.replace('content', {uiColor: '#FFFFFF'});  
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
      var res="";
      
    	//서비스기간설정버튼을 눌렀을때	  
      $("#serviceBt").click(function() {
    	  $("#submitBt").show();
    	  $("#serviceInfo").hide();
    	  $("#serviceBt").hide();
    	  
    	  $.ajax({
              url:"<c:url value='/service/serviceWrite.ag'/>",
              type:"GET",
              success:function(res){
                 res="<div>";
                 
res+="<h2>서비스 선택</h2>";
res+='<form method="post" name="frmService" id="frmService" ';
res+='action="<c:url value='/service/serviceWrite.ag'/>" style="display:inline" >';
res+='<select class="textBox white"  id="gradeSel">';
res+='<option value="1등급">1등급</option>';
res+='<option value="2등급">2등급</option>';
res+='<option value="3등급">3등급</option>';
res+='<option value="4등급">4등급</option></select>';
res+='<select class="textBox white"  id="daysSel">';
res+='<option value="1일">1일</option>';
res+='<option value="7일">7일</option>';
res+='<option value="30일"> 30일</option>';
res+='<option value="90일">90일</option>';
res+='<option value="180일">180일</option></select>';
res+=' <input class="button medium white" type="reset" value="취소"> ';
res+=' </form></div>';
                  
                 $("#divService").html(res);
                 
              },
              error:function(xhr, status, error){
                 alert(status+":"+error)
              },
         });//aj
        }); //click  
          
      
      $("#regBt").click(function() {
		 
    	  if($("#grade").val().length<1){
    		  alert("서비스기간을 설정해주세요");
    		  $("#serviceBt").focus();
    	  }else if($("#title").val().length<1){
    		  alert("채용 제목을 설정해주세요");
              $("#title").focus();
    	  }else if($("#grade").val().length<1){
           alert("등급을 선택하세요");
           $("#grade").focus();
           return false;
        }else if($("#days").val()==0){
           alert("기간을 선택하세요");
           $("#days").focus();
           return false;
        }else{
 
        	   frm1.action
              ="<c:url value='/rec/recWrite.ag'/>";
              frm1.submit();
    	  }
	});//click
      
		$("#recListBt").click(function() {
		   frmList.action
		   ="<c:url value='/rec/recList.ag'/>";   
		   frmList.submit();
			//나중에 카테고리 추가 예정
		});//click
		
//호선별 역정보	
$("#subNum").change(function() {
	
	var subway2="";
	var result2="";
		$.ajax({
			url:"<c:url value='/json/seoulSubway.json'/>",
			type:"GET",
			dataType:"json",
			success:function(res){
				
 /* result+='<select class="txt_150 white medium button name="subNum" id="subNum">'; */  
 /* alert($("#subNum option:selected").val()); */ 

			$.each(res.DATA,function(idx,item){
				if($("#subNum option:selected").val()==this.LINE_NUM){				
				subway2+="<option value="+this.STATION_NM+">";
				subway2+=this.STATION_NM+"</option>";
				}//if 
			});
				 /* subway2+="</select>";  */
				result2+=subway2
				$("#subName").html(result2);
			},
			error:function(xhr, statust,error){
				alert(status+":"+error);
			}
		});
});		//change


//지역별 호선 정보	
	$("#subRegion").change(function() {
          
         var subway="";
         var result="";
            $.ajax({
               url:"<c:url value='/json/SubwayRegion.json'/>",
               type:"GET",
               dataType:"json",
               success:function(res){
                  
/* result+='<select class="txt_150 white medium button name="subNum" id="subNum">'; */ 
  /* alert($("#subRegion option:selected").val());   */

               $.each(res.SDATA,function(idx,item){
                  if($("#subRegion option:selected").val()==this.REGION_NM){            
                  subway+="<option value="+this.LINE_NUM+">";
                  subway+=this.LINE_NM+"</option>";
                  }//if 
               });
                /*   subway+="</select>"; */
                  result+=subway
                  $("#subNum").html(result);
                   $("#subNumOption option:eq(0)").attr("selected", "selected"); 
                  
               },
               error:function(xhr, statust,error){
                  alert(status+":"+error);
               }
            });//change	
	
   });
   });
   
   
	function setAges() {
	    if($("#donAge").is(":checked")){
	      //연령무관시 체크박스 비활성화
	      $("#oldAge").attr('disabled',true);
	      $("#housewife").attr('disabled',true);
	      $("#youngAge").attr('disabled',true);
	    }else {
	    	$("#oldAge").attr('disabled',false);
	      $("#housewife").attr('disabled',false);
	      $("#youngAge").attr('disabled',false);
	    }//if
	}
	
	function setForms() {
	    if($("#recForm").is(":checked")){
	      //자사지원 체크박스 선택시 활성화
	      $("#FormF").attr('disabled',false);
	      $("#FormS").attr('disabled',false);
	      $("#FormF").attr('checked',true);
	      
	    }else {
	    	$("#FormF").attr('disabled',true);
	      $("#FormS").attr('disabled',true);
	    }//if
	}
	
  </script>
  
  
  

<form name="frm1" method="post" 
   action="<c:url value='/rec/recWrite.ag'/>">
<div id="divService" style="margin-left: 50px;"> </div>
	<div class="recWrite">
<div id="serviceInfo">

<span class="txt_85">서비스등급</span>

<input class="txth_35" type="text"
id="grade" name="grade"
readonly="readonly">
<span class="txt_85">서비스기간</span>

<input class="txt_35" type="text"
 id="days" name="days"
 readonly="readonly">
 </div>
 
<input type="button" value="서비스설정"
 id="serviceBt" title="보여주기" class="white  button">
 <input class="button white" type="button"
  id="submitBt" value="서비스 등록" style="margin-left: 300px" >
<input type="hidden" value="${compVo.compCode }"
name="compCode" readonly="readonly" >


<div id="div1"></div>
	<h2>기업 정보</h2>
	<div class="companyInfo bg">
		<dl class="clearBoth">
			<dt>
				<span class="tit">회사/점포명</span> 
				<input type="text" class="txt_150"
				readonly="readonly" value="${compVo.compName }">				
</dt>
<dt>
	<span class="tit">대표자명(ceo)</span>
	<input type="text" class="txt_150"
	readonly="readonly" value="${compVo.ceo }"
	>
</dt>
<dt>
	<span class="tit">사업자등록번호</span>
	<input type="text" class="txt_150"
	readonly="readonly" value="${compVo.compNum }">
</dt>
<dt>
	<span class="tit">회사/점포주소</span>
	<input type="text" class="txt"
	readonly="readonly" value="${compVo.address } 
${compVo.addressDetail}">
				</dt>
			<!-- 	<dt>
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
</div>
<!-- 근무지 정보 -->
<h2>근무지정보</h2>
<div class="workInfo bg">
 <dl class="clearBoth">
   <dt>
      <span class="tit">근무회사/점포명</span> 
      <input type="text" class="txt_200"
      placeholder="회사명(지점명)" maxlength="30"
      name="compName">
   </dt>
   <dt>
      <span class="tit">채용제목</span>
      <input type="text" class="txt"
      placeholder="성실하게 함께할 가족 구합니다"
      name="title" id="title" maxlength="33">
   </dt>
   <dt>
      <span class="tit">업직종</span>
      <select class="txt_180 button white medium"
      name="jobName" id="jobName">
      <option value="null">1차직종</option>
      <c:forTokens items="" delims=""></c:forTokens>
      </select>
      <select class="txt_180 button white medium"
      name="jobName2" id="jobName2">
      <option value="null">2차직종</option>
      </select>
   </dt>
   <dt>
      <span class="tit">근무지주소</span>
        <input type="text" class="txt_70"
        placeholder="우편번호" name="zipcode"
        id="zipcode" readonly="readonly">
          <input type="text" class="txt_500"
        placeholder="주소" name="address"
        id="address" readonly="readonly">
    </dt>
    <dt>  
      <span class="tit">상세주소</span>
         <input type="text" class="txt_500"
        placeholder="상세주소" name="addressDetail"
        id="addressDetail">
                        
      <input type="button" class="white button"
      value="우편번호 찾기" id="btnZipcode">
   </dt>
   <dt>
      <span class="tit">인근지하철</span>
           <select class="txt_100 white medium button"
           name="subRegion" id="subRegion">
      <option value="null">지역</option>
      <option value="서울">서울</option>
      <option value="인천">인천</option>
      <option value="대전">대전</option>
      <option value="광주">광주</option>
      <option value="부산">부산</option>
      </select>
     
        
    <select class="txt_150 white medium button"
           name="subNum" id="subNum">
            <option value="null">호선</option> 
         </select> 
     
     
   
     
         <select class="txt_150 white medium button"
           name="subName" id="subName">
      <option value="null">지하철역</option> 
     
      </select>
      <input type="text" class="txt_200" 
      name="subInfo" id="subInfo">
   </dt>
</dl>
</div>
<!-- 근무조건 -->
<h2>근무조건</h2>
<div class="workCondition bg">
  <dl class="clearBoth">
      <dt>
         <span class="tit">근무기간</span> 

         <label class="radio" for="one">
         <input type="radio" id="one"
         name="workTerm" value="하루(1일)" 
         checked="checked">
         <span class="font_11">하루(1일)</span></label>
         
         <label class="radio" for="week">
         <input type="radio" id="week"
         name="workTerm" value="1주일이하">
         <span class="font_11">1주일이하</span></label>
         
         <label class="radio" for="month">
         <input type="radio" id="month"
         name="workTerm" value="1주일~1개월">
         <span class="font_11">1주일~1개월</span></label>
         
         <label class="radio" for="threeMonth">
         <input type="radio" id="threeMonth"
         name="workTerm" value="1개월~3개월">
         <span class="font_11">1개월~3개월</span></label>
         
         <label class="radio" for="sixMonth">
         <input type="radio" id="sixMonth"
         name="workTerm" value="3개월~6개월">
         <span class="font_11">3개월~6개월 </span></label>
         
         <label class="radio" for="year">
         <input type="radio" id="year"
         name="workTerm" value="6개월~1년">
         <span class="font_11">6개월~1년</span></label>
         
         <label class="radio" for="consult">
         <input type="radio" id="consult"
         name="workTerm" value="기간협의">
         <span class="font_11">기간협의</span></label>
         
      </dt>
      <dt>
         <span class="tit">근무요일</span>
         <label class="radio" for="MontoSun">
         <input type="radio" id="MontoSun" 
         name="workDays" checked="checked"
         value="월~일">
         <span class="font_11">월~일</span></label>
         
         <label class="radio" for="MontoSat">
         <input type="radio" id="MontoSat"
         name="workDays" value="월~토">
         <span class="font_11">월~토</span></label>
         
         <label class="radio" for="MontoFri">
         <input type="radio" id="MontoFri"
         name="workDays" value="월~금">
         <span class="font_11">월~금</span></label>
         
         
         <label class="radio" for="SatSun">
         <input type="radio" id="SatSun"
         name="workDays" value="주말(토,일)">
         <span class="font_11">주말(토,일)</span></label>
         
         
         <label class="radio" for="sixDay">
         <input type="radio" id="sixDay"
         name="workDays" value="주 6일">
         <span class="font_11">주 6일</span></label>
         
         
         <label class="radio" for="fiveDay">
         <input type="radio" id="fiveDay"
         name="workDays" value="주 5일">
         <span class="font_11">주 5일</span></label>
         
         
         <label class="radio" for="fourDay">
         <input type="radio" id="fourDay"
         name="workDays" value="주 4일">
         <span class="font_11">주 4일</span></label>
         
         
         <label class="radio" for="threeDay">
         <input type="radio" id="threeDay"
         name="workDays" value="주 3일">
         <span class="font_11">주 3일</span></label>
         
         
         <label class="radio" for="twoDay">
         <input type="radio" id="twoDay"
         name="workDays" value="주 2일">
         <span class="font_11">주 2일</span></label>
         
         
         <label class="radio" for="oneDay">
         <input type="radio" id="oneDay"
         name="workDays" value="주 1일">
         <span class="font_11">주 1일</span></label>
         
         
      </dt>
      <dt>
         <span class="tit">근무시간</span> <select
class="txt_85 white button medium" name="workTime">
<!-- <option value="null">시작</option> -->
	<c:forEach var="i" begin="0" end="24" step="1">
		<c:if test="${i<10 }">
			<c:set var="j" value="0${i}" />

		<option value="${j}">${j}시</option>
                </c:if>
		<c:if test="${i>=10}">

		<option value="${i}">${i}시</option>
                </c:if>
	</c:forEach>
</select> <select class="txt_85 white button medium"
	name="workTime2">
	<!--   <option value="null">시간</option> -->
	<c:forEach var="i" begin="0" end="60" step="10">
<c:if test="${i<10 }">
                   <c:set var="j" value="0${i}" />

                <option value="${j}">${j}분</option>
       </c:if>
                <c:if test="${i>=10}">

                <option value="${i}">${i}분</option>
       </c:if>
	</c:forEach>
</select> <span style="float: left;">~</span> <select
	class="txt_85 white button medium" name="workTime3">
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
</select> <select class="txt_85 white button medium"
	name="workTime4">
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
           <span class="tit">선택</span>
           <select class="txt_85 white button medium"
           name="payMethod">
           <option value="시급">시급</option>
           <option value="일당">일당</option>
           <option value="주급">주급</option>
           <option value="월급">월급</option>
           </select>
           <input type="text" class="txt_150"
           name="pay" id="pay" value="0">
             <span class="txt_30">원</span>
           <span class="txt_150 font_11 white">최저임금 6030원</span> 
        </dt>
        <dt>
           <span class="tit">근무형태</span>
           
           <label for="alba">
           <span class="txt_70 font_11">
           <input type="checkbox" name="recruitType" 
           value="알바" id="alba">알바</span></label>

           <label for="jung">               
            <span class="txt_75 font_11">
            <input type="checkbox" 
           value="J" id="jung">정규직</span></label>
           
           <label for="gye">           
            <span class="txt_75 font_11">
            <input type="checkbox" 
           value="G" id="gye">계약직</span></label>
           
           <label for="fageon">
            <span class="txt_75 font_11">
            <input type="checkbox" 
           value="F" id="fageon">파견직</span></label>
           
           <label for="intern">
            <span class="txt_75 font_11">
            <input type="checkbox" 
           value="I" id="intern">인턴직</span></label>
           
           <label for="wechock">
            <span class="txt_75 font_11">
            <input type="checkbox" 
           value="W" id="wechock">위촉직</span></label>
           
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
       name="gender" checked="checked" 
       value="성별무관">
       <span class="font_11">성별무관</span></label>
       
       
       <label class="radio" for="male">
       <input type="radio" id="male"
       name="gender" value="남성">
       <span class="font_11">남성</span></label>
       

       <label class="radio" for="female">
       <input type="radio" id="female"
       name="gender" value="여성">
       <span class="font_11">여성</span></label>
       
    </dt>
    <dt>
       <span class="tit">연령</span>
       
       <label class="radio" for="donAge">
       <input type="radio" id="donAge"
       name="age" checked="checked"
       value="연령무관">
       <span class="font_11">연령무관</span></label>
       
       
       <label class="radio" for="dontAge">
       <input type="radio" id="dontAge"
       name="age" value="">
       <span class="font_11 ">연령제한 있음</span></label>
       
       
       <label class="radio" for=oldAge>
       <input type="checkbox" id="oldAge"
       name="age" value="고연령자(65세이상)">
       <span class="font_11">고연령자 가능(65세이상)</span></label>
       
       
       <label class="radio" for=housewife>
       <input type="checkbox" id="housewife"
       name="age" value="주부">
       <span class="font_11">주부 가능</span></label>
       
       
       <label class="radio" for=youngAge>
       <input type="checkbox" id="youngAge"
       name="age" value="청소년(만18세 이상)">
       <span class="font_11">청소년가능(만18세 이상)</span></label>
       
    </dt>
    <dt>
       <span class="tit">학력조건</span>
       <label class="radio" for="eduLv">
       <input type="radio" id="eduLv"
       name="educateLv" checked="checked"
       value="학력무관">
       <span class="font_11">학력무관</span></label>
       
       
       <label class="radio" for="middle">
       <input type="radio" id="middle"
       name="educateLv" value="중학교졸업">
       <span class="font_11">중학교졸업
       </span></label>
       
       <label class="radio" for="high">
       <input type="radio" id="high"
       name="educateLv" value="고등학교졸업">
       <span class="font_11">고등학교졸업
       </span></label>
       
       <label class="radio" for="univ23">
       <input type="radio" id="univ23"
       name="educateLv" value="대학(2,3년제)졸업">
       <span class="font_11">대학(2,3년제)졸업
       </span></label>
       
       <label class="radio" for="univ4">
       <input type="radio" id="univ4"
       name="educateLv" value="대학(4년제)졸업">
       <span class="font_11">대학(4년제)졸업
       </span></label>
       
       <label class="radio" for="graduate">
       <input type="radio" id="graduate"
       name="educateLv" value="대학원졸업~">
       <span class="font_11">대학원졸업~
       </span></label>
       
    </dt>
    <dt>
       <span class="tit">경력사항</span>
        <label class="radio" for="work">
       <input type="radio" id="work"
       name="career" checked="checked">
       <span class="font_11">경력무관
       </span></label>
       
       <label class="radio" for="newcomer">
       <input type="radio" id="newcomer"
       name="career">
       <span class="font_11">신입
       </span></label>
       
       <label class="radio" for="experience">
       <input type="radio" id="experience"
       name="career">
       <span class="font_11">경력
       </span></label>
       
    </dt>
    <dt><div style="height: 100px;">
       <span class="titc" >우대조건</span>
       
       <label class="rence" for="expPre">
       <input type="checkbox" id="expPre"
       name="preference" value="동종업계 경력자">
       <span class="font_11">동종업계 경력자
       </span></label>
       
       <label class="rence" for="licensePre">
       <input type="checkbox" id="licensePre"
       name="preference" value="관련자격증 소시자">
       <span class="font_11">관련자격증 소지자
       </span></label>
       
       <label class="rence" for="pcPre">
       <input type="checkbox" id="pcPre"
       name="preference" value="컴퓨터활용 가능자">
       <span class="font_11">컴퓨터활용 가능자
       </span></label>
       
       <label class="rence" for="longPre">
       <input type="checkbox" id="longPre"
       name="preference" value="장기근무 가능자">
       <span class="font_11">장기근무 가능자
       </span></label>
       
       <span class="clearBoth tit"></span>
       <label class="rence" for="engPre">
       <input type="checkbox" id="engPre"
       name="preference" value="영어 가능자">
       <span class="font_11">영어 가능자
       </span></label>
       
       <label class="rence" for="jpPre">
       <input type="checkbox" id="jpPre"
       name="preference" value="일어 가능자">
       <span class="font_11">일어 가능자
       </span></label>
       
       <label class="rence" for="cnPre">
       <input type="checkbox" id="cnPre"
       name="preference" value="중국어 가능자">
       <span class="font_11">중국어 가능자
       </span></label>
       
       <label class="rence" for="insidePre">
       <input type="checkbox" id="insidePre"
       name="preference" value="인근 거주자">
       <span class="font_11">인근 거주자
       </span></label>
       
       <span class="clearBoth tit"></span>
       <label class="rence" for="drivePre">
       <input type="checkbox" id="drivePre"
       name="preference" value="운전면허 소지자">
       <span class="font_11">운전면허 소지자
       </span></label>
       
       <label class="rence" for="byclePre">
       <input type="checkbox" id="byclePre"
       name="preference" value="원동기면허 소지자">
       <span class="font_11">원동기면허 소지자
       </span></label>
       
       <label class="rence" for="carPre">
       <input type="checkbox" id="carPre"
       name="preference" value="차량 소지자">
       <span class="font_11">차량 소지자
       </span></label>
       
       <label class="rence" for="militaryPre">
       <input type="checkbox" id="militaryPre"
       name="preference" value="군필자">
       <span class="font_11">군필자
       </span></label>
       
       <span class="clearBoth tit"></span>
       <label class="rence" for="femailPre">
       <input type="checkbox" id="femailPre"
       name="preference" value="여성">
       <span class="font_11">여성
       </span></label>
       
       <label class="rence" for="mrsPre">
       <input type="checkbox" id="mrsPre"
       name="preference" value="경력단절여성">
       <span class="font_11">경력단절여성
       </span></label>
       
   </div> </dt>
 </dl>
</div>
<h2>모집내용</h2>
<div class="recContent bg">
   <dl class="clearBoth">
      <dt>
         <span class="tit">모집인원</span> 
         <input type="text" class="txt_35"
         placeholder="10" name="recruitMember">
         <span class="by">명</span>
         <label class="txt_50" for="tenPeople">
         <input type="checkbox" id="tenPeople"
         name="recruitMember" value="0명">
         <span class="font_11">0명
         </span></label>
         
         <label class="txt_70" for="hundredPeople">
         <input type="checkbox" id="hundredPeople"
         name="recruitMember" value="00명">
         <span class="font_11">00명
         </span></label>
      </dt>
      <dt>
         <span class="tit">모집대상</span>
         <label class="txt_60 font_11" for="youth">
         <input type="checkbox" id="youth"
          name="recruitPerson"
         value="청소년">청소년</label>
         
          <label class="txt_60 font_11" for="univSt">
          <input type="checkbox" id="univSt" 
          name="recruitPerson"
         value="대학생">대학생</label>
         
          <label class="txt_50 font_11" for="homemaker"> 
          <input type="checkbox" id="homemaker" 
          name="recruitPerson"
         value="주부">주부</label>
         
          <label class="txt_50 font_11" for="senior">
          <input type="checkbox" id="senior" 
          name="recruitPerson"
         value="장년">장년</label>
         
          <label class="txt_60 font_11" for="disabled">
          <input type="checkbox" id="disabled" 
          name="recruitPerson"
         value="장애인">장애인</label>
         
          <label class="txt_60 font_11" for="novice">
          <input type="checkbox" id="novice" 
          name="recruitPerson"
         value="초보자">초보자</label>
         
         <label class="txt_75 font_11" for="homeWork">
          <input type="checkbox" id="homeWork"
          name="recruitPerson"
         value="재택가능">재택가능</label>
      </dt>
       <dt>
         <span class="tit">모집종료일</span>
         
         <label class="radio" for="oneCal">
         <input type="radio" id="oneCal" 
         name="recruitDeadlineTest" checked="checked" >
         <span class="font_11">
         <input type="text" id="calText" size="10">
         <input type="button" class="button white medium"
         value="날짜선택" id="calBt"> </span></label>
         
         <label class="radio" for="weekCal">
         <input type="radio" id="weekCal"
         name="recruitDeadlineTest" value="sysdate+7">
         <span class="font_11">1주일이하
         </span></label>
         
         <label class="radio" for="monthCal">
         <input type="radio" id="monthCal"
         name="recruitDeadlineTest" value="sysdate+30" >
         <span class="font_11">1주일~1개월
         </span></label>
      </dt> 
      <dt>
         <span class="tit">접수방법</span>
         
         <label class="rence" for="onlineRec">
         <input type="checkbox" id="onlineRec"
         name="recruitMethod" value="온라인지원">
         <span class="font_11">온라인지원
         </span></label>
         
          <label class="rence" for="emailRec">
         <input type="checkbox" id="emailRec"
         name="recruitMethod" value="e-메일지원">
         <span class="font_11">e-메일지원
         </span></label>
         
          <label class="rence" for="phoneRec">
         <input type="checkbox" id="phoneRec"
         name="phoneRec" value="전화연락">
         <span class="font_11">전화연락
         </span></label>
         
          <label class="rence" for="offlineRec">
         <input type="checkbox" id="offlineRec"
         name="offlineRec" value="방문접수">
         <span class="font_11">방문접수
         </span></label>
         
         <label class="rence" for="postRec">
         <input type="checkbox" id="postRec"
         name="postRec" value="우편">
         <span class="font_11">우편
         </span></label>
         
         <label class="rence" for="faxRec">
         <input type="checkbox" id="faxRec"
         name="faxRec" value="팩스">
         <span class="font_11">팩스
         </span></label>
         
         <label class="rence" for="homepageRec">
         <input type="checkbox" id="homepageRec"
         name="homepageRec" value="홈페이지">
         <span class="font_11">홈페이지
         </span></label>
       
         <span class="txt_300 font_11" 
         style="margin: 5px 0 0 0">
          <label for="recForm">
          <input type="checkbox" id="recForm"
          value="자사지원양식" >
          <span>자사지원양식
          </span></label>
          (
          <label for="FormF">
          <input type="radio" name="recForm" 
          id="FormF">필수,</label>
          <label for="FormS">
          <input type="radio" name="recForm"
           id="FormS">선택</label>
         
          )
          </span>
          
       </dt>
       <dt>
          <span class="tit">제출서류</span>
          
           <label class="rence" for="expDoc">
          <input type="checkbox" id="expDoc"
          name="documents" value="이력서">
          <span class="font_11">이력서
          </span></label>
          
          <label class="rence" for="juminDoc">
          <input type="checkbox" id="juminDoc"
          name="documents" value="주민.등록등본">
          <span class="font_11">주민.등록등본
          </span></label>
          
          <label class="rence" for="mediDoc">
          <input type="checkbox" id="mediDoc"
          name="documents" value="보건증">
          <span class="font_11">보건증
          </span></label>
          
          
          <label class="rence" for="introDoc">
          <input type="checkbox" id="introDoc"
          name="documents" value="자기소개서">
          <span class="font_11">자기소개서
          </span></label>
          
          
          <label class="rence" for="parDoc">
          <input type="checkbox" id="parDoc"
          name="documents" value="부모님동의서">
          <span class="font_11">부모님동의서
          </span></label>
          
       </dt>
    </dl>
	</div>
	<h2>상세모집요강</h2>
	<div class="detailContent" >
	<div>
	 <textarea id="content" name="detailRecruit" 
        rows="12" cols="40"></textarea>
        </div>
	</div>
</div>
<div class="align_center" style="margin-top: 50px;">
	<input class="white button "
	  id="regBt" type="button" value="확인">
	<input class="white button " type="reset" value="취소">
	<input class="white button" type="button" 
      id="recListBt" value="목록">
	</div>
	
</form>
<form name="frmList" method="post">

</form>
<%@ include file="../inc/simple_bottom.jsp" %>