<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>simple Top - 넌 무얼 원하냐고 되물어봤어</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/simpleInc.css'/>" />
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
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
<!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>      
    <![endif]-->
</head>
<body>
	<div id="simple_wrap">
		<!-- 헤더영역 -->
		<header>
			<div id="simple_top">
				<a href="<c:url value='/index.ag'/>"><img alt="로고" src="<c:url value='/images/simple_Logo.png'/> ">
				</a>
				<span></span>
				<ul>
					<li><a href="<c:url value='/index.ag'/>">홈</a> |</li>
					<li><a href="#">채용정보</a> |</li>
					<li><a href="#">인재정보</a> |</li>
					<li><a href="#">알바토크</a> |</li>
					<li><a href="<c:url value='/faq/faqList.ag'/>">FAQ</a> |</li>
					<li><a href="#">캠페인</a></li>
				</ul>
			</div>
		</header>
		<!-- /헤더영역 -->
		
		<div id="container">
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