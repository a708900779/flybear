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
    
    <title>My JSP 'specialtime.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript">
  	$(function(){
  		$.ajax({
  			type:"POST",
  			url:"staff_arrangetime/staff_name",
  			data:{id:$("#id").val(), text:$("#text").val()},
  			success: function(data){
  				$.each(JSON.parse(data), function(key,value){
  					$("#tbody").append("<tr><td>"+value.id+"</td><td>"+value.text+"</td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"</tr>");
  				});
  			}
  		});
  	});
  	
  </script>
  <script language="javascript">
	function out(){
		var a = document.getElementsByName("a");
		var str = "";
		for(var i = 0; i < a.length;i++){
			if(a[i].checked){
				str += "0";
			}else{
				str += "1";
			}
		}
		$.post("staff_arrangetime/buildsche", {str:str});
	}
</script>
  
  <body>
    <div>客服人员特殊情况记录</div>
    <div>
    	<form action="staff_arrangetime/begintime" method="post">
    		<table>
    			<tr>
    				<td><input type="text" class="jq-datebox" id="begintime" name="begintime"></td>
    			</tr>
    		</table>
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
    		<table>
    			<tr><td colspan="8"></td><td><input type="submit" value="排班" onclick="out()"></input></td></tr>
    		</table>
    	</form>
    </div>
  </body>
</html>
