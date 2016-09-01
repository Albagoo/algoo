<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.recWrite {
	width: 820px;
	background: #F7F7F7;
}

.companyInfo {
	width: 800px;
	height: 300px;
}

.personInfo {
	width: 800px;
	height: 300px;
}

.workInfo {
	width: 800px;
	height: 300px;
}

.workCondition {
	width: 800px;
	height: 300px;
}

.requestCondition {
	width: 800px;
	height: 300px;
}

.recContent {
	width: 800px;
	height: 300px;
}

.detailContent {
	width: 800px;
	height: 300px;
}
.detailContent textarea{
   margin: 30px;
}

.bg {
	background: #FFF;
	border: 1px solid gray;
}

.tit {
   margin:10px;
   text-align:right;
	width: 150px;
	float: left;
}
.titc {
   margin:10px 10px 0 10px;
   text-align:right;
	width: 150px;
	float: left;
}
.radio{
   margin:10px 0;
   float: left;
}
.prefe{
   margin:10px 0 0 0;
   width:115px;
   float: left;
}
.rence{
   margin: 10px 0 0 10px;
   float: left;
}
.txt{
   margin:10px;
	width: 600px;
	float: left;
}
.txt_300 {
   margin:10px;
	width: 300px;
	float: left;
}
.txt_250 {
   margin:10px;
	width: 250px;
	float: left;
}
.txt_200 {
   margin:10px;
	width: 200px;
	float: left;
}
.txt_180 {
   margin:10px;
	width: 180px;
	float: left;
}
.txt_150 {
   margin:10px;
	width: 150px;
	float: left;
}
.txt_100 {
   margin:10px;
	width: 100px;
	float: left;
}
.txt_30 {
   text-align:center;
   margin:10px 0;
	width: 30px;
	float: left;
}
.txt_50 {
   margin:10px 3px;
	width: 50px;
	float: left;
}
.txt_60 {
   margin:10px;
	width: 60px;
	float: left;
}
.txt_65 {
   margin:10px;
	width: 65px;
	float: left;
}
.txt_70 {
   margin:10px;
	width: 70px;
	float: left;
}
.txt_75 {
   margin:10px;
	width: 75px;
	float: left;
}
.phone1{
margin:10px;
   width: 120px;
   float: left;
}
.phone2{
margin:10px;
   width: 150px;
   float: left;
}
.phone3{
margin:10px;
   width: 150px;
   float: left;
}
.email1{
   margin:10px;
   width: 150px;
   float: left;
}
.email2{
   margin:10px;
   width: 200px;
   float: left;
}
.email3{
   margin:10px;
   width: 120px;
   float: left;
}
.clearBoth, .clearBoth dt{
	clear: both;
}
.recWrite h2{
   margin: 20px;
}
.font_11{
   font-size: 10pt;
}
.bgg{
 background: #F7F7F7
}
.pink{
   color: pink;
}
</style>
<body>
<form name="frmWrite" method="post" 
   action="<c:url value='/rec/recWrite.ag'/>">
	<div class="recWrite">
		<h2>기업 정보</h2>
		<div class="companyInfo bg">
			<dl>
				<dt>
					<span class="tit">회사/점포명</span> 
					<input type="text" class="txt">
				</dt>
				<dt>
					<span class="tit">대표자명(ceo)</span>
					<input type="text" class="txt">
				</dt>
				<dt>
					<span class="tit">사업자등록번호</span>
					<input type="text" class="txt">
				</dt>
				<dt>
					<span class="tit">회사/점포주소</span>
					<input type="text" class="txt">
				</dt>
				<dt>
					<span class="tit">회사이미지</span>
					<input type="text" class="txt">
				</dt>
			</dl>
		</div>
		<h2 class="clearBoth">담당자 정보</h2>
		<div class="personInfo bg">
		 <dl>
           <dl>
            <dt>
               <span class="tit">담당자명</span> 
               <input type="text" class="txt">
            </dt>
            <dt>
               <span class="tit">전화번호</span>
               <select class="phone1">
               <option>010</option>
               <option>011</option>
               <option>016</option>
               <option>018</option>
               <option>019</option>
               </select>
               <input type="text" class="phone2">
               <input type="text" class="phone3">
            </dt>
            <dt class="clearBoth">
               <span class="tit">휴대폰</span>
                <select class="phone1">
               <option>010</option>
               <option>011</option>
               <option>016</option>
               <option>018</option>
               <option>019</option>
               </select>
               <input type="text" class="phone2">
               <input type="text" class="phone3">
            </dt>
            <dt>
               <span class="tit">팩스번호</span>
                <select class="phone1">
               <option>010</option>
               <option>011</option>
               <option>016</option>
               <option>018</option>
               <option>019</option>
               </select>
               <input type="text" class="phone2">
               <input type="text" class="phone3">
            </dt>
            <dt>
               <span class="tit">e-mail</span>
               <input type="text" class="email1">
               <input type="text" class="email2">
               <select class="email3">
               <option>naver.com</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
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
               <input type="text" class="txt_200">
            </dt>
            <dt >
               <span class="tit">채용제목</span>
               <input type="text" class="txt">
            </dt>
            <dt>
               <span class="tit">업직종</span>
               <select class="txt_180">
               <option>1차직종</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
               <select class="txt_180">
               <option>2차직종</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
               <select class="txt_180">
               <option>3차직종</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
            </dt>
            <dt>
               <span class="tit">근무지주소</span>
                 <select class="txt_70">
               <option>시도</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
                  <select class="txt_75">
               <option>시군구</option>
               <option>시군구</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
                  <select class="txt_70">
               <option>읍면동</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
               <input type="text" class="txt_150">
            </dt>
            <dt>
               <span class="tit">인근지하철</span>
                    <select class="txt_100">
               <option>지역</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
                    <select class="txt_75">
               <option>호선</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
                    <select class="txt_100">
               <option>지하철역</option>
               <option>hanmail.net</option>
               <option>google.com</option>
               <option>nate.com</option>
               <option>직접입력</option>
               </select>
               <input type="text" class="txt_200">
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
               name="term"></label>
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
               
               <select class="txt_50">
               <option>선택</option>
               <option>00시</option>
               <option>01시</option>
               <option>02시</option>
               <option>03시</option>
               </select>
               <select class="txt_50">
               <option>선택</option>
               <option>00분</option>
               <option>10분</option>
               <option>20분</option>
               <option>30분</option>
               </select>
               <span class="txt_30">~</span>
               
               <select class="txt_50">
               <option>선택</option>
               <option>00시</option>
               <option>01시</option>
               <option>02시</option>
               <option>03시</option>
               </select>
               <select class="txt_50">
               <option>선택</option>
               <option>00분</option>
               <option>10분</option>
               <option>20분</option>
               <option>30분</option>
               </select>
            </dt>
            <dt>
               <span class="tit">급여</span>
               <select class="txt_70">
               <option>==급여==</option>
               <option>00분</option>
               <option>10분</option>
               <option>20분</option>
               <option>30분</option>
               </select>
               <input type="text" class="txt_150">
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
               <input type="text" class="txt">
             
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
               <span class="font_11 prefe">운전면허 솟지자
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
               <span class="txt_50"></span><input type="text" class="">
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">0명
               </span>
               <label class="rence" for="experience">
               <input type="checkbox" id="experience"
               name="preference"></label>
               <span class="font_11 prefe">00명
               </span>
            </dt>
            <dt>
               <span class="tit">모집대상</span>
               <input type="text" class="txt">
            </dt>
            <dt>
               <span class="tit">모집종료일</span>
               <input type="text" class="txt">
            </dt>
            <dt>
               <span class="tit">접수방법</span>
               <input type="text" class="txt">
            </dt>
            <dt>
               <span class="tit">제출서류</span>
               <input type="text" class="txt">
            </dt>
         </dl>
		</div>
		<h2>상세모집요강</h2>
		<div class="detailContent">
		<textarea rows="15" cols="100"></textarea>
		</div>
	</div>
	<input type="submit" value="확인">
	<input type="reset" value="취소">
</form>
</body>
</html>