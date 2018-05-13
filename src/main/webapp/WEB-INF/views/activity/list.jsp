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
			url: '${z:u('activity/list')}',   
			method:'post',
			columns: [[
				{field:'id',checkbox:true},
				{field:'name',title:'活动名称',width:100},
				{field:'content',title:'活动内容',width:100},
				{field:'location',title:'活动地点',width:100},
				{field:'poster',title:'海报',width:100},
				{field:'stertDate',title:'开始时间',width:100},
				{field:'endDate',title:'截止时间',width:100},
				{field:'applicant',title:'申请人',width:100},
				{field:'phoneNumber',title:'申请人手机号码',width:100},
				{field:'applicationTime',title:'申请时间',width:100},
				{field:'maxNum',title:'活动最大人数',width:100},
				{field:'department',title:'所属部门',width:100}
			]]}">
		</table>
	</div>
	
</div>
<script type="text/javascript">
	$("#add").click(function() {
		App.popup('${z:u("activity/add")}', {
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
				App.popup('${z:u("activity/edit")}?id='+row.id, {
				title : "编辑",
				width : 610,
				height : 270
			});
			}else if(eleId=="delete"){
	            App.ajax('${z:u("activity/delete")}?id='+row.id,{
	            type: "POST"
	            });
				
			}
		}
	});
	$("#search_btn").on("click", function() {
	    var key = $("#search_text").val();
	    $("#grid").datagrid({
	        url: '${z:u("activity/find" )}?key='+key
	    });
	});
</script>