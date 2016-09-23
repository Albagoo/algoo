<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/simpleButton.css'/>" />
<style type="text/css">
	.title{
		margin-left: 10px;
		font-size: 1.2em;
		font-weight: bold;
	}
	
	.hope{
		padding: 5px;
		font-size: 0.8em;
		text-align: center;
	}
	
	.hope_table{
		height: 75px; 
		width: 100%;
	}
	
	.hope_title{
		font-size: 15px;
	    letter-spacing: 0;
	    color: #777;
	    text-align: center;
	}
	
	#box{
		margin-top: 10px;
		width: 100%;
		margin-bottom: 30px;
	}
	
	li{
		float: left;
	    height: 20px;
	    font: 12px 'Malgun gothic';
	    letter-spacing: -0.1em;
	    text-align: center;
	    border-left: 1px solid #dcdcdc;
	    color: #888;
	}
	
	.first{
		border: 0 none;
	}
	
	.com_ul{
		list-style: none;
		overflow: hidden;
		height: 100px;
		margin-top: 10px;
	}
	
	.com_ul li{
		float: left;
    	width: 24.5%;
	}
	
	.com_title{
		font-size: 15px;
	    font-weight: bold;
	    color: #333;
	}
	
	.com_ul li span{
		display: block;
	    text-align: center;
	    vertical-align: top;
	}
	
	.com_icon{
		width: 64px;
	    height: 64px;
	    margin: 10px auto;
	    background: none;
	}
	
	.personal_ul{
		list-style: none;
		overflow: hidden;
	}
	
	.personal_ul li{
		float: none;
	    width: auto;
	    padding: 5px 0 7px 6px;
	    font-size: 17px;
	    border-top: 1px solid #e6e6e6;
	    border-left: 0 none;
	    text-align: left;
	}
	
	.hope_span{
		display: block;
	    padding-bottom: 10px;
	    font-size: 12px;
	    letter-spacing: -0.1em !important;
	    color: #888;
	}
	
	.back{
		display: inline-block;
	    height: 38px;
	    padding: 10px 40px 0;
	    font: bold 18px 'Malgun Gothic';
	    letter-spacing: -0.1em;
	    vertical-align: top;
	    border: 1px solid #4f585e;
	    background: #52575c;
	    color: #fff;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[type='text']").addClass("textBox");
		
		var period = $("#period").val();
		if(period.indexOf("동") != -1){
			$("#period_1").html(period.substr(0, period.indexOf("동")-1));
		}else{
			$("#period_1").html(period);
		}
		
		var detail = $("#detail").val().split(",");
		
		for(var d in detail){
			var year = detail[d].split("-");
			
			$("#detail_"+d).html(year[0]);
			
			if($("#authCode").val() == "2"){
				$("#detail"+d).html(year[1]);
			}else{
				$("#detail"+d).html("OOOO");
			}
		}
	});
</script>
	<div style="width: 700px; height: 70px; border: 3px solid #444;
		text-align: center;" >
		<input type="hidden" id="authCode" value="${sessionScope.authCode }">
		<h2 style="margin-top: 10px; font-weight: bold; font-size: 2em">
			<c:if test="${fn:length(resumeVo.title)>20}">
				${fn:substring(resumeVo.title, 0,20)}...
			</c:if>
			<c:if test="${fn:length(resumeVo.title)<=20}">
				${resumeVo.title}
			</c:if>
		</h2>
	</div>
	<div style="width: 672px; border: 1px solid #e6e6e6; overflow: hidden;
		padding: 15px">
		<div style="float: right; padding: 5px 15px 5px 5px;">
			<div style="border: 1px solid silver; width: 200px;
				font-size: 0.8em; text-align: center; padding: 5px;">
				연락 가능 시간 : <span style="color: skyblue; font-weight: bold">${resumeVo.contatctHour }</span>
			</div>
		</div>
		<div style="clear: both">
			<table>
				<tr id="tr">
					<td style="text-align: center; padding: 10px; width: 20%">
						<c:if test="${empty memberVo.photo }">
							<img alt="사람이미지" src="<c:url value='/images/saram.PNG'/>">
						</c:if>
						<c:if test="${!empty memberVo.photo }">
							<img alt="회원이미지" src="/algoo/algoo_images/${memberVo.photo }"
							width="130" height="150">
						</c:if><br>
					</td>
					<td style="width: 80%">
						<table style="float: left; width: 60%">
							<tr>
								<td id="td1" style="width: 20%; padding-left: 0;font-weight: bold;">이름</td>
								<td id="td2" style="padding: 5px">
								<input type="text" value="${memberVo.userName }" readonly></td>
							</tr>
							<tr>
								<td id="td1" style="width: 20%; padding-left: 0;font-weight: bold;">휴대폰</td>
								<td id="td2" style="padding: 5px">
								<input type="text" value="${memberVo.hp1 } - ${memberVo.hp2 } - ${memberVo.hp3 }" readonly>
								</td>
							</tr>
							<tr>
								<td id="td1" style="width: 20%; padding-left: 0;font-weight: bold;">e-메일</td>
								<td id="td2" style="padding: 5px">
								<input type="text" style="width: 70%"
								value="${memberVo.email1 }@${memberVo.email2}" readonly></td>
							</tr>
							<tr>
								<td id="td1" style="width: 20%; padding-left: 0;font-weight: bold;">주소</td>
								<td id="td2" style="padding: 5px">
								<input type="text" style="width: 180%" 
								value="${memberVo.address }" readonly></td>
								</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		
		<span class="title">희망근무조건</span>
		<table id="box">
			<tr style="border-top: 2px solid #444">
				<td>
					<ul style="overflow: hidden;
							    padding: 10px 0 15px;
							    height: 40px">
						<li style="height: 40px; width: 60%; border-left: 0 none;">
							<span class="hope_span">근무기간 / 요일 / 시간</span>	
							<span style="font-size: 1.1em;
										color: #444; font-weight: bold">${hopeVo.day }</span>					
						</li>
						<li style="height: 40px; width: 19%">
							<span class="hope_span">근무형태</span>
							<span style="font-size: 1.1em;
										color: #444; font-weight: bold">${hopeVo.type }</span>
						</li>
						<li style="height: 40px; width: 19%">
							<span class="hope_span">희망급여</span>
							<span style="font-size: 1.1em;
										color: #444; font-weight: bold">${hopeVo.pay }</span>
						</li>
					</ul>
				</td>
			</tr>
			<tr style="border-bottom: 1px solid #e6e6e6; border-top: 1px solid #e6e6e6;">
				<td colspan="3">
					<table class="hope_table">
						<colgroup>
							<col width="15%">
							<col width="85%">
						</colgroup>
						<tr>
							<td class="hope_title" style="text-align: right">희망지역</td>
							<td class="hope" style="text-align: left"><span style="margin-left: 10px">${hopeVo.area }</span></td>
						</tr>
						<tr>
							<td class="hope_title" style="text-align: right">희망직종</td>
							<td class="hope" style="text-align: left"><span style="margin-left: 10px">${hopeVo.category }</span></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		<c:if test="${resumeVo.careerCode != 0}">
			<span class="title">경력</span>&nbsp;
			<div style="overflow: hidden;
						  margin-top: 10px;
						  border-top: 2px solid #444">
				<div style="float: left;
							    width: 170px;
							    margin-right: 30px;
							    text-align: center">
					<p id="period_1"
						style="margin-top: 8px;
							    font-size: 13px;
							    letter-spacing: 0;
							    color: #777;">
						<input type="hidden" id="period" value="${careerVo.period }"></p>
				</div>
				<dl style="width: 400px;
    							padding-top: 0; overflow: hidden; list-style: none">
    				<dt style="display: block;
							    padding: 0 0 5px;
							    font-size: 24px;
							    font-weight: normal;
							    letter-spacing: -0.1em;">
							    <c:if test="${sessionScope.authCode == '2'}">
							    	${careerVo.company }
							    </c:if>
							    <c:if test="${sessionScope.authCode != '2'}">
							    	OOOO
							    </c:if>
							    </dt>
					<dd style="position: relative;
							    display: inline-block;
							    padding: 0 12px 0 0;
							    margin-right: 8px;
							    font-size: 15px;
							    font-weight: bold;
							    vertical-align: top;">${careerVo.period }</dd>
					<dd style="clear: both;
    							margin-top: 5px;overflow: hidden;
							    padding: 0 0 2px;
							    vertical-align: top;">
					<span style="display: block;
								    width: auto;
								    height: 22px;
								    padding-top: 4px;
								    font-size: 12px;
								    color: #989898;">담당업무</span>
					<ul><li style="float: left;
							    height: 23px;
							    padding: 1px 6px 0;
							    margin: 0 2px 5px;
							    font: 14px 'Malgun Gothic';
							    white-space: nowrap;
							    border: 1px solid #e5e5e5;
							    background: #f2f2f2;">${careerVo.work }</li></ul>  
								    </dd>
				</dl>
			</div>
		</c:if>
		
		<c:if test="${resumeVo.careerCode != 0}">
			<span class="title">학력</span>&nbsp;
			<div style="border-top: 2px solid #444; margin-top: 10px">
			<input type="hidden" id="detail" value="${resumeVo.detail }">
			<c:forEach var="i" begin="0" end="${length }">
			<div style="overflow: hidden;
						  margin-top: 10px;">
				<div style="float: left;
							    width: 170px;
							    margin-right: 30px;
							    text-align: center">
					<p id="detail_${i }"
						style="margin-top: 8px;
							    font-size: 13px;
							    letter-spacing: 0;
							    color: #777;">
						</p>
				</div>
				<dl style="width: 400px;
    							overflow: hidden; list-style: none">
    				
						<dd style="position: relative;
								    display: inline-block;
								    padding: 0 12px 0 0;
								    margin-right: 8px;
								    margin-top:5px;
								    font-size: 15px;
								    font-weight: bold;
								    "
								    id="detail${i }"></dd>
				</dl>
				</div>
				</c:forEach>	
			</div>
		</c:if>
		
		<c:if test="${resumeVo.languageCode != 0}">
			<span class="title">외국어 능력</span>&nbsp;
			<ul style="overflow: hidden;
						   padding: 10px 4px;
						   border-bottom: 1px solid #e6e6e6;
						   border-top: 2px solid #444;
						   margin-top: 10px;">
				<li class="first" style="width: 19%">외국어명</li>
				<li style="width: 19%">구사능력</li>
				<li style="width: 60%">해외연수/공인시험</li>
			</ul>
			<div style="margin: 0; height: 40px;
						    padding: 10px 0 0 0;
						    border-bottom: 1px solid #e5e5e5;
						    overflow: hidden;
						    margin-bottom: 30px;">
				<div style="float: left; width: 19%">
					<p style="font-size: 17px;
						    font-weight: bold;
						    text-align: center;">${languageVo.language }</p>
				</div>
				<dl style="padding-top: 3px; overflow: hidden;">
					<dt style="width: 19%; float: left;
							    margin: 0;
							    padding: 0 0 0 20px;
							    font-weight: normal;
							    border: 0 none;
							    vertical-align: top;">${languageVo.languageCommand }</dt>
					<dd style="width: 60%;float: left;
							    padding-left: 20px;
							    font-size: 15px;
							    letter-spacing: 0;
							    vertical-align: top;">
							    ${languageVo.languageStudy } / ${languageVo.officialTest }</dd>
				</dl>
			</div>
		</c:if>
		
		<c:if test="${resumeVo.licenseCode != 0}">
			<span class="title">자격증</span>&nbsp;
			<ul style="overflow: hidden;
						   padding: 10px 4px;
						   border-bottom: 1px solid #e6e6e6;
						   border-top: 2px solid #444;
						   margin-top: 10px;">
				<li class="first" style="width: 50%">자격증명</li>
				<li style="width: 49%">발행처 / 취득년도</li>
			</ul>
			<div style="overflow: hidden;
						    float: none;
						    margin: 0;
						    padding: 13px 4px 17px;
						    border-bottom: 1px solid #e6e6e6;
						    margin-bottom: 30px;
						    height: 20px;">
				<p style="float: left;
						    width: 48%;
						    font-size: 17px;
						    font-weight: bold;
						    text-align: center;">${licenseVo.licenseName }</p>
				<p style="overflow: hidden;
						    width: 48%;
						    margin: 0;
						    padding: 3px 0 0 20px;
						    font-size: 15px;">${licenseVo.collicensePlace }</p>
			</div>
		</c:if>
		<c:if test="${resumeVo.comAbilityCode != 0}">
			<span class="title">컴퓨터 활용능력</span>&nbsp;
			<div style="margin-top: 20px;
							overflow: hidden;
							height: 150px;
							border-top: 2px solid #444;
							border-bottom: 1px solid #e6e6e6;
							margin-bottom: 30px;">
				<ul class="com_ul" style="height: 150px">
					<li class="first" >
						<span class="com_title">워드</span>					
						<span class="com_icon">
							<c:if test="${computerAbilityVo.word == '상 : 표/도구 활용' }">
								<img alt="상" src="<c:url value='/images/resume_good.png'/>">
							</c:if>
							<c:if test="${computerAbilityVo.word == '중 : 문서편집' }">
								<img alt="중" src="<c:url value='/images/resume_nomal.png'/>">
							</c:if>
							<c:if test="${computerAbilityVo.word == '하 : 기본사용' }">
								<img alt="하" src="<c:url value='/images/resume_bad.png'/>">
							</c:if>
						</span>
						<span style="font-size: 13px;
    									color: #2073f0;display: block;
    									text-align: center;vertical-align: top;">${computerAbilityVo.word}</span>
					</li>
					<li>
						<span class="com_title">엑셀</span>					
						<span class="com_icon">
							<c:if test="${computerAbilityVo.excel == '상 : 수식/함수 활용' }">
								<img alt="상" src="<c:url value='/images/resume_good.png'/>">
							</c:if>
							<c:if test="${computerAbilityVo.excel == '중 : 데이터 입력/편집' }">
								<img alt="중" src="<c:url value='/images/resume_nomal.png'/>">
							</c:if>
							<c:if test="${computerAbilityVo.excel == '하 : 기본사용' }">
								<img alt="하" src="<c:url value='/images/resume_bad.png'/>">
							</c:if>
						</span>
						<span style="font-size: 13px;
    									color: #2073f0;display: block;
    									text-align: center;vertical-align: top;">${computerAbilityVo.excel}</span>
					</li>
					<li>
						<span class="com_title">파워포인트</span>					
						<span class="com_icon">
							<c:if test="${computerAbilityVo.powerPoint == '상 : 차트/효과 활용' }">
								<img alt="상" src="<c:url value='/images/resume_good.png'/>">
							</c:if>
							<c:if test="${computerAbilityVo.powerPoint == '중 : 서식/도형 활용' }">
								<img alt="중" src="<c:url value='/images/resume_nomal.png'/>">
							</c:if>
							<c:if test="${computerAbilityVo.powerPoint == '하 : 기본사용' }">
								<img alt="하" src="<c:url value='/images/resume_bad.png'/>">
							</c:if>
						</span>
						<span style="font-size: 13px;
    									color: #2073f0;display: block;
    									text-align: center;vertical-align: top;">${computerAbilityVo.powerPoint}</span>
					</li>
					<li>
						<span class="com_title">인터넷</span>					
						<span class="com_icon">
							<c:if test="${computerAbilityVo.internet == '상 : 정보수집능숙' }">
								<img alt="상" src="<c:url value='/images/resume_good.png'/>">
							</c:if>
							<c:if test="${computerAbilityVo.internet == '중 : 검색/정보수집' }">
								<img alt="중" src="<c:url value='/images/resume_nomal.png'/>">
							</c:if>
							<c:if test="${computerAbilityVo.internet == '하 : 기본사용' }">
								<img alt="하" src="<c:url value='/images/resume_bad.png'/>">
							</c:if>
						</span>
						<span style="font-size: 13px;
    									color: #2073f0;display: block;
    									text-align: center;vertical-align: top;">${computerAbilityVo.internet}</span>
					</li>
				</ul>
			</div>
		</c:if>
		
		
		<c:if test="${resumeVo.personalInfoCode != 0}">
			<span class="title">개인부가정보</span>
			<div style="margin: 10px 0 0;
    						padding: 0 4px;
    						overflow: hidden;
    						border-top: 2px solid #444;
							border-bottom: 1px solid #e6e6e6;
							margin-bottom: 30px;"> 
				<ul class="personal_ul">
					<li style="border-top: 0 none;">
						장애여부 - <strong style="font-weight: bold;
													color: #444">
													<c:if test="${sessionScope.authCode == '2'}">
												    	${personalInfoVo.obstacle }
												    </c:if>
												    <c:if test="${sessionScope.authCode != '2'}">
												    	OOOO
												    </c:if></strong>
					</li>
					<li>
						국가보훈 - <strong style="font-weight: bold;
													color: #444"><c:if test="${sessionScope.authCode == '2'}">
															    	${personalInfoVo.veterans }
															    </c:if>
															    <c:if test="${sessionScope.authCode != '2'}">
															    	OOOO
															    </c:if></strong>
					</li>
					<li>
						병역사항 - <strong style="font-weight: bold;
													color: #444"><c:if test="${sessionScope.authCode == '2'}">
															    	${personalInfoVo.military }
															    </c:if>
															    <c:if test="${sessionScope.authCode != '2'}">
															    	OOOO
															    </c:if></strong>
					</li>
					<li>
						고용지원금 - <strong style="font-weight: bold;
													color: #444"><c:if test="${sessionScope.authCode == '2'}">
															    	${personalInfoVo.employment }
															    </c:if>
															    <c:if test="${sessionScope.authCode != '2'}">
															    	OOOO
															    </c:if></strong>
					</li>
				</ul>
			</div>
		</c:if>
		
		<span class="title">자기소개서</span>
		<div style="margin-top: 10px; border-top: 2px solid #444">
		<table>	
			<tr><td>
			<img src="<c:url value='/images/resume_content.PNG'/>" alt="기업회원으로 로그인 하시면 열람하실 수 있습니다! 개인회원의 개인정보보호를 위하여 사진, 학교 및 경력사항, 자기소개서등의 정보는 기업회원으로 로그인 후 열람하실 수 있습니다." 
				border="0" usemap="#MapContents" />
				<map name="MapContents" id="MapContents">
					<area shape="rect" coords="116,80,240,109" alt="기업회원 로그인" 
						href="#" onclick="window.open('/algoo/login/login.ag?type=Company', 'login','width=390,height=480,left=700,top=200,resizable=yes,location=yes')"/>
					<area shape="rect" coords="254,80,378,109" alt="기업회원 가입" 
						href="#" onclick="location.href='/algoo/jj/join.ag'"/>
				</map>
			</td>
		</tr>
		</table>		
		</div>
		<div class="resumeComfirm" 
			style="margin-top: 10px; border-top: 1px solid #e6e6e6">
			<img alt="확인 이미지" src="<c:url value='/images/confirm.png'/>"
				style="height:28px;padding: 30px 0 0 60px;" class="align_center">
			<div style="text-align: center;padding: 20px 0 30px 0;" >
				<span style="padding-right: 40px;">
					작성일 : <span style="font-weight: bold;"><fmt:formatDate value="${resumeVo.regdate }" pattern="yyyy년 MM월 dd일" /></span></span>
				<span>작성자 : ${memberVo.userName }</span>
			</div>
		</div>
	</div>
	<p style="margin-top: 20px">
		<a href="<c:url value='/resume/list.ag'/>" class="back"
			style="text-decoration: none">돌아가기</a>
	</p>
<%@ include file="../inc/bottom.jsp"%>