<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<div class="jq-layout rel" data-options="fit:true">
	<div data-options="region:'north',border:false">
        <div id="grid-toolbar" class="clearfix p5">
        <a id="add" class="btn btn-sm btn-success"><i class="icon icon-add"></i>增加</a>
        <a id="edit" class="btn btn-sm btn-info"><i class="icon icon-edit"></i>编辑</a>
        <a id="delete" class="btn btn-sm btn-danger"><i class="icon icon-delete"></i>删除</a>
        </div>
    </div>
    
	<div data-options="region:'center',border:false">
		<table id="" class="jq-datagrid" fit="true" data-options="{
			url: 'staffWorktime/list',
			method:'post',
			columns: [[
				{field:'id',checkbox:true},
				{field:'staffId',title:'员工id',width:100},
				{field:'onworkTime',title:'上岗时间',width:100},
				{field:'outworkTime',title:'下岗时间',width:100},
				{field:'workingTime',title:'工作时长',width:100}
			]]}">
		</table>
	</div>
	
</div>
<script type="text/javascript">
	$("#add").click(function() {
		App.popup('staffWorktime/add', {
			title : "新增",
			width : 610,
			height : 270
		});
	});

	$("#edit,#delete").click(function(){
		var row = $(".jq-datagrid").datagrid("getSelected");
		if(row == null){
			App.alert("请先选择一条记录","warning");
		}else{
			var eleId = $(this).attr("id");
			if(eleId=="edit"){
				App.popup('staffWorktime/edit?id='+row.id, {
				title : "编辑",
				width : 610,
				height : 270
			});
			}else if(eleId=="delete"){
	            App.ajax('staffWorktime/delete?id='+row.id,{
	            type: "POST"
	            });
				
			}
		}
	});
	
</script>