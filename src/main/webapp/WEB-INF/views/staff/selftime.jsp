<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'SelfChoosetime.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${__static__}/mod/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${__static__}/mod/jquery/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		var jQuery_New = $.noConflict(true);
	</script>
	<style type="text/css">
		.left{
			width:120px;
			float:left;
		}
		.left table{
			background:#E0ECFF;
		}
		.left td{
			background:#eee;
		}
		.right{
			float:right;
			width:800px;
		}
		.right table{
			background:#E0ECFF;
			width:100%;
		}
		.right td{
			background:#fafafa;
			text-align:center;
			padding:2px;
		}
		.right td{
			background:#FFEC8B;
		}
		.right td.drop{
			background:#fafafa;
			width:100px;
		}
		.right td.over{
			background:#FBEC88;
		}
		.item{
			text-align:center;
			border:1px solid #499B33;
			background:#fafafa;
			width:100px;
		}
		.assigned{
			border:1px solid #BC2A4D;
		}
		
	</style>
	<script>
		jQuery_New(function(){
			$('.left .item').draggable({
				revert:true,
				proxy:'clone'
			});
			$('.right td.drop').droppable({
				onDragEnter:function(){
					$(this).addClass('over');
				},
				onDragLeave:function(){
					$(this).removeClass('over');
				},
				onDrop:function(e,source){
					$(this).removeClass('over');
					if ($(source).hasClass('assigned')){
						//$(this).append(source);
						$(this).html($(source).html());
					} else {
						var c = $(source).clone().addClass('assigned');
						//$(this).empty().append(c);
						$(this).html($(source).html());
						c.draggable({
							revert:true
						});
					}
				}
			});
		});
		function out(){
			var allin ='';
			var tab = document.getElementById("tab");
			var allrows = tab.rows;
			for(var i = 1; i < allrows.length;i++){
				for(var j = 1; j < allrows[i].cells.length;j++){
					var cell = allrows[i].cells[j];
					if(cell.innerHTML == "排班"){
						allin += '1';
					}else if(cell.innerHTML == "休息"){
						allin += '0';
					}
				}
				i++;
			}
			jQuery_New.post("/staff/selftime", {allin:allin});
		}
	</script>

  </head>
  
  <body>
    <div style="width:1000px;">
	<div class="left">
		<table>
			<tr>
				<td><div class="item">排班</div></td>
			</tr>
			<tr>
				<td><div class="item">休息</div></td>
			</tr>
		</table>
	</div>
	<div class="right">
		<table id="tab" style="height: 346px; width: 1015px; ">
			<tr>
				<td class="blank" style="width: 178px; "></td>
				<td class="title">星期一</td>
				<td class="title">星期二</td>
				<td class="title">星期三</td>
				<td class="title">星期四</td>
				<td class="title">星期五</td>
				<td class="title">星期六</td>
				<td class="title">星期日</td>
			</tr>
			<tr id="first">
				<td class="time">9:00~17:00</td>
				<td class="drop" id="onemor"></td>
				<td class="drop" id="twomor"></td>
				<td class="drop" id="threemor"></td>
				<td class="drop" id="fourmor"></td>
				<td class="drop" id="fivemor"></td>
				<td class="drop" id="sixmor"></td>
				<td class="drop" id="sevenmor"></td>
			</tr>
			<!-- <tr>
				<td class="time"></td>
				<td class="lunch" colspan="8">交接班</td>
			</tr>
			<tr>
				<td class="time">14:00~22:00</td>
				<td class="drop" id="oneafter"></td>
				<td class="drop" id="twoafter"></td>
				<td class="drop" id="threeafter"></td>
				<td class="drop" id="fourafter"></td>
				<td class="drop" id="fiveafter"></td>
				<td class="drop" id="sixafter"></td>
				<td class="drop" id="sevenafter"></td>
			</tr>
 -->
			<tr >
				<td colspan="8"><input type="submit" value="提交" style="width: 111px; height: 49px" onClick="out()"></td>
			</tr>
		</table>
	</div>
</div>
  </body>
</html>
