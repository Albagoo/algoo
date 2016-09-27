<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>


 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.css">
    <!-- <link rel="stylesheet" href="style.css"> -->
 <link rel="stylesheet" type="text/css"
   href="<c:url value='/css/style.css'/>" />   
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Knob/1.2.13/jquery.knob.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript"
   src="<c:url value='/js/app.js'/>"></script>
    <script type="text/javascript"
   src="<c:url value='/js/gifie.js'/>"></script>
    
    
    <!-- <script src="app.js"></script>
    <script src="gifie.js"></script> -->


   <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-45228842-1', 'eirikb.github.io');
      ga('send', 'pageview');
    </script>



    <div class="container">
      <div>
        <h1>gifie</h1>
        <p>Make a gif-selfie with your webcam!</p>
        <p><a href="https://github.com/eirikb/gifie">Source @ GitHub</a></p>
        <h2 id="imgur-upload">Uploading to imgur...</h2>
        <div class="group">
          <label>Quality</label>
          <div class="btn-group" data-toggle="buttons">
            <label class="btn btn-sm btn-default">
              <input id="quality-bad" name="quality" type="radio"> Bad
            </label>
            <label class="btn btn-sm btn-default active">
              <input name="quality" type="radio" checked="checked"> Crap
            </label>
          </div>
        </div>
        <div class="group">
          <label>Length</label>
          <div class="btn-group" data-toggle="buttons">
            <label class="btn btn-sm btn-default active">
              <input id="length-short" name="length" type="radio" checked="checked"> Short
            </label>
            <label class="btn btn-sm btn-default">
              <input name="length" type="radio"> Shorter
            </label>
          </div>
        </div>
        <div class="group">
          <div id="error" class="alert alert-danger">
            gifie does not work with your browser
          </div>
          <button id="record" type="button" class="btn btn-default btn-lg btn-block">
            <span class="glyphicon glyphicon-facetime-video"></span> 
            <span class="info">Record</span>
          </button>
          <input id="countdown" type="text" data-max="200" data-displayInput="false" data-readOnly="true">
          <input id="loader" type="text" data-cursor="true" data-displayInput="false" data-readOnly="true">
          <div>
            <a id="gifLink" target="_blank">
              <img id="gif" class="img-rounded">
            </a>
          </div>
          <div id="imgur">
            <a class="btn btn-default" href="https://api.imgur.com/oauth2/authorize?response_type=token">
              <span class="glyphicon glyphicon-cloud-upload"></span>
              <span class="glyphicon glyphicon-user"></span>
              Post to imgur 
            </a>
            <a class="btn btn-default" href="#">
              <span class="glyphicon glyphicon-cloud-upload"></span>
              Post anonymously to imgur 
            </a>
          </div>

<%@ include file="../inc/simple_bottom.jsp"%>