<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" type="text/css"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>"
   type="text/css">
<%-- <link rel="stylesheet" type="text/css"
   href="<c:url value='/css/recLayout.css'/>" /> --%>
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/simpleButton.css'/>" />   
<script src="<c:url value='/jquery/jquery-ui.js'/>"
   type="text/javascript"></script>
<script type="text/javascript" 
	src="<c:url value='/naver/naverLogin_implicit-1.0.2.js'/>" charset="utf-8"></script>
	
	
	
	
<script type="text/javascript">
	function pageProc(curPos){
		document.frmPage.currentPage.value = curPos;
		document.frmPage.submit();
	}
	
	$.getPeriod = function(period_1, period_2){
		var period1 = period_1.split("년");
		var period2 = period_2.split("년");
		
		var period_b = new Date(period1[0], period1[1]-1, 1);
		var period_a = new Date(period2[0], period2[1]-1, 1);
		
		var period_c = (period_a.getTime()-period_b.getTime())/1000/60/60/24/30;
		
		var period = Math.floor(period_c);
		
		return period;
	}
	
	
	
	
	function validate_num(num) {
	      var pattern = new RegExp(/^[0-9]*$/g);
	      return pattern.test(num);
	}
	$(function() {
		
		$("#frmSearch").submit(function() {
			
		  if (!validate_num($("#period_year").val()) ||
	                  !validate_num($("#period_month").val())){
	          alert("경력은 숫자여야 합니다");
	          $("#period_year").focus();
	          return false;
	       }
		});
	   
		
		
		//상세검색 탭형식으로 보여주기
	      $( "#detailTabs" ).tabs({});
		
	      //임시 검색 추가조건 가리기 
	     
	      runEffect("#effect3");   
	         
	         // run the currently selected effect
	          function runEffect(effect) {
	            // get effect type from
	            var selectedEffect = $( "#effectTypes" ).val();
	            // Most effect types need no options passed by default
	            var options = {};
	            // some effects have required parameters
	            if ( selectedEffect === "scale" ) {
	              options = { percent: 50 };
	            } else if ( selectedEffect === "size" ) {
	              options = { to: { width: 10, height: 3 } };
	            }
	       
	            // Run the effect
	            $( effect ).toggle( selectedEffect, options, 500 );
	          };
	       
	          // Set effect from select menu value
	        
	          $( "#button3" ).on( "click", function() {
	            runEffect("#effect3");
	          });
	         
	          
	          
	          
	          
	          
	          
	          
	          
	/* Write에서 퍼오기 */          
	          $("#area1").change(function(){
	              if($("#area1 option:selected").val()=="서울특별시"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='강남구'>강남구</option>");
	                 $("#area2").append("<option value='강동구'>강동구</option>");
	                 $("#area2").append("<option value='강북구'>강북구</option>");
	                 $("#area2").append("<option value='강서구'>강서구</option>");
	                 $("#area2").append("<option value='관악구'>관악구</option>");
	                 $("#area2").append("<option value='광진구'>광진구</option>");
	                 $("#area2").append("<option value='구로구'>구로구</option>");
	                 $("#area2").append("<option value='금천구'>금천구</option>");
	                 $("#area2").append("<option value='노원구'>노원구</option>");
	                 $("#area2").append("<option value='도봉구'>도봉구</option>");
	                 $("#area2").append("<option value='동대문구'>동대문구</option>");
	                 $("#area2").append("<option value='동작구'>동작구</option>");
	                 $("#area2").append("<option value='마포구'>마포구</option>");
	                 $("#area2").append("<option value='서대문구'>서대문구</option>");
	                 $("#area2").append("<option value='서초구'>서초구</option>");
	                 $("#area2").append("<option value='성동구'>성동구</option>");
	                 $("#area2").append("<option value='성북구'>성북구</option>");
	                 $("#area2").append("<option value='송파구'>송파구</option>");
	                 $("#area2").append("<option value='양천구'>양천구</option>");
	                 $("#area2").append("<option value='양천구'>영등포구</option>");
	                 $("#area2").append("<option value='용산구'>용산구</option>");
	                 $("#area2").append("<option value='은평구'>은평구</option>");
	                 $("#area2").append("<option value='종로구'>종로구</option>");
	                 $("#area2").append("<option value='중구'>중구</option>");
	                 $("#area2").append("<option value='중랑구'>중랑구</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="광주광역시"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='광산구'>광산구</option>");
	                 $("#area2").append("<option value='남구'>남구</option>");
	                 $("#area2").append("<option value='동구'>동구</option>");
	                 $("#area2").append("<option value='북구'>북구</option>");
	                 $("#area2").append("<option value='서구'>서구</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="대구광역시"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='남구'>남구</option>");
	                 $("#area2").append("<option value='달서구'>달서구</option>");
	                 $("#area2").append("<option value='달성군'>달성군</option>");
	                 $("#area2").append("<option value='동구'>동구</option>");
	                 $("#area2").append("<option value='북구'>북구</option>");
	                 $("#area2").append("<option value='서구'>서구</option>");
	                 $("#area2").append("<option value='수성구'>수성구</option>");
	                 $("#area2").append("<option value='중구'>중구</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="대전광역시"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='대덕구'>대덕구</option>");
	                 $("#area2").append("<option value='동구'>동구</option>");
	                 $("#area2").append("<option value='서군'>서군</option>");
	                 $("#area2").append("<option value='유성구'>유성구</option>");
	                 $("#area2").append("<option value='중구'>중구</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="부산광역시"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='강서구'>강서구</option>");
	                 $("#area2").append("<option value='금정구'>금정구</option>");
	                 $("#area2").append("<option value='기장군'>기장군</option>");
	                 $("#area2").append("<option value='남구'>남구</option>");
	                 $("#area2").append("<option value='동구'>동구</option>");
	                 $("#area2").append("<option value='부산진구'>부산진구</option>");
	                 $("#area2").append("<option value='북구'>북구</option>");
	                 $("#area2").append("<option value='사상구'>사상구</option>");
	                 $("#area2").append("<option value='사하구'>사하구</option>");
	                 $("#area2").append("<option value='서구'>서구</option>");
	                 $("#area2").append("<option value='수영구'>수영구</option>");
	                 $("#area2").append("<option value='연제구'>연제구</option>");
	                 $("#area2").append("<option value='영도구'>영도구</option>");
	                 $("#area2").append("<option value='중구'>중구</option>");
	                 $("#area2").append("<option value='해운대구'>해운대구</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="울산광역시"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='남구'>남구</option>");
	                 $("#area2").append("<option value='동구'>동구</option>");
	                 $("#area2").append("<option value='북구'>북구</option>");
	                 $("#area2").append("<option value='울주군'>울주군</option>");
	                 $("#area2").append("<option value='중구'>중구</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="인천광역시"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='강화군'>강화군</option>");
	                 $("#area2").append("<option value='계양구'>계양구</option>");
	                 $("#area2").append("<option value='남구'>남구</option>");
	                 $("#area2").append("<option value='남동구'>남동구</option>");
	                 $("#area2").append("<option value='동구'>동구</option>");
	                 $("#area2").append("<option value='부평구'>부평구</option>");
	                 $("#area2").append("<option value='서구'>서구</option>");
	                 $("#area2").append("<option value='연수구'>연수구</option>");
	                 $("#area2").append("<option value='옹진군'>옹진군</option>");
	                 $("#area2").append("<option value='중구'>중구</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="세종특별자치시"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='세종시'>세종시</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="경기도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='가평군'>가평군</option>");
	                 $("#area2").append("<option value='고양시 덕양구'>고양시 덕양구</option>");
	                 $("#area2").append("<option value='고양시 일산동구'>고양시 일산동구</option>");
	                 $("#area2").append("<option value='고양시 일산서구'>고양시 일산서구</option>");
	                 $("#area2").append("<option value='과천시'>과천시</option>");
	                 $("#area2").append("<option value='광명시'>광명시</option>");
	                 $("#area2").append("<option value='광주시'>광주시</option>");
	                 $("#area2").append("<option value='구리시'>구리시</option>");
	                 $("#area2").append("<option value='군포시'>군포시</option>");
	                 $("#area2").append("<option value='김포시'>김포시</option>");
	                 $("#area2").append("<option value='남양주시'>남양주시</option>");
	                 $("#area2").append("<option value='동두천시'>동두천시</option>");
	                 $("#area2").append("<option value='부천시 소사구'>부천시 소사구</option>");
	                 $("#area2").append("<option value='부천시 오정구'>부천시 오정구</option>");
	                 $("#area2").append("<option value='부천시 원미구'>부천시 원미구</option>");
	                 $("#area2").append("<option value='성남시 분당구'>성남시 분당구</option>");
	                 $("#area2").append("<option value='성남시 수정구'>성남시 수정구</option>");
	                 $("#area2").append("<option value='성남시 중원구'>성남시 중원구</option>");
	                 $("#area2").append("<option value='수원시 권선구'>수원시 권선구</option>");
	                 $("#area2").append("<option value='수원시 영통구'>수원시 영통구</option>");
	                 $("#area2").append("<option value='수원시 장안구'>수원시 장안구</option>");
	                 $("#area2").append("<option value='수원시 팔달구'>수원시 팔달구</option>");
	                 $("#area2").append("<option value='안산시 단원구'>안산시 단원구</option>");
	                 $("#area2").append("<option value='안산시 상록구'>안산시 상록구</option>");
	                 $("#area2").append("<option value='안성시'>안성시</option>");
	                 $("#area2").append("<option value='안양시 동안구'>안양시 동안구</option>");
	                 $("#area2").append("<option value='안양시 만안구'>안양시 만안구</option>");
	                 $("#area2").append("<option value='양주시'>양주시</option>");
	                 $("#area2").append("<option value='양평군'>양평군</option>");
	                 $("#area2").append("<option value='여주시'>여주시</option>");
	                 $("#area2").append("<option value='연천군'>연천군</option>");
	                 $("#area2").append("<option value='오산시'>오산시</option>");
	                 $("#area2").append("<option value='용산시 기흥구'>용산시 기흥구</option>");
	                 $("#area2").append("<option value='용산시 수지구'>용산시 수지구</option>");
	                 $("#area2").append("<option value='용산시 처인구'>용산시 처인구</option>");
	                 $("#area2").append("<option value='의왕시'>의왕시</option>");
	                 $("#area2").append("<option value='의정부시'>의정부시</option>");
	                 $("#area2").append("<option value='이천시'>이천시</option>");
	                 $("#area2").append("<option value='파주시'>파주시</option>");
	                 $("#area2").append("<option value='평택시'>평택시</option>");
	                 $("#area2").append("<option value='포천시'>포천시</option>");
	                 $("#area2").append("<option value='하남시'>하남시</option>");
	                 $("#area2").append("<option value='화성시'>화성시</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="강원도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='강화군'>강릉시</option>");
	                 $("#area2").append("<option value='고성군'>고성군</option>");
	                 $("#area2").append("<option value='동해시'>동해시</option>");
	                 $("#area2").append("<option value='삼척시'>삼척시</option>");
	                 $("#area2").append("<option value='속초시'>속초시</option>");
	                 $("#area2").append("<option value='양양군'>양구군</option>");
	                 $("#area2").append("<option value='양양군'>양양군</option>");
	                 $("#area2").append("<option value='영월군'>영월군</option>");
	                 $("#area2").append("<option value='원주시'>원주시</option>");
	                 $("#area2").append("<option value='인제군'>인제군</option>");
	                 $("#area2").append("<option value='정선군'>정선군</option>");
	                 $("#area2").append("<option value='철원군'>철원군</option>");
	                 $("#area2").append("<option value='춘천시'>춘천시</option>");
	                 $("#area2").append("<option value='태백시'>태백시</option>");
	                 $("#area2").append("<option value='평창군'>평창군</option>");
	                 $("#area2").append("<option value='홍천군'>홍천군</option>");
	                 $("#area2").append("<option value='화천군'>화천군</option>");
	                 $("#area2").append("<option value='횡성군'>횡성군</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="경상남도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='거제시'>거제시</option>");
	                 $("#area2").append("<option value='거창군'>거창군</option>");
	                 $("#area2").append("<option value='고성군'>고성군</option>");
	                 $("#area2").append("<option value='김해시'>김해시</option>");
	                 $("#area2").append("<option value='남해군'>남해군</option>");
	                 $("#area2").append("<option value='밀양시'>밀양시</option>");
	                 $("#area2").append("<option value='사천시'>사천시</option>");
	                 $("#area2").append("<option value='산청군'>산청군</option>");
	                 $("#area2").append("<option value='양산시'>양산시</option>");
	                 $("#area2").append("<option value='양산시'>의령군</option>");
	                 $("#area2").append("<option value='진주시'>진주시</option>");
	                 $("#area2").append("<option value='창녕군'>창녕군</option>");
	                 $("#area2").append("<option value='창원시 마산합포구'>창원시 마산합포구</option>");
	                 $("#area2").append("<option value='창원시 마산회원구'>창원시 마산회원구</option>");
	                 $("#area2").append("<option value='창원시 성산구'>창원시 성산구</option>");
	                 $("#area2").append("<option value='창원시 의창구'>창원시 의창구</option>");
	                 $("#area2").append("<option value='창원시 진해구'>창원시 진해구</option>");
	                 $("#area2").append("<option value='통영시'>통영시</option>");
	                 $("#area2").append("<option value='하동군'>하동군</option>");
	                 $("#area2").append("<option value='하동군'>함안군</option>");
	                 $("#area2").append("<option value='함양군'>함양군</option>");
	                 $("#area2").append("<option value='합천군'>합천군</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="경상북도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='경산시'>경산시</option>");
	                 $("#area2").append("<option value='경주시'>경주시</option>");
	                 $("#area2").append("<option value='고령군'>고령군</option>");
	                 $("#area2").append("<option value='구미시'>구미시</option>");
	                 $("#area2").append("<option value='군위군'>군위군</option>");
	                 $("#area2").append("<option value='김천시'>김천시</option>");
	                 $("#area2").append("<option value='문경시'>문경시</option>");
	                 $("#area2").append("<option value='봉화군'>봉화군</option>");
	                 $("#area2").append("<option value='상주시'>상주시</option>");
	                 $("#area2").append("<option value='성주군'>성주군</option>");
	                 $("#area2").append("<option value='안동시'>안동시</option>");
	                 $("#area2").append("<option value='영덕군'>영덕군</option>");
	                 $("#area2").append("<option value='영양군'>영양군</option>");
	                 $("#area2").append("<option value='영주시'>영주시</option>");
	                 $("#area2").append("<option value='영천시'>영천시</option>");
	                 $("#area2").append("<option value='예천군'>예천군</option>");
	                 $("#area2").append("<option value='예천군'>울릉군</option>");
	                 $("#area2").append("<option value='울진군'>울진군</option>");
	                 $("#area2").append("<option value='의성군'>의성군</option>");
	                 $("#area2").append("<option value='청도군'>청도군</option>");
	                 $("#area2").append("<option value='청송군'>청송군</option>");
	                 $("#area2").append("<option value='칠곡군'>칠곡군</option>");
	                 $("#area2").append("<option value='포항시 남구'>포항시 남구</option>");
	                 $("#area2").append("<option value='포항시 북구'>포항시 북구</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="전라남도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='강진군'>강진군</option>");
	                 $("#area2").append("<option value='고흥군'>고흥군</option>");
	                 $("#area2").append("<option value='곡성군'>곡성군</option>");
	                 $("#area2").append("<option value='광양시'>광양시</option>");
	                 $("#area2").append("<option value='구례군'>구례군</option>");
	                 $("#area2").append("<option value='나주시'>나주시</option>");
	                 $("#area2").append("<option value='담양군'>담양군</option>");
	                 $("#area2").append("<option value='목포시'>목포시</option>");
	                 $("#area2").append("<option value='무안군'>무안군</option>");
	                 $("#area2").append("<option value='보성군'>보성군</option>");
	                 $("#area2").append("<option value='순천시'>순천시</option>");
	                 $("#area2").append("<option value='신안군'>신안군</option>");
	                 $("#area2").append("<option value='여수시'>여수시</option>");
	                 $("#area2").append("<option value='영광군'>영광군</option>");
	                 $("#area2").append("<option value='영암군'>영암군</option>");
	                 $("#area2").append("<option value='완도군'>완도군</option>");
	                 $("#area2").append("<option value='장성군'>장성군</option>");
	                 $("#area2").append("<option value='장흥군'>장흥군</option>");
	                 $("#area2").append("<option value='진도군'>진도군</option>");
	                 $("#area2").append("<option value='함평군'>함평군</option>");
	                 $("#area2").append("<option value='해남군'>해남군</option>");
	                 $("#area2").append("<option value='화순군'>화순군</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="전라북도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='고창군'>고창군</option>");
	                 $("#area2").append("<option value='군산시'>군산시</option>");
	                 $("#area2").append("<option value='김제시'>김제시</option>");
	                 $("#area2").append("<option value='남원시'>남원시</option>");
	                 $("#area2").append("<option value='무주군'>무주군</option>");
	                 $("#area2").append("<option value='부안군'>부안군</option>");
	                 $("#area2").append("<option value='순창군'>순창군</option>");
	                 $("#area2").append("<option value='완주군'>완주군</option>");
	                 $("#area2").append("<option value='익산시'>익산시</option>");
	                 $("#area2").append("<option value='임실군'>임실군</option>");
	                 $("#area2").append("<option value='장수군'>장수군</option>");
	                 $("#area2").append("<option value='전주시 덕진구'>전주시 덕진구</option>");
	                 $("#area2").append("<option value='전주시 완산구'>전주시 완산구</option>");
	                 $("#area2").append("<option value='정읍시'>정읍시</option>");
	                 $("#area2").append("<option value='진안군'>진안군</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="충청남도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='계룡시'>계룡시</option>");
	                 $("#area2").append("<option value='공주시'>공주시</option>");
	                 $("#area2").append("<option value='금산군'>금산군</option>");
	                 $("#area2").append("<option value='논산시'>논산시</option>");
	                 $("#area2").append("<option value='당진시'>당진시</option>");
	                 $("#area2").append("<option value='보령시'>보령시</option>");
	                 $("#area2").append("<option value='부여군'>부여군</option>");
	                 $("#area2").append("<option value='서산시'>서산시</option>");
	                 $("#area2").append("<option value='서천군'>서천군</option>");
	                 $("#area2").append("<option value='아산시'>아산시</option>");
	                 $("#area2").append("<option value='예산군'>예산군</option>");
	                 $("#area2").append("<option value='천안시 동남구'>천안시 동남구</option>");
	                 $("#area2").append("<option value='천안시 서북구'>천안시 서북구</option>");
	                 $("#area2").append("<option value='청양군'>청양군</option>");
	                 $("#area2").append("<option value='태안군'>태안군</option>");
	                 $("#area2").append("<option value='홍성군'>홍성군</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="충청북도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='괴산군'>괴산군</option>");
	                 $("#area2").append("<option value='단양군'>단양군</option>");
	                 $("#area2").append("<option value='보은군'>보은군</option>");
	                 $("#area2").append("<option value='영동군'>영동군</option>");
	                 $("#area2").append("<option value='옥천군'>옥천군</option>");
	                 $("#area2").append("<option value='음성군'>음성군</option>");
	                 $("#area2").append("<option value='제천시'>제천시</option>");
	                 $("#area2").append("<option value='증평군'>증평군</option>");
	                 $("#area2").append("<option value='진천군'>진천군</option>");
	                 $("#area2").append("<option value='청주시 상당구'>청주시 상당구</option>");
	                 $("#area2").append("<option value='청주시 서원구'>청주시 서원구</option>");
	                 $("#area2").append("<option value='청주시 청원구'>청주시 청원구</option>");
	                 $("#area2").append("<option value='청주시 흥덕구'>청주시 흥덕구</option>");
	                 $("#area2").append("<option value='충주시'>충주시</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="제주특별자치도"){
	                 $("#area2 option").remove();
	                 $("#area2").removeAttr("disabled");
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").append("<option value='서귀포시'>서귀포시</option>");
	                 $("#area2").append("<option value='제주시'>제주시</option>");
	                 $("#area2").append("<option value='전체'>전체</option>");
	              }else if($("#area1 option:selected").val()=="전국"){
	                 $("#area2 option").remove();
	                 $("#area2").append("<option value=''>시/군/구</option>");
	                 $("#area2").prop("disabled","disabled");
	              }
	           });
	           
	           $("#ability1").change(function(){
	              if($("#ability1 option:selected").val()=="초등학교"){
	                 $("#ability2 option").remove();
	                 $("#ability2").append("<option value=''>상태</option>");
	                 $("#ability2").append("<option value='졸업'>졸업</option>");
	                 $(".detail_tr").remove();
	                 }else if($("#ability1 option:selected").val()=="중학교"
	                       || $("#ability1 option:selected").val()=="고등학교"){
	                    $("#ability2 option").remove();
	                 $("#ability2").append("<option value=''>상태</option>");
	                 $("#ability2").append("<option value='졸업'>졸업</option>");
	                 $("#ability2").append("<option value='재학'>재학</option>");
	                 $("#ability2").append("<option value='중퇴'>중퇴</option>");
	                 $(".detail_tr").remove();
	                 if($("#ability1 option:selected").val()=="고등학교"){
	                    $(".detail_tr_before").after("<tr id='tr' class='detail_tr'><td id='td1'><span>학력상세</span>"
	                    +"</td><td id='td2'><input type='checkbox' name='detail1' id='detail1'>"
	                    +"<label for='detail1'>고등학교</label></td></tr>");
	                    
	                 }
	                 }else if($("#ability1 option:selected").val()=="대학교 (2, 3년제)"
	                       || $("#ability1 option:selected").val()=="대학교 (4년제)"
	                       || $("#ability1 option:selected").val()=="대학원"){
	                    $("#ability2 option").remove();
	                 $("#ability2").append("<option value=''>상태</option>");
	                 $("#ability2").append("<option value='졸업'>졸업</option>");
	                 $("#ability2").append("<option value='재학'>재학</option>");
	                 $("#ability2").append("<option value='중퇴'>중퇴</option>");
	                 $("#ability2").append("<option value='휴학'>휴학</option>");
	                 $("#ability2").append("<option value='수료'>수료</option>");
	                 $(".detail_tr").remove();
	                 if($("#ability1 option:selected").val()=="대학교 (2, 3년제)"){
	                    $(".detail_tr_before").after("<tr id='tr' class='detail_tr'><td id='td1'><span>학력상세</span>"
	                    +"</td><td id='td2'><input type='checkbox' name='detail1' id='detail1'>"
	                    +"<label for='detail1'>고등학교  &nbsp;</label><input type='checkbox' name='detail2' id='detail2'>"
	                    +"<label for='detail2'>대학교 (2, 3년제)&nbsp;</label></td></tr>");
	                 }else if($("#ability1 option:selected").val()=="대학교 (4년제)"){
	                    $(".detail_tr_before").after("<tr id='tr' class='detail_tr'><td id='td1'><span>학력상세</span>"
	                       +"</td><td id='td2'><input type='checkbox' name='detail1' id='detail1'>"
	                       +"<label for='detail1'>고등학교  &nbsp;</label><input type='checkbox' name='detail2' id='detail2'>"
	                       +"<label for='detail2'>대학교 (2, 3년제)  &nbsp;</label><input type='checkbox' name='detail3' id='detail3'>"
	                       +"<label for='detail3'>대학교 (4년제)  &nbsp;</label></td></tr>");
	                 }else if($("#ability1 option:selected").val()=="대학원"){
	                    $(".detail_tr_before").after("<tr id='tr' class='detail_tr'><td id='td1'><span>학력상세</span>"
	                       +"</td><td id='td2'><input type='checkbox' name='detail1' id='detail1'>"
	                       +"<label for='detail1'>고등학교  &nbsp;</label><input type='checkbox' name='detail2' id='detail2'>"
	                       +"<label for='detail2'>대학교 (2, 3년제)  &nbsp;</label><input type='checkbox' name='detail3' id='detail3'>"
	                       +"<label for='detail3'>대학교 (4년제)  &nbsp;</label><input type='checkbox' name='detail4' id='detail4'>"
	                       +"<label for='detail4'>대학원&nbsp;</label></td></tr>");
	                 }
	                 }else{
	                    $("#ability2 option").remove();
	                    $("#ability2").append("<option value=''>상태</option>");
	                    $(".detail_tr").remove();
	                 }
	              
	              $("#detail1").change(function(){
	                 if($("#detail1").is(":checked")){
	                    $(".detail_tr").after("<tr id='tr' class='detail_tr_after1'><td id='td1'>고등학교</td><td id='td2'>"
	                    +"<select class='medium white textBox' name='detail1_year1' id='detail1_year1'><option value=''>년도</option><c:forEach var='i' begin='1989' end='2016'>"
	                    +"<option value='${i}'>${i}</option></c:forEach></select> ~ <select class='medium white textBox' name='detail1_year2' id='detail1_year2'><option value=''>년도</option>"
	                    +"<option value='현재'>현재</option><c:forEach var='i' begin='1989' end='2016'><option value='${i}'>${i}</option></c:forEach>"
	                    +"</select>&nbsp;&nbsp;<input type='text' class='textBox' id='university1' name='university1' placeholder='학교명'></td></tr>");
	                  }else{
	                    $(".detail_tr_after1").remove();
	                  }
	              });
	              
	              $("#detail2").change(function(){
	                 if($("#detail2").is(":checked")){
	                    $(".detail_tr").after("<tr id='tr' class='detail_tr_after2'><td id='td1'>대학교 (2 ,3년제)</td><td id='td2'>"
	                    +"<select class='medium white textBox' name='detail2_year1' id='detail2_year1'><option value=''>년도</option><c:forEach var='i' begin='1989' end='2016'>"
	                    +"<option value='${i}'>${i}</option></c:forEach></select> ~ <select class='medium white textBox' name='detail2_year2' id='detail2_year2'><option value=''>년도</option>"
	                    +"<option value='현재'>현재</option><c:forEach var='i' begin='1989' end='2016'><option value='${i}'>${i}</option></c:forEach>"
	                    +"</select><br><br><input type='text' id='university2' class='textBox' name='university2' placeholder='학교명'>"
	                    +"&nbsp;&nbsp;<input type='text' id='university2_2' class='textBox' name='university2_2' placeholder='전공'></td></tr>");
	                  }else{
	                    $(".detail_tr_after2").remove();
	                  }
	              });
	              
	              $("#detail3").change(function(){
	                 if($("#detail3").is(":checked")){
	                    $(".detail_tr").after("<tr id='tr' class='detail_tr_after3'><td id='td1'>대학교 (4년제)</td><td id='td2'>"
	                    +"<select class='medium white textBox' name='detail3_year1' id='detail3_year1'><option value=''>년도</option><c:forEach var='i' begin='1989' end='2016'>"
	                    +"<option value='${i}'>${i}</option></c:forEach></select> ~ <select class='medium white textBox' name='detail3_year2' id='detail3_year2'><option value=''>년도</option>"
	                    +"<option value='현재'>현재</option><c:forEach var='i' begin='1989' end='2016'><option value='${i}'>${i}</option></c:forEach>"
	                    +"</select><br><br><input type='text' id='university3' class='textBox' name='university3' placeholder='학교명'>"
	                    +"&nbsp;&nbsp;<input type='text' id='university3_3' class='textBox' name='university3_3' placeholder='전공'></td></tr>");
	                  }else{
	                    $(".detail_tr_after3").remove();
	                  }
	              });
	              
	              $("#detail4").change(function(){
	                 if($("#detail4").is(":checked")){
	                    $(".detail_tr").after("<tr id='tr' class='detail_tr_after4'><td id='td1'>대학원</td><td id='td2'>"
	                    +"<select class='medium white textBox' name='detail4_year1' id='detail4_year1'><option value=''>년도</option><c:forEach var='i' begin='1989' end='2016'>"
	                    +"<option value='${i}'>${i}</option></c:forEach></select> ~ <select class='medium white textBox' name='detail4_year2' id='detail4_year2'><option value=''>년도</option>"
	                    +"<option value='현재'>현재</option><c:forEach var='i' begin='1989' end='2016'><option value='${i}'>${i}</option></c:forEach></select>"
	                    +"&nbsp;&nbsp;<select class='medium white textBox' name='university' id='university'><option value=''>학위</option><option value='석사'>석사</option><option value='박사'>박사</option>"
	                    +"<option value='석박사통합'>석박사통합</option></select>"
	                    +"<br><br><input type='text' id='university4' class='textBox' name='university4' placeholder='학교명'>"
	                    +"&nbsp;&nbsp;<input type='text' id='university4_4' class='textBox' name='university4_4' placeholder='전공'></td></tr>");
	                  }else{
	                    $(".detail_tr_after4").remove();
	                  }
	              });
	              
	              $(".detail_tr_after1").remove();
	              $(".detail_tr_after2").remove();
	              $(".detail_tr_after3").remove();
	              $(".detail_tr_after4").remove();
	           }); // change 메서드 (학력사항, 상세입력)
	           
	           $("#period_check").click(function(){
	              if($("#period_check").is(":checked")){
	                 $("#period_year").removeAttr("disabled");
	                 $("#period_month").removeAttr("disabled");
	                 $("#period_year_2").removeAttr("disabled");
	                 $("#period_month_2").removeAttr("disabled");
	                 $("#period_c").removeAttr("disabled");
	                 $("#period_year2").prop("disabled","disabled").val("");
	                 $("#period_day").prop("disabled","disabled").val("");
	              } 
	           });
	           
	           $("#period_check2").click(function(){
	              if($("#period_check2").is(":checked")){
	                 $("#period_year").prop("disabled","disabled").val("");
	                 $("#period_month").prop("disabled","disabled").val("");
	                 $("#period_year_2").prop("disabled","disabled").val("");
	                 $("#period_month_2").prop("disabled","disabled").val("");
	                 $("#period_c").prop("disabled","disabled").prop("checked", false);
	                 $("#period_year2").removeAttr("disabled");
	                 $("#period_day").removeAttr("disabled");
	              }
	           });
	           
	           $("#period_c").click(function(){
	              if($("#period_c").is(":checked")){
	                 $("#period_year_2").prop("disabled","disabled").val("");
	                 $("#period_month_2").prop("disabled","disabled").val("");
	              }else if(!$("#period_c").is(":checked")){
	                 $("#period_year_2").removeAttr("disabled");
	                 $("#period_month_2").removeAttr("disabled");
	              }
	           });
	           
	           $("#language_study").click(function(){
	              if($("#language_study").is(":checked")){
	                 $("#language_study_Text").removeAttr("readonly");
	              }else{
	                 $("#language_study_Text").val("");
	                 $("#language_study_Text").prop("readonly", "readonly");
	              }
	           });
	           
	           $("#moo").click(function(){
	              if($("#moo").is(":checked")){
	                 $("#time1").removeAttr("selected").prop("disabled","disabled");
	                 $("#time2").removeAttr("selected").prop("disabled","disabled");
	                 $("#time1 option:eq(1)").prop("selected", "selected");
	                 $("#time2 option:eq(25)").prop("selected", "selected");
	              }else{
	                 $("#time1").removeAttr("selected").removeAttr("disabled");
	                 $("#time2").removeAttr("selected").removeAttr("disabled");
	                 $("#time1 option:eq(0)").prop("selected", "selected");
	                 $("#time2 option:eq(0)").prop("selected", "selected");
	              }
	           });
	           
	           $("#bt_picture").click(function(){
	              window.open("<c:url value='/resume/imageUp.ag?memberCode="+
	                    $("#memberCode").val()+"&photo="+$("#photo").val()+"'/>",
	                    "imageUp",
	                 "width=550,height=400,left=10, top=50,resizable=yes,location=yes");  
	           });
	           
	           $("#frmResume").submit(function(){
	              var ability = $("#ability1").val()+" "+$("#ability2").val();
	              $("#ability").val(ability);
	              
	              var detail = "";
	              if($("#detail1").is(":checked")){
	                 detail += $("#detail1_year1 option:selected").val()
	                          +"년 ~ "+$("#detail1_year2 option:selected").val()+"년 - "
	                          +$("#university1").val();
	              }
	              
	              if($("#detail2").is(":checked")){
	                 detail += ","+$("#detail2_year1 option:selected").val()
	                             +"년 ~ "+$("#detail2_year2 option:selected").val()+"년 -"
	                             +$("#university2").val()+" 전공 : "+$("#university2_2").val();
	              }
	              
	              if($("#detail3").is(":checked")){
	                 detail += ","+$("#detail3_year1 option:selected").val()
	                             +"년 ~ "+$("#detail3_year2 option:selected").val()+"년 -"
	                             +$("#university3").val()+" 전공 : "+$("#university3_3").val();
	              }
	              
	              if($("#detail4").is(":checked")){
	                 detail += ","+$("#detail4_year1 option:selected").val()
	                             +"년 ~ "+$("#detail4_year2 option:selected").val()+"년 -"
	                             +$("#university4").val()+" "+$("#university option:selected").val()+" 전공 : "+$("#university4_4").val();
	              }
	              
	              $("#detail").val(detail);
	              
	              /* 연락가능시간 */
	              var contatctHour = "";
	              if($("#time1 option:selected").val() != ""
	                       && $("#time2 option:selected").val() != ""){
	                 contatctHour = $("#time1 option:selected").val()+" ~ "
	                                +$("#time2 option:selected").val();
	              }
	              
	              $("#contatctHour").val(contatctHour);
	              
	              
	              /* 희망근무 */
	              /* 근무지 */
	              var area = $("#area1 option:selected").val()+" "+$("#area2 option:selected").val();
	              $("#area").val(area);
	              
	              /* 업직종 */
	              var category = "";
	              
	              if($("#category1").is(":checked")){
	                 category += $("#category1").val()+",";
	              }
	              if($("#category2").is(":checked")){
	                 category += $("#category2").val()+",";
	              }
	              if($("#category3").is(":checked")){
	                 category += $("#category3").val()+",";
	              }
	              if($("#category4").is(":checked")){
	                 category += $("#category4").val()+",";
	              }
	              if($("#category5").is(":checked")){
	                 category += $("#category5").val()+",";
	              }
	              if($("#category6").is(":checked")){
	                 category += $("#category6").val()+",";
	              }
	              if($("#category7").is(":checked")){
	                 category += $("#category7").val()+",";
	              }
	              if($("#category8").is(":checked")){
	                 category += $("#category8").val()+",";
	              }
	              if($("#category9").is(":checked")){
	                 category += $("#category9").val()+",";
	              }
	              if($("#category10").is(":checked")){
	                 category += $("#category10").val()+",";
	              }
	              if($("#category11").is(":checked")){
	                 category += $("#category11").val();
	              }
	              
	              $("#category").val(category);
	              
	              /* 업직종 */
	              var type = "";
	              if($("#type1").is(":checked")){
	                 type += $("#type1").val()+",";
	              }
	              if($("#type2").is(":checked")){
	                 type += $("#type2").val()+",";
	              }
	              if($("#type3").is(":checked")){
	                 type += $("#type3").val()+",";
	              }
	              if($("#type4").is(":checked")){
	                 type += $("#type4").val()+",";
	              }
	              if($("#type5").is(":checked")){
	                 type += $("#type5").val();
	              }
	              
	              $("#type").val(type);
	              
	              /* 근무일시 */
	              var day = "기간 : " + $("#day1 option:selected").val() + ", 요일 : "
	                    + $("#day2 option:selected").val() + ", 시간 : "
	                    + $("#day3 option:selected").val()
	              
	              $("#day").val(day);
	              
	              /* 급여 */
	              var pay = "";
	              
	              if($("#pay2").val() != ""){
	                 pay = $("#pay1 option:selected").val() + " " + $("#pay2").val() + "원";
	              }
	              
	              if($("#pay3").is(":checked")){
	                 pay = "추후협의";
	              }
	              
	              $("#pay").val(pay);
	              
	              /* 경력사항
	              근무기간 */
	              var period = "";
	              if($("#period_check").is(":checked")){
	                 period = $("#period_year option:selected").val()+"년 "
	                 + $("#period_month option:selected").val()+"월 ~ "
	                 + $("#period_year_2 option:selected").val()+"년 "
	                 + $("#period_month_2 option:selected").val()+"월 동안 근무";
	                 if($("#period_c").is(":checked")){
	                    period = $("#period_year option:selected").val()+"년 "
	                    + $("#period_month option:selected").val()+"월 부터 재직중";
	                 }
	              }else if($("#period_check2").is(":checked")){
	                 period = $("#period_year2 option:selected").val()+"년 "
	                    +$("#period_day option:selected").val()+"일 동안 근무";
	              }
	              
	              $("#period").val(period);
	              
	              /* 외국어능력
	              어학연수 */
	              var language = "";
	              if($("#language_study").is(":checked")){
	                 language = "어학연수 : "+$("#language_study_Text").val();
	                 $("#language_study").val(language);
	              } 
	              if(!$("#language_study").is(":checked")){
	                 $("#language_study").val("");
	              }
	              
	              /* 공인시험 */
	              var officialTest = $("#official_test1").val()+" "+$("#official_test2").val()
	                 +" "+$("#official_test_year option:selected").val()+"년 "
	                 +$("#official_test_month option:selected").val()+"월 시험";
	              
	              $("#officialTest").val(officialTest);
	              
	              /* 자격증
	              발행처 */
	              var collicensePlace = $("#collicense_place").val()+" "
	                 +$("#collicense_place_year").val()+"년 취득";
	              
	              $("#collicensePlace").val(collicensePlace);
	              
	              /* 컴퓨터 활용능력
	              IT/DESIGN 분야 */
	              var itDesignAbility = "";
	              
	              if($("#it_design_ability_1").is(":checked")){
	                 itDesignAbility += $("#it_design_ability_1").val()+",";
	              }
	              if($("#it_design_ability_2").is(":checked")){
	                 itDesignAbility += $("#it_design_ability_2").val()+",";
	              }
	              if($("#it_design_ability_3").is(":checked")){
	                 itDesignAbility += $("#it_design_ability_3").val()+",";
	              }
	              if($("#it_design_ability_4").is(":checked")){
	                 itDesignAbility += $("#it_design_ability_4").val()+",";
	              }
	              if($("#it_design_ability_5").is(":checked")){
	                 itDesignAbility += $("#it_design_ability_5").val()+",";
	              }
	              if($("#it_design_ability_6").is(":checked")){
	                 itDesignAbility += $("#it_design_ability_6").val()+",";
	              }
	              if($("#it_design_ability_7").is(":checked")){
	                 itDesignAbility += $("#it_design_ability_7").val();
	              }
	              
	              $("#itDesignAbility").val(itDesignAbility);
	              
	              if($("#title").val().length < 1){
	                 alert("이력서제목을 입력하셔야 합니다!!");
	                 $("#title").focus();
	                 return false;
	              }else if($("#area1").val()=='' || $("#area2").val()==''){
	                 alert("근무지를 입력하셔야 합니다!!");
	                 $("#area1").focus();
	                 return false;
	              }else if($("#category").val().length < 1){
	                 alert("업/직종을 입력하셔야 합니다!!");
	                 $("#category").focus();
	                 return false;
	              }else if($("#type").val().length < 1){
	                 alert("근무형태를 입력하셔야 합니다!!");
	                 $("#type").focus();
	                 return false;
	              }else if($("#type").val().length < 1){
	                 alert("근무형태를 입력하셔야 합니다!!");
	                 $("#type").focus();
	                 return false;
	              }else if($("#day1").val()==''
	                    || $("#day2").val()==''
	                    || $("#day3").val()==''){
	                 alert("근무일시를 입력하셔야 합니다!!");
	                 $("#day1").focus();
	                 return false;
	              }else if($("#ability1").val()==''
	                    || $("#ability2").val()=='' ){
	                 alert("최종학력을 입력하셔야 합니다!!");
	                 $("#ability1").focus();
	                 return false;
	              }else if($("#careerB").val() == "Y"){
	                 if($("#company").val().length < 1){
	                    alert("회사명을 입력하셔야 합니다!!");
	                    $("#company").focus();
	                    return false;
	                 }else if($("#period").val().length < 1){
	                    alert("근무기간을 입력하셔야 합니다!!");
	                    $("#period").focus();
	                    return false;
	                 }else if($("#work").val().length < 1){
	                    alert("담당업무를 입력하셔야 합니다!!");
	                    $("#work").focus();
	                    return false;
	                 }
	              }else if($("#languageB").val() == "Y"){
	                 if($("#language").val() == ''){
	                    alert("외국어를 입력하셔야 합니다!!");
	                    $("#language").focus();
	                    return false;
	                 }
	              }else if($("#licenseB").val() == "Y"){
	                 if($("#license_name").val().length < 1){
	                    alert("자격증을 입력하셔야 합니다!!");
	                    $("#license_name").focus();
	                    return false;
	                 }else if($("#collicense_place").val().length < 1){
	                    alert("발행처를 입력하셔야 합니다!!");
	                    $("#collicense_place").focus();
	                    return false;
	                 }
	              }else if($("#contatctHour").val().length < 1){
	                 alert("연락가능시간을 입력하셔야 합니다!!");
	                 $("#contatctHour").focus();
	                 return false;
	              }else if($("#pay").val().length < 1){
	                 alert("급여를 입력하셔야 합니다!!");
	                 $("#pay").focus();
	                 return false;
	              }
	           }); //submit
	           
	           $("select").addClass("medium white textBox");
	           
	           $("input[type='text']").addClass("textBox");
	           
	           $("#career").hide();
	           $(".language").hide();
	           $(".license").hide();
	           $(".computerAbility").hide();
	           $(".award").hide();
	           $(".personalInfo").hide();
	           
	           $("#img1").hover(function(event){
	              $("#img1").prop("src", "<c:url value='/images/resume_career_c.PNG'/>");
	           }, function(event){
	              if($("#careerB").val() == "N"){
	                 $("#img1").prop("src", "<c:url value='/images/resume_career.PNG'/>");
	              }
	           }).click(function(){
	              $("#career").toggle();
	              if($("#careerB").val() == "N"){
	                 $("#careerB").val("Y");
	                 $("#img1").prop("src", "<c:url value='/images/resume_career_c.PNG'/>");
	              }else{
	                 $("#careerB").val("N");
	                 $("#img1").prop("src", "<c:url value='/images/resume_career.PNG'/>");
	              }
	           });
	           
	           $("#img2").hover(function(event){
	              $("#img2").prop("src", "<c:url value='/images/resume_language_c.PNG'/>");
	           }, function(event){
	              if($("#languageB").val() == "N"){
	                 $("#img2").prop("src", "<c:url value='/images/resume_language.PNG'/>");
	              }
	           }).click(function(){
	              $(".language").toggle();
	              if($("#languageB").val() == "N"){
	                 $("#languageB").val("Y");
	                 $("#img2").prop("src", "<c:url value='/images/resume_language_c.PNG'/>");
	              }else{
	                 $("#languageB").val("N");
	                 $("#img2").prop("src", "<c:url value='/images/resume_language.PNG'/>");
	              }
	           });
	           
	           $("#img3").hover(function(event){
	              $("#img3").prop("src", "<c:url value='/images/resume_license_c.PNG'/>");
	           }, function(event){
	              if($("#licenseB").val() == "N"){
	                 $("#img3").prop("src", "<c:url value='/images/resume_license.PNG'/>");
	              }
	           }).click(function(){
	              $(".license").toggle();
	              if($("#licenseB").val() == "N"){
	                 $("#licenseB").val("Y");
	                 $("#img3").attr("src", "<c:url value='/images/resume_license_c.PNG'/>");
	              }else{
	                 $("#licenseB").val("N");
	                 $("#img3").prop("src", "<c:url value='/images/resume_license.PNG'/>");
	              }
	           });
	           
	           $("#img4").hover(function(event){
	              $("#img4").prop("src", "<c:url value='/images/resume_computer_c.PNG'/>");
	           }, function(event){
	              if($("#computerAbilityB").val() == "N"){
	                 $("#img4").prop("src", "<c:url value='/images/resume_computer.PNG'/>");
	              }
	           }).click(function(){
	              $(".computerAbility").toggle();
	              if($("#computerAbilityB").val() == "N"){
	                 $("#computerAbilityB").val("Y");
	                 $("#img4").prop("src", "<c:url value='/images/resume_computer_c.PNG'/>");
	              }else{
	                 $("#computerAbilityB").val("N");
	                 $("#img4").prop("src", "<c:url value='/images/resume_computer.PNG'/>");
	              }
	           });
	           
	           $("#img5").hover(function(event){
	              $("#img5").prop("src", "<c:url value='/images/resume_award_c.PNG'/>");
	           }, function(event){
	              if($("#awardB").val() == "N"){
	                 $("#img5").prop("src", "<c:url value='/images/resume_award.PNG'/>");
	              }
	           }).click(function(){
	              $(".award").toggle();
	              if($("#awardB").val() == "N"){
	                 $("#awardB").val("Y");
	                 $("#img5").prop("src", "<c:url value='/images/resume_award_c.PNG'/>");
	              }else{
	                 $("#awardB").val("N");
	                 $("#img5").prop("src", "<c:url value='/images/resume_award.PNG'/>");
	              }
	           });
	           
	           $("#img6").hover(function(event){
	              $("#img6").prop("src", "<c:url value='/images/resume_personal_c.PNG'/>");
	           }, function(event){
	              if($("#personalInfoB").val() == "N"){
	                 $("#img6").prop("src", "<c:url value='/images/resume_personal.PNG'/>");
	              }
	           }).click(function(){
	              $(".personalInfo").toggle();
	              if($("#personalInfoB").val() == "N"){
	                 $("#personalInfoB").val("Y");
	                 $("#img6").prop("src", "<c:url value='/images/resume_personal_c.PNG'/>");
	              }else{
	                 $("#personalInfoB").val("N");
	                 $("#img6").prop("src", "<c:url value='/images/resume_personal.PNG'/>");
	              }
	           });
	           
	           $("#pay3").click(function(){
	              if($("#pay3").is(":checked")){
	                 $("#pay2").prop("readonly", "readonly");
	                 $("#pay2").val("");
	              }else{
	                 $("#pay2").removeAttr("readonly");
	              }
	           });
	                     
	          
	});//ready
</script>
<style type="text/css">
	#tr{
		border-bottom: 2px solid silver;
	}
	
	td, th{
		padding: 5px;
	}
	
	.align_center{
		text-align: center;
	}
	
	.align_left{
		text-align: left;
	}
	
	.align_right{
		text-align: right;
	}
	
	#h2{
		font-size: 1.2em;
		font-weight: bold;
		border-bottom: 5px solid #33336C;
		padding-bottom: 20px;
		width: 880px;
	}
	
	a, a:VISITED{
		color: black;
		font-weight: bold;
	}
	
	.divPage{
		text-align:center;		
		padding:5px 0;
	}
	
	.divPage span{
		color:#5b75ff;
		font-weight: bold;
		font-size: 0.9em;
		border: 1px solid #eee;
		padding: 0 9px 0 9px;
		margin: 0 1px 0 1px;"
	}
	
	.divPage a{
		font-size: 0.9em;
		color: black;
		padding: 0 10px 0 10px;
	}
	#tdName{
		font-weight: bold;
		text-align: left;
		font-size: 0.8em;
		padding-left: 5px;
	}
	#tdGender{
		font-size: 0.7em;
		text-align: left;
		padding-left: 5px;
	}
	#spanName{
		padding-left: 5px;
	}
	td{
		padding: 10px 0;
	}
	tr#tr td#td2 label{
	width: 135px;
	
	}
	tr#tr td#td1{
	width: 90px;
	
	}
	
	#searchBt2
	{
	width: 100px; 
	height: 31px;
	border:none; 
	padding: 2px;
	background: #5995F4;
	color: #fdfdff;
	font-weight: bold;
	}
	#searchKeyword,
	#searchCondition{
	height: 29px;
   padding: 2px;
   border: 1px solid #5995F4;
   color: #0A34B4;
   font-weight: bold;
	}
	
	#searchBt2:hover
	{
	background: #1666F0;  
	}
	#searchKeyword:hover,
   #searchCondition:hover{
   border: 1.5px solid #1666F0;
   }
   
   #searchBt2:ACTIVE
   {
   background: #0A34B4;
   }
   #searchKeyword:ACTIVE,
   #searchCondition:ACTIVE{
   border: 2.5px solid #0A34B4;
   }
 /*   .rence label{
   margin: 10px 0 5px 0px;
   float: left;
   width: 115px;
   font-family:'bon godic';
   font-size: 8pt;
} */
dt label{
   font-family:'bon godic';
   font-size: 9.5pt;
   color: #650; 
}
#frmSearch label:HOVER {
	font-size: 80%;
	color: #0A34B4;
}
</style>





