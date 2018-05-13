<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>uploadimg.html</title>

    <meta name="keywords" content="keyword1,keyword2,keyword3"></meta>
    <meta name="description" content="this is my page"></meta>
    <meta name="content-type" content="text/html; charset=UTF-8"></meta>

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>

  <body>
  <form enctype="multipart/form-data" method="post" action="${z:u('activity/uploading')}">
    图片<input type="file" name="file"/>
    <input type="submit" value="上传"/>
    </form>
  </body>
</html>
