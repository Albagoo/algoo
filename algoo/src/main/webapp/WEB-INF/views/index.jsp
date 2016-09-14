<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainPage.css'/>" />
<<<<<<< HEAD

<script type="text/javascript">
	$(document).ready(function(){
		$(".divSpecial .SpBox")
			.hover(function(){
				$(this).css("border-color","red")
					.css("border-width", "1px")
					.css("cursor","pointer");
			}, function(){
				$(this).css("border","");
			});
	});
	$(document).ready(function(){
		$(".divGrand .GrBox")
			.hover(function(){
				$(this).css("border-color","red")
					.css("border-width", "1px")
					.css("cursor","pointer");
			}, function(){
				$(this).css("border","")
			});
	});
</script>

=======
>>>>>>> branch 'master' of https://github.com/Albagoo/algoo.git
	<%-- <!-- 메인 컨테이너 페이지 -->
	<br>
	<img src="<c:url value='${pageContext.request.contextPath}/images/console.png'/>" 
		alt="메인테스트">
	<br><br> --%>
	
	<section>
		<div class="divMain">
			<div class="divCategory">
				<!-- 광고 및 기본 기능 -->
				<div class="divCAD">
				<div class="divCmHeader">
					<!-- 광고배너(2개) -->
					<img src="<c:url value='${pageContext.request.contextPath }/images/banner1.jpg'/>">
					<img src="<c:url value='${pageContext.request.contextPath }/images/banner1.jpg'/>">
				</div>
				<div class="divDivision">
					<!-- 알바 분류 -->
					<div class="divJob">
						<!-- 지역별 알바 -->
					</div>
					<div class="divJob">
						<!-- 업종별 알바 -->
					</div>
					<div class="divJob">
						<!-- 테마별 알바 -->
					</div>
				</div>
				</div>
				<div class="divFunction">
					<!-- 로그인상자 및 광고 -->
					<div class="loginBox">
						<!-- 로그인상자 -->
					</div>
					<div class="divCommercial2">
						<!-- 다른 사이즈의 광고 -->
					</div>
				</div>
				<div class="divBrand">
					<!-- 브랜드 알바(페이지 슬라이드) -->
				</div>
			</div>
			<div class="divSpecial">
				<br><br>
				<span id="divTitle">슈퍼 채용공고</span>
				<div>
				<!-- 슈퍼 채용공고 리스트 -->
<<<<<<< HEAD
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
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/005.jpg'/>">
						 <br><p id="title">유엔난민기구</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</a></div>
						
						<a href="#"><div class="SpBox">
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
						</div></a><a href="#"><div class="SpBox">
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
						</div></a>
						
						<a href="#"><div class="SpBox">
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
						</div></a><a href="#"><div class="SpBox">
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
						</a></div>
					
						<a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/016.jpg'/>">
						 <br><p id="title">스시로</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a><a href="#"><div class="SpBox">
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
						</div></a><a href="#"><div class="SpBox">
						 <img src="<c:url value='/images/company/025.jpg'/>">
						 <br><p id="title">앤젤리너스</p>
						 <p id="content">[재택근무] 2016년 상반기 알바</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>
					</div>
=======
				<table class="tableSpecial">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
>>>>>>> branch 'master' of https://github.com/Albagoo/algoo.git
			</div>

			<div class="divGrand">
				<br><br>
				<span id="divTitle">그랜드 채용공고</span>
<<<<<<< HEAD
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
						</div></a><a href="#"><div class="GrBox">
						 <img src="<c:url value='/images/company/029.jpg'/>">
						 <br><p id="title">삼성화재서비스</p>
						 <p id="content">주5일/주말근무/휴일근무</p>
						 <p id="pay">서울 동작구 <span id="time">월</span>
						 <span id="money">1,500,000</span>원</p>
						</div></a>
						
						<a href="#"><div class="GrBox">
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
						</div></a><a href="#"><div class="GrBox">
						 <p id="grayFont">파워 점프, 지역 focus,<br>지역TOP, 업직종 TOP 무료</p>
						 <p id="grayButton"> 상품 안내 및 신청 </p>
						</div></a><a href="#"><div class="GrBox">
						 <p id="grayFont">파워 점프, 지역 focus,<br>지역TOP, 업직종 TOP 무료</p>
						 <p id="grayButton"> 상품 안내 및 신청 </p>
						</div></a>
				</div>
=======
				<table class="tableGrand">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
>>>>>>> branch 'master' of https://github.com/Albagoo/algoo.git
			</div>
			<div class="divOther">
				<!-- 일반 공고 리스트(게시판형) -->
			</div>
			<div class="divCmFooter">
				<!-- 광고배너(2개) -->
			</div>
		</div>
	</section>
=======
	<!-- 메인 컨테이너 페이지 -->
	<div id="mainContentAll">
		<div id="mainTop">
			<div id="mainTop_west">
			
			</div>
			<div id="mainTop_east">
			
			</div>
		</div>
	</div>
	
<%@ include file="inc/bottom.jsp" %> 