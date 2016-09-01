<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Algoo - 이력서 등록 페이지</title>
</head>
<body>
<form action="<c:url value = '/resume/write.do'/>"
	method="post" name="frmResume">
	<!-- ability (학력사항)-->
	<h2>학력사항</h2>
	<select name="ability1">
		<option value="">학교</option>
		<option value="초등학교">초등학교</option>
		<option value="중학교">중학교</option>
		<option value="고등학교">고등학교</option>
		<option value="대학교 (2, 3년제)">대학교 (2, 3년제)</option>
		<option value="대학교 (4년제)">대학교 (4년제)</option>
		<option value="대학원">대학원</option>
	</select>
	<select name="ability2">
		<option value="">상태</option>
		<option value="졸업">졸업</option>
		<option value="재학">재학</option>
		<option value="중퇴">중퇴</option>
		<option value="휴학">휴학</option>
		<option value="수료">수료</option>
	</select>
	<br>
	<hr>
	<!-- detail (상세)-->
	<input type="checkbox" name="detail1" id="detail1">
	<label for="detail1">고등학교</label>
	<input type="checkbox" name="detail2" id="detail2">
	<label for="detail2">대학교 (2, 3년제)</label>
	<input type="checkbox" name="detail3" id="detail3">
	<label for="detail3">대학교 (4년제)</label>
	<input type="checkbox" name="detail4" id="detail4">
	<label for="detail4">대학원</label>
	<br>
	<hr>
   	<!-- university (학교)-->
   	<select name="year1">
		<option value="">년도</option>
		<c:forEach var="i" begin="1989" end="2016">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	~
   	<select name="year2">
		<option value="">년도</option>
		<c:forEach var="i" begin="1989" end="2016">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
   	<select name="university1">
		<option value="">학위</option>
		<option value="석사">석사</option>
		<option value="박사">박사</option>
		<option value="석박사통합">석박사통합</option>
	</select>
	<br>
	<input type="text" id="university2" name="university2" 
		placeholder="학교명">
	<input type="text" id="university3" name="university3"
		placeholder="전공">
	<br>
	<hr>	
	<!-- CONTATCT_HOUR (연락 가능 시간) -->
	연락가능시간
	<input type="checkbox" name="moo" id="moo">
	<label for="moo">무관</label><br>
	<select name="time1">
		<option value="">시간</option>
		<c:forEach var="i" begin="0" end="24">
			<option value="${i}:00">${i}:00</option>
		</c:forEach>
	</select>
	~
	<select name="time2">
		<option value="">시간</option>
		<c:forEach var="i" begin="0" end="24">
			<option value="${i}:00">${i}:00</option>
		</c:forEach>
	</select>
	<br><hr>
	
	<!-- CAREER (경력사항) -->
	<label for="company">회사명</label>
	<input type="text" id="company" name="company" placeholder="회사명"><br>
   	<label for="term">근무기간</label>
   	<input checked="checked" 
   		id="Career_0__IsWorkOver" name="Career[0].IsWorkOver" type="radio" value="1" />
   	<label for="Career_0__IsWorkOver">1개월 이상 근무</label>
   	<select name="term1">
		<option value="">년도</option>
		<c:forEach var="i" begin="1989" end="2016">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	<select name="term2">
		<option value="">월</option>
		<c:forEach var="i" begin="1" end="12">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	~
	<select name="term3">
		<option value="">년도</option>
		<c:forEach var="i" begin="1989" end="2016">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	<select name="term4">
		<option value="">월</option>
		<c:forEach var="i" begin="1" end="12">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	<input id="Career_0__In_Office_Stat" name="Career[0].In_Office_Stat" 
		type="checkbox" value="true" /><label for="Career_0__In_Office_Stat">재직중</label><br>
	<input id="Career_0___IsWorkOver" name="Career[0].IsWorkOver" 
		type="radio" value="0" /><label for="Career_0___IsWorkOver">1개월 미만 근무</label>
	<select name="term5">
		<option value="">년도</option>
		<c:forEach var="i" begin="1989" end="2016">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	<select name="term6">
		<option value="">일</option>
		<c:forEach var="i" begin="1" end="29">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
    <span class="work_2">일 동안 근무</span><br>
    <label for="Career_0__C_Text">담당업무</label>
    <textarea cols="5" id="Career_0__C_Text" name="Career[0].C_Text" 
    	rows="10" style="width: 480px; height: 86px; margin: 0px;">
	</textarea>
	<br><hr>
   	
   	<!-- LANGUAGE_ABILITY(외국어 능력) -->
    <label for="Lngg_0__Lang1_Name">외국어</label>
    <select id="Lngg_0__Lang1_Name" name="Lngg[0].Lang1_Name" 
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
    <input id="Lngg_0__Experience_Stat" name="Lngg[0].Experience_Stat" 
    	type="checkbox" value="true" />
   	<label for="Lngg_0__Experience_Stat">어학연수 경험있음</label><br>                    
    <input class="hide" id="Lngg_0__Experience_Text" name="Lngg[0].Experience_Text" 
    	placeholder="어학연수 경험을 입력해 주세요. (ex- 2012~2013 : 캐나다 OOO 대학교 교환학생)" 
    	style="width:548px;" title="어학연수경험 입력" type="text" value="" />
    <br>구사능력
    <input checked="checked" id="1" name="Career[0].IsWorkOver" type="radio" value="1" />상
    <input checked="checked" id="2" name="Career[0].IsWorkOver" type="radio" value="1" />중
    <input checked="checked" id="3" name="Career[0].IsWorkOver" type="radio" value="1" />하
    <br>공인시험
    <input type="text" id="" name="" placeholder="시험종목">
    <input type="text" id="" name="" placeholder="점수/등급">
    <select name="">
		<option value="">취득년도</option>
		<c:forEach var="i" begin="1989" end="2016">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	<select name="">
		<option value="">취득월</option>
		<c:forEach var="i" begin="1" end="12">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
   	<br><hr>
   	
   	<!-- LICENSE(자격증) -->
    자격증 <input type="text" id="" name="" placeholder="자격증"><br>
    발행처 <input type="text" id="" name="" placeholder="발행처">
    <select name="">
		<option value="">년도</option>
		<c:forEach var="i" begin="1989" end="2016">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select> 년 취득
	<br><hr>
   	
   	<!-- COMPUTER_ABILITY(컴퓨터 활용능력) -->
   	<p class="tit">OA능력</p>
    워드
    <input checked="checked" id="1" name="Career[0].IsWorkOver1" type="radio" value="1" />상
    <input checked="checked" id="2" name="Career[0].IsWorkOver1" type="radio" value="1" />중
    <input checked="checked" id="3" name="Career[0].IsWorkOver1" type="radio" value="1" />하<br>
    파워포인트
    <input checked="checked" id="1" name="Career[0].IsWorkOver2" type="radio" value="1" />상
    <input checked="checked" id="2" name="Career[0].IsWorkOver2" type="radio" value="1" />중
    <input checked="checked" id="3" name="Career[0].IsWorkOver2" type="radio" value="1" />하<br>
    엑셀
    <input checked="checked" id="1" name="Career[0].IsWorkOver3" type="radio" value="1" />상
    <input checked="checked" id="2" name="Career[0].IsWorkOver3" type="radio" value="1" />중
    <input checked="checked" id="3" name="Career[0].IsWorkOver3" type="radio" value="1" />하<br>
    인터넷
    <input checked="checked" id="1" name="Career[0].IsWorkOver4" type="radio" value="1" />상
    <input checked="checked" id="2" name="Career[0].IsWorkOver4" type="radio" value="1" />중
    <input checked="checked" id="3" name="Career[0].IsWorkOver4" type="radio" value="1" />하<br>
    <p class="tit">IT/디자인 능력</p>
    <input id="OaCaa_Ablt_IT_0_" name="OaCaa.Ablt_IT[0]" type="checkbox" value="true" /><input name="OaCaa.Ablt_IT[0]" type="hidden" value="false" /><label for="OaCaa_Ablt_IT_0_">프로그래밍</label>
    <input id="OaCaa_Ablt_IT_1_" name="OaCaa.Ablt_IT[1]" type="checkbox" value="true" /><input name="OaCaa.Ablt_IT[1]" type="hidden" value="false" /><label for="OaCaa_Ablt_IT_1_">웹디자인툴</label>
    <input id="OaCaa_Ablt_IT_2_" name="OaCaa.Ablt_IT[2]" type="checkbox" value="true" /><input name="OaCaa.Ablt_IT[2]" type="hidden" value="false" /><label for="OaCaa_Ablt_IT_2_">편집디자인툴</label>
    <input id="OaCaa_Ablt_IT_3_" name="OaCaa.Ablt_IT[3]" type="checkbox" value="true" /><input name="OaCaa.Ablt_IT[3]" type="hidden" value="false" /><label for="OaCaa_Ablt_IT_3_">동영상편집툴</label>
    <input id="OaCaa_Ablt_IT_4_" name="OaCaa.Ablt_IT[4]" type="checkbox" value="true" /><input name="OaCaa.Ablt_IT[4]" type="hidden" value="false" /><label for="OaCaa_Ablt_IT_4_">3D 프로그램</label>
    <input id="OaCaa_Ablt_IT_5_" name="OaCaa.Ablt_IT[5]" type="checkbox" value="true" /><input name="OaCaa.Ablt_IT[5]" type="hidden" value="false" /><label for="OaCaa_Ablt_IT_5_">웹에디터</label>
    <input id="OaCaa_Ablt_IT_6_" name="OaCaa.Ablt_IT[6]" type="checkbox" value="true" /><input name="OaCaa.Ablt_IT[6]" type="hidden" value="false" /><label for="OaCaa_Ablt_IT_6_">기타</label>
   	<br><hr>
   	
   	<!-- AWARD(수상 수료 활동내역) -->
    수상&middot;수료&middot;활동내역
        <textarea cols="5" id="Award_M_Licence_Text" name="Award.M_Licence_Text" placeholder="자신이 수상한 내역, 교육기관 수료내용, 각종 활동 내용을 입력해 주세요 
			ex- OO교육원 : 웹마스터 교육 수료 / 자원봉사 : 아이티 난민구호 모금운동" rows="10" style="width:700px; height:140px;" title="수상/수료/활동내역 입력">
		</textarea>
   	<br><hr>
   	
   	<!-- PERSONAL_INFO(개인부가정보) -->
    개인부가정보 입력<br>
    장애여부
	<input id="lb_handicap_1" name="AdditionInfo.Entity.Hndcap_Stat" 
		type="radio" value="0" /><label for="lb_handicap_1">비대상</label>
	<input id="lb_handicap_2" name="AdditionInfo.Entity.Hndcap_Stat" 
	 	type="radio" value="1" /><label for="lb_handicap_2">대상</label><br>
    병역사항
    <input id="lb_military_1" name="AdditionInfo.Entity.Mlt_Cntnt_Code" 
    	type="radio" value="2" ><label for="lb_military_1">미필</label>
    <input id="lb_military_2" name="AdditionInfo.Entity.Mlt_Cntnt_Code" 
    	type="radio" value="4" ><label for="lb_military_2">군필</label>
    <input id="lb_military_3" name="AdditionInfo.Entity.Mlt_Cntnt_Code" 
    	type="radio" value="1" ><label for="lb_military_3">면제</label><br>
    국가보훈
    <input id="lb_veteran_1" name="AdditionInfo.Entity.Nation_Bohun_Target_Stat" 
    	type="radio" value="0" /><label for="lb_veteran_1">비대상</label>
    <input id="lb_veteran_2" name="AdditionInfo.Entity.Nation_Bohun_Target_Stat" 
   	type="radio" value="1" /><label for="lb_veteran_2">대상</label><br>
    고용지원금
    <input id="lb_support_1" name="AdditionInfo.Entity.Empmnt_Spt_Fund_Target_Stat" 
    	type="radio" value="0" /><label for="lb_support_1">비대상</label>
    <input id="lb_support_2" name="AdditionInfo.Entity.Empmnt_Spt_Fund_Target_Stat" 
    	type="radio" value="1" /><label for="lb_support_2">대상</label> 
   	<br><hr>
   	
   	<!-- PHOTOBOOK(사진첩) -->
   	
   	<!-- CONTENT(자기소개서) -->
    자기소개서
    <textarea cols="5" id="lb_work_4" name="Profile.M_Profile_Text" 
    	placeholder="자기소개서를 입력해 주세요 (최소 20자 필수)" 
    	rows="101" style="width:97%; height:240px;" title="자기소개서 입력">
	</textarea>
   	<input type="submit" value="등록">
   	</form>
   
</body>	
</html>