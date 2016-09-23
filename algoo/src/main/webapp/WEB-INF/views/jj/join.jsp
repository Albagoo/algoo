<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/join.css'/>" />
<!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>      
    <![endif]-->
<script type="text/javascript">
	$(document).ready(function(){
		$("#simple_top span").html("회원가입");
		//simple_top 이용시 자기가 맡은화면 명칭 innerHTML로 붙여주기
		
		$("#bt_personal").click(function(){
			location.href="<c:url value='/member/agreement.ag'/>";
		});
		
		$("#bt_business").click(function(){
			location.href="<c:url value='/member_comp/register.ag'/>";
		});
	});
</script>
<section>
	<div id="join_div" style="margin-right: 80px;">
		<div id="joinMessage">
			<h1>개인/기업 회원가입</h1>
			<p>개인/기업회원 가입을 환영합니다 다양한 가입을 통해서 다양한 서비스를 누리세요</p>
		</div>
		<div id="joinType" style="padding-right: 80px;">
			<div id="join_personal">
				<h2><span class="point_p">개인&nbsp;</span>회원가입</h2>
				<p>원하는 기업을 쏙쏙</p>
				<img alt="개인이미지" src="<c:url value='/images/suit.png'/>"><br>
				<input type="button" id="bt_personal" value="개인 회원가입">
				<p style="color:sliver;font-size:14px;font-weight:normal;">간편하게 가입하는 방법도 있어요</p>
				
				<div id="join_google">
					<img alt="구글로고" src="<c:url value='/images/icon_google.png'/>"/>
					<input type="button" id="bt_google" value="구글로 로그인">
				</div>
				
				<div id="join_naver">
					<img alt="네이버로고" src="<c:url value='/images/icon_naver.png'/>"/>
					<input type="button" id="bt_naver" value="네이버로 로그인">
				</div>
				
				<div id="join_kakao">
					<img alt="카카오로고" src="<c:url value='/images/icon_kakao.png'/>"/>
					<input type="button" id="bt_kakao" value="카카오로 로그인">
				</div>
					
				<div id="join_facebook">
					<img alt="페이스북로고" src="<c:url value='/images/icon_facebook.png'/>"/>
					<input type="button" id="bt_facebook" value="페이스북 로그인">
				</div>
			</div>
			<div id="join_business" style="margin-right: 16px;">
				<h2><span class="point_b">기업&nbsp;</span>회원가입</h2>
				<p>원하는 인재를 쏙쏙</p>
				<img alt="기업이미지" src="<c:url value='/images/briefcase.png'/>"><br>
				<input type="button" id="bt_business" value="기업 회원가입">
				<p>※ 채용공고를 등록하거나, 인재를 채용하고자 하는<br>
					 개인사업주, 사업체직원이라면<br>
				      기업 회원가입( 업체정보필수 )을 하시면 됩니다.</p>
			</div>
			<div>
				<p>
			</div>
		</div>	
	</div>
</section>
<%@ include file="../inc/simple_bottom.jsp" %>