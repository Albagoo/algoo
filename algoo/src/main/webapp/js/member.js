/**
 * 
 */
$(document).ready(function(){
		$("#email2").change(function(){
			if($(this).val()=="etc"){
				$("#email3").css("visibility","visible");
				$("#email3").focus();
				$("#email3").val("");
			}else{
				$("#email3").css("visibility","hidden");
			}
		});//chang
		
		$("#btnZipcode").click(function(){
			window.open("/algoo/zipcode/zipcode.ag",
				"zip",
			"width=500,height=550,left=10, top=50,resizable=yes,location=yes");	
		});//zipcode click
		
		$("#id").click(function(){
			$("#id").css("color","black");
		});
		
		$(".gender_man").click(function(){
			$("#man").val("남자").prop("checked",this.checked);
			$(".gender_man").css("border","1px solid #E70400");
			$("#manRb").css("color","#E70400");
			
			$("#woman").val("")
			$(".gender_woman").css("border","");
			$("#womanRb").css("color","#999");
		});
		
		$(".gender_woman").click(function(){
			$("#woman").val("여자").prop("checked",this.checked);
			$(".gender_woman").css("border","1px solid #E70400");
			$("#womanRb").css("color","#E70400");
			
			$("#man").val("");
			$(".gender_man").css("border","");
			$("#manRb").css("color","#999");
		});
		
		$("#copy_algoo").hover(function(){
			$("#copy_algoo").css("color","red");
		},function(){
			$("#copy_algoo").css("color","");
		});
		
		
		//pwd유효성 검사
		$("#pwd").keyup(function(){
			if($("#pwd").val().length<4 || $("#pwd").val().length>16){
				$("#message2").html("비밀번호는 4~16자리로 입력하세요");
				$("#chkPw").val("N");
			}else{	
				if(validate_userid($("#pwd").val()) && 
						$("#pwd").val().length>=0){
						$("#message2").html("비밀번호 중복확인을 하세요");
						
						$("#pwd2").keyup(function(){
							if($("#pwd").val()==$("#pwd2").val()){
								if($("#pwd").val().length>=4 && $("#pwd").val().length<=16
										&& $("#pwd2").val().length>=4 && $("#pwd2").val().length<=16){
									$("#message2").html("사용가능한 비밀번호입니다");
									$("#chkPw").val("Y");
								}else if(validate_userid($("#pwd").val()) || validate_userid($("#pwd2").val())){
									$("#message2").html("비밀번호 규칙에 맞지 않습니다");
									$("#chkPw").val("N");
								}else{
									$("#message2").html("비밀번호 규칙에 맞지 않습니다");
									$("#chkPw").val("N");
								}
							}else{
								$("#message2").html("비밀번호가 일치 하지 않습니다");
								$("#chkPw").val("N");
							}	
						});
				}else{
					//유효성 검사를 통과하지 못한 경우
					$("#message2").html("비밀번호 규칙에 맞지 않습니다");
					$("#chkPw").val("N");
				}
			}	
		});//pwd
		/*$("#pwd2").keyup(function(){
			if($("#pwd").val()==$("#pwd2").val()){
				if($("#pwd").val().length>=4 && $("#pwd").val().length<=16
						&& $("#pwd2").val().length>=4 && $("#pwd2").val().length<=16){
					$("#message2").html("사용가능한 비밀번호입니다");
					$("#chkPw").val("Y");
				}else{
					$("#message2").html("비밀번호 규칙에 맞지 않습니다");
					$("#chkPw").val("N");
				}
			}else{
				$("#message2").html("비밀번호가 일치 하지 않습니다");
				$("#chkPw").val("N");
			}	
		});//pwd2
*/		
		$("#nickName").keyup(function(){
			if($("#nickName").val().length<1 || $("#nickName").val()==""){
				$("#message3").html("닉네임을 입력하세요");	
				$("#nick").val("N");
			}else{
				$("#message3").html("");
				$("#nick").val("Y");
			}
		});//nickname
		$("#userName").keyup(function(){
			if($("#userName").val().length<1 || $("#userName").val()==""){
				$("#message4").html("이름을 입력하세요");	
				$("#chkName").val("N");
			}else{
				$("#message4").html("");
				$("#chkName").val("Y");
			}
		});//nickname
		$("#b_yy").keyup(function(){
			if($("#b_yy").val().length==4 && $("#b_mm").val()!="null" && $("#b_dd").val()>=1 && $("#b_dd").val()<=31 ){
				$("#chkBirth").val("Y");
			}else{
				$("#chkBirth").val("N");
			}
		});
		$("#b_mm").change(function(){
			if($("#b_yy").val().length==4 && $("#b_mm").val()!="null" && $("#b_dd").val()>=1 && $("#b_dd").val()<=31 ){
				$("#chkBirth").val("Y");
			}else{
				$("#chkBirth").val("N");
			}
		});
		$("#b_dd").keyup(function(){
			if($("#b_yy").val().length==4 && $("#b_mm").val()!="null" && $("#b_dd").val()>=1 && $("#b_dd").val()<=31 ){
				$("#chkBirth").val("Y");
			}else{
				$("#chkBirth").val("N");
			}
		});
		$("#hp1").keyup(function(){
			if($("#hp1").val().length==3 && $("#hp2").val().length==4 && $("#hp3").val().length==4){
				$("#chkHp").val("Y");
				$("#message6").html("");
			}else if(!validate_hp($("#hp1").val()) ||
					!validate_hp($("#hp2").val()) || 
					!validate_hp($("#hp3").val()) ){
				$("#chkHp").val("N");
				$("#message6").html("숫자만 입력하세요");
			}else{
				$("#chkHp").val("N");
				$("#message6").html("휴대폰번호를 입력하세요");
			}
		});
		$("#hp2").keyup(function(){
			if($("#hp1").val().length==3 && $("#hp2").val().length==4 && $("#hp3").val().length==4){
				$("#chkHp").val("Y");
				$("#message6").html("");
			}else if(!validate_hp($("#hp1").val()) ||
					!validate_hp($("#hp2").val()) || 
					!validate_hp($("#hp3").val()) ){
				$("#chkHp").val("N");
				$("#message6").html("숫자만 입력하세요");
			}else{
				$("#chkHp").val("N");
				$("#message6").html("휴대폰번호를 입력하세요");
			}
		});
		$("#hp3").keyup(function(){
			if($("#hp1").val().length==3 && $("#hp2").val().length==4 && $("#hp3").val().length==4){
				$("#chkHp").val("Y");
				$("#message6").html("");
			}else if(!validate_hp($("#hp1").val()) ||
					!validate_hp($("#hp2").val()) || 
					!validate_hp($("#hp3").val()) ){
				$("#chkHp").val("N");
				$("#message6").html("숫자만 입력하세요");
			}else{
				$("#chkHp").val("N");
				$("#message6").html("휴대폰번호를 입력하세요");
			}
		});
		
		$("#bt_register").click(function(event){
			if($("#chkId").val()=="N"){
				alert("아이디를 확인해 주세요");
				$("#userid").focus();
				return false;
			}else if($("#nick").val()=="N"){
				alert("닉네임을 확인해 주세요");
				$("#nickName").focus();
				return false;
			}else if($("#chkPw").val()=="N"){
				alert("비밀번호를 확인해 주세요");
				$("#pwd").focus();
				return false;
			}else if($("#chkName").val()=="N"){
				alert("이름을 확인해 주세요");
				$("#userName").focus();
				return false;
			}else if($("#chkEmail").val()=="N"){
				alert("이메일을 확인해 주세요");
				$("#email1").focus();
				return false;
			}else if($("#chkBirth").val()=="N"){
				alert("생일을 확인해 주세요");
				$("#b_yy").focus();
				return false;
			}else if($("#chkHp").val()=="N"){
				alert("휴대폰 번호를 확인해 주세요");
				$("#hp1").focus();
				return false;
			}
			var yy = $("#b_yy").val();
	        if($("#b_mm").val().length<2){
	           var mm="0"+$("#b_mm").val();
	        }else{
	           var mm=$("#b_mm").val();
	        }
	        if($("#b_dd").val().length<2){
	           var dd="0"+$("#b_dd").val();
	        }else{
	           var dd=$("#b_dd").val();
	        }
	        
	        $("#birth").val(yy+"-"+mm+"-"+dd);
		});
		
});//document.ready



function validate_userid(userid){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userid);		
	    /*
	   	정규식  /^[a-zA-Z0-9_]+$/g
		a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 
		숫자나 _로 시작하거나 끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 
		그 이상 반복된다는 의미
	    */
}
	
function validate_hp(hp){
	var pattern = new RegExp(/^[0-9]*$/g);
	return pattern.test(hp);
	/*  정규식  /^[0-9]*$/g
	0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
	(^는 시작, $는 끝을 의미)
	닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복  */
}