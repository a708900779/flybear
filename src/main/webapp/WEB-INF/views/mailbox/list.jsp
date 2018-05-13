<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<div class="jq-layout rel" data-options="fit:true">
	<div data-options="region:'north',border:false">
        <div id="grid-toolbar" class="clearfix p5">
        <a id="add" class="btn btn-sm btn-success"><i class="icon icon-add"></i>增加</a>
        <a id="edit" class="btn btn-sm btn-info"><i class="icon icon-edit"></i>编辑</a>
        <a id="delete" class="btn btn-sm btn-danger"><i class="icon icon-delete"></i>删除</a>
        <input class="ml10 w200" type="text" placeholder="输入ID 搜索" id="search_text" name="search_text" />
		<button class="btn btn-sm btn-info" id="search_btn">搜索</button>
        </div>
    </div>
    
	<div data-options="region:'center',border:false">
		<table id="grid" class="jq-datagrid" fit="true" data-options="{
			url: '${z:u('mailbox/list')}',   
			method:'post',
			columns: [[
				{field:'id',checkbox:true},
				{field:'title',title:'title',width:100},
				{field:'content',title:'content',width:100},
				{field:'time',title:'time',width:100},
				{field:'username',title:'username',width:100}
			]]}">
		</table>
	</div>
	
</div>
<script type="text/javascript">
	$("#add").click(function() {
		App.popup('${z:u("mailbox/add")}', {
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
				App.popup('${z:u("mailbox/edit")}?id='+row.id, {
				title : "编辑",
				width : 610,
				height : 270
			});
			}else if(eleId=="delete"){
	            App.ajax('${z:u("mailbox/delete")}?id='+row.id,{
	            type: "POST"
	            });
				
			}
		}
	});
	$("#search_btn").on("click", function() {
	    var key = $("#search_text").val();
	    $("#grid").datagrid({
	        url: '${z:u("mailbox/find" )}?key='+key
	    });
	});
</script>