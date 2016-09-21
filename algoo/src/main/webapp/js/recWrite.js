/**
 * 
 */

$(document).ready(function(){
	
	
	$("#weekCal").click(function() {
		var date = new Date();
		var str= $.getDate(date);
		$.setEndDate('d',6,str);
		
	});
	
	$("#monthCal").click(function() {
		var date = new Date();
		var str= $.getDate(date);
		$.setEndDate('m',1,str);
		$.setEndDate('d',-1,str);
		
	});
	$("#completeCal").click(function() {
		 $("input[name='recruitDeadline']").val("3000-01-01");
		 $("input[name='recruitDeadlineView']").val("채용시까지");
	});
	
	
	
	$.setEndDate=function(type,term,today){
	     //종료일에 해당하는 날짜 구하기
	     var str =today.split("-"); //2016-09-13
	     var resDate =new Date(str[0],str[1]-1,str[2]);
	                       //=> new Date(2016 , 8, 13)
	     if(type=='d'){
	       resDate.setDate(resDate.getDate()+term);
	     }else if(type=='m'){
	       resDate.setMonth(resDate.getMonth()+term);
	     }
	     str=$.getDate(resDate);                 
	     $("input[name='recruitDeadline']").val(str);
	     $("input[name='recruitDeadlineView']").val(str);
	  }
	
	$.getDate =function(date){
	     var str= date.getFullYear()+"-"
	        + $.findDate(date.getMonth()+1)+"-"
	        + $.findDate(date.getDate());
	     return str;
	}
	$.findDate=function(str){
	     str2=str;
	     if(str<10){
	        str2="0"+str;
	     }
	     return str2;
	  }
	
	//연령무관, 지원양식 
	setAges();
	setForms();
	$("input[name='age']").click(function() {
		setAges();
	});
	$("#recForm").click(function() {
		setForms();
	});
	//최초 서비스 적용버튼 숨기기
	$("#submitBt").hide();
	//CK에디터 적용하기
	CKEDITOR.replace('content', {
		uiColor : '#FFFFFF'
	});
	

	
    //이메일보여주기
    $("#email3").css("visibility","hidden");
    
       $("#email2").change(function(){
          if($("#email2").val()=="etc"){
             $("#email3").css("visibility","visible");
             $("#email3").focus();
             $("#email3").val("");
          }else{
             $("#email3").css("visibility","hidden");
          }
       });//change
       
	
});
		
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

function setAges() {
	if ($("#donAge").is(":checked")) {
		//연령무관시 체크박스 비활성화
		$("#oldAge").attr('disabled', true);
		$("#housewife").attr('disabled', true);
		$("#youngAge").attr('disabled', true);
	} else {
		$("#oldAge").attr('disabled', false);
		$("#housewife").attr('disabled', false);
		$("#youngAge").attr('disabled', false);
		$("#oldAge").attr('checked', false);
		$("#housewife").attr('checked', false);
		$("#youngAge").attr('checked', false);
	}//if
}

function setForms() {
	if ($("#recForm").is(":checked")) {
		//자사지원 체크박스 선택시 활성화
		$("#FormF").attr('disabled', false);
		$("#FormS").attr('disabled', false);
		$("#FormF").attr('checked', true);
	} else {
		$("#FormF").attr('checked', false);
		$("#FormS").attr('checked', false);
		$("#FormF").attr('disabled', true);
		$("#FormS").attr('disabled', true);
	}//if
}