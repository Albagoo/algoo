<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>알바의 새로운 패러다임! - 알구</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/includeLayout.css" />
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	function login(){
		window.open("<c:url value='/login/login.ag'/>",	"login",
		"width=390,height=480,left=700,top=200,resizable=yes,location=yes");
	}
	
	/* top버튼 나타내기 */
	$(document).ready(function(){
	    $(".upMark").hide(); // 탑 버튼 숨김
	    $(function () {
	                 
	        $(window).scroll(function () {
	            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
	                $('.upMark').fadeIn();
	            } else {
	                $('.upMark').fadeOut();
	            }
	        });
	                
	        $('.upMark').click(function () {
	            $('body,html').animate({
	                scrollTop: 0
	            }, 100);  // 탑 이동 스크롤 속도
	            return false;
	        });
	    });
	});
	
	/* 우측 메뉴의 이동 */
	// 현재 스크롤바의 위치를 저장하는 변수 (px)
	var currentScrollTop = 0;
	     
	window.onload = function() {
	    // 새로고침 했을 경우를 대비한 메소드 실행
	    scrollController();
	     
	    // 스크롤을 하는 경우에만 실행
	    $(window).on('scroll', function() {
	        scrollController();
	    });
	}
	// 메인 메뉴의 위치를 제어
	function scrollController() {
	    currentScrollTop = $(window).scrollTop();
	    if (currentScrollTop < 220) {
	        $('#header').css('top', -(currentScrollTop));
	        $('#rightMenu').css('top', 220-(currentScrollTop));
	        if ($('#rightMenu').hasClass('fixed')) {
	            $('#rightMenu').removeClass('fixed');
	        }
	    } else {
	        if (!$('#rightMenu').hasClass('fixed')) {
	            $('#header').css('top', -220);
	            $('#rightMenu').css('top', 10);
	            $('#rightMenu').addClass('fixed');
	        }
	    }
	}
</script>
</head>
<body>
	<div id="wrap">
		<!-- header시작 -->
		<div id="header">
			<div id="header_div">
				<div id="header_top">
					<div id="header_action">
					<!-- 로그인이 안된 경우 -->
					<c:if test="${empty sessionScope.userid }">
						<a href="#" onclick="login()">로그인</a> |
						<a href="<c:url value='/jj/join.ag'/>">회원가입</a>
					</c:if>
					<!-- 로그인이된 경우 -->
					<c:if test="${!empty sessionScope.userid }">
						<span style="font-size:1em">${sessionScope.userName}님</span>
						<a href="<c:url value='/member/logout.ag' />">로그아웃</a>
						<a href="<c:url value='/login/mypageType.ag'/>">마이페이지</a>
					</c:if>
						<!-- <a href="#">고객센터</a> |
						<a href="#">이벤트</a> -->
					</div>
				</div>
				<div id="header_search">
					<div id="header_logo">
						<a href="<c:url value='/index.ag' />">
						<img alt="로고" src="${pageContext.request.contextPath}/images/mainLogo-red.png"></a>
					</div>
					<div id="header_searchBar">
						<div>
							<a href="<c:url value='/rec/recList.ag'/>">시간선택제</a> | 
							<a href="<c:url value='/rec/recList.ag'/>">당일알바</a> |
							<a href="http://www.alba.co.kr/story/albahelper/laboroverduelist.asp">임금체불주신고</a>
							<form name="frmSearch" id="frmSearch"
							 action="<c:url value='/rec/recList.ag?searchCondition=title&searchKeyword="keyword"'/>" method="post">
								<fieldset>
									<span id="span_keyword">
									<input type="text" name="keyword" id="keyword"></span>
									<input type="submit" id="bt_search" value="검색">
								</fieldset>
							</form>
						</div>
					</div>
					<div id="header_advertise">
						<a href="http://www.findjob.co.kr/" target="_blank">
						<img alt="광고" src="${pageContext.request.contextPath}/images/findjobLogo.png">
						</a>
					</div>
				</div>
				
				<div id="header_menu">
					<a href="<c:url value='/rec/recList.ag'/>">채용정보 </a>
					<a href="<c:url value='/rec/recList.ag'/>">브랜드알바 </a> 
					<a href="<c:url value='/rec/recList.ag'/>">굿잡 </a>
					<a href="<c:url value='/freeboard/list.ag'/>">알바토크 </a>
					<a href="<c:url value='/resume/list.ag'/>">인재정보	</a>
					<a href="<c:url value='/faq/faqUserList.ag'/>">FAQ </a>
					<a href="<c:url value='/notice/noticeUserList.ag'/>">공지사항 </a>
					<a href="<c:url value='/resume/write.ag'/>">이력서등록 </a>
					<a href="<c:url value='/rec/recWrite.ag'/>">공고등록 </a>
				</div>
			</div><!-- header_div -->
		</div><!-- header -->
		<!-- header끝 -->
		
			<!-- 최상단으로 이동버튼 -->
			<div class="upMark">
			<a href="#">
			<img id="upMark" src="<c:url value='/images/up_mark.png'/>">
			</a></div>
			
			<!-- 좌측 고정배너 -->
			<div id="leftBanner">
				<script type="text/javascript">
					var how_many_ads = 2; 
					var now = new Date() 
					var sec = now.getSeconds() 
					var ad = sec % how_many_ads; 
					ad +=1; 
					if (ad==1) { 
						url="#"; 
						banner="<c:url value='/images/banner/banner4_1.jpg'/>"; 
						height="205px"; 
					} 
					if (ad==2) { 
						url="#"; 
						banner="<c:url value='/images/banner/banner4_2.jpg'/>"; 
						height="205px"; 
					}
					document.write('<center>'); 
					document.write('<a href="' + url + '" target="_top">'); 
					document.write('<img src="' + banner + '"'); 
					document.write(' height=' + height + ' '); 
					document.write(' border=0><br>'); 
					document.write('</a>'); 
					document.write('</center>'); 
				</script>
				<%-- <img src="<c:url value='/images/banner/banner4_2.jpg'/>"> --%>
			</div>
			
		<!-- container시작 -->
		<div id="container">
			<!-- 우측 메뉴(고정) -->
			<div id="rightMenu">
				<div id="mJoin">
					가입
					<img src="<c:url value='/images/icon_facebook.png'/>">
					<img src="<c:url value='/images/icon_naver.png'/>">
					<img src="<c:url value='/images/icon_kakao.png'/>">
					<br>
					<hr>
					<ul type="circle">
						<li><a href="#">이력서 등록</a></li>
						<li><a href="#">채용공고 등록</a></li>
					</ul>
				</div>
				<div id="mToday">
					<div id="mTitle">오늘 본 인재 :
					<a href="#">0</a></div>
					<div id="mContent">
						오늘 본 인재가<br> 없습니다.
					</div>
					<div id="mView">
						<p>전체보기 1/0</p>
						<span>∧</span>
						<span>∨</span>
					</div>
				</div>
				<div id="mReport">
					<a href="#"><p>온라인 문의<img src="<c:url value='/images/question.png'/>"></p></a>
					<a href="#"><p>허위정보 신고<img src="<c:url value='/images/van.png'/>"></p></a>
				</div>
			</div>