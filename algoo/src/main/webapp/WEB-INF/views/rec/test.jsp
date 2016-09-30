<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- <%@ include file="../inc/simple_top.jsp"%> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <script type="text/javascript"
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script> --%>

<title>이미지 업로더 (imgur API v3) :: 아키버드의 블로그</title>
<![if !IE]>
<link href='http://fonts.googleapis.com/css?family=Open+Sans%3A400%2C300%2C300italic%2C400italic%2C700&subset=latin%2Clatin-ext%2Ccyrillic&ver=3.5.1' rel='stylesheet' type='text/css'>
<![endif]>
<link href="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/style.css?_T_=1463288566" rel="stylesheet" type="text/css" />
<link rel="alternate" type="application/rss+xml" title="아키버드의 블로그" href="http://rrss.tistory.com/rss" />
<link rel="shortcut icon" href="/favicon.ico" />

<link rel="stylesheet" href="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/bootstrap.css" /> 
<!--[if lt IE 8]>
<link type="text/css" rel="stylesheet" href="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/ie.css" />
<![endif]-->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- <script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-2952373429063804",
    enable_page_level_ads: true
  }); -->
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
<script src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/clipboard.min.js" type="text/javascript"></script> 
<script src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/jquery.noty.js" type="text/javascript"></script>
<script src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/default.js" type="text/javascript"></script>
<script src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/bottomRight.js" type="text/javascript"></script>
<script src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/dough-script-0.2.0.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/plugins/A_ShareEntryWithSNS/css/shareEntryWithSNS.css"/>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/plugins/A_ShareEntryWithSNS/script/shareEntryWithSNS.js"></script>

