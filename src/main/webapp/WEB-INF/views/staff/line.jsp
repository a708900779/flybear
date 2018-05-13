<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'line.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <script type="text/javascript" src="${__static__}/highcharts/code/jquery-1.8.3.min.js"></script>
		<style type="text/css">
	#container {
		min-width: 100%;
		max-width: 100%;
		height: 100%;
		margin: 0 auto
	}
		</style>
	<script src="${__static__}/highcharts/code/highcharts.js"></script>
	<script src="${__static__}/highcharts/code/modules/exporting.js"></script>
  </head>
  
  <body>

<div id="container"></div>

  </body>
  
</html>
<script type="text/javascript">
 var jQuery_New = $.noConflict(true);
 jQuery_New(function () {
	Highcharts.chart('container', {

    title: {
        text: '热门标签搜索量'
    },

    subtitle: {
        text: ''
    },

    yAxis: {
        title: {
            text: '热门标签搜索量'
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        series: {
            pointStart: 2010
        }
    },

    series: [{
        name: '国内新闻',
        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
    }, {
        name: '欧美新闻',
        data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
    }, {
        name: '澳洲新闻',
        data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
    }, {
        name: '极地新闻',
        data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
    }, {
        name: '非洲新闻',
        data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
    }]
});
});
</script>
