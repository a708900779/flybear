<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<div class="jq-layout rel" data-options="fit:true">
	<div data-options="region:'north',border:false">
        <div id="grid-toolbar" class="clearfix p5">
        <!-- <a id="add" class="btn btn-sm btn-success"><i class="icon icon-add"></i>增加</a> -->
        <a id="look" class="btn btn-sm btn-success"><i class="icon icon-add"></i>查看排班</a>
        <!-- <a id="delete" class="btn btn-sm btn-danger"><i class="icon icon-delete"></i>删除</a> -->
        </div>
    </div>
    
	<div data-options="region:'center',border:false">
		<table id="" class="jq-datagrid" fit="true" data-options="{
			url: 'staff_weektime/list',
			method:'post',
			columns: [[
				{field:'id',checkbox:true},
				{field:'begintime',title:'工作开始时间',width:100},
				{field:'setweektime',title:'排班时间',width:100},
				{field:'othernews',title:'备注',width:100}
			]]}">
		</table>
	</div>
	
</div>
<script type="text/javascript">
	$("#add").click(function() {
		App.popup('staff_weektime/add', {
			title : "新增x_staff_weektime",
			width : 610,
			height : 270
		});
	});

	$("#look").click(function(){
		var row = $(".jq-datagrid").datagrid("getSelected");
		if(row == null){
			App.alert("请先选择一条记录","warning");
		}else{
			var eleId = $(this).attr("id");
			if(eleId=="look"){
				App.popup('staff_weektime/stafflook?id='+row.id, {
				title : "员工班次信息",
				width : 900,
				height : 350
			});
			}
		}
	});
	
</script>