<link rel="stylesheet" type="text/css" href="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/plugins/TistoryProfileLayer/style.css" />
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/plugins/TistoryProfileLayer/profile.js"></script>
   <style type="text/css">
      .another_category { border: 1px solid #E5E5E5; padding: 10px 10px 5px; margin:10px 0; clear: both; }
      .another_category h4 { font-size: 12px !important; margin: 0 !important; border-bottom: 1px solid #E5E5E5 !important; padding: 2px 0 6px !important; }
      .another_category h4 a { font-weight: bold !important; }
      .another_category table { table-layout: fixed; border-collapse: collapse; width: 100% !important; margin-top: 10px !important; }
      * html .another_category table { width: auto !important; }
      *:first-child+html .another_category table { width: auto !important; }
      .another_category th, .another_category td { padding: 0 0 4px !important; }
      .another_category th { text-align: left; font-size: 12px !important; font-weight: normal;  word-break: break-all; overflow: hidden; line-height: 1.5; }
      .another_category td { text-align: right; width: 80px; font-size: 11px; }
      .another_category th a { font-weight: normal; text-decoration: none; border: none !important; }
      .another_category th a.current{ font-weight: bold; text-decoration: none !important; border-bottom: 1px solid !important; }
      .another_category th span { font-weight: normal; text-decoration: none; font: 10px Tahoma, Sans-serif; border: none !important; }

      .another_category_color_gray, .another_category_color_gray h4 { border-color: #E5E5E5 !important; }
      .another_category_color_gray * { color: #909090 !important; }
      .another_category_color_gray th a.current{border-color:#909090 !important;}
      .another_category_color_gray h4, .another_category_color_gray h4 a { color: #737373 !important; }


      .another_category_color_red, .another_category_color_red h4 { border-color: #F6D4D3 !important;  }
      .another_category_color_red * { color: #E86869 !important; }
      .another_category_color_red th a.current{border-color:#E86869 !important;}
      .another_category_color_red h4, .another_category_color_red h4 a { color: #ED0908 !important; }


      .another_category_color_green, .another_category_color_green h4 { border-color: #CCE7C8 !important; }
      .another_category_color_green * { color: #64C05B !important; }
      .another_category_color_green th a.current{border-color:#64C05B !important;}
      .another_category_color_green h4, .another_category_color_green h4 a { color: #3EA731 !important; }


      .another_category_color_blue, .another_category_color_blue h4 { border-color: #C8DAF2 !important; }
      .another_category_color_blue * { color: #477FD6 !important; }
      .another_category_color_blue th a.current{border-color:#477FD6 !important;}
      .another_category_color_blue h4, .another_category_color_blue h4 a { color: #1960CA !important; }


      .another_category_color_violet, .another_category_color_violet h4 { border-color: #E1CEEC !important;  }
      .another_category_color_violet * { color:#9D64C5 !important; }
      .another_category_color_violet th a.current{border-color:#9D64C5 !important;}
      .another_category_color_violet h4, .another_category_color_violet h4 a { color: #7E2CB5 !important; }
   </style>
<script type="text/javascript">
//<![CDATA[
var servicePath = "";
var blogURL = "";
//]]>
</script>
<!-- <script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/lib/jigu/jigu-latest.min.js"></script> -->
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/T.js"></script>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/EAF2.js"></script>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/common.js"></script>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/gallery.js"></script>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/flash.js"></script>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/sha256.js"></script>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/md5.min.js"></script>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/swfobject.js"></script>

<link rel="stylesheet" type="text/css" href="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/style/dialog.css" />
<link rel="stylesheet" type="text/css" href="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/style/menubar.css"/><style type="text/css">.tt_article_useless_p_margin p {padding-top:0 !important;padding-bottom:0 !important;margin-top:0 !important;margin-bottom:0 !important;}</style><meta name="referrer" content="always"><link rel="shortcut icon" href="http://i1.daumcdn.net/cfs.tistory/static/top/favicon_0630.ico"/><meta name="description" content="Upload (Drag &amp; Drop Here↓) Img HTML tag">

<!-- BEGIN OPENGRAPH -->
<link rel="canonical" href="http://rrss.tistory.com/13" /><meta property="og:type" content="article"><meta property="og:url" content="http://rrss.tistory.com/13" ><meta property="og:site_name" content="아키버드의 블로그" ><meta property="og:title" content="이미지 업로더 (imgur API v3)" ><meta name="by" content="아키버드" ><meta property="og:description" content="Upload (Drag &amp; Drop Here↓) Img HTML tag" ><meta property="og:image" content="http://cfile9.uf.tistory.com/image/2176203E53FC211D1199FD" >
<!-- END OPENGRAPH -->



<!-- BEGIN TWITTERCARD -->
<meta name="twitter:card" content="summary_large_image"><meta name="twitter:site" content="@TISTORY"><meta name="twitter:title" content="이미지 업로더 (imgur API v3)" ><meta name="twitter:description" content="Upload (Drag &amp; Drop Here↓) Img HTML tag" ><meta property="twitter:image" content="http://cfile9.uf.tistory.com/image/2176203E53FC211D1199FD" >
<!-- END TWITTERCARD -->



<!-- BEGIN DAUMAPP -->
<meta property="dg:plink" content="http://rrss.tistory.com/13" ><meta name="plink" content="http://rrss.tistory.com/13" ><meta name="title" content="이미지 업로더 (imgur API v3)" ><meta name="article:media_name" content="아키버드의 블로그" ><meta property="article:mobile_url" content="http://rrss.tistory.com/m/13" ><meta property="article:pc_url" content="http://rrss.tistory.com/13" ><meta property="article:mobile_view_url" content="http://rrss.tistory.com/m/13" ><meta property="article:pc_view_url" content="http://rrss.tistory.com/13" ><meta property="article:pc_service_home" content="http://www.tistory.com" ><meta property="article:mobile_service_home" content="http://www.tistory.com/m" ><meta property="article:txid" content="1538088_13" /><meta property="article:published_time" content="20131026232137" ><meta property="og:regDate" content="20131026232137" ><meta property="article:modified_time" content="20160515105151" >
<!-- END DAUMAPP -->



<!-- BEGIN STRUCTURED_DATA -->
<script type="application/ld+json">{"@context":"http://schema.org", "@type":"BlogPosting","mainEntityOfPage":{"@id": "http://rrss.tistory.com/13"},"url":"http://rrss.tistory.com/13","headline":"이미지 업로더 (imgur API v3)","description":"Upload (Drag &amp; Drop Here↓) Img HTML tag","author":{"@type":"Person","name":"아키버드"},"image":{"@type":"ImageObject","url":"http://cfile9.uf.tistory.com/image/2176203E53FC211D1199FD","width":"800px","height":"800px"},"datePublished":"20131026T23:21:37+09:00","dateModified":"20160515T10:51:51+09:00","publisher":{"@type":"Organization","name":"TISTORY","logo":{"@type":"ImageObject","url":"https://t1.daumcdn.net/cssjs/icon/557567EA016E200001","width":"800px","height":"800px"}}}</script>
<!-- END STRUCTURED_DATA -->

<link rel="apple-touch-icon" href="http://i1.daumcdn.net/thumb/C180x180/?fname=http%3A%2F%2Fcfile5.uf.tistory.com%2Fimage%2F241F093D5701E7380371B5">
<link rel="apple-touch-icon" sizes="76x76" href="http://i1.daumcdn.net/thumb/C76x76/?fname=http%3A%2F%2Fcfile5.uf.tistory.com%2Fimage%2F241F093D5701E7380371B5">
<link rel="apple-touch-icon" sizes="120x120" href="http://i1.daumcdn.net/thumb/C120x120/?fname=http%3A%2F%2Fcfile5.uf.tistory.com%2Fimage%2F241F093D5701E7380371B5">
<link rel="apple-touch-icon" sizes="152x152" href="http://i1.daumcdn.net/thumb/C152x152/?fname=http%3A%2F%2Fcfile5.uf.tistory.com%2Fimage%2F241F093D5701E7380371B5"></head>
<body>

<script type="text/javascript">
   T.config = {"TOP_SSL_URL":"https:\/\/www.tistory.com","PREVIEW":false,"ROLE":"guest","PREV_PAGE":"\/17","NEXT_PAGE":"\/11","BLOG":{"isDormancy":false,"title":"\uc544\ud0a4\ubc84\ub4dc\uc758 \ube14\ub85c\uadf8"},"NEED_COMMENT_LOGIN":false,"COMMENT_LOGIN_CONFIRM_MESSAGE":"","LOGIN_URL":"https:\/\/www.tistory.com\/login\/?requestURI=http%3A%2F%2Frrss.tistory.com%2F13","TRACKBACK_COPY_URL":"\/\/s1.daumcdn.net\/cfs.tistory\/resource\/8534\/blog\/script\/copyTrackback","TRACKBACK_BUTTON":"whiteButton","DEFAULT_URL":"http:\/\/rrss.tistory.com","USER":{"name":null,"homepage":null}};
</script>

<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/resource/8534/blog/script/blog/common.js"></script>
<div style="margin:0; padding:0; border:none; background:none; float:none; clear:none; z-index:0"></div>
<!-- 

   <div id="top">
      <div class="wrap tw">
         <h1 id="logo"><a href="/" title="아키버드의 블로그">아키버드의 블로그</a></h1>
         <div  class="trb">
            <ul>  
               li>
                  <a href="/guestbook">GUEST</a>
               </li>
               <li>
                  <a href="/gateway/entry/post">WRITE</a>
               </li>
               <li>
                  <a href="/admin">ADMIN</a>
               </li
               <li class="last">
               
               <form class="searchform cf">
                  <input id="searchInput" required type="text" name="search" value="" onkeypress="if (event.keyCode == 13) { try{window.location.href='/search/' + looseURIEncode(document.getElementsByName('search')[0].value);document.getElementsByName('search')[0].value = ''; return false;}catch(e){} }" />
                  <button onclick="try{window.location.href='/search/' + looseURIEncode(document.getElementsByName('search')[0].value);document.getElementsByName('search')[0].value = ''; return false;}catch(e){}"><span class="glyphicon glyphicon-search"></span></button>
               </form>
               
               </li>
            </ul>
         </div>
      </div>
   </div>

   <div class="tab_line">
      <div class="wrap">
      <ul class="tt_category">
   <li class="">
      <a class="link_tit" href="/category">
         분류 전체보기                    <span class="c_cnt">(14)</span>
         
               </a>

            <ul class="category_list">
                     <li class="">
               <a class="link_item" href="/category/구글드라이브">
                  구글드라이브                                       <span class="c_cnt">(3)</span>
                  
                                 </a>

               
            </li>
                     <li class="">
               <a class="link_item" href="/category/HTML5">
                  HTML5                                     <span class="c_cnt">(4)</span>
                  
                                 </a>

               
            </li>
                     <li class="">
               <a class="link_item" href="/category/이미지">
                  이미지                                       <span class="c_cnt">(1)</span>
                  
                                 </a>

               
            </li>
                     <li class="">
               <a class="link_item" href="/category/북마클릿">
                  북마클릿                                      <span class="c_cnt">(3)</span>
                  
                                 </a>

               
            </li>
                     <li class="">
               <a class="link_item" href="/category/ETC">
                  ETC                                       <span class="c_cnt">(3)</span>
                  
                                 </a>

               
            </li>
               </ul>
         </li>
</ul>

      </div>
   </div>
   <div id="container">
      <div class="res_div"><select class="res_tab" onchange="if (this.value) window.location.href=this.value"><option>카테고리</option></select></div>
   <div class="wrap cw">
   
      <div id="content">
      
      
 -->
   

   

   

   

   

<!--    
   <div class="entry">
      <div class="tdiv">
      <h2><a href="/13">이미지 업로더 (imgur API v3)</a></h2>
      <div class="ect"><a id="category" href="/category/%EC%9D%B4%EB%AF%B8%EC%A7%80"><span class='glyphicon glyphicon-bookmark'></span>이미지</a><span><span class='glyphicon glyphicon-time'></span>2013.10.26 23:21</span>
      </div>
      </div>

      <ul id="pnn" class="dno">
        <li class="first"><a onclick="cw_open('/13#yview')"><span class="glyphicon glyphicon-new-window"></span> 뷰어</a></li> 
        <li class="commtent"><a href="#ycmt"><span class="glyphicon glyphicon-comment"></span> 댓글로</a></li> 
        <li class="prev"><a id="a_prev" ><span class="glyphicon glyphicon-chevron-left"></span> 이전글</a></li>  
        <li class="next" ><a id="a_next" >다음글 <span class="glyphicon glyphicon-chevron-right"></span></a></li>
      </ul>

      <div class="article">
         <p id="ddd" style="padding:20px 0px;">
         <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
rrss 반응형
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2952373429063804"
     data-ad-slot="3868640680"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
         </p>
         article st
         <div class="tt_article_useless_p_margin"><p style="text-align: left; clear: none; float: none;"><span class="imageblock" style="display:inline-block;width:0px;width: 0px; height: 0px;;height:auto;max-width:100%"><img src="http://cfile9.uf.tistory.com/image/2176203E53FC211D1199FD" style="cursor: pointer;max-width:100%;height:auto" onclick="open_img('http://cfile9.uf.tistory.com/original/2176203E53FC211D1199FD')" width="0" height="0" filename="3.jpg" filemime="image/jpeg" style="width: 0px; height: 0px;" /></span></p>
-->   
      
<style>
   #box.loading {background:url(http://cfile29.uf.tistory.com/image/242AD43E526BCE2A27BB0A) no-repeat center center;}.hero-unit{padding:40px 0;width:600px;border:1px solid #b8c9c2;background:#f7f7f7}.hero-unit h1{margin-bottom:0;font-size:60px;line-height:1;letter-spacing:-1px;color:inherit}.hero-unit p{font-size:18px;font-weight:200;line-height:27px;color:inherit}.pull-right{float:right}.pull-left{float:left}.hide{display:none}.show{display:block}.invisible{visibility:hidden}#preview{padding:10px 0;width:600px}.tip_box {position:absolute;padding:1em;_background:#333;*background:#333;background:rgba(0,0,0,0.6);-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color:#fff;border-radius:1.5em 1.5em 1.5em 0;box-shadow:0.25em 0.25em 1em rgba(0,0,0,0.25);text-shadow:0 -1px 0 rgba(0,0,0,0.6);}
</style>
<script>
var _0x17a7=["\x23\x62\x6F\x78","\x62\x61\x63\x6B\x67\x72\x6F\x75\x6E\x64\x2D\x63\x6F\x6C\x6F\x72","\x23\x65\x65\x65","\x63\x73\x73","\x23\x36\x36\x36","\x64\x72\x61\x67\x45\x6E\x74\x65\x72","\x6C\x6F\x67","\x64\x72\x61\x67\x4C\x65\x61\x76\x65","\x64\x72\x61\x67\x45\x6E\x64","\x64\x72\x61\x67\x4F\x76\x65\x72","\x64\x72\x61\x67","\x70\x72\x65\x76\x65\x6E\x74\x44\x65\x66\x61\x75\x6C\x74","\x64\x72\x6F\x70","\x6F\x72\x69\x67\x69\x6E\x61\x6C\x45\x76\x65\x6E\x74","\x66\x69\x6C\x65\x73","\x64\x61\x74\x61\x54\x72\x61\x6E\x73\x66\x65\x72","\x6C\x65\x6E\x67\x74\x68","\x65\x61\x63\x68","\x6C\x6F\x61\x64\x69\x6E\x67","\x61\x64\x64\x43\x6C\x61\x73\x73","\x72\x65\x61\x64\x41\x73\x44\x61\x74\x61\x55\x52\x4C","\x6C\x6F\x61\x64\x65\x6E\x64","\x72\x65\x73\x75\x6C\x74","\x74\x61\x72\x67\x65\x74","\x6F\x6E","\x64\x72\x61\x67\x6F\x76\x65\x72","\x64\x72\x61\x67\x6C\x65\x61\x76\x65","\x64\x72\x61\x67\x65\x6E\x74\x65\x72","\x64\x72\x61\x67\x65\x6E\x64","\x2C","\x69\x6E\x64\x65\x78\x4F\x66","\x73\x75\x62\x73\x74\x72","\x23\x70\x72\x65\x76\x69\x65\x77","\x68\x74\x74\x70\x3A\x2F\x2F","\x73\x70\x6C\x69\x74","\x2E\x74\x69\x73\x74\x6F\x72\x79\x2E\x63\x6F\x6D","\x68\x72\x65\x66","\x72\x72\x73\x73","\x68\x74\x74\x70\x73\x3A\x2F\x2F\x61\x70\x69\x2E\x69\x6D\x67\x75\x72\x2E\x63\x6F\x6D\x2F\x33\x2F\x75\x70\x6C\x6F\x61\x64\x2E\x6A\x73\x6F\x6E","\x43\x6C\x69\x65\x6E\x74\x2D\x49\x44\x20\x64\x33\x62\x66\x39\x66\x33\x30\x30\x62\x62\x31\x62\x66\x35","\x50\x4F\x53\x54","\x64\x61\x74\x61","\x3C\x61\x20\x68\x72\x65\x66\x3D\x22","\x6C\x69\x6E\x6B","\x22\x20\x74\x61\x72\x67\x65\x74\x3D\x22\x5F\x62\x6C\x61\x6E\x6B\x22\x3E\x3C\x69\x6D\x67\x20\x73\x72\x63\x3D\x22\x68\x74\x74\x70\x3A\x2F\x2F\x69\x2E\x69\x6D\x67\x75\x72\x2E\x63\x6F\x6D\x2F","\x69\x64","\x73\x2E\x6A\x70\x67\x22\x2F\x3E\x3C\x2F\x61\x3E","\x61\x70\x70\x65\x6E\x64","\x76\x61\x6C\x75\x65","\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64","\x3C\x69\x6D\x67\x20\x73\x72\x63\x3D\x22","\x22\x2F\x3E","\x72\x65\x6D\x6F\x76\x65\x43\x6C\x61\x73\x73","\uC5C5\uB85C\uB4DC\x20\uC2E4\uD328","\x61\x6A\x61\x78","\uC62C\uBC14\uB978\x20\uC811\uADFC\uC774\x20\uC544\uB2D9\uB2C8\uB2E4\x2E","\uBCF5\uC0AC\x20\uC644\uB8CC\x21","\x62\x69\x6E\x64","\x23\x72\x65\x73\x75\x6C\x74","\x72\x65\x61\x64\x79"];$(function(){var _0xf556x1=$(_0x17a7[0]);function _0xf556x2(){_0xf556x1[_0x17a7[3]](_0x17a7[1],_0x17a7[2])}function _0xf556x3(){_0xf556x1[_0x17a7[3]](_0x17a7[1],_0x17a7[4])}function _0xf556x4(){console[_0x17a7[6]](_0x17a7[5]);return false}function _0xf556x5(){console[_0x17a7[6]](_0x17a7[7]);_0xf556x2();return false}function _0xf556x6(){console[_0x17a7[6]](_0x17a7[8]);return false}function _0xf556x7(){console[_0x17a7[6]](_0x17a7[9]);_0xf556x3();return false}function _0xf556x8(){console[_0x17a7[6]](_0x17a7[10]);return false}function _0xf556x9(_0xf556xa){_0xf556xa[_0x17a7[11]]();console[_0x17a7[6]](_0x17a7[12]);_0xf556x2();var _0xf556xb=_0xf556xa[_0x17a7[13]];var _0xf556xc=_0xf556xb[_0x17a7[15]][_0x17a7[14]];var _0xf556xd=_0xf556xc[_0x17a7[16]];console[_0x17a7[6]](_0xf556xc);for(var _0xf556xe in _0xf556xc){if(_0xf556xd>0){_0xf556xc[_0x17a7[17]];_0xf556x1[_0x17a7[19]](_0x17a7[18]);var _0xf556xf= new FileReader();_0xf556xc;_0xf556xf[_0x17a7[20]](_0xf556xc[_0xf556xe]);$(_0xf556xf)[_0x17a7[24]](_0x17a7[21],function(_0xf556xa){var _0xf556x10=_0xf556xa[_0x17a7[23]][_0x17a7[22]];_0xf556x11(_0xf556x10)})}};return false}_0xf556x1[_0x17a7[24]](_0x17a7[25],_0xf556x7);_0xf556x1[_0x17a7[24]](_0x17a7[26],_0xf556x5);_0xf556x1[_0x17a7[24]](_0x17a7[27],_0xf556x4);_0xf556x1[_0x17a7[24]](_0x17a7[28],_0xf556x6);_0xf556x1[_0x17a7[24]](_0x17a7[12],_0xf556x9);_0xf556x1[_0x17a7[24]](_0x17a7[10],_0xf556x9);function _0xf556x11(_0xf556x10){var _0xf556x12=_0xf556x10[_0x17a7[31]](_0xf556x10[_0x17a7[30]](_0x17a7[29])+1,_0xf556x10[_0x17a7[16]]);var _0xf556x13=$(_0x17a7[32]);console[_0x17a7[6]](_0xf556x12);if(location[_0x17a7[36]][_0x17a7[34]](_0x17a7[35])[0][_0x17a7[34]](_0x17a7[33])[1]==_0x17a7[37]){$[_0x17a7[54]]({url:_0x17a7[38],headers:{"\x41\x75\x74\x68\x6F\x72\x69\x7A\x61\x74\x69\x6F\x6E":_0x17a7[39]},type:_0x17a7[40],data:_0xf556x12,success:function(_0xf556x14){var _0xf556x15=_0xf556x14[_0x17a7[41]];_0xf556x13[_0x17a7[47]](_0x17a7[42]+_0xf556x15[_0x17a7[43]]+_0x17a7[44]+_0xf556x15[_0x17a7[45]]+_0x17a7[46]);document[_0x17a7[49]](_0x17a7[22])[_0x17a7[48]]+=_0x17a7[50]+_0xf556x15[_0x17a7[43]]+_0x17a7[51];_0xf556x1[_0x17a7[52]](_0x17a7[18])},error:function(){_0xf556x1[_0x17a7[52]](_0x17a7[18]);generate(_0x17a7[53])}})}else {generate(_0x17a7[55])}}});$(document)[_0x17a7[59]](function(){$(_0x17a7[58])[_0x17a7[57]]({copy:function(){generate(_0x17a7[56])}})})
</script><p>
<b><span data-tip-event="mouseover" title="imgur 서버에 익명으로 업로드 됩니다" style="cursor:help;">Upload (Drag &amp; Drop Here↓)</span></b><br />
</p>
<p></p>
<div id="box" data-tip-event="mouseover" title="이 영역에 파일을 끌어다 놓으세요." class="hero-unit"></div><p>
<br /><b><span data-tip-event="mouseover" title="아래의 코드를 복사하여 게시판 HTML에 '붙여넣기' 하세요." style="cursor:help;">Img&nbsp;HTML tag</span></b><br />
</p><textarea class="copyTrigger" data-clipboard-target="#result" id="result" style="width:600px;height:100px;border:1px solid #b8c9c2;background:#f7f7f7;padding:0" readonly="readonly" onclick="this.select();"></textarea>
<div id="preview"></div><div style="width:100%;margin-top:30px;clear:both;height:30px"><div style="width:31px;float:left;"><a href="/toolbar/popup/abuseReport/?entryId=13" onclick="window.open(this.href, 'tistoryThisBlogPopup', 'width=550, height=510, toolbar=no, menubar=no, status=no, scrollbars=no'); return false;"><img style="border:0" src="//t1.daumcdn.net/tistory_admin/static/ico/ico_spam_report.png" alt="신고"></a></div></div><div class="tt-plugin tt-share-entry-with-sns tt-sns-icon-alignment-right tt-sns-icon-size-big">
   
   <!--  <div class="tt-sns-wrap" id="ttSnsWrap-13">
      <ul class="tt-sns-service-default">
         <li class="tt-sns-service-kakaostory"><a href="javascript:;" onclick="ShareEntryWithSNS.share('kakaostory', '13', '%EC%9D%B4%EB%AF%B8%EC%A7%80%20%EC%97%85%EB%A1%9C%EB%8D%94%20%28imgur%20API%20v3%29');">카카오스토리</a></li>
         <li class="tt-sns-service-twitter"><a href="javascript:;" onclick="ShareEntryWithSNS.share('twitter', '13', '%EC%9D%B4%EB%AF%B8%EC%A7%80%20%EC%97%85%EB%A1%9C%EB%8D%94%20%28imgur%20API%20v3%29');">트위터</a></li>
         <li class="tt-sns-service-facebook"><a href="javascript:;" onclick="ShareEntryWithSNS.share('facebook', '13', '%EC%9D%B4%EB%AF%B8%EC%A7%80%20%EC%97%85%EB%A1%9C%EB%8D%94%20%28imgur%20API%20v3%29');">페이스북</a></li>
      </ul>
   </div>
   <div class="tt-sns-clear"></div>
</div>
<div class="another_category another_category_color_gray">
<h4>'<a href="/category/이미지">이미지</a>' 카테고리의 다른 글</h4>
<table>
<tr>
<th>
<a href="http://rrss.tistory.com/13"  class ="current" >이미지 업로더 (imgur API v3)</a>&nbsp;&nbsp;<span>(2)</span>
</th>
<td>
2013.10.26</td>
</tr>
</table></div></div>
         article ed
         <p style="padding:20px 0px;">
         <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
rrss 반응형
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2952373429063804"
     data-ad-slot="3868640680"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
         </p>
      
         <div class="tagTrail">
            <span class="glyphicon glyphicon glyphicon-tags" style="margin-right:5px"></span> <a href="/tag/API"  rel="tag">API</a>,
<a href="/tag/imgur"  rel="tag">imgur</a>,
<a href="/tag/업로드"  rel="tag">업로드</a>,
<a href="/tag/이미지"  rel="tag">이미지</a>,
<a href="/tag/태그%20생성기"  rel="tag">태그 생성기</a>
         </div>
      
      </div>
      
      <h1 id="ycmt" class="hx cmt"><a href="javascript:void(0)" onclick="toggleLayerForEntry('13', 'comment'); return false"><span id="commentCount13">Comment <span class="cnt">+2</span></span></a></h1>
      <div id="entry13Comment" style="display:none"></div>
      entry close

   

   
   <div id="paging" class="yzpaging">
      <a href='/17' class="" id="prevPage"><span>‹</span> Prev</a>
      
      <a href='/30' class="num"> <span>1</span></a>
       <span class="interword">...</span> 
      <a href='/22' class="num"> <span>7</span></a>
      
      <a href='/21' class="num"> <span>8</span></a>
      
      <a href='/19' class="num"> <span>9</span></a>
      
      <a href='/17' class="num"> <span>10</span></a>
      
      <a  class="num"> <span class="selected" >11</span></a>
      
      <a href='/11' class="num"> <span>12</span></a>
      
      <a href='/10' class="num"> <span>13</span></a>
      
      <a href='/3' class="num"> <span>14</span></a>
      
      <a href='/11' class="" id="nextPage">Next <span>›</span></a>
   </div>
   
</div>

</div>

</div>
</div>

   <div class="wrap">
      <div id="sidebar">
         
            최근에 올라온 글
               <div class="section">
               <h2 class="hx">최근에 올라온 글</h2>
                  <ul>
                  
                  <li><a href="/30"> 네이버 카페 로그인 우회, 로그인 없이..</a></li>
                  
                  <li><a href="/29"> QR코드 생성기 / QR코드 만들기</a></li>
                  
                  <li><a href="/28"> 이모티콘, 특수문자 모음 777개</a></li>
                  
                  <li><a href="/27"> 최신가요 TOP100 무료 듣기 사이트</a></li>
                  
                  <li><a href="/25"> HTML5 오디오 태그 생성기</a></li>
                  
                  <li><a href="/23"> Gfycat 동영상 다운로드, 북마클릿</a></li>
                  
                  <li><a href="/22"> 웹 페이지 내 동영상(플짤) 쉽게 저장하..</a></li>
                  
                  <li><a href="/21"> JW Player XML Playlist Downloader</a></li>
                  
                  <li><a href="/19"> HTML5 비디오 태그 생성기</a></li>
                  
                  <li><a href="/17"> gfycat 태그 생성기</a></li>
                  
                  <li><a href="/13"> 이미지 업로더 (imgur API v3)</a></li>
                  
                  <li><a href="/11"> 구글 드라이브 이미지 태그 생성기</a></li>
                  
                  </ul>
               </div>
            
            최근에 달린 댓글
               <div class="section">
               <h2 class="hx">최근에 달린 댓글</h2>
                  <ul>
                  
                  <li><a href="/10#comment11244340"> 구글드라이브 대체는 없는건가요 ㅜㅜ</a> 
                  
                  <li><a href="/10#comment11243838"> 아키버드님은 아니지만.. 구글이 구글 드..</a> 
                  
                  <li><a href="/10#comment11243740"> 항상 감사하게 쓰고있습니다
잘써오고 있..</a> 
                  
                  <li><a href="/10#comment11243306"> 아키버드님 위에분 얘기 처럼 온라인이..</a> 
                  
                  <li><a href="/30#comment11216140"> Gif 녹화를 뭘로하신건지 궁금하네요 엄..</a> 
                  
                  <li><a href="/30#comment11204943"> 안녕하세요~
좋은 정보 감사합니다.

혹..</a> 
                  
                  <li><a href="/29#comment11190844"> 우와 이런건 어떻게 만드시는지 ㄷㄷㄷ..</a> 
                  
                  <li><a href="/19#comment11189650"> 정말 감사합니다 !!!!</a> 
                  
                  <li><a href="/19#comment11186376"> 넵 ㅠㅠㅠ 답변 감사합니다..! 열심히 노..</a> 
                  
                  <li><a href="/19#comment11186093"> 죄송하지만, 제가 예시를 든다고 하더라..</a> 
                  
                  <li><a href="/19#comment11185877"> 제가 자바스크립트에 관해 잘 몰라서요....</a> 
                  
                  <li><a href="/19#comment11185482"> 쉬운 방법으로는 자바스크립트의 pc와 모..</a> 
                  
                  </ul>
               </div>
            
      </div>
   </div>
   <div id="footer">
      <div class="copyright">
         <p><a href="/"> This</a> blog is powered by <a href="http://www.tistory.com/" onclick="window.open(this.href); return false">Tistory</a> / <span class="tistory">designed by <a href="http://www.yongzz.com/tist.php?bbs=skin" target="_blank">yongzz.com</a></span></p>
      </div>
   </div>
</div> -->
<script type="text/javascript">
var _tiq = 'undefined' !== typeof _tiq ? _tiq : []; // Global Variables
_tiq.push(["__setParam", "title", "아키버드의 블로그 :: 이미지 업로더 (imgur API v3)"]);
_tiq.push(["__setParam", "svcdomain", "user.tistory.com"]);
_tiq.push(["__setParam", "category", ""]);
_tiq.push(["__setParam", "articleno", "13"]);
_tiq.push(["__setParam", "plink", "http://rrss.tistory.com/13"]);
_tiq.push(["__setParam", "date", "2013-10-26 23:21:37"]);
_tiq.push(["__setParam", "author", "rrss"]);
_tiq.push(["__setParam", "length", "6426"]);
_tiq.push(["__setParam", "isauthor", "N"]);
_tiq.push(["__setParam", "ishidden", "1"]);
_tiq.push(["__setParam", "comments", "2"]);
_tiq.push(["__setParam", "param1", "0"]);
_tiq.push(["__setParam", "param2", "e"]);
_tiq.push(["__setParam", "param3", ""]);
_tiq.push(["__trackPageview"]);
(function(d) {
   var se = d.createElement('script'); se.type = 'text/javascript'; se.async = true;
   se.src = location.protocol + '//m2.daumcdn.net/tiara/js/td.min.js';
   var s = d.getElementsByTagName('head')[0]; s.appendChild(se);
})(document);
</script>
<!-- <script type="text/javascript">
var __TiaraObj = __TiaraObj || {}; if ('undefined' === typeof __TiaraObj.startTime) { __TiaraObj.startTime = new Date(); }
var addEvent = function (evt, fn) { window.addEventListener ? window.addEventListener(evt, fn, false) : window.attachEvent('on' + evt, fn); };
var ua = navigator.userAgent.toLowerCase(); var isIOS = /iP[ao]d|iPhone/i.test(ua); var contentStat = function() {
_tiq.push(['__content', 't_content', {
"c_id":"1538088_13", 
"c_title":"아키버드의 블로그 :: 이미지 업로더 (imgur API v3)", 
"type":"article", 
"author":"아키버드", 
"author_id":"235409", 
"cp":"rrss", 
"cp_id":"1538088", 
"regdata":"2013-10-26 23:21:37", 
"plink":"http://localhost:9090/algoo/rec/test.ag", 
"media":"pcweb", 
"comment_cnt":2, 
"duration": (new Date()).getTime() - __TiaraObj.startTime.getTime()
}]); };
addEvent(isIOS ? "pagehide" : "beforeunload", contentStat);
</script>
<script type="text/javascript">window.roosevelt_params_queue = window.roosevelt_params_queue || []; window.roosevelt_params_queue.push({channel_id: "dk", channel_label: "tistory"});</script>
<script type="text/javascript" src="//adimg.daumcdn.net/rt/dk_bt/roosevelt_dk_bt.js" async></script><script type="text/javascript">if(window.console!=undefined){setTimeout(console.log.bind(console,"%cTISTORY","font:8em Arial;color:#EC6521;font-weight:bold"),0);setTimeout(console.log.bind(console,"%c  나를 표현하는 블로그","font:2em sans-serif;color:#333;"),0);}</script>      <div id="tistorytoolbarid"
          style="position:absolute;height:20px;top:4px;right:0px;background-color:transparent;background-image:none;z-index:11;">
         <div class="tistorytoolbar tt_menubar_login">
            <div
               class="tt_menubar_whiteBar">
               <div id="ttMenubarInnerWrap" class="tt_menubar_inner">
                  <div class="tt_menubar_bg_toolbar"></div>
                  <h2 style="display:none;">티스토리 툴바</h2>
                  <div class="tt_menubar_mainmenu"><a
                        class="tt_menubar_link_tit tt_menubar_link_tit_daum tt_menubar_link_tit_eng"
                        href="http://www.daum.net/?nil_ref=tistory"
                        target="_blank">Daum</a></div>
                  <div class="tt_menubar_bg_bar"></div>
                  <div class="tt_menubar_mainmenu"><a class="tt_menubar_link_tit tt_menubar_link_tit_eng"
                                             href="http://www.tistory.com">Tistory</a>
                  </div>
                  <div class="tt_menubar_bg_bar"></div>
                  <div class="tt_menubar_logout"><a class="tt_menubar_link_tit"
                                            href="https://www.tistory.com/login">로그인</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      </body>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/jquery.slimscroll.min.js"></script>
<script type="text/javascript">
var ie7 = 0;
</script>
[if lte IE 7]>
<script type="text/javascript">
    ie7 = 1;
</script>
<![endif]
-->
<script>
$(document).ready(function () {
   var $all = $(".tab_line ul li a").eq(0);
   if($all.length > 0){
      $all.parent().find("ul").eq(0).prepend('<li class="on"><a href="/category">'+$all.html()+'</a></li>');
      $all.remove();

      var url = (window.location.href).replace("http://","");

      var uarr = url.split("/");
      var s = false;
      if(uarr.length > 1){
         if(uarr[1] != "category"){
            s = true;
            var tmp = "com"+$("div.ect a#category").attr("href");
            uarr = tmp.split("/");
         }
      }
      
      if(uarr.length > 2 && !s){
         if(uarr[2].length > 0) s = true;
      }
      if(s){
         //uarr[2] = uarr[2].replace(" ","%20");
         //var cate = $('.tab_line ul li a[href*="'+uarr[2]+'"]');
         var cate = $('.tab_line ul li a[href="/category/'+uarr[2]+'"]');
         if(cate.length > 0){
            $(".tab_line ul li.on").removeClass("on");
            cate.addClass("on");
         }
         uarr[2] = decodeURIComponent(uarr[2]);
         cate = $('.tab_line ul li a[href*="'+uarr[2]+'"]');
         if(cate.length > 0){
            $(".tab_line ul li.on").removeClass("on");
            cate.parent().addClass("on");
         }
      }

      $(".tab_line ul li a").mouseenter(function(){
         $(this).parent().find("ul").show();
         if(ie7 == 1){
            $(this).parent().find("ul").css("margin-left",-$(this).parent().width());
         }
      }).mouseleave(function(){
         $(this).parent().find("ul").hide();
      });

      $(".tab_line ul li ul li ul").mouseenter(function(){
         $(this).show();
      }).mouseleave(function(){
         $(this).hide();
      });

      var res_tab = $(".res_tab");
      $(".tab_line a").each(function(i){
         var name = $(this).text();
         var href = $(this).attr("href");
         
         res_tab.append($("<option></option>").attr("value",href).text(name));
      });
   }
});

function fsch(){
 $("#searchBox").toggleClass("dno");
}

$(document).ready(function () {
   var t_href = location.href;
   var t_arr = t_href.split("/");
   var t_last = t_arr[(t_arr.length-1)].split("#");
   if(t_last.length > 1){
      if(t_last[1] == 'yview'){
         $("#container").addClass("yview");
         $("#top").addClass("dno");
         $("#footer").hide();
         $(".tistorytoolbar").hide();
         $(".tab_line").hide();
         $("#sidebar").hide();
         $("#paging a").each(function(i){
            $(this).attr('href',$(this).attr('href')+"#yview");
         });
      }
   }

   var pn = 0;
   var anh = $("a#prevPage").attr("href");
   var anp = $("a#a_prev");
   if(anh != "undefined" && anh != undefined){
      anp.attr("href",anh);
      pn++;
   }else{
      anp.attr("title","이전글이 없습니다");
      anp.html("이전글").addClass("nohr");
   }

   anh = $("a#nextPage").attr("href");
   anp = $("a#a_next");
   if(anh != "undefined" && anh != undefined){
      anp.attr("href",anh);
      pn++;
   }else{
      anp.attr("title","다음글이 없습니다");
      anp.html("다음글").addClass("nohr");
   }

   if(pn > 0){
      $("#pnn").removeClass("dno");
   }
});
 
function cw_open(url){
   width = 1024;
   height = $(window).height();
   var sst = window.open(url,'popwin','top='+((screen.availHeight - height)/2 - 40) +', left='+(screen.availWidth - width)/2+', width='+width+', height='+height+', toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=1');
   if(sst){
   sst.focus();
   }
}
   
$(document).ready(function(){
   $('div#box, div>textarea, div>input:not(input[type="checkbox"])').width('92%');
});

var pp = '<div class="section"><h2 class="hx">인기 글</h2><ul> <li><a href="/10"> 구글드라이브 플짤(동영상) 태그 생성기</a> </li> <li><a href="/11"> 구글드라이브 이미지 태그 생성기</a> </li> <li><a href="/17"> Gfycat 태그 생성기</a> </li> <li><a href="/19"> HTML5 비디오 태그 생성기</a> </li> <li><a href="/25"> HTML5 오디오 태그 생성기</a> </li> <li><a href="/29"> QR CODE 생성기</a> </li> </ul> </div>';
$('#sidebar').append(pp);
   
</script>
<script type="text/javascript">
   var adblock = true;
   if(T.config.USER.name==="아키버드"){
      adblock = false;
   }
</script>
<script type="text/javascript" src="http://cfs.tistory.com/custom/blog/153/1538088/skin/images/ads.js"></script>
<script type="text/javascript">
if(adblock) {
  $('div.article').html('<img src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/abwarn.png"/>');
}
</script>
<script src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/jquery.masonry.min.js"></script>
<script src="//s1.daumcdn.net/cfs.tistory/custom/blog/153/1538088/skin/images/ygaln.js?time=15"></script>
<script>
      var clipboard = new Clipboard('.copyTrigger');  
</script>
[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.3.0/respond.js"></script>
<![endif]>

<%@ include file="../inc/simple_bottom.jsp"%>