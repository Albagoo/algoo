<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Basic jQuery Accordion</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.2/themes/dark-hive/jquery-ui.css" />
    <script type="text/javascript">
          $(document).ready(
            function () {
                $("#accordion").accordion({ header: "h3",          
                    autoheight: false,
                    active: false,
                    alwaysOpen: false,
                    fillspace: false,
                    collapsible: true,
                    //heightStyle: content   //auto, fill, content
                });
            });
    </script>
</head>
<body>
 <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
    </script>
    <!-- begin html for accordion -->
    <div style="width: 600px;">
        <div id="accordion">
            <c:forEach var="i" items="${ulist}">
		<h3>[${i.category }] ${i.title}</h3>
  		<div id="answer">
    		<p>
    			${i.content}
			</p>
		</div>
	</c:forEach>
        </div>
    </div>
    <!-- end html for accordion -->
</body>
</html>