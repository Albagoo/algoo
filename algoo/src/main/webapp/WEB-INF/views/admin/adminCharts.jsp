<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>알구 - 관리자페이지</title>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" 
	src="<c:url value='/highcharts/highcharts.js'/>"></script>
</head>
<body>
<script  type="text/javascript">
	var qoduf = new Array(); 
	qoduf[0] = ${rec.jan};
	qoduf[1] = ${rec.feb};
	qoduf[2] = ${rec.mar};
	qoduf[3] = ${rec.apr};
	qoduf[4] = ${rec.may};
	qoduf[5] = ${rec.jun};
	qoduf[6] = ${rec.jul};
	qoduf[7] = ${rec.aug};
	qoduf[8] = ${rec.sep};
	qoduf[9] = ${rec.oct};
	qoduf[10] = ${rec.nov};
	qoduf[11] = ${rec.dec};
	
	var qoduf2 = new Array(); 
	qoduf2[0] = ${resume.jan};
	qoduf2[1] = ${resume.feb};
	qoduf2[2] = ${resume.mar};
	qoduf2[3] = ${resume.apr};
	qoduf2[4] = ${resume.may};
	qoduf2[5] = ${resume.jun};
	qoduf2[6] = ${resume.jul};
	qoduf2[7] = ${resume.aug};
	qoduf2[8] = ${resume.sep};
	qoduf2[9] = ${resume.oct};
	qoduf2[10] = ${resume.nov};
	qoduf2[11] = ${resume.dec};
	
	$(function () {
	    $('#container1').highcharts({
	        chart: {
	            type: 'line'
	        },
	        title: {
	            text: '월별 인재정보  & 채용공고 등록 현황'
	        },
	        subtitle: {
	            text: ''
	        },
	        xAxis: {
	            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
	        },
	        yAxis: {
	            title: {
	                text: '공고 수'
	            }
	        },
	        plotOptions: {
	            line: {
	                dataLabels: {
	                    enabled: true
	                },
	                enableMouseTracking: false
	            }
	        },
	        series: [{
	            name: '채용공고',
	            data: qoduf
	        }, {
	            name: '인재정보',
	            data: qoduf2
	        }]
	    });
	});
</script>
<div id="container1"></div>
</body>
</html>