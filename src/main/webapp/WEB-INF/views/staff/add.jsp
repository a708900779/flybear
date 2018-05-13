<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>
<head>
<script type="text/javascript" src="${__static__}/highcharts/code/jquery-1.8.3.min.js"></script> 
<script type="text/javascript">
    var jQuery_New = $.noConflict(true);
</script>
</head>
<script src="${__static__}/highcharts/code/highcharts.js"></script>
<script src="${__static__}/highcharts/code/modules/exporting.js"></script>

<div id="container" style="min-width: 100%; height: 100%; max-width: 700px; margin: 0 auto"></div>
<script type="text/javascript" >
/* jQuery_New(function () {
	/* var seriesData = [];
	for (var i = 0; i < data.length; i++) {
	    var singleData = [];
	    singleData.push(data[i].name);
	    singleData.push(data[i].y);
	
	    seriesData.push(singleData);
	} 
    // Build the chart
    alert(resultList);
    Highcharts.chart('container', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '2017年四月热点信息'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: '占比',
            colorByPoint: true,
            data:[['国际汇率消息', 56.33], ['萨德反导弹系统', 24.03], ['美国投降', 19.64]]
            /* [['国际汇率消息',56.33],['萨德反导弹系统',24.03],['美国投降',10.38],['韩国整容',4.77],['日本淹没',0.91],['民生',0.2]] */
            /* [{
                name: '国际汇率消息',
                y: 56.33
            }, {
                name: '萨德反导弹系统',
                y: 24.03,
                sliced: true,
                selected: true
            }, {
                name: '美国投降',
                y: 10.38
            }, {
                name: '韩国整容',
                y: 4.77
            }, {
                name: '日本淹没',
                y: 0.91
            }, {
                name: '民生',
                y: 0.2
            }] 
           
        }]
    });
});
 */

 jQuery_New(function () {
	var URL = "staff/test";
	  	$.ajax({
	  	url: URL, 
	    type: 'GET',
	    success: function(result) {

		    Highcharts.chart('container', {
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,
	            type: 'pie'
	        },
	        title: {
	            text: '2017年四月热点问题'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: false
	                },
	                showInLegend: true
	            }
	        },
	        series: [{
	            name: '占比',
	            colorByPoint: true,
	            data:
	         		[{name:"国际汇率消息", y:26.33
	            	}, {name:"萨德反导弹系统", y:24.03
	            	}, {name:"美国投降", y:19.64}
	            	, {name:"朝鲜退兵", y:14.23}
	            	, {name:"苏联重构", y:15.77}]
		    }]
			});
		}
	});
});
</script>