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
			url: 'user/list',
			method:'post',
			columns: [[
				{field:'id',checkbox:true},
				{field:'name',title:'账号',width:100},
				{field:'password',title:'密码',width:100},
				{field:'realName',title:'姓名',width:100},
				{field:'phone',title:'手机号码',width:100},
				{field:'roleName',title:'角色',width:100}
			]]}">
		</table>
	</div>
	
</div>
<script type="text/javascript">
	$("#add").click(function() {
		App.popup('user/add', {
			title : "新增用户",
			width : 610,
			height : 350
		});
	});

	$("#edit,#delete").click(function(){
		var row = $(".jq-datagrid").datagrid("getSelected");
		if(row == null){
			App.alert("请先选择一条记录","warning");
		}else{
			var eleId = $(this).attr("id");
			if(eleId=="edit"){
				App.popup('user/edit?id='+row.id, {
				title : "编辑用户",
				width : 610,
				height : 350
			});
			}else if(eleId=="delete"){
	            App.ajax('user/delete?id='+row.id,{
	            type: "POST"
	            });
				
			}
		}
	});
	
</script>