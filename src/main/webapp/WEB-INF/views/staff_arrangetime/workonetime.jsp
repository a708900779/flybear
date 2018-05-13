<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'workonetime.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${__static__}/mod/jquery/jquery.min.js"></script>

  </head>
  <script type="text/javascript">
  	$(function(){
  		$.ajax({
  			type:"POST",
  			url:"staff_arrangetime/schenoup",
  			data:{id:$("#id").val(), text:$("#text").val(), tim1:$("#tim1").val(), tim2:$("#tim2").val(), tim3:$("#tim3").val(), tim4:$("#tim4").val(), tim5:$("#tim5").val(), tim6:$("#tim6").val(), tim7:$("#tim7").val()},
  			success:function(data){
  				$.each(JSON.parse(data),function(key,value){
  					$("#tbody").append("<tr><td>"+value.id+"</td>"
					  					  +"<td>"+value.text+"</td>"
					  					  +"<td>"+value.tim1+"</td>"
					  					  +"<td>"+value.tim2+"</td>"
					  					  +"<td>"+value.tim3+"</td>"
					  					  +"<td>"+value.tim4+"</td>"
					  					  +"<td>"+value.tim5+"</td>"
					  					  +"<td>"+value.tim6+"</td>"
					  					  +"<td>"+value.tim7+"</td></tr>");
  				});
  			}
  		});
  	});
  </script>
  
  <body>
    <table id="tbody">
    	<tr>
    		<td>员工工号</td>
			<td>员工姓名</td>
			<td>星期一</td>
			<td>星期二</td>
			<td>星期三</td>
			<td>星期四</td>
			<td>星期五</td>
			<td>星期六</td>
			<td>星期天</td>
    	</tr>
    </table>
  </body>
</html>