<form name="frmPage" method="post" action="<c:url value='/resume/list.ag'/>">
	<input type="hidden" name="currentPage">	
</form>
<h2 id="h2">인재 정보 리스트</h2>


<div class="divSearch" style="height:  400px;">
         <form name="frmSearch" method="post" id="frmSearch"
            action="<c:url value='/resume/list.ag' />">
            <div class="checks">
            <dl>
             <dt class="" style="height: 65px;margin-bottom: 0px;border-bottom: 0px">
                              
             <!-- CAREER (경력사항) -->
             <h2>경력사항</h2>
              <table id="box" >
               <!-- <tr id="tr">
                <td id="td1">
                 <label id="a">*</label>&nbsp;회사명
                </td>
                <td id="td2">
                 <input type="text" id="company" name="company" placeholder="회사명">
                </td>
               </tr> -->
               <tr id="tr">
                <td id="td1">
                 <label id="a">*</label>&nbsp;경력기간
                </td>
                <td id="td2">
           
                 <input id="period_check2" name="period_checks" 
                  type="radio" value="일" 
                  <c:if test="${param.period_checks=='일' }">
                  checked="checked"
                  </c:if>
                  />
                 <label for="period_check2"
                 style="width: 50px;"> 신입</label>
                   
                 <input id="period_check" name="period_checks" 
                  type="radio" value="~" 
                  <c:if test="${param.period_checks=='~' }">
                  checked="checked"
                  </c:if>
                  />
                 <label for="period_check"
                 style="width: 50px;"> 경력</label>
                  
            
            <input id="period_check3" name="period_checks" 
               type="radio" value="부터" 
               <c:if test="${param.period_checks=='부터' }">
               checked="checked"
               </c:if>
               />
            <label for="period_check3">재직중</label><br><br>
            
            </tr>
            
            <!-- <h2>희망근무조건</h2> -->
   <!-- <table id="box"> -->
      <tr id="tr">
         <td id="td1">
            <label id="a">*</label>&nbsp;지역
         </td>
         <td id="td2">
            <select id="area1" name="area1">
               <option value="">시/도</option>
               <option value="서울특별시">서울특별시</option>
               <option value="광주광역시">광주광역시</option>
               <option value="대구광역시">대구광역시</option>
               <option value="대전광역시">대전광역시</option>
               <option value="부산광역시">부산광역시</option>
               <option value="울산광역시">울산광역시</option>
               <option value="인천광역시">인천광역시</option>
               <option value="세종특별자치시">세종특별자치시</option>
               <option value="경기도">경기도</option>
               <option value="강원도">강원도</option>
               <option value="경상남도">경상남도</option>
               <option value="경상북도">경상북도</option>
               <option value="전라남도">전라남도</option>
               <option value="전라북도">전라북도</option>
               <option value="충청남도">충청남도</option>
               <option value="충청북도">충청북도</option>
               <option value="제주특별자치도">제주특별자치도</option>
               <option value="전국">전국</option>
            </select>
            &nbsp;
            <select id="area2" name="area2">
               <option value="">시/군/구</option>
            </select>
         </td>
      </tr>
      <tr id="tr">
         <td id="td1">
            <label id="a">*</label>&nbsp;업직종
         </td>
         <td id="td2">
            <input type="radio" name="categorys" id="category1" value="외식/음료">
            <label for="category1">외식/음료</label>
            <input type="radio" name="categorys" id="category2" value="유통/판매">
            <label for="category2">유통/판매</label>
            <input type="radio" name="categorys" id="category3" value="외식/음료">
            <label for="category3">문화/여가/생활</label>
            <input type="radio" name="categorys" id="category4" value="서비스">
            <label for="category4">서비스</label>
            <input type="radio" name="categorys" id="category5" value="사무직">
            <label for="category5">사무직</label>
            <input type="radio" name="categorys" id="category6" value="고객상담/리서치/영업">
            <label for="category6">고객상담/리서치/영업</label>
            <input type="radio" name="categorys" id="category7" value="생산/건설/운송">
            <label for="category7">생산/건설/운송</label>
            <input type="radio" name="categorys" id="category8" value="IT/컴퓨터">
            <label for="category8">IT/컴퓨터</label>
            <input type="radio" name="categorys" id="category9" value="교육/강사">
            <label for="category9">교육/강사</label>
            <input type="radio" name="categorys" id="category10" value="디자인">
            <label for="category10">디자인</label>
            <input type="radio" name="categorys" id="category11" value="미디어">
            <label for="category11">미디어</label>
         </td>
      </tr>
      <tr id="tr">
         <td id="td1">
            <label id="a">*</label>&nbsp;근무조건
         </td>
         <td id="td2">
            <input type="checkbox" name="type1" id="type1" value="알바">
            <label for="type1">알바</label>
            <input type="checkbox" name="type2" id="type2" value="정규직">
            <label for="type2">정규직</label>
            <input type="checkbox" name="type3" id="type3" value="계약직">
            <label for="type3">계약직</label>
            <input type="checkbox" name="type4" id="type4" value="파견직">
            <label for="type4">파견직</label>
            <input type="checkbox" name="type5" id="type5" value="인턴">
            <label for="type5">인턴</label>
         </td>
      </tr>
      <tr id="tr">
       <td id="td1">
            <label id="a">*</label>&nbsp;성별
         </td>
         <td id="td2">
           
             <input id="noneGender" name="gender" 
             type="radio" value="" checked="checked">
             <label for="noneGender">성별무관</label>
            
             <input id="namja" name="gender" 
             type="radio" value="남자" />
             <label for="namja">남자</label>

             <input id="yeoja" name="gender" 
             type="radio" value="여자">
             <label for="yeoja">여자</label>
             
         </td>     
       </tr>     
            
  
   
              </table><br><br>
            <p style="text-align: center; clear: both;">
               <select id="searchCondition" name="searchCondition">
                  <option value="username"
                     <c:if test="${param.searchCondition=='username'}">
                  selected
               </c:if>>이름</option>
                  <option value="title"
                     <c:if test="${param.searchCondition=='title'}">
                  selected
               </c:if>>이력서제목</option>
               </select> 
               
               <input type="text" id="searchKeyword" 
               name="searchKeyword" title="검색어 입력" size="40"
               
               value="${param.searchKeyword}">
               
               <!-- 일반검색버튼 -->
               <input type="submit" id="searchBt2"  value="검색" > 
                        
               
               
            </p> 
      
          </div>
         </form>
      </div>




<table style="width: 100%">
	<colgroup>
		<col width="8%">
		<col width="10%">
		<col width="46%">
		<col width="15%">
		<col width="11%">
		<col width="10%">
	</colgroup>
	<thead>
		<tr id="tr" style="background: #0A34B4;
		color: #CED8F0;font-family:sans-serif ;
		font-size: 13px; ">
			<th class="photo">이름</th>
			<th class="name"></th>
			<th>이력서 제목</th>
			<th>경력/자격증</th>
			<th>희망지역</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty alist }">
			<tr id="tr" class="align_center">
				<td colspan="5">	
					데이터가 없습니다!!
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty alist }">
			<c:set var="i" value="1"/>
			<c:forEach var="vo" items="${alist }">
			
			<c:set var="testResume" value="${param.period_checks}"/>
			<!-- 신입이면 -->
			<%-- <c:if test="${vo.period.indexOf('일')!=-1 }"> --%>
			
			<!-- 경력직이면 -->
			<%-- <c:if test="${vo.period.indexOf('~')!=-1 }"> --%>
         
			<!-- 재직중이면 -->
			<%-- <c:if test="${vo.period.indexOf('부터')!=-1 }"> --%>
			
 <c:if test="${vo.period.indexOf(testResume)!=-1 }"> 
			
				<tr id="tr" class="align_center">
					<td scope="row">
						<c:if test="${empty vo.photo }">
							<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>"
								height="60px" align="absmiddle" width="30px">
						</c:if>
						<c:if test="${!empty vo.photo }">
							<img alt="회원이미지" src="/algoo/algoo_images/${vo.photo }"
								height="60px" align="absmiddle" width="50px">
						</c:if>
					</td>
					<td scope="row">
							<p id="tdName">${vo.username }</p>
							<p id="tdGender">
								<c:if test="${vo.gender=='남자' }">
									<font style="color:#5b75ff">(${vo.gender}</font>/${vo.birth }세)
								</c:if>
								<c:if test="${vo.gender=='여자' }">
									<font style="color:#ff7373">(${vo.gender}</font>/${vo.birth }세)
								</c:if>
							</p>
					</td>
					<td class="align_left">
						<a href="<c:url value='/resume/detail.ag?hisCode=${vo.hisCode }'/>">
							<span>
								<c:if test="${fn:length(vo.title)>20}">
									${fn:substring(vo.title, 0,20)}...
								</c:if>
								<c:if test="${fn:length(vo.title)<=20}">
									${vo.title}
								</c:if>
							</span>
						</a><br>
						<span style="font-size: 0.8em">${vo.category }</span>
					</td>
					<td class="align_left" style="font-size: 0.7em">
							<span>
								<span class="align_right">
									경력 : 
								</span>
								<span class="align_left" style="color: #5b75ff" id="period${i}">
									<c:if test="${empty vo.period }">
										신입
									</c:if>
									<c:if test="${!empty vo.period }">
										<c:if test="${vo.period.indexOf('부터') == -1 }">
											<c:if test="${vo.period.indexOf('일') != -1 }">
												1개월 미만
											</c:if>
											<c:if test="${vo.period.indexOf('일') == -1 }">
												<script type="text/javascript">
													$("#period"+${i}).html($.getPeriod("${fn:substringBefore(vo.period,'월')}","${fn:substringBefore(fn:substringAfter(vo.period ,'~'),'월')}")+"개월");
												</script>
											</c:if>
										</c:if>
										<c:if test="${vo.period.indexOf('부터') != -1 }">
											재직중
										</c:if>
									</c:if>
								</span>
							</span>
							<br>
							<span>
								<span class="align_right">
									자격증 : 
								</span>
								<span class="align_left" style="color: #5b75ff">
									<c:if test="${empty vo.licenseName }">
										${vo.licenseName }
									</c:if>
									<c:if test="${!empty vo.licenseName }">
										${vo.licenseName }
									</c:if>
								</span>
							</span>

					</td>
					<td style="font-size: 0.7em">
						${vo.area }
					</td>
					<td style="font-size: 0.8em">
						<fmt:formatDate value="${vo.regdate }" pattern="MM/dd"/>
					</td>
				</tr>
				<c:set var="i" value="${i+1}"></c:set>
			</c:if>     	
			</c:forEach>
		</c:if>
	</tbody>
</table>

<div class="divPage">
	<!-- 이전 블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/images/first.JPG'/>" 
					alt="이전블럭으로">
		</a>	
	</c:if>
	
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">	 
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue; font-weight: bold">
				${i }</span>
		</c:if>		
		<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageProc(${i})">
				[${i}]</a>
		</c:if>
 
	</c:forEach>	
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">	
		<a href="#" 
		onclick="pageProc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/images/last.JPG'/>" 
					alt="다음블럭으로">
		</a>
	</c:if>
</div>

<div id="naver_id_login"></div>


<script type="text/javascript">
	var naver_id_login = new naver_id_login("auJlpwcbWWsD_1mAuGmP", "http://localhost:9090/algoo/resume/list.ag");
	var state = naver_id_login.getUniqState();
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
</script>

<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
		
		opener.location.href = "/algoo/resume/list.ag";
		self.close();
	}

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>

<%@ include file="../inc/bottom.jsp"%>