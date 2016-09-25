<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainPage.css'/>" />
<%-- <script src="<c:url value='/js/jquery.scroll.pack.js'/>"></script>
<script src="<c:url value='/js/jquery.easing.js'/>"></script> --%>

<script type="text/javascript">
	$(document).ready(function(){
		$(".divSuper .SpBox")
			.hover(function(){
				$(this).css("border-color","#E70400")
					.css("border-width", "1px")
					.css("cursor","pointer");
			}, function(){
				$(this).css("border","");
			});
		$(".divGrand .GrBox")
		.hover(function(){
			$(this).css("border-color","#E70400")
				.css("border-width", "1px")
				.css("cursor","pointer");
		}, function(){
			$(this).css("border","")
		});
	});
	
	function login2_1(){
		var type = $("#loginBox1").val();
		
		window.open("<c:url value='/login/login.ag?type="+type+"'/>", "login",
		"width=390,height=480,left=700,top=200,resizable=yes,location=yes");
	}function login2_2(){
		var type = $("#loginBox2").val();
		
		window.open("<c:url value='/login/login.ag?type="+type+"'/>", "login",
		"width=390,height=480,left=700,top=200,resizable=yes,location=yes");
	}
	
</script>

	<%-- <!-- 메인 컨테이너 페이지 -->
	<br>
	<img src="<c:url value='${pageContext.request.contextPath}/images/console.png'/>" 
		alt="메인테스트">
	<br><br> --%>
	
	<section>
		<div class="divMain">
			<!-- 광고 및 기본 기능 -->
			<div class="divCategory">
				<div class="divCAD">
				<!-- 광고배너(2개) -->
				<div class="divCmHeader">
					<table>
					<td>
					<script type="text/javascript">
						var how_many_ads = 3; 
						var now = new Date() 
						var sec = now.getSeconds() 
						var ad = sec % how_many_ads; 
						ad +=1; 
						if (ad==1) { 
							url="#"; 
							banner="<c:url value='/images/banner/banner1_1.jpg'/>"; 
							height="111px"; 
						} 
						if (ad==2) { 
							url="#"; 
							banner="<c:url value='/images/banner/banner1_2.jpg'/>"; 
							height="111px"; 
						}
						if (ad==3) { 
							url="#"; 
							banner="<c:url value='/images/banner/banner1_3.jpg'/>"; 
							height="111px"; 
						}
						document.write('<center>'); 
						document.write('<a href="' + url + '" target="_top">'); 
						document.write('<img src="' + banner + '"'); 
						document.write(' height=' + height + ' '); 
						document.write(' border=0><br>'); 
						document.write('</a>'); 
						document.write('</center>'); 
					</script>
					<%-- <img src="<c:url value='/images/banner1.jpg'/>"
						height="111px"> --%></td>
					<td>
					<script type="text/javascript">
						var how_many_ads = 2; 
						var now = new Date() 
						var sec = now.getSeconds() 
						var ad = sec % how_many_ads; 
						ad +=1; 
						if (ad==1) { 
							url="#"; 
							banner="<c:url value='/images/banner/banner2_1.jpg'/>"; 
							height="111px"; 
						} 
						if (ad==2) { 
							url="#"; 
							banner="<c:url value='/images/banner/banner2_2.jpg'/>"; 
							height="111px"; 
						}
						document.write('<center>'); 
						document.write('<a href="' + url + '" target="_top">'); 
						document.write('<img src="' + banner + '"'); 
						document.write(' height=' + height + ' '); 
						document.write(' border=0><br>'); 
						document.write('</a>'); 
						document.write('</center>'); 
					</script>
					<%-- <img src="<c:url value='/images/banner2.jpg'/>"
						height="111px"> --%>
					</td>
					</table>
				</div><!-- divCmHeader -->
				
				<div class="divDivision">
					<!-- 알바 분류 -->
					<div class="divJob1">
						<!-- 지역별 알바 -->
						<span>지역별 알바</span>
						<hr width="90px">
						<div class="divMap">
						<p class="areaP">
						 <a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EA%B8%B0%EB%8F%84'/>" class="kyunggi">경기</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EA%B0%95%EC%9B%90%EB%8F%84'/>" class="kangwon">강원</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EC%9D%B8%EC%B2%9C%EA%B4%91%EC%97%AD%EC%8B%9C'/>" class="incheon" id="spCity">인천</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C'/>" class="seoul" id="spCity">서울</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EC%B6%A9%EC%B2%AD%EB%82%A8%EB%8F%84'/>" class="chungnam">충남</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EC%B6%A9%EC%B2%AD%EB%B6%81%EB%8F%84'/>" class="chungbuk">충북</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EB%8C%80%EC%A0%84%EA%B4%91%EC%97%AD%EC%8B%9C'/>" class="daejeon" id="spCity">대전</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EC%83%81%EB%B6%81%EB%8F%84'/>" class="kyungbuk">경북</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EC%A0%84%EB%9D%BC%EB%B6%81%EB%8F%84'/>" class="jeonbuk">전북</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EB%8C%80%EA%B5%AC%EA%B4%91%EC%97%AD%EC%8B%9C'/>" class="daegu" id="spCity">대구</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EA%B2%BD%EC%83%81%EB%82%A8%EB%8F%84'/>" class="kyungnam">경남</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EC%9A%B8%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C'/>" class="ulsan" id="spCity">울산</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EA%B4%91%EC%A3%BC%EA%B4%91%EC%97%AD%EC%8B%9C'/>" class="kwangju" id="spCity">광주</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EB%B6%80%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C'/>" class="busan" id="spCity">부산</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EC%A0%84%EB%9D%BC%EB%82%A8%EB%8F%84'/>" class="jeonnam">전남</a>
						 <a href="<c:url value='/rec/recList.ag?areas=%EC%A0%9C%EC%A3%BC%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EB%8F%84'/>" class="jeju">제주</a>
						</div>
					</div>
					<div class="divJob2">
						<!-- 업종별 알바 -->
						<span>업종별 알바</span>
						<hr width="90px">
						<table>
							<tr>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EC%99%B8%EC%8B%9D%C2%B7%EC%9D%8C%EB%A3%8C'/>">
								<img src="<c:url value='/images/JobIcon/food.png'/>">
									<br>외식<br>음료</a></td>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EC%9C%A0%ED%86%B5%C2%B7%ED%8C%90%EB%A7%A4'/>">
								<img src="<c:url value='/images/JobIcon/shop.png'/>">
									<br>유통<br>판매</a></td>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EB%AC%B8%ED%99%94%C2%B7%EC%97%AC%EA%B0%80%EC%83%9D%ED%99%9C'/>">
								<img src="<c:url value='/images/JobIcon/game.png'/>">
									<br>문화<br>여가생활</a></td>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EC%84%9C%EB%B9%84%EC%8A%A4'/>">
								<img src="<c:url value='/images/JobIcon/service.png'/>">
									<br>서비스<br><br></a></td>
							</tr>
							<tr>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EC%82%AC%EB%AC%B4%EC%A7%81'/>">
								<img src="<c:url value='/images/JobIcon/company.png'/>">
									<br>사무직<br><br></a></td>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EA%B3%A0%EA%B0%9D%EC%83%81%EB%8B%B4%C2%B7%EB%A6%AC%EC%84%9C%EC%B9%98%C2%B7%EC%98%81%EC%97%85'/>">
								<img src="<c:url value='/images/JobIcon/advice.png'/>">
									<br>고객상담<br>영업</a></td>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EC%83%9D%EC%82%B0%C2%B7%EA%B1%B4%EC%84%A4%C2%B7%EC%9A%B4%EC%86%A1'/>">
								<img src="<c:url value='/images/JobIcon/build.png'/>">
									<br>생산·건<br>설·운송</a></td>
								<td><a href="<c:url value='/rec/recList.ag?jobs=IT%C2%B7%EC%BB%B4%ED%93%A8%ED%84%B0'/>">
								<img src="<c:url value='/images/JobIcon/computer.png'/>">
									<br>IT·컴퓨터<br><br></a></td>
							</tr>
							<tr>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EA%B5%90%EC%9C%A1%C2%B7%EA%B0%95%EC%82%AC'/>">
								<img src="<c:url value='/images/JobIcon/study.png'/>">
									<br>교육<br>강사</a></td>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EB%94%94%EC%9E%90%EC%9D%B8'/>">
								<img src="<c:url value='/images/JobIcon/design.png'/>">
									<br>디자인<br><br></a></td>
								<td><a href="<c:url value='/rec/recList.ag?jobs=%EB%AF%B8%EB%94%94%EC%96%B4'/>">
								<img src="<c:url value='/images/JobIcon/media.png'/>">
									<br>미디어<br><br></a></td>
								<td></td>
							</tr>
						</table>
					</div>
					<div class="divJob3">
						<!-- 테마별 알바 -->
						<span>테마별 알바</span>
						<hr width="90px">
						<table>
							<tr>
								<td><a href="<c:url value='/rec/recList.ag?workTerm=1%EC%A3%BC%EC%9D%BC~1%EA%B0%9C%EC%9B%94'/>">
								<img src="<c:url value='/images/JobIcon/part.png'/>">
									<br>단기알바</a></td>
								<td><a href="<c:url value=''/>">
								<img src="<c:url value='/images/JobIcon/today.png'/>">
									<br>당일지급</a></td>
							</tr>
							<tr>
								<td><a href="<c:url value='#'/>">
								<img src="<c:url value='/images/JobIcon/quick.png'/>">
									<br>급구알바</a></td>
								<td><a href="<c:url value='#'/>">
								<img src="<c:url value='/images/JobIcon/good.png'/>">
									<br>안심계약</a></td>
							</tr>
						</table>
					</div>
				</div><!-- divDivision -->
				</div>
				<div class="divFunction">
					<!-- 로그인상자 및 광고 -->
					<c:if test="${empty sessionScope.userid }">
					<div class="loginBox1">
						<!-- 로그인상자 -->
						<a href="#" onclick="login2_1()">
						<div class="personalLogin">
						<input type="hidden" id="loginBox1" value="Personal">
							개인회원<br>로그인
						</div></a>
						<a href="#" onclick="login2_2()">
						<input type="hidden" id="loginBox2" value="Company">
						<div class="companyLogin">
							기업회원<br>로그인
						</div></a>
						<div class="selectLogin">
							<a href="<c:url value='/jj/join.ag'/>">
							<span style="font-weight:bold">
								회원가입</span></a> |
							<a href="<c:url value='/member/findMember.ag' /> ">아이디 찾기</a> |
							<a href="<c:url value='/member/findMember.ag' /> ">비밀번호 찾기</a>
						</div>
					</div>
					</c:if>
					<c:if test="${!empty sessionScope.userid }">
					<div class="loginBox2">
						<!-- 로그인된 경우 -->
						<div class="logOver">
							<div id="logImg">
							<img src="<c:url value='/images/unImg.jpg'/>">
							</div>
							<div id="logText">
							<span>${sessionScope.nickName }</span>님
							<br>환영합니다
							</div>
						</div>
						<div class="logUnder">
							<p id="underLogText"><br>
							<a href="<c:url value='/member/memInfo.ag'/>">
							▷회원정보 수정</a>
							<a href="<c:url value='/member/logout.ag'/>">
							<span>로그아웃</span></a>
							</p>
						</div>
					</div>
					</c:if>
					
					<div class="">
						<a href="http://www.mova.co.kr/ "><img src="<c:url value='/images/spam.jpg'/>"
						 width="220px"></a>
					</div>
					<div class="divCommercial2">
						<!-- 다른 사이즈의 광고 -->
						<script type="text/javascript">
							var how_many_ads = 3; 
							var now = new Date() 
							var sec = now.getSeconds() 
							var ad = sec % how_many_ads; 
							ad +=1;
							if (ad==1) { 
								url="http://mcdonalds.co.kr/ "; 
								banner="<c:url value='/images/banner/banner3_2.jpg'/>"; 
								height="111px"; 
							}
							if (ad==2) { 
								url="http://cowaykk.com/ "; 
								banner="<c:url value='/images/banner/banner3_3.jpg'/>"; 
								height="111px"; 
							}
							if (ad==3) { 
								url="http://www.ksdb.co.kr/main.asp"; 
								banner="<c:url value='/images/banner/banner3_4.jpg'/>"; 
								height="111px"; 
							}
							document.write('<center>'); 
							document.write('<a href="' + url + '" target="_top">'); 
							document.write('<img src="' + banner + '"'); 
							document.write(' height=' + height + ' '); 
							document.write(' border=0><br>'); 
							document.write('</a>'); 
							document.write('</center>'); 
						</script>
						<%-- <img src="<c:url value='/images/banner/banner3.jpg'/>"
						 width="220px" height="65px"> --%>
						<a href="http://bossam.co.kr/ "><img src="<c:url value='/images/banner/banner5.jpg'/>"
						 width="220px" height="65px"></a>
					</div>
				</div><!-- divFunction -->
				<div class="divBrand">
				<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
				</script>
				<script type="text/javascript" src="<c:url value='/jquery/jquery.simplyscroll.js'/>"></script>
				<link rel="stylesheet" href="<c:url value='/css/jquery.simplyscroll.css'/>" media="all" type="text/css">
				<script type="text/javascript">
				(function($) {
					$(function() {
						$("#scroller").simplyScroll();
					});
				})(jQuery);
				</script>
				
					<!-- 브랜드 알바(페이지 슬라이드) -->
					<div id="divRoll">
						<ul id="scroller">
						    <li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/BurgerKing_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/BR_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/Dunkin_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/GS25_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/Gyejul_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/Otoko_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/Joes_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/KFC_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/Outback_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/Vips_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/CJFood_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/LotteMart_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/Nike_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/PizzaHut_c.png'/>" alt=""/></a></li>
							<li><a href="#" target="_self"><img src="<c:url value='/images/CircleBanner/ParisBagguet_c.png'/>" alt=""/></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="divSuper">
				<br><br>
				<p id="divTitle">슈퍼 채용공고</p>
				<div>
				<!-- 슈퍼 채용공고 리스트 -->
						<a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/001.jpg'/>">
						 <br><p id="title">롯데아이몰</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/002.jpg'/>">
						 <br><p id="title">쿠팡</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/003.jpg'/>">
						 <br><p id="title">나이키</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/004.jpg'/>">
						 <br><p id="title">삼성전자판매</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>
						
						<a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/005.jpg'/>">
						 <br><p id="title">유엔난민기구</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/006.jpg'/>">
						 <br><p id="title">이베이</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/007.jpg'/>">
						 <br><p id="title">롯데백화점</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/008.jpg'/>">
						 <br><p id="title">우리카드</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p></td>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>
						
						<a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/009.jpg'/>">
						 <br><p id="title">라이나생명</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/010.jpg'/>">
						 <br><p id="title">씨티뱅크</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/011.jpg'/>">
						 <br><p id="title">하나카드</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/012.jpg'/>">
						 <br><p id="title">롯데홈쇼핑</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>
						
						<a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/013.jpg'/>">
						 <br><p id="title">피자헛</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/014.jpg'/>">
						 <br><p id="title">서브웨이</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/015.jpg'/>">
						 <br><p id="title">빕스</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</a></div><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/016.jpg'/>">
						 <br><p id="title">스시로</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>
						
						<a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/017.jpg'/>">
						 <br><p id="title">죠스떡볶이</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/018.jpg'/>">
						 <br><p id="title">올리브영</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/019.jpg'/>">
						 <br><p id="title">산들해</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/020.jpg'/>">
						 <br><p id="title">아워홈</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>

						<a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/021.jpg'/>">
						 <br><p id="title">배스킨라빈스</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/022.jpg'/>">
						 <br><p id="title">롯데리아</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/023.jpg'/>">
						 <br><p id="title">던킨도넛</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/024.jpg'/>">
						 <br><p id="title">믹소</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>
						<%-- <a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/025.jpg'/>">
						 <br><p id="title">앤젤리너스</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a> --%>
					</div>
			</div>

			<div class="divGrand">
				<br><br>
				<p id="divTitle">그랜드 채용공고</p>
				<div>
						<a href="#"><div class="GrBox">
						 <img src="<c:url value='/images/company/026.jpg'/>">
						 <br><p id="title">유베이스</p>
						 <p id="content">주5일/주말근무/휴일근무</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="GrBox">
						 <img src="<c:url value='/images/company/027.jpg'/>">
						 <br><p id="title">이마트</p>
						 <p id="content">주5일/주말근무/휴일근무</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="GrBox">
						 <img src="<c:url value='/images/company/028.jpg'/>">
						 <br><p id="title">어노플레이스</p>
						 <p id="content">주5일/주말근무/휴일근무</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>
						
						<a href="#"><div class="GrBox">
						 <img src="<c:url value='/images/company/029.jpg'/>">
						 <br><p id="title">삼성화재서비스</p>
						 <p id="content">주5일/주말근무/휴일근무</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="GrBox">
						 <img src="<c:url value='/images/company/030.jpg'/>">
						 <br><p id="title">삼성화재애니카</p>
						 <p id="content">주5일/주말근무/휴일근무</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="GrBox">
						 <img src="<c:url value='/images/company/031.jpg'/>">
						 <br><p id="title">엘지유플러스</p>
						 <p id="content">주5일/주말근무/휴일근무</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#">
						
						<div class="GrBox">
						 <p id="grayFont">파워 점프, 지역 focus,<br>지역TOP, 업직종 TOP 무료</p>
						 <p id="grayButton"> 상품 안내 및 신청 </p>
						</div></a><a href="#"><div class="GrBox">
						 <p id="grayFont">파워 점프, 지역 focus,<br>지역TOP, 업직종 TOP 무료</p>
						 <p id="grayButton"> 상품 안내 및 신청 </p>
						</div></a><a href="#"><div class="GrBox">
						 <p id="grayFont">파워 점프, 지역 focus,<br>지역TOP, 업직종 TOP 무료</p>
						 <p id="grayButton"> 상품 안내 및 신청 </p>
						</div></a>
				</div>
			</div>
			
			<div class="divSuper">
				<!-- 슈퍼 공고 리스트 -->
				<article id="divSuper">
				<c:import url="/superList.ag"></c:import>
				</article>
			</div>
			<div class="divGrand">
				<!-- 그랜드 공고 리스트 -->
				<article id="divGrand">
				<c:import url="/grandList.ag"></c:import>
				</article>
			</div>
			<div class="divSpecial">
				<!-- 스페셜 공고 리스트(게시판형) -->
				<article id="divSpecial">
				<c:import url="/specialList.ag"></c:import>
				</article>
			</div>
			<div class="divSpeed">
				<!-- 스피드 공고 리스트(게시판형) -->
				<article id="divSpeed">
				<c:import url="/speedList.ag"></c:import>
				</article>
			</div>
			<div class="divCmFooter">
				<!-- 광고배너(2개) -->
			</div>
			<br><br>
		</div>
	</section>
	
<%@ include file="inc/bottom.jsp" %> 