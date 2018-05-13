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

<div id="container" style="min-width: 100%; max-width: 100%; height: 100%; margin: 0 auto"></div>

  </body>
  
</html>
<script type="text/javascript">
 var jQuery_New = $.noConflict(true);
 jQuery_New(function () {
	Highcharts.chart('container', {
    chart: {
        type: 'bar'
    },
    title: {
        text: '客服员工的工作情况'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: ['员工1', '员工2', '员工3', '员工4', '员工5'],
        title: {
            text: null
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Population (millions)',
            align: 'high'
        },
        labels: {
            overflow: 'justify'
        }
    },
    tooltip: {
        valueSuffix: ' millions'
    },
    plotOptions: {
        bar: {
            dataLabels: {
                enabled: true
            }
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -40,
        y: 80,
        floating: true,
        borderWidth: 1,
        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        shadow: true
    },
    credits: {
        enabled: false
    },
    series: [{
        name: '回答量',
        data: [107, 131, 235, 203, 2]
    }, {
        name: '工作时长',
        data: [133, 156, 347, 408, 6]
    }, {
        name: '总体评分',
        data: [1052, 954, 1352, 740, 38]
    }]
});
});
</script>
