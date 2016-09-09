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
		margin-left: 50px;
		border-bottom: 5px solid black;
		padding-bottom: 20px;
		width: 860px;
	}
	
	#box{
		width: 860px;
		margin-left: 50px;
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
 	});
</script>
<div id="resume">
<form action="<c:url value = '/resume/write.ag'/>"
	method="post" name="frmResume">
	<!-- 개인 기본 정보 -->
	<h2>개인 기본 정보</h2>
	<table id="box">
		<tr id="tr">
			<td style="text-align: center; padding: 10px; width: 20%">
				<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>"><br>
				<button>
					사진등록
				</button>
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
				<div style="float: left; background-color: rgb(242, 247, 193); 
					width: 200px; height: 80px; padding-left: 30px;
					padding-top: 15px;">
					연락가능시간
					<input type="checkbox" name="moo" id="moo">
					<label for="moo">무관</label><br><br>
					<select name="time1" id="time1">
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
   	
   	<!-- PHOTOBOOK(사진첩) -->
   	<h2>사진첩</h2>
   	<br><br>
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