<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<style type="text/css">
	#resume{
		text-align: left;
		margin: 30px;
	}
	
	h2{
		font-size: 1.2em;
		font-weight: bold;
		
		border-bottom: 5px solid black;
		padding-bottom: 20px;
		width: 860px;
	}
	
	#box{
		width: 860px;
		
	}
		
	#tr{
		border-bottom: 2px solid silver;
		
	}
	
	#td1{
		padding-left: 60px;
		width: 23%;
		font-weight: bold;	
	}
	
	#td2{
		width: 77%;
		padding: 20px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
    	$("#simple_top span").html("이력서 등록");
    	
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
					+"<select name='year1'><option value=''>년도</option><c:forEach var='i' begin='1989' end='2016'>"
					+"<option value='${i}'>${i}</option></c:forEach></select> ~ <select name='year2'><option value=''>년도</option>"
					+"<c:forEach var='i' begin='1989' end='2016'><option value='${i}'>${i}</option></c:forEach>"
					+"</select>&nbsp;&nbsp;<input type='text' id='university2' name='university2' placeholder='학교명'></td></tr>");
			    }else{
			    	$(".detail_tr_after1").remove();
			    }
	    	});
	    	
	    	$("#detail2").change(function(){
		    	if($("#detail2").is(":checked")){
			    	$(".detail_tr").after("<tr id='tr' class='detail_tr_after2'><td id='td1'>대학교 (2 ,3년제)</td><td id='td2'>"
					+"<select name='year1'><option value=''>년도</option><c:forEach var='i' begin='1989' end='2016'>"
					+"<option value='${i}'>${i}</option></c:forEach></select> ~ <select name='year2'><option value=''>년도</option>"
					+"<c:forEach var='i' begin='1989' end='2016'><option value='${i}'>${i}</option></c:forEach>"
					+"</select><br><br><input type='text' id='university2' name='university2' placeholder='학교명'>"
					+"&nbsp;&nbsp;<input type='text' id='university3' name='university3' placeholder='전공'></td></tr>");
			    }else{
			    	$(".detail_tr_after2").remove();
			    }
	    	});
	    	
	    	$("#detail3").change(function(){
		    	if($("#detail3").is(":checked")){
			    	$(".detail_tr").after("<tr id='tr' class='detail_tr_after3'><td id='td1'>대학교 (4년제)</td><td id='td2'>"
					+"<select name='year1'><option value=''>년도</option><c:forEach var='i' begin='1989' end='2016'>"
					+"<option value='${i}'>${i}</option></c:forEach></select> ~ <select name='year2'><option value=''>년도</option>"
					+"<c:forEach var='i' begin='1989' end='2016'><option value='${i}'>${i}</option></c:forEach>"
					+"</select><br><br><input type='text' id='university2' name='university2' placeholder='학교명'>"
					+"&nbsp;&nbsp;<input type='text' id='university3' name='university3' placeholder='전공'></td></tr>");
			    }else{
			    	$(".detail_tr_after3").remove();
			    }
	    	});
	    	
	    	$("#detail4").change(function(){
		    	if($("#detail4").is(":checked")){
			    	$(".detail_tr").after("<tr id='tr' class='detail_tr_after4'><td id='td1'>대학원</td><td id='td2'>"
					+"<select name='year1'><option value=''>년도</option><c:forEach var='i' begin='1989' end='2016'>"
					+"<option value='${i}'>${i}</option></c:forEach></select> ~ <select name='year2'><option value=''>년도</option>"
					+"<c:forEach var='i' begin='1989' end='2016'><option value='${i}'>${i}</option></c:forEach></select>"
					+"&nbsp;&nbsp;<select name='university1'><option value=''>학위</option><option value='석사'>석사</option><option value='박사'>박사</option>"
					+"<option value='석박사통합'>석박사통합</option></select>"
					+"<br><br><input type='text' id='university2' name='university2' placeholder='학교명'>"
					+"&nbsp;&nbsp;<input type='text' id='university3' name='university3' placeholder='전공'></td></tr>");
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
    			$("#language_study_Text").removeAttr("hidden");
    		}else{
    			$("#language_study_Text").prop("hidden", true);
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
    		window.open("<c:url value='/resume/imageUp.ag'/>",
    				"imageUp",
    			"width=550,height=400,left=10, top=50,resizable=yes,location=yes");	
    	});
 	});
</script>
<div id="resume">
<form action="<c:url value = '/resume/write.ag'/>"
	method="post" name="frmResume">
	<!-- 개인 기본 정보 -->
	<h2 style="border: none; padding-bottom: 0">이력서 제목</h2>
	<input type="text" style="width: 94%; margin: 20px 0 20px 0;
		height: 30px; padding: 5px" placeholder="내 이력서를 돋보이게 할 PR 한마디!">
	<h2>개인 기본 정보</h2>
	<table id="box">
		<tr id="tr">
			<td style="text-align: center; padding: 10px; width: 20%">
				<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>"><br>
				<img id="bt_picture" src="<c:url value='/images/bt_imgUp.PNG'/>">
			</td>
			<td style="width: 80%">
				<table style="float: left; width: 60%">
					<tr>
						<td id="td1" style="width: 20%; padding-left: 0;">이름</td>
						<td id="td2" style="padding: 5px"><input type="text"></td>
					</tr>
					<tr>
						<td id="td1" style="width: 20%; padding-left: 0;">휴대폰</td>
						<td id="td2" style="padding: 5px"><input type="text"></td>
					</tr>
					<tr>
						<td id="td1" style="width: 20%; padding-left: 0;">e-메일</td>
						<td id="td2" style="padding: 5px">
						<input type="text" style="width: 70%"></td>
					</tr>
					<tr>
						<td id="td1" style="width: 20%; padding-left: 0;">주소</td>
						<td id="td2" style="padding: 5px">
						<input type="text" style="width: 80%"></td>
					</tr>
					<tr>
						<td id="td1" style="width: 20%; padding-left: 0;">홈페이지</td>
						<td id="td2" style="padding: 5px">
						<input type="text" style="width: 80%"></td>
					</tr>
				</table>
				<div style="float: left; background-color: #eee; border:1px solid silver; 
					width: 175px; height: 50px; padding: 5px 0 5px 20px;">
					연락가능시간
					<input type="checkbox" name="moo" id="moo">
					<label for="moo">무관</label><br>
					<select name="time1" id="time1" style="margin-top: 5px;">
						<option value="">시간</option>
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}:00">${i}:00</option>
						</c:forEach>
					</select>
					~
					<select name="time2" id="time2">
						<option value="">시간</option>
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}:00">${i}:00</option>
						</c:forEach>
					</select>
				</div>
			</td>
		</tr>
	</table><br><br>
	<!-- HOPE(희망 근무 조건) -->
	<h2>희망근무조건</h2>
	<table id="box">
		<tr id="tr">
			<td id="td1">
				근무지
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
				업직종
			</td>
			<td id="td2">
				<input type="checkbox" name="category1" id="category1" value="외식/음료">
				<label for="category1">외식/음료</label>
				<input type="checkbox" name="category2" id="category2" value="유통/판매">
				<label for="category2">유통/판매</label>
				<input type="checkbox" name="category3" id="category3" value="외식/음료">
				<label for="category3">문화/여가/생활</label>
				<input type="checkbox" name="category4" id="category4" value="서비스">
				<label for="category4">서비스</label>
				<input type="checkbox" name="category5" id="category5" value="서비스">
				<label for="category5">사무직</label><br>
				<input type="checkbox" name="category6" id="category6" value="서비스">
				<label for="category6">고객상담/리서치/영업</label>
				<input type="checkbox" name="category7" id="category7" value="서비스">
				<label for="category7">생산/건설/운송</label>
				<input type="checkbox" name="category8" id="category8" value="서비스">
				<label for="category8">IT/컴퓨터</label><br>
				<input type="checkbox" name="category9" id="category9" value="서비스">
				<label for="category9">교육/강사</label>
				<input type="checkbox" name="category10" id="category10" value="서비스">
				<label for="category10">디자인</label>
				<input type="checkbox" name="category11" id="category11" value="서비스">
				<label for="category11">미디어</label>
			</td>
		</tr>
		<tr id="tr">
			<td id="td1">
				근무형태
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
				근무일시
			</td>
			<td id="td2">
				<select id="day1" name="day1">
					<option value="">기간</option>
					<option value="무관">무관</option>
					<option value="1주일이하">1주일이하</option>
					<option value="1주일 ~ 1개월">1주일 ~ 1개월</option>
					<option value="1개월 ~ 3개월">1개월 ~ 3개월</option>
					<option value="3개월 ~ 6개월">3개월 ~ 6개월</option>
					<option value="6개월 ~ 1년">6개월 ~ 1년</option>
					<option value="1년이상">1년이상</option>
				</select>
				<select id="day2" name="day2">
					<option value="">요일</option>
					<option value="무관">무관</option>
					<option value="월 ~ 일">월 ~ 일</option>
					<option value="월 ~ 토">월 ~ 토</option>
					<option value="월 ~ 금">월 ~ 금</option>
					<option value="주말(토, 일)">주말(토, 일)</option>
					<option value="주6일">주6일</option>
					<option value="주5일">주5일</option>
					<option value="주4일">주4일</option>
					<option value="주3일">주3일</option>
					<option value="주2일">주2일</option>
					<option value="주1일">주1일</option>
				</select>
				<select id="day3" name="day3">
					<option value="">시간</option>
					<option value="무관">무관</option>
					<option value="오전 파트타임(06:00 ~ 12:00)">오전 파트타임(06:00 ~ 12:00)</option>
					<option value="오후 파트타임(12:00 ~ 18:00)">오후 파트타임(12:00 ~ 18:00)</option>
					<option value="저녁 파트타임(18:00 ~ 24:00)">저녁 파트타임(18:00 ~ 24:00)</option>
					<option value="새벽 파트타임(24:00 ~ 06:00)">새벽 파트타임(24:00 ~ 06:00)</option>
					<option value="오전 ~ 오후 파트타임">오전 ~ 오후 파트타임</option>
					<option value="오후 ~ 저녁 파트타임">오후 ~ 저녁 파트타임</option>
					<option value="저녁 ~ 새벽 파트타임">저녁 ~ 새벽 파트타임</option>
					<option value="새벽 ~ 오전 파트타임">새벽 ~ 오전 파트타임</option>
					<option value="풀타임(8시간이상)">풀타임(8시간이상)</option>
				</select>
			</td>
		</tr>
		<tr id="tr">
			<td id="td1">
				급여
			</td>
			<td id="td2">
				<select name="pay1" id="pay1">
					<option value="시급">시급</option>
					<option value="일급">일급</option>
					<option value="주급">주급</option>
					<option value="월급">월급</option>
					<option value="연봉">연봉</option>
					<option value="건별">건별</option>
				</select>
				<input type="text" placeholder="금액" name="pay2" id="pay2"> 원
				<input type="checkbox" id="pay3" name="pay3" value="추후협의">
				<label for="pay3">추후협의</label>
			</td>
		</tr>
	</table>
	
	<br><br>
	<!-- ability (학력사항)-->
	<h2>학력사항</h2>
	<table id="box">
		<tr id="tr" class="detail_tr_before">
			<td id="td1">
				<span>최종학력</span>
			</td>
			<td id="td2">
				<select id="ability1" name="ability1">
					<option value="">학교</option>
					<option value="초등학교">초등학교</option>
					<option value="중학교">중학교</option>
					<option value="고등학교">고등학교</option>
					<option value="대학교 (2, 3년제)">대학교 (2, 3년제)</option>
					<option value="대학교 (4년제)">대학교 (4년제)</option>
					<option value="대학원">대학원</option>
				</select>
				<select id="ability2" name="ability2">
					<option value="">상태</option>
				</select>
			</td>
		</tr>
	</table><br><br>
   
	<%-- <!-- CONTATCT_HOUR (연락 가능 시간) -->
	 --%>
	
	<!-- CAREER (경력사항) -->
	<h2>경력사항</h2>
	<table id="box">
		<tr id="tr">
			<td id="td1">
				<label for="company">회사명</label>
			</td>
			<td id="td2">
				<input type="text" id="company" name="company" placeholder="회사명">
			</td>
		</tr>
		<tr id="tr">
			<td id="td1">
				근무기간
			</td>
			<td id="td2">
				<input id="period_check" name="period_check" 
					type="radio" value="1" checked="checked"/>
			 	<label for="period_check"> 1개월 이상 근무</label>
			 	<select name="period_year"
			 		id="period_year">
				<option value="">년도</option>
				<c:forEach var="i" begin="1989" end="2016">
					<option value="${i}">${i}</option>
				</c:forEach>
				</select>
				<select name="period_month"
					id="period_month">
					<option value="">월</option>
					<c:forEach var="i" begin="1" end="12">
					<option value="${i}">${i}</option>
				</c:forEach>
				</select>
				~
				<select name="period_year_2"
					id="period_year_2">
					<option value="">년도</option>
					<c:forEach var="i" begin="1989" end="2016">
					<option value="${i}">${i}</option>
				</c:forEach>
				</select>
				<select name="period_month_2"
					id="period_month_2">
					<option value="">월</option>
					<c:forEach var="i" begin="1" end="12">
					<option value="${i}">${i}</option>
				</c:forEach>
				</select>
				<input id="period_c" name="period_c" 
					type="checkbox" value="true" />
				<label for="period_c">재직중</label><br><br>
				<input id="period_check2" name="period_check" 
					type="radio" value="0" />
				<label for="period_check2"> 1개월 미만 근무</label>
				<select name="period_year2" id="period_year2" disabled="disabled">
					<option value="">년도</option>
					<c:forEach var="i" begin="1989" end="2016">
					<option value="${i}">${i}</option>
				</c:forEach>
				</select>
				<select name="period_day" id="period_day" disabled="disabled">
					<option value="">일</option>
					<c:forEach var="i" begin="1" end="29">
					<option value="${i}">${i}</option>
				</c:forEach>
				</select>일 동안 근무<br>
			</td>
		</tr>
		<tr id="tr">
			<td id="td1">
				<label for="work">담당업무</label>
			</td>
			<td id="td2">
				 <textarea cols="5" id="work" name="work" 
			    	rows="10" style="width: 480px; height: 86px; margin: 0px;"></textarea>
			</td>
		</tr>
	</table><br><br>
	
   	<!-- LANGUAGE_ABILITY(외국어 능력) -->
   	<h2>외국어 능력</h2>
   	<table id="box">
		<tr id="tr">
			<td id="td1">
				<label for="language">외국어</label>
			</td>
			<td id="td2">
				<select id="language" name="language" 
				  	style="width:235px;margin-right:5px" title="언어선택">
				   	<option value="">외국어명</option>
					<option value="1">그리스어</option>
					<option value="2">네덜란드어</option>
					<option value="3">노르웨이어</option>
					<option value="4">독일어</option>
					<option value="5">러시아어</option>
					<option value="6">루마니아어</option>
					<option value="7">마인어</option>
					<option value="8">몽고어</option>
					<option value="9">미얀마어</option>
					<option value="10">베트남어</option>
					<option value="11">세르비아어</option>
					<option value="12">스웨덴어</option>
					<option value="13">스페인어</option>
					<option value="14">슬로바키아어</option>
					<option value="15">아랍어</option>
					<option value="16">영어</option>
					<option value="17">유고어</option>
					<option value="18">이란(페르시아)어</option>
					<option value="19">이탈리아어</option>
					<option value="20">일본어</option>
					<option value="21">중국어</option>
					<option value="22">체코어</option>
					<option value="23">태국어</option>
					<option value="24">터키어</option>
					<option value="25">포르투갈어</option>
					<option value="26">폴란드어</option>
					<option value="27">프랑스어</option>
					<option value="28">헝가리어</option>
					<option value="29">히브리어</option>
					<option value="30">힌디어</option>
					<option value="31">기타</option>
				</select>
				   <input id="language_study" name="language_study" 
				   	type="checkbox" value="true" />
				  	<label for="language_study">어학연수 경험있음</label><br> <br>                  
				   <input id="language_study_Text" name="language_study_Text" 
				   	placeholder="어학연수 경험을 입력해 주세요. (ex- 2012~2013 : 캐나다 OOO 대학교 교환학생)" 
				   	style="width:548px;" title="어학연수경험 입력" type="text" hidden="true"/>
			</td>
		</tr>
		<tr id="tr">
			<td id="td1">
				구사능력
			</td>
			<td id="td2">
			    <input checked="checked" id="language_command_1" name="language_command" type="radio" value="1" />
			    <label for="language_command_1">상</label>
			    <input id="language_command_2" name="language_command" type="radio" value="2" />
			    <label for="language_command_2">중</label>
			    <input id="language_command_3" name="language_command" type="radio" value="3" />
			    <label for="language_command_3">하</label>
			</td>
		</tr>
		<tr id="tr">
			<td id="td1">
				공인시험
			</td>
			<td id="td2">
			    <input type="text" id="official_test1" name="official_test1" 
			    	placeholder="시험종목">
			    <input type="text" id="official_test2" name="official_test2" 
		   			placeholder="점수/등급">
			    <select name="official_test_year">
					<option value="">취득년도</option>
					<c:forEach var="i" begin="1989" end="2016">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<select name="official_test_month">
					<option value="">취득월</option>
					<c:forEach var="i" begin="1" end="12">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</table>
	<br><br>
   	<!-- LICENSE(자격증) -->
   	<h2>자격증</h2>
   	<table id="box">
		<tr id="tr">
			<td id="td1">
				자격증
			</td>
			<td id="td2">
				<input type="text" id="license_name" name="license_name" placeholder="자격증">
			</td>
		</tr>
		<tr id="tr">
			<td id="td1">
				발행처
			</td>
			<td id="td2">
				<input type="text" id="collicense_place" 
					name="collicense_place" placeholder="발행처">
				<select name="collicense_place_year">
					<option value="">년도</option>
					<c:forEach var="i" begin="1989" end="2016">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select> 년 취득
			</td>
		</tr>
	</table>
  	<br><br>
   	<!-- COMPUTER_ABILITY(컴퓨터 활용능력) -->
   	<h2>컴퓨터 활용능력</h2>
   	<table id="box">
		<tr id="tr">
			<td id="td1">
				OA능력
			</td>
			<td id="td2">
				워드
			    <input checked="checked" id="word1" name="word" type="radio" value="1" />
			    <label for="word1">상</label>
			    <input id="word2" name="word" type="radio" value="2" />
			    <label for="word2">중</label>
			    <input id="word3" name="word" type="radio" value="3" />
			    <label for="word3">하</label><br><br>
			    파워포인트
			    <input checked="checked" id="power_point1" name="power_point" type="radio" value="1" />
			    <label for="power_point1">상</label>
			    <input id="power_point2" name="power_point" type="radio" value="2" />
			    <label for="power_point2">중</label>
			    <input id="power_point3" name="power_point" type="radio" value="3" />
			    <label for="power_point3">하</label><br><br>
			    엑셀
			    <input checked="checked" id="excel1" name="excel" type="radio" value="1" />
			    <label for="excel1">상</label>
			    <input id="excel2" name="excel" type="radio" value="2" />
			    <label for="excel2">중</label>
			    <input id="excel3" name="excel" type="radio" value="3" />
			    <label for="excel3">하</label><br><br>
			    인터넷
			    <input checked="checked" id="internet1" name="internet" type="radio" value="1" />
			    <label for="internet1">상</label>
			    <input id="internet2" name="internet" type="radio" value="2" />
			    <label for="internet2">중</label>
			    <input id="internet3" name="internet" type="radio" value="3" />
			   <label for="internet3">하</label><br><br>
			</td>
		</tr>
		<tr id="tr">
			<td id="td1">
				IT/디자인 능력
			</td>
			<td id="td2">
			    <input id="it_design_ability_1" name="it_design_ability_1" type="checkbox"/>
			    <label for="it_design_ability_1">프로그래밍</label>
			    <input id="it_design_ability_2" name="it_design_ability_2" type="checkbox"/>
			    <label for="it_design_ability_2">웹디자인툴</label>
			    <input id="it_design_ability_3" name="it_design_ability_3" type="checkbox"/>
			    <label for="it_design_ability_3">편집디자인툴</label>
			    <input id="it_design_ability_4" name="it_design_ability_4" type="checkbox"/>
			    <label for="it_design_ability_4">동영상편집툴</label><br>
			    <input id="it_design_ability_5" name="it_design_ability_5" type="checkbox"/>
			    <label for="it_design_ability_5">3D 프로그램</label>
			    <input id="it_design_ability_6" name="it_design_ability_6" type="checkbox"/>
			    <label for="it_design_ability_6">웹에디터</label>
			    <input id="it_design_ability_7" name="it_design_ability_7" type="checkbox"/>
			    <label for="it_design_ability_7">기타</label>
			</td>
		</tr>
	</table><br><br>
   	
   	<!-- AWARD(수상 수료 활동내역) -->
   	<h2>수상&middot;수료&middot;활동내역</h2>
   	<table id="box">
   		<tr>
   			<td>
   				<textarea cols="5" id="award" name="award" placeholder="자신이 수상한 내역, 교육기관 수료내용, 각종 활동 내용을 입력해 주세요 
					ex- OO교육원 : 웹마스터 교육 수료 / 자원봉사 : 아이티 난민구호 모금운동" style="width:800px; 
					height:140px; margin-left: 30px; margin-top: 10px"></textarea>
   			</td>
   		</tr>
   	</table><br><br>
   	
   	<!-- PERSONAL_INFO(개인부가정보) -->
   	<h2>개인부가정보 입력</h2>
   	<table id="box">
   		<tr id="tr">
   			<td id="td1">
   				장애여부
   			</td>
   			<td id="td2">
   				<input id="obstacle1" name="obstacle" type="radio" value="1" checked="checked"/>
   				<label for="obstacle1">비대상</label>
				<input id="obstacle2" name="obstacle" type="radio" value="2" />
				<label for="obstacle2">대상</label>
   			</td>
   		</tr>
   		<tr id="tr">
   			<td id="td1">
   				병역사항
   			</td>
   			<td id="td2">
			    <input id="military1" name="military" type="radio" value="1" checked="checked">
			    <label for="military1">미필</label>
			    <input id="military2" name="military" type="radio" value="2" >
			    <label for="military2">군필</label>
			    <input id="military3" name="military" type="radio" value="3" >
			    <label for="military3">면제</label>
   			</td>
   		</tr>
   		<tr id="tr">
   			<td id="td1">
   				국가보훈
   			</td>
   			<td id="td2">
			    <input id="veteran1" name="veteran" type="radio" value="1" checked="checked"/>
			    <label for="veteran1">비대상</label>
			    <input id="veteran2" name="veteran" type="radio" value="2" />
			    <label for="veteran2">대상</label>
   			</td>
   		</tr>
   		<tr id="tr">
   			<td id="td1">
   				고용지원금
   			</td>
   			<td id="td2">
   			    <input id="employment1" name="employment" type="radio" value="1" checked="checked"/>
   			    <label for="employment1">비대상</label>
			    <input id="employment2" name="employment" type="radio" value="2" />
			    <label for="employment2">대상</label> 
   			</td>
   		</tr>
   	</table><br><br>
   	<!-- CONTENT(자기소개서) -->
    <h2>자기소개서</h2>
    <table id="box">
    	<tr>
    		<td>
    			 <textarea cols="5" id="content" name="content" 
			    	placeholder="자기소개서를 입력해 주세요 (최소 20자 필수)" 
			    	rows="101" style="width:800px; height:240px; 
			    	margin-left: 30px; margin-top: 10px"></textarea>
    		<td>
    	</tr>
    </table>
   
   	<input type="submit" value="등록">
   	</form>
</div>
<%@ include file="../inc/simple_bottom.jsp" %>