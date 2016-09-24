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
		
		//남자 여자 누를때 빨간색으로 선택하게 만드는 부분
		$("#manRb").click(function(){
			$("#man").val("남자").prop("checked",this.checked);
			$(".gender_man").css("border","1px solid #E70400");
			$("#manRb").css("color","#E70400");
			
			$("#woman").val("")
			$(".gender_woman").css("border","");
			$("#womanRb").css("color","#999");
		});
		
		$("#womanRb").click(function(){
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
				return false;
			}else{
				if(validate_userid($("#pwd").val()) && 
						$("#pwd").val().length>=0){
						$("#message2").html("비밀번호 중복확인을 하세요");	
				}else{
					//유효성 검사를 통과하지 못한 경우
					$("#message2").html("비밀번호 규칙에 맞지 않습니다");
					$("#chkPw").val("N");
				}
			}	
		});//pwd
		$("#pwd2").keyup(function(){
			if($("#pwd").val()==$("#pwd2").val()){
				$("#message2").html("비밀번호가 일치합니다");	
				$("#chkPw").val("Y");
			}else{
				$("#message2").html("비밀번호가 일치 하지 않습니다");
				$("#chkPw").val("N");
			}
		});//pwd2
		
		$("#bt_register").click(function(event){
			if($("#chkId").val()=="N"){
				alert("아이디를 확인해 주세요");
				$("#userid").focus();
				return false;
			}else if($("#chkPw").val()=="N"){
				alert("비밀번호를 확인해 주세요");
				$("#pwd").focus();
				return false;
			}
			if($("#userName").val().length<1 || $("#userName").val()==""){
				alert("이름을 입력하세요")
				$("#userName").focus();
				return false;
			}/*else if($(':radio[name="gender"]:checked').length < 1){
				alert("성별을 입력하세요");
				return false;
			}*/else if(!validate_hp($("#b_yy").val()) ||
					!validate_hp($("#b_mm").val()) || 
					!validate_hp($("#b_dd").val()) ){
				alert("생년 월일은 숫자여야 합니다");
				$("#b_yy").focus();
				return false;
			}else if($("#b_yy").val().length<1){
				alert("생일 연도를 입력하세요");
				$("#b_yy").focus();
				return false;
			}else if($("#b_mm").val()=='0'){
				alert("월을 입력하세요");
				$("#b_mm").focus();
				return false;
			}else if($("#b_dd").val().length<1){
				alert("일을 입력하세요");
				$("#b_dd").focus();
				return false;
			}else if($("#hp1").val().length<1 || $("#hp2").val().length<1
					|| $("#hp3").val().length<1){
				alert("휴대폰 번호를 입력하세요")
				$("#hp1").focus();
				return false;
			}else if(!validate_hp($("#hp1").val()) ||
					!validate_hp($("#hp2").val()) || 
					!validate_hp($("#hp3").val()) ){
				alert("휴대폰 번호는 숫자여야 합니다");
				$("#hp1").focus();
				return false;
			}else if(!validate_hp($("#phone1").val()) ||
					!validate_hp($("#phone2").val()) || 
					!validate_hp($("#phone3").val())){
				alert("전화번호는 숫자여야 합니다");
				$("#phone2").focus();
				return false;
			}else if(!validate_hp($("#fax1").val()) ||
					!validate_hp($("#fax2").val()) || 
					!validate_hp($("#fax3").val())){
				alert("FAX 번호는 숫자여야 합니다");
				$("#fax2").focus();
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
	}
	
	function validate_hp(hp){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(hp);
	}