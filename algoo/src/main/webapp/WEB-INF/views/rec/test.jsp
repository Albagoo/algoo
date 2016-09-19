<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/simple_top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
   src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/recLayout.css'/>" />
<!-- 파일업로드 -->  
 <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css"> 
   
<script type="text/javascript" src
="<c:url value='../api/scrollup-master/dist/jquery.scrollUp.min.js'/>"></script>
<script type="text/javascript" src
="<c:url value='../api/scrollup-master/src/jquery.scrollUp.js'/>"></script>
<script type="text/javascript" src
="<c:url value='/js/member.js'/>"></script>
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/simpleButton.css'/>" />
<%-- <script src="<c:url value='ckeditor/ckeditor.js'/>"
   type="text/javascript"></script> --%>
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>"
   type="text/css">
<script src="<c:url value='/jquery/jquery-ui.js'/>"
   type="text/javascript"></script>

<script type="text/javascript">
$(function() {

function compress_png($path_to_png_file,$dest_to_path, $max_quality = 90)
{
    if (!file_exists($path_to_png_file)) {
        throw new Exception("File does not exist: $path_to_png_file");
    }
 
    // guarantee that quality won't be worse than that.
    $min_quality = 60;
 
    // '-' makes it use stdout, required to save to $compressed_png_content variable
    // '<' makes it read from the given file path
    // escapeshellarg() makes this safe to use with any path
    $compressed_png_content = shell_exec("pngquant --quality=$min_quality-$max_quality - < ".escapeshellarg(    $path_to_png_file));
 
    if (!$compressed_png_content) {
        throw new Exception("Conversion to compressed PNG failed. Is pngquant 1.8+ installed on the server?");
        return false;
    }
 
    file_put_contents($dest_to_path, $compressed_png_content);
    return true;
}
 
function compress_image($path_to_file, $dest_to_path,$quality=70) {
    $info = getimagesize($path_to_file);
 
    if ($info['mime'] == 'image/jpeg'){
        $image = imagecreatefromjpeg($path_to_file);
        imagejpeg($image, $dest_to_path, $quality);
    } else if ($info['mime'] == 'image/gif') {
        $image = imagecreatefromgif($path_to_file);
        imagetruecolortopalette($image, false, 16);
        imagegif($image, $dest_to_path);
    } else return false;
 
    //return destination file
    return true;
}

});
</script>

<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-12">
        <blockquote>
                  <ul>
                    <li>아래의 영역에 이미지 파일을 드롭다운하시거나 클릭하셔서 파일을 업로드 해 주세요.
                    </li><li>최대 300Kb의 이미지 파일을 압축할 수 있습니다.
                    </li><li>압축이 가능한 파일은 gif, jpeg/jpg, png 등이 압축이 가능합니다.
                  </li></ul>
                </blockquote>       
                          <form action="<c:url value='../upload'/>" class="dropzone" drop-zone="" id="file-dropzone">
                         
                            <div class="dz-message text-center alert alert-danger">
                                <h3><strong>배너파일을 이곳에 드롭다운 하시거나 여기를 클릭해 주세요.</strong></h3>
                            </div>
                         
                          </form>
                           
                          <div class="upload-progress text-center alert alert-warning">
                        <h3><i class="fa fa-refresh fa-spin"></i><strong> 파일을 압축중 입니다.</strong></h3>
                          </div>
                           
                          <div class="resize-image text-center alert alert-success">
                        <h3>
                            기존 <span id="origin-size"></span>Kbyte 에서 <span id="resize-size"></span>KByte로 압축되었습니다.
                        </h3>
                        <div class="text-center">
                            <button type="button" class="btn btn-lg btn-primary" filename="" onclick="downImage()" id="image-down">이미지 다운로드</button>
                        </div>
                          </div>
                     
                     
                    <div id="banner-preview" class="dropzone-previews hide"></div>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-12">                                       <h3>이미지 파일 미리보기</h3>
        <div class="image-preview">
            <img src="" id="preview-img">
        </div>
</div>
 
 
</div><!-- /. row -->


<%@ include file="../inc/simple_bottom.jsp"%>