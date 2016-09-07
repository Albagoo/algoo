<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
   href="<c:url value='../css/mainstyle.css'/>">
<script type="text/javascript"
   src="<c:url value='../js/paging.js'/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도로명 주소 검색</title>
<style type="text/css">
.box2 {
   width: 440px;
}

#divZip1,#divCount {
   margin: 10px 0;
}

.divPage {
   margin: 5px;
   text-align: center;
}
.divPage
</style>
<script type="text/javascript"
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>">
</script>
<script type="text/javascript">
   var totalCount=0;

   $(document).ready(function(){
      $("#dong").focus();
      
      $("#frmZip").submit(function() {
          if($("#dong").val().length<1){
            alert("지역명을 입력하세요");
            $("#dong").focus();
            return false;
          }
          
          send(1);
          
          event.preventDefault();
      });
      
      $(".box2 tbody tr")
         .hover(function() {
            $(this).css("background","skyblue")
               .css("cursor","pointer");
         }, function() {
            $(this).css("background","");
      });
   });
   
   
   function send(curPage) {
       $("#currentPage").val(curPage);
       $.ajax({
        url:"<c:url value='/zipcode/getAddrApi.ag'/>"     // 고객사 API 호출할 Controller URL
            ,type:"post"
            ,data:$("#frmZip").serialize()                       // 요청 변수 설정
            ,dataType:"xml"                                    // 데이터 결과 : XML
            ,success:function(xmlStr){                         // xmlStr : 주소 검색 결과 XML 데이터
               $("#list").html("");                         // 결과 출력 영역 초기화
               var errCode= $(xmlStr).find("errorCode").text();      // 응답코드
               var errDesc= $(xmlStr).find("errorMessage").text();      // 응답메시지
               totalCount= $(xmlStr).find("totalCount").text();      // 전체개수
               if(errCode != "0"){                          // 응답에러시 처리
                  alert(errCode+"="+errDesc);
               }else{
                  if(xmlStr!= null){
                     makeList(xmlStr);                      // 결과 XML 데이터 파싱 및 출력
                  }
               }
            }
            ,error: function(xhr,status, error){
               alert("에러발생");                            // AJAX 호출 에러
            }
       });
     }
   
   function setZipcode(zipcode, address) {
      opener.frmWrite.zipcode.value = zipcode;
      opener.frmWrite.address.value = address;
      self.close();
   }
    
   function makeList(xmlStr){
     
      
      
   
      if(totalCount>0){
         $("#divCount").css("text-align","left")
         .html("도로명 주소 검색 결과("+totalCount+"건)");
      }else{
         $("#divCount").css("text-align","center")
         .html("해당 데이터는 존재하지 않습니다.");
         return;
      }
      
      var tableEl = $("<table class='box2'></table>");
      var trEl= $("<tr></tr>")
        .append("<th style='width:15%'>우편번호</th>"
        +"<th style='width:85%'>도로명 주소</th>");//th를 tr 내부에넣음
      tableEl.append(trEl);
      
      
      // jquery를 이용한 XML 결과 데이터 파싱
      
      $(xmlStr).find("juso").each(function(){
         var zipNo=$(this).find("zipNo").text();
         var roadAddr=$(this).find("roadAddr").text();

         var tdEl1 = $("<td></td>").html(zipNo);
         var anchor = $("<a href='#'></a>")
             .html(roadAddr)
.attr("onclick","setZipcode('"+zipNo+"','"+roadAddr+"')");
             //속성추가
         var tdEl2 = $("<td></td>").html(anchor);
         
         var trEl2=$("<tr></tr>").append(tdEl1)
             .append(tdEl2);
         tableEl.append(trEl2);
      $("#list").append(tableEl);
      
    // 페이징 처리
           $(".divPage").html("");
    
    var p_blockSize=10;
       pagination( $("#currentPage").val(),
            $("#countPerPage").val(),
            p_blockSize, totalCount); 
    
       // 이전 블럭으로 이동 
       if(firstPage>1){
         var img = $("<img alt='이전블럭으로'>")
         .attr("src", "<c:url value='/images/first.JPG'/>");
         
         
         var anchor = $("<a href='#'></a>")
         .html(img).attr("onclick","send("+(firstPage-1)+")");
         
         $(".divPage").append(anchor);
       }
       //페이지 번호 추가 
         //[1][2][3][4][5][6][7][8][9][10]
       for(var i=firstPage;i<=lastPage;i++){
         var sp="";
         if(i==currentPage){
            sp=$("<span style='color: blue; font-weight: bold'></sapn>")
            .html(i);
         }else{
            sp=$("<a href='#' onclick='send("+i+")'></a>")
            .html("["+i+"]");
         }//if
         $(".divPage").append(sp);
       }//for
       //페이지 번호 끝 

       //다음 블럭으로 이동 
        if(lastPage<totalPage){
         var img=$("<img alt='다음블럭으로'>")
         .attr("src", "<c:url value='/images/last.JPG'/>");
         var anchor
       =$("<a href='#' onclick= 'send("+(lastPage+1)+")'></a>")
       .html(img);
          
         $(".divPage").append(anchor);
        }
   }
   )};
</script>
</head>
<body>

   <h2>도로명 주소 검색</h2>
   <p>도로명 주소, 건물명 또는 지번을 입력하세요.</p>
   <p style="color: #006ad5">검색어 예 : 도로명(반포대로 58),
       건물명(독립기념관), 지번(삼성동 25)</p>
   <form name="frmZip" id="frmZip" method="post">
      <input type="hidden" id="currentPage" 
      name="currentPage" value="1"/>          
        <!-- 요청 변수 설정 (현재 페이지) -->
      <input type="hidden" id="countPerPage" 
      name="countPerPage" value="10"/>         
        <!-- 요청 변수 설정 (페이지당 출력 개수) -->
      <input type="hidden" name="confmKey" 
      value="U01TX0FVVEgyMDE2MDcxODIyMDcxMzEzODg5"/>    
       <!-- 요청 변수 설정 (승인키) -->
      <label for="dong">지역명</label> 
      <input type="text" name="keyword" id="dong"
         <%-- value="${param.keyword }"> --%>>

       <input type="submit" value="찾기">
   </form>
   <div id="divCount"></div>    
   <div id=list></div>

   <div class="divPage"></div>
</body>
</html>