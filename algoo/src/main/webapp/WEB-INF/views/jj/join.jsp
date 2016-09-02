<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/join.css'/>" />
<!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>      
    <![endif]-->
<script type="text/javascript">
	
</script>
<section>
	<div id="join_div">
		<div id="joinMessage">
			<h1>개인/기업 회원가입</h1>
			<p>통합회원 가입을 환영합니다 다양한 가입을통해 보다나은 서비스를 누리세요</p>
		</div>
		<div id="joinType">
			<div id="join_personal">
				<h2><span class="point_p">개인</span>회원가입</h2>
				<p>원하는 기업을 쏙쏙</p>
				<img alt="개인이미지" src="../images/suit.png"><br>
				<input type="button" id="bt_personal" value="개인회원가입">
			</div>
			<div id="join_business">
				<h2><span class="point_b">기업</span>회원가입</h2>
				<p>원하는 인재를 쏙쏙</p>
				<img alt="기업이미지" src="../images/briefcase.png"><br>
				<input type="button" id="bt_business" value="기업회원가입">
			</div>
			<div>
				<p>
			</div>
		</div>	
	</div>
</section>
<%@ include file="../inc/simple_bottom.jsp" %>