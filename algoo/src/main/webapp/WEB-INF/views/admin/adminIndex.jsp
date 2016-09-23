<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/leftNavi.css'/>" />
<style>
	footer{
		clear:both;
	}
	#content{
		width:78%;
		border:1px solid #eee;
		float:right;
		margin-top:16px;
	}
	
</style>
<div id="adminPage">
	<h2>관리자페이지</h2>
	<div id="naviDiv">
		<nav>
			<dl id="leftNavi">
				<dt>회원정보관리</dt>
					<dd><a href="#">회원목록</a></dd><br>
				<dt>인재정보관리</dt>
					<dd><a href="#">승인대기목록</a></dd>
					<dd><a href="#">게시현황</a></dd><br>
				<dt>채용공고관리</dt>
					<dd><a href="#">승인대기목록</a></dd>
					<dd><a href="#">게시현황</a></dd><br>
				<dt>게시판관리</dt>
					<dd><a href="#">공지사항</a></dd>
					<dd><a href="#">질문과답변</a></dd>
					<dd><a href="#">알바토크</a></dd><br>
			</dl>
		</nav>
	</div>\
	<div id="content">
		<section>
			<h1>관리자 메인</h1>
		</section>
	</div>
</div>
