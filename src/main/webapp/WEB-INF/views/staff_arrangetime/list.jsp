<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<div class="jq-layout rel" data-options="fit:true">
	<div data-options="region:'north',border:false">
        <div id="grid-toolbar" class="clearfix p5">
        <a id="add" class="btn btn-sm btn-success"><i class="icon icon-add"></i>智能排班</a>
        <!-- <a id="edit" class="btn btn-sm btn-info"><i class="icon icon-edit"></i>编辑</a>
        <a id="delete" class="btn btn-sm btn-danger"><i class="icon icon-delete"></i>删除</a> -->
        </div>
    </div>
    
	<div data-options="region:'center',border:false">
		<table id="" class="jq-datagrid" fit="true" data-options="{
			url: 'staff_arrangetime/list',
			method:'post',
			columns: [[
				{field:'id',checkbox:true},
				{field:'staffId',title:'员工id',width:100},
				<!-- {field:'weektime',title:'一周员工排班',width:100}, -->
				{field:'begintime',title:'起始时间',width:100},
				<!-- {field:'isaddtime',title:'判断是否添加时间',width:100} -->
			]]}">
		</table>
	</div>
	
</div>
<script type="text/javascript">
	$("#add").click(function() {
		App.popup('staff_arrangetime/add', {
			title : "智能排班",
			width : 610,
			height : 450
		});
	});

	$("#edit,#delete").click(function(){
		var row = $(".jq-datagrid").datagrid("getSelected");
		if(row == null){
			App.alert("请先选择一条记录","warning");
		}else{
			var eleId = $(this).attr("id");
			if(eleId=="edit"){
				App.popup('staff_arrangetime/edit?id='+row.id, {
				title : "编辑x_staff_arrangetime",
				width : 610,
				height : 270
			});
			}else if(eleId=="delete"){
	            App.ajax('staff_arrangetime/delete?id='+row.id,{
	            type: "POST"
	            });
				
			}
		}
	});
	
</script>