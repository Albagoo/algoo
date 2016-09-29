<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>

<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/recLayout.css'/>" />

<link rel="stylesheet" type="text/css" 
href="<c:url value='/jquery/jquery-ui.css'/>"/>
   
      
<script type="text/javascript" src
="<c:url value='/js/member.js'/>"></script>
<script type="text/javascript" src
="<c:url value='/js/recWrite.js'/>"></script>


<script src="<c:url value='/ckeditor/ckeditor.js'/>"
   type="text/javascript"></script>
<script src="<c:url value='/jquery/jquery-ui.js'/>"
   type="text/javascript"></script>

<script type="text/javascript">
//결제 코드
var IMP = window.IMP;
IMP.init('imp16818347');




//검색조건 정보
function k(wel,index,item,ids,names) {
      
      wel+='<input type="checkbox" id="'+ids;
      wel+=index+'"';
      wel+='name="'+names+'"';
      wel+=' value="'+item.values+'"> <label for="';
      wel+=ids+index;
      wel+='">'+item.values+'</label>';
      return wel;
}
 
 
   $(document).ready(function() {
	   
	   
	   var welfareArr=[{name:'보험',values:'국민연금'},{name:'보험',values:'고용보험'},
	                   {name:'보험',values:'산재보험'},{name:'보험',values:'건강보험'},
	                   {name:'휴가/휴무',values:'연차'},{name:'휴가/휴무',values:'월차'},
	                   {name:'휴가/휴무',values:'정기휴가'},{name:'보상제도',values:'인센티브제'},
	                   {name:'보상제도',values:'정기보너스'},{name:'보상제도',values:'퇴직금'},
	                   {name:'보상제도',values:'장기근속자 포상'},{name:'보상제도',values:'우수사원 표창/포상'},
	                   {name:'수당제도',values:'야간근로수당'},{name:'수당제도',values:'휴일근로수당'},
	                   {name:'수당제도',values:'연월차수당'},{name:'수당제도',values:'장기근속수당'},
	                   {name:'수당제도',values:'위험수당'},{name:'수당제도',values:'연장근로수당'},
	                   {name:'수당제도',values:'주휴수당'},{name:'생활안정 지원',values:'기숙사운영'},
	                   {name:'생활안정 지원',values:'명절 귀향비 지급'},{name:'생활편의 지원',values:'조식제공'},
	                   {name:'생활편의 지원',values:'중식제공'},{name:'생활편의 지원',values:'석식제공'},
	                   {name:'생활편의 지원',values:'근무복 제공'},{name:'생활편의 지원',values:'통근버스 운행'},
	                   {name:'생활편의 지원',values:'야간교통비 지급'},{name:'생활편의 지원',values:'차량유류보조금'},
	                   {name:'생활편의 지원',values:'주차비지원(주차가능)'},{name:'경조사 지원',values:'각종 경조금'},
	                   {name:'경조사 지원',values:'경조 휴가제'}];
	   
	      /* var cnt=0; */
	      var wel='<span class="titd">복리후생</span>';
	      var welTemp="보험";
	      var welCnt=0;
	   $.each(welfareArr,function(index,item){
	      welCnt+=1;
	      if(item.name!=welTemp || welCnt>4){
	         wel+='<span class="clearBoth titd">　</span>';
	         welCnt=0;
	      }
	      
	      wel=k(wel,index,item,"welfare_","welfares");
	      welTemp=item.name;
	      
	      
	   });
	   $("#welf").html(wel);
	   
	   
	   
	   
	   
	   //모집종료일 달력기능
	   $("#calText").datepicker({
	      dateFormat:"yy-mm-dd",
	        changeYear:true,
	        dayNamesMin:['일','월','화','수','목','금','토'],
	         monthNames:['1월','2월','3월','4월','5월','6월',
	                     '7월','8월','9월','10월','11월','S12월']
		   
	   });
	   
	   $("#calText").change(function() {
		 
		   var cal=$("#calText").val();
		   $("#calText2").val(cal);
	   });
	   
	   /* $("#calText").keyup(function() {
		return;
	}) */

	   
	   
	   //모집인원 입력시 체크해제되도록
	   $("#writeMember").keyup(function() {
        $("#tenPeople").attr('checked',false);
        $("#hundredPeople").attr('checked',false);
		
        var abc=$("#writeMember").val().length;
	         
		 if(abc>=1){
			 $("#tenxten").css("visibility","hidden");
			 $("#tenxone").css("visibility","hidden");
			 $("#tenPeople").attr('disabled',true); 
			 $("#hundredPeople").attr('disabled',true);
		 }else{
			 $("#tenxone").css("visibility","visible");
			 $("#tenxten").css("visibility","visible");
			   $("#tenPeople").attr('disabled',false); 
			   $("#hundredPeople").attr('disabled',false);
		 }
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
            res += '<option value="스페셜">스페셜</option>';
            res += '<option value="스피드">스피드</option></select>';
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
	   
	   //결제 금액 설정부분
	   var servicePay = 0;
	   var dayss = $("#days").val();
	   if($("#grade").val() == "슈퍼"){
		   servicePay = 4000*dayss;
	   }else if($("#grade").val() == "그랜드"){
		   servicePay = 3000*dayss;
	   }else if($("#grade").val() == "스페셜"){
		   servicePay = 2000*dayss;
	   }else if($("#grade").val() == "스피드"){
		   servicePay = 1000*dayss;
	   }
	   
      if ($("#grade").val().length < 1) {
         alert("서비스기간을 설정해주세요");
         $("#serviceBt").focus();
      } else if ($("input[name='compName']").val().length < 1) {
         alert("근무지 이름을 설정해주세요");
         $("input[name='compName']").focus();
      } else if ($("#title").val().length < 1) {
         alert("채용 제목을 설정해주세요");
         $("#title").focus();
      } else if ($("#zipcode").val().length < 1) {
         alert("근무지 주소를 설정해주세요");
         $("#btnZipcode").focus();
      } else if ($("#calText").val().length < 1) {
         alert("모집 종료일을 설정해주세요");
         $("#calText").focus();
      } else if ($("#grade").val().length < 1) {
         alert("등급을 선택하세요");
         $("#grade").focus();
      return false;
      } else if ($("#days").val() == 0) {
         alert("기간을 선택하세요");
         $("#days").focus();
      return false;
      } else {
    	  IMP.request_pay({
    		    pg : 'kakao',
    		    pay_method : 'card', // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
    		    merchant_uid : 'merchant_' + new Date().getTime(),
    		    name : '알구 채용 등록 서비스',
    		    amount : servicePay,
    		    buyer_email : "a@b.c",
    		    buyer_name : '구매자이름',
    		    buyer_tel : '010-1234-5678',
    		    buyer_addr : '서울특별시 강남구 삼성동',
    		    buyer_postcode : '123-456'
    		}, function(rsp) {
    		    if ( rsp.success ) {
    		        var msg = '결제가 완료되었습니다.';
    		        msg += '고유ID : ' + rsp.imp_uid;
    		        msg += '상점 거래ID : ' + rsp.merchant_uid;
    		        msg += '결제 금액 : ' + rsp.paid_amount;
    		        msg += '카드 승인번호 : ' + rsp.apply_num;
    		        
    		        
    		        
    		    } else {
    		        var msg = '결제에 실패하였습니다.';
    		        msg += '에러내용 : ' + rsp.error_msg;
    		        alert(msg);
    		        return false;
    		    }
    		 	
    		    alert(msg);
    		    frm1.action = "<c:url value='/rec/recWrite.ag'/>";
		        frm1.submit();
    		});
    	  
        
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
                  jobN2 += "<option value="+this.JOB_FIRST+','+this.JOB_SECOND+">";
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

<style type="text/css">


/* 체크박스디자인 */


/* <div class="checks">
  <input type="checkbox" id="ex_chk">
  <label for="ex_chk">체크박스</label>
</div> 
 */
.checks {position: relative;}



.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
  position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip:rect(0,0,0,0);
   border: 0
}
.checks input[type="checkbox"] + label {
  display: inline-block;
  position: relative;
  padding-left: 30px;  /* 글자와 체크박스 사이의 간격을 변경 */
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
  content: '';
  position: absolute;
  left: 0;
  top: -0px;  /* 이 값을 변경해서 글자와의 정렬 */
  width: 14px;  /* 체크박스의 너비를 지정 */
  height: 14px;  /* 체크박스의 높이를 지정 */
  line-height: 14px; /* 세로정렬을 위해 높이값과 일치 */
  text-align: center;  
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius : 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="checkbox"] + label:active:before,
.checks input[type="checkbox"]:checked + label:active:before {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
  content: '\2714';  /* 체크표시 유니코드 사용 */
  color: #99a1a7;
  text-shadow: 1px 1px #fff;
  background: #e9ecee;
  border-color: #adb8c0;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}

/* 라디오버튼 디자인 */

/* <div class="checks">
  <input type="radio" id="ex_rd2"> 
  <label for="ex_rd2">체크박스</label> 
</div> */

.checks {position: relative;}
.checks input[type="radio"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}
.checks input[type="radio"] + label {
  display: inline-block;
  position: relative;
  padding-left: 30px; /* 글자와 체크박스 사이의 간격을 변경 */
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.checks input[type="radio"] + label:before {
  content: '';  /* 체크표시 유니코드 사용 */
  position: absolute;
  left: 0;
  top: 0px; /* 이 값을 변경해서 글자와의 정렬 */
  width: 14px; /* 라디오버튼의 너비를 지정 */
  height: 14px; /* 라디오버튼의 높이를 지정 */
  text-align: center; /* 세로정렬을 위해 높이값과 일치 */
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius: 100%;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="radio"] + label:active:before,
.checks input[type="radio"]:checked + label:active:before  {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}
.checks input[type="radio"]:checked + label:before {
  background: #777;
  border-color: #adb8c0;
}
.checks input[type="radio"]:checked + label:after {
  position: absolute;
  top:  0px;
  left: 0.9px;  
  width: 14px; /*  체크시 라디오버튼의 너비를 지정 */
  height: 14px;
  background: #777;
  border-radius: 100%;
  box-shadow: inset 0px 0px 10px rgba(0,0,0,0.3);
  
  .button {
   display: inline-block;
   zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
   *display: inline;
   vertical-align: baseline;
   margin: 0 2px;
   outline: none;
   cursor: pointer;
   text-align: center;
   text-decoration: none;
   font: 14px/100% Arial, Helvetica, sans-serif;
   padding: .5em 2em .55em;
   text-shadow: 0 1px 1px rgba(0,0,0,.3);
   -webkit-border-radius: .5em; 
   -moz-border-radius: .5em;
   border-radius: .5em;
   -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
   -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
   box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.button:hover {
   text-decoration: none;
}
.button:active {
   position: relative;
   top: 1px;
}

.bigrounded {
   -webkit-border-radius: 2em;
   -moz-border-radius: 2em;
   border-radius: 2em;
}
.medium {
   font-size: 12px;
   padding: .4em 1.5em .42em;
}
.small {
   font-size: 10.5px;
   padding: .2em 1em .275em;
}
  
}

/* white */
.white {
   color: #606060;
   border: solid 1px #b7b7b7;
   background: #fff;
   background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
   background: -moz-linear-gradient(top,  #fff,  #ededed);
   filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');
}
.white:hover {
   background: #ededed;
   background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
   background: -moz-linear-gradient(top,  #fff,  #dcdcdc);
   filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#dcdcdc');
}
.white:active {
   color: #999;
   background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#fff));
   background: -moz-linear-gradient(top,  #ededed,  #fff);
   filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#ffffff');
}

</style>

<form name="frm1" method="post"
   action="<c:url value='/rec/recWrite.ag'/>">

   <div class="recWrite">
         <span class="titd">서비스등급</span> 
           <select style="float: left;" 
           name="grade" id="grade">
            <option value="슈퍼">슈퍼</option>
            <option value="그랜드">그랜드</option>
            <option value="스페셜">스페셜</option>
            <option value="스피드">스피드</option></select>
        <span class="titd">서비스기간</span> 
         <select style="float:left; " 
         name="days" id="days">
            <option value="1">1일</option>
            <option value="7">7일</option>
            <option value="30">30일</option>
            <option value="90">90일</option>
            <option value="180">180일</option></select>
      
    

      <input type="hidden" value="${compVo.compCode }" 
        name="compCode" readonly="readonly">


      <div id="div1"></div>
      <h2>기업 정보</h2>
      <div class="companyInfo bg">
         <dl class="clearBoth renceWrite">
            <dt>
               <span class="titd">회사/점포명</span> <input type="text" class="txt_150"
                  readonly="readonly" value="${compVo.compName }">
            </dt>
            <dt>
               <span class="titd">대표자명(ceo)</span> <input type="text"
                  class="txt_150" readonly="readonly" value="${compVo.ceo }">
            </dt>
            <dt>
               <span class="titd">사업자<br>등록번호</span> <input type="text" class="txt_150"
                  readonly="readonly" value="${compVo.compNum }">
            </dt>
            <dt>
               <span class="titd">회사<br>점포주소</span> <input type="text" class="txt"
                  readonly="readonly"
                  value="${compVo.address } 
                         ${compVo.addressDetail}">
            </dt>
            <input type="hidden" name="imgURL" value="http://i.imgur.com/kbujjW9.jpg" >
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
			<dl class="clearBoth renceWrite">
				<dt>
					<span class="titd">담당자명</span> <input type="text" class="txt_60"
						placeholder="이름" name="detpName" value="${compVo.deptName }">
				</dt>
				<dt>
					<span class="titd">전화번호</span> <input type="text" class="phone1"
						name="phone1" placeholder="02" maxlength="3"
						value="${compVo.phone1 }"> <input type="text"
						class="phone2" name="phone2" placeholder="0000" maxlength="4"
						value="${compVo.phone2 }"> <input type="text"
						class="phone3" name="phone3" placeholder="0000" maxlength="4"
						value="${compVo.phone3 }">
				</dt>
				<dt class="clearBoth">
					<span class="titd">휴대폰</span> <input type="text" class="phone1"
						name="hp1" placeholder="010" maxlength="3" value="${compVo.hp1 }">
					<input type="text" class="phone2" name="hp2" placeholder="0000"
						maxlength="4" value="${compVo.hp2 }"> <input type="text"
						class="phone3" name="hp3" placeholder="0000" maxlength="4"
						value="${compVo.hp3 }">
				</dt>
				<dt>
					<span class="titd">팩스번호</span> <input type="text" class="phone1"
						name="fax1" placeholder="010" maxlength="3"
						value="${compVo.fax1 }"> <input type="text" class="phone2"
						name="fax2" placeholder="0000" maxlength="4"
						value="${compVo.fax2 }"> <input type="text" class="phone3"
						name="fax3" placeholder="0000" maxlength="4"
						value="${compVo.fax3 }">
				</dt>
				<dt>
					<span class="titd">e-mail</span> <input type="text" class="email1"
						placeholder="exam123" value="${compVo.email1 }"> <span
						style="margin-top: 7px; float: left"> @</span> <select
						class="floatLeft" id=email2>
						<option value="naver">naver.com</option>
						<option value="hanmail">hanmail.net</option>
						<option value="google">google.com</option>
						<option value="nate">nate.com</option>
						<option value="etc">직접입력</option>
					</select> <input type="text" class="email3" placeholder=naver.com
						id="email3" value="${compVo.email2 }">


				</dt>
			</dl>
		</div>
      <!-- 근무지 정보 -->
      <h2>근무지정보</h2>
      <div class=" workInfo bg">
         <dl class="clearBoth rence">
            <dt>
               <span class="titd">근무회사<br>점포명</span> <input type="text"
                  class="txt_200" placeholder="회사명(지점명)" maxlength="30"
                  name="compName">
            </dt>
            <dt>
               <span class="titd">채용제목</span> <input type="text" class="txt"
                  placeholder="성실하게 함께할 가족 구합니다" name="title" id="title"
                  maxlength="33">
            </dt>
            <dt >
               <span class="titd">업직종</span>
               <select style="margin-left: 10px"   
                name="jobName" id="jobName"> </select>
                <select  
                name="jobName2" id="jobName2">
                <option value="null">직종선택</option>
               </select>
               
            </dt>
            <dt>
               <span class="titd">근무지주소</span> <input type="text" class="txt_70"
                  placeholder="우편번호" name="zipcode" id="zipcode" readonly="readonly">
               <input type="text" class="txt_500" placeholder="주소" name="address"
                  id="address" readonly="readonly">
            </dt>
            <dt>
               <span class="titd">상세주소</span> <input type="text" class="txt_500"
                  placeholder="상세주소" name="addressDetail" id="addressDetail">

               <input type="button" class="white" value="우편번호 찾기"
                  id="btnZipcode">
            </dt>
            <dt>
               <span class="titd">인근지하철</span> <select
                  class="txt_100 " name="subRegion"
                  id="subRegion">
                  <option value="null">지역</option>
                  <option value="서울">서울</option>
                  <option value="인천">인천</option>
                  <option value="대전">대전</option>
                  <option value="광주">광주</option>
                  <option value="부산">부산</option>
               </select> <select class="txt_150 " name="subNum"
                  id="subNum">
               </select> <select class="txt_150 " name="subName"
                  id="subName">

               </select> <input type="text" class="txt_200" name="subInfo" id="subInfo"
               placeholder="1번출구  500m이내" >
            </dt>
         </dl>
      </div>
      <!-- 근무조건 -->
      <h2>근무조건</h2>
      <div class="workCondition bg checks">
         <dl class="clearBoth renceWrite">
            <dt >
               <span class="titd">근무기간</span> 
               <input type="radio" id="one" name="workTerm" 
                 value="하루(1일)" checked="checked"> 
               <label for="one"> 하루(1일)</label> 
               <input type="radio" id="week"
                 name="workTerm" value="1주일이하"> 
               <label for="week"> 1주일이하</label> 
               <input type="radio" id="month" name="workTerm"
                 value="1주일~1개월"> 
               <label for="month"> 1주일~1개월</label> 
               <input type="radio" id="threeMonth" name="workTerm" 
                 value="1개월~3개월">
               <label for="threeMonth"> 1개월~3개월</label> 
               <input type="radio" id="sixMonth" name="workTerm" 
                 value="3개월~6개월"> 
               <label for="sixMonth"> 3개월~6개월 </label>
               <span class="clearBoth titd">　</span>  
               <input type="radio" id="year"  name="workTerm" 
                 value="6개월~1년"> 
               <label for="year">  6개월~1년</label> 
               <input type="radio" id="consult" name="workTerm"
                 value="기간협의"> 
               <label for="consult"> 기간협의</label>
            </dt>
            <dt >
               <span class="titd">근무요일</span> 
               <input type="radio" id="MontoSun"
                  name="workDays" checked="checked" value="월~일"> 
               <label for="MontoSun"> 월~일</label> 
               <input type="radio" id="MontoSat"
                  name="workDays" value="월~토"> 
               <label for="MontoSat"> 월~토</label> 
               <input type="radio" id="MontoFri" name="workDays" 
                  value="월~금">
               <label for="MontoFri"> 월~금</label> 
               <input type="radio" id="SatSun"
                  name="workDays" value="주말(토,일)"> 
               <label for="SatSun"> 주말(토,일)</label>
               <input type="radio" id="sixDay" name="workDays"
                  value="주 6일"> 
               <label for="sixDay"> 주 6일</label> 
               <span class="clearBoth titd"> </span> 
               <input type="radio" id="fiveDay" name="workDays" 
                  value="주 5일"> 
               <label for="fiveDay"> 주 5일</label> 
               <input type="radio" id="fourDay" name="workDays"
                value="주 4일"> 
               <label for="fourDay">  주 4일</label> 
               <input type="radio" id="threeDay" name="workDays"
                  value="주 3일"> 
               <label for="threeDay"> 주 3일</label> 
               <input type="radio" id="twoDay" name="workDays" 
                  value="주 2일"> 
               <label for="twoDay"> 주 2일</label> 
               <input type="radio" id="oneDay" name="workDays" 
               value="주 1일"> 
               <label for="oneDay"> 주 1일</label>


            </dt>
            <dt>
               <span class="titd" style="height: 20px;">근무시간 </span><select
                  class="txt_85 " 
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
               </select> <select class="txt_85 " name="workTime2">
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
                  class="txt_85 " name="workTime3">
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
               </select> <select class="txt_85 " name="workTime4">
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
               <span class="titd" >급여선택</span> 
               <select class="txt_85 " 
                  name="payType" >
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
                class="white small button"
                type="button" onclick="minPaySet()"> 
            </dt>
            <dt >
               <span class="titd">고용형태</span> 
               <input type="checkbox"
                name="recruitType" value="알바" id="alba"> 
               <label for="alba">알바</label>
               <input type="checkbox" value="J" id="jung"> 
               <label for="jung"> 정규직</label> 
               <input type="checkbox" value="G" id="gye">
               <label for="gye"> 계약직</label> 
               <span class="clearBoth titd"> </span>
               <input type="checkbox" value="F"
                  id="fageon"> 
               <label for="fageon">파견직</label> 
               <input type="checkbox" value="I" id="intern">
               <label for="intern">인턴직</label>
               <input type="checkbox" value="W" id="wechock"> 
               <label for="wechock">위촉직</label>
            </dt>
            <dt class="rence" id="welf" style="height: 280px;">
               <!-- <span class="titd">복리후생</span> <input type="text" class="txt"
                  name="welfare" id="welfare"> -->
            </dt>
         </dl>
      </div>
      <h2>지원조건</h2>
      <div class="requestCondition bg checks">
         <dl class="clearBoth renceWrite">
            <dt >
               <span class="titd">성별 </span> 
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
            <dt >
               <span class="titd">연령</span> 
               <input type="radio" id="donAge"
                name="age" checked="checked" value="연령무관"> 
               <label for="donAge">연령무관</label> 
               <input type="radio" id="dontAge"
                  name="age" value="">
               <label for="dontAge">연령제한 있음</label>

               <input type="checkbox" id="oldAge" 
                name="age" value="고연령자(65세이상)">
               <label for=oldAge> 고연령자 가능<br>(65세이상)</label> 
               <input type="checkbox" id="youngAge" 
                name="age" value="청소년(만 18세이상)"> 
               <label for=youngAge> 청소년가능<br>(만18세 이상)</label>
               <input type="checkbox" id="housewife" 
                name="age" value="주부"> 
               <label for=housewife> 주부 가능</label> 
            </dt>
            <dt >
               <span class="titd">학력조건</span> 
               <input type="radio" id="eduLv" name="educateLv" 
                checked="checked" value="학력무관"> 
               <label for="eduLv"> 학력무관</label> 
               <input type="radio" id="middle"
                name="educateLv" value="중학교졸업"> 
               <label for="middle"> 중학교졸업 </label> 
               <input type="radio" id="high" name="educateLv"
                value="고등학교졸업"> 
               <label for="high"> 고등학교졸업 </label> 
               <span class="clearBoth titd"> </span>
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
            <dt >
               <span class="titd">경력사항</span> 
               <input type="radio" id="work" name="career" 
                checked="checked"> 
               <label for="work"> 경력무관 </label> 
               <input type="radio" id="newcomer" name="career">
               <label for="newcomer"> 신입 </label> 
               <input type="radio" id="experience"
                name="career"> 
               <label for="experience"> 경력 </label>
            </dt>
            <dt >
               <div style="height: 110px;">
                 <span class="clearBoth titd">우대조건</span> 
                 <input type="checkbox" id="expPre" 
                  name="preference" value="동종업계 경력자"> 
                 <label  for="expPre"> 
                                        동종업계 경력자 </label> 
                 <input type="checkbox" id="licensePre" 
                  name="preference" value="관련자격증 소시자"> 
                 <label  for="licensePre">
                                        관련자격증 소지자 </label> 
                 <input type="checkbox" id="pcPre" 
                  name="preference" value="컴퓨터활용 가능자"> 
                 <label  for="pcPre">
                                        컴퓨터활용 가능자 </label> 
                 <input type="checkbox" id="longPre" 
                  name="preference" value="장기근무 가능자"> 
                 <label  for="longPre">
                                        장기근무 가능자 </label> 
                 <span class="clearBoth titd"> </span> 
                 <input type="checkbox" id="engPre" 
                  name="preference" value="영어 가능자">
                 <label  for="engPre"> 
                                        영어 가능자 </label> 
                 <input type="checkbox" id="jpPre" 
                  name="preference" value="일어 가능자">
                 <label  for="jpPre"> 
                                         일어 가능자 </label> 
                 <input type="checkbox" id="cnPre" 
                  name="preference" value="중국어 가능자">
                 <label  for="cnPre"> 
                                         중국어 가능자 </label> 
                 <input type="checkbox" id="insidePre" 
                  name="preference" value="인근 거주자">
                 <label  for="insidePre"> 
                                         인근 거주자 </label> 
                 <span class="clearBoth titd"> </span> 
                 <input type="checkbox" id="drivePre" 
                  name="preference" value="운전면허 소지자"> 
                 <label  for="drivePre"> 
                                        운전면허 소지자 </label> 
                 <input type="checkbox" id="byclePre" 
                  name="preference" value="원동기면허 소지자">
                 <label  for="byclePre"> 
                                         원동기면허 소지자 </label> 
                 <input type="checkbox" id="carPre" 
                  name="preference" value="차량 소지자">
                 <label  for="carPre"> 
                                        차량 소지자 </label> 
                 <input type="checkbox" id="militaryPre" 
                  name="preference" value="군필자">
                 <label  for="militaryPre"> 
                                        군필자 </label> 
                 <span class="clearBoth titd"> </span> 
                 <input type="checkbox" id="femailPre" 
                  name="preference" value="여성"> 
                 <label  for="femailPre"> 
                                          여성 </label> 
                 <input type="checkbox" id="mrsPre" 
                  name="preference" value="경력단절여성"> 
                 <label  for="mrsPre"> 
                                        경력단절여성 </label>
               </div>
            </dt>
         </dl>
      </div>
      <h2>모집내용</h2>
      <div class="recContent bg checks">
         <dl class="clearBoth renceWrite">
            <dt >
               <span class="titd">모집인원 </span> 
               <input type="text" class="txt_50"
                placeholder="00명" name="recruitMember"
                id="writeMember" name="recruitMember"> 
               <input type="radio" id="tenPeople" 
                name="recruitMember" value="0명">
               <label id="tenxone" for="tenPeople"> 0명 </label> 
               <input type="radio" id="hundredPeople" 
                name="recruitMember" value="00명" name="recruitMember"> 
                <label id="tenxten" for="hundredPeople">00명 </label>
            </dt>
            <dt >
               <span class="titd">모집대상</span> 
               <input type="checkbox" id="youth"
                  name="recruitPerson" value="청소년"> 
               <label for="youth">청소년</label>


               <input type="checkbox" id="univSt" 
               name="recruitPerson" value="대학생">
               <label for="univSt">대학생</label> 
               <input type="checkbox" id="homemaker" 
               name="recruitPerson" value="주부"> 
               <label for="homemaker">주부</label> 
               <input type="checkbox" id="senior"
               name="recruitPerson" value="장년"> 
               <label for="senior">장년</label>
               <span class="clearBoth titd"> </span>
               <input type="checkbox" id="disabled" 
               name="recruitPerson" value="장애인"> 
               <label for="disabled">장애인</label> 
               <input type="checkbox" id="novice" 
               name="recruitPerson" value="초보자">
               <label for="novice">초보자</label> 
               <input type="checkbox" id="homeWork" 
               name="recruitPerson" value="재택가능">
               <label for="homeWork">재택가능</label>
            </dt>
            <dt>
               <span class="titd">모집종료일</span>
               
                 <input type="hidden" id="calText2" size="10"
                 name="recruitDeadline" value="${serv }">
                 <input type="text" id="calText" size="10"
                 style="margin: 5px 0 0 10px;"
                 name="recruitDeadlineView" maxlength="10">
                 <input type="button" id="weekCal"
                   value="일주일동안" class="white small textBox"> 
                 <input type="button" id="monthCal"
                   value="한달동안" class="white small textBox">
                 <input type="button" id="completeCal"
                   value="채용시까지" class="white small textBox">
            </dt>
            <dt >
               <span class="titd">접수방법</span> 
               <input type="checkbox" id="onlineRec"
                 name="recruitMethod" value="온라인지원"> 
               <label  for="onlineRec"> 
                                  온라인지원 </label> 
               <input type="checkbox" id="emailRec" 
               name="recruitMethod" value="e-메일지원"> 
               <label  for="emailRec"> 
               e-메일지원 </label> 
               <input type="checkbox" id="phoneRec" 
               name="phoneRec" value="전화연락">
               <label  for="phoneRec"> 
                                    전화연락 </label> 
               <input  type="checkbox" id="offlineRec" 
               name="offlineRec" value="방문접수">
               <label  for="offlineRec"> 
                                   방문접수 </label>
               
               <input type="checkbox" id="postRec" 
                 value="우편">
               <label  for="postRec"> 우편 </label>
               <span class="clearBoth titd">　　</span> 
               <input type="checkbox" id="faxRec" 
                 value="팩스"> 
               <label  for="faxRec"> 팩스 </label> 
               <input type="checkbox" id="homepageRec" 
                 value="홈페이지"> 
               <label  for="homepageRec"> 홈페이지 </label> 
               <input type="checkbox" id="recForm" 
                 value="자사지원양식"> 
               <label for="recForm">자사지원양식</label> 
               <div style="display: inline-block;float: left;">
               <span style="float: left;margin: 5px 0;">(</span>
               <input type="radio"  
               name="recForm" id="FormF"> 
               <label for="FormF" style="width: 35px">필수 ,</label> 
               <input type="radio" name="recForm" id="FormS"> 
               <label for="FormS" style="width: 35px">선택</label>
               <span style="float: left;margin: 5px 0;">)</span>
               </div>
            </dt>
               

            <dt >
               <span class="titd">제출서류</span> <input type="checkbox" id="expDoc"
                  name="documents" value="이력서"> <label 
                  for="expDoc"> 이력서 </label> <input type="checkbox" id="juminDoc"
                  name="documents" value="주민.등록등본"> <label 
                  for="juminDoc"> 주민.등록등본 </label> <input type="checkbox"
                  id="mediDoc" name="documents" value="보건증"> <label
                   for="mediDoc"> 보건증 </label> <input type="checkbox"
                  id="introDoc" name="documents" value="자기소개서"> <label
                   for="introDoc"> 자기소개서 </label> <input
                  type="checkbox" id="parDoc" name="documents" value="부모님동의서">
               <label  for="parDoc"> 부모님동의서 </label>

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

<%@ include file="../inc/bottom.jsp"%>