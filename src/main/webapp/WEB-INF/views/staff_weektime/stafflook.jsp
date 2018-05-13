<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

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
<%-- <form id="form" action="staff_weektime/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>工作开始时间：</td>
				<td>
						<input type="text" name="begintime" id="begintime" value="${list.begintime}" />
				</td>
			</tr>
			<tr>
				<td>排班时间：</td>
				<td>
						<input type="text" name="setweektime" id="setweektime" value="${list.setweektime}" />
				</td>
			</tr>
			<tr>
				<td>备注：</td>
				<td>
						<input type="text" name="othernews" id="othernews" value="${list.othernews}" />
				</td>
			</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input type="hidden" name="id" id="id" value="${list.id}" />
				<button type="submit"  class="btn btn-small btn-success">确定</button>
				<button class="btn btn-primary btn-small J_close" type="button">返回</button>
			</td>
		</tr>
	</table>
	
</form> --%>
<form id="form" action="staff_weektime/stafflook" method="post"  >
<div>
	<div class="right">
		<table id="tab" style="height: auto; width: 600px; ">
			<tr>
				<td class="title">员工工号</td>
				<td class="title">员工名字</td>
				<td class="title">星期一</td>
				<td class="title">星期二</td>
				<td class="title">星期三</td>
				<td class="title">星期四</td>
				<td class="title">星期五</td>
				<td class="title">星期六</td>
				<td class="title">星期日</td>
			</tr>
			<c:forEach items="${listNews }" var="list">
			<tr>
				<td>${list.staff_id}<input type="hidden" id="begintime" value="${list.begintime }"></td>
				<td>${list.staffname}</td>
				<td class="drop">${list.mon }</td>
				<td class="drop">${list.tue }</td>
				<td class="drop">${list.wed }</td>
				<td class="drop">${list.thu }</td>
				<td class="drop">${list.fri }</td>
				<td class="drop">${list.sat }</td>
				<td class="drop">${list.sun }</td>
				
			</tr>
			</c:forEach>
			<tr >
				<td colspan="9">
					<button class="btn btn-primary btn-small J_close" type="button">返回</button>
				</td>
			</tr>
		</table>
	</div>
</div>
</form>
<script type="text/javascript">
/* $(function(){
 	$.ajax({
		type:"POST",
		url:"staff_weektime/weeknews",
		data:{staff_id:$("staff_id").val, staffname:$("staffname").val, mon:$("mon").val, tue:$("tue").val, wed:$("wed").val, thu:$("thu").val, fri:$("fri").val, sat:$("sat").val, sun:$("sun").val},
		success: function(data){
			$.each(JSON.parse(data), function(key,value){
				$("tab").append("<tr><td>"+1+"</td>"
				+"<td>"+value.staffname+"</td>"
				+"<td class="drop">"+value.mon+"</td>"
				+"<td class="drop">"+value.tue+"</td>"
				+"<td class="drop">"+value.wed+"</td>"
				+"<td class="drop">"+value.thu+"</td>"
				+"<td class="drop">"+value.fri+"</td>"
				+"<td class="drop">"+value.sat+"</td>"
				+"<td class="drop">"+value.sun+"</td>"
				+"</tr>");
			});
		}
	});
 }); */
</script>