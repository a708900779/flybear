<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>
<html>
  <head>
  	<link href="${__static__}/charts/style.css" rel="stylesheet" type="text/css" />
        <link href="${__static__}/charts/prettify.css" rel="stylesheet" type="text/css" />
<%--         <script type="text/javascript" src="${__static__}/charts/jquery.min.js"></script> --%>
        <script type="text/javascript" src="${__static__}/charts/FusionCharts.js"></script>
        <script type="text/javascript" src="${__static__}/charts/prettify.js"></script>
        <script type="text/javascript" src="${__static__}/charts/json2.js"></script>
        <script type="text/javascript" src="${__static__}/charts/lib.js"></script>
  </head>
  
  <body>
<h3 class="chart-title">Pie 2D Chart</h3>
<p>&nbsp;</p>
        <script type="text/javascript" src="${__static__}/charts/Pie2D1.js" ></script> 
        <div id="chartdiv" align="center">Chart will load here</div>
        <script type="text/javascript">
            var chart = new FusionCharts("${__static__}/charts/swf/Pie2D.swf", "ChartId", "560", "400", "0", "0");
		   chart.setXMLData( dataString );		   
		   chart.render("chartdiv");
		</script>	
		  <p>&nbsp;</p>
		  <p align="center">2D Pie chart showing major causes of airline delay.Labels are hidden on this chart.</p> 
		 <br/> 
<div class="qua-button-holder"></div>
       
        <div class="show-code-block"></div>
  </body>
</html>
