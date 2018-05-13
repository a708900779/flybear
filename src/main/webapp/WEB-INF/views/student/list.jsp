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
			url: '${z:u('student/list')}',   
			method:'post',
			columns: [[
				{field:'id',checkbox:true},
				{field:'grade',title:'年级',width:100},
				{field:'classNumber',title:'行政班号',width:100},
				{field:'studentId',title:'学号',width:100},
				{field:'password',title:'密码',width:100},
				{field:'studentName',title:'姓名',width:100},
				{field:'major',title:'专业',width:100},
				{field:'counselor',title:'辅导员',width:100},
				{field:'activityName',title:'报名的活动',width:100},
				{field:'activityNum',title:'报名活动的数量',width:100},
				{field:'laActivityName',title:'报名的维修',width:100},
				{field:'laActivityNum',title:'报名维修的数量',width:100}
			]]}">
		</table>
	</div>
	
</div>
<script type="text/javascript">
	$("#add").click(function() {
		App.popup('${z:u("student/add")}', {
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
				App.popup('${z:u("student/edit")}?id='+row.id, {
				title : "编辑",
				width : 610,
				height : 270
			});
			}else if(eleId=="delete"){
	            App.ajax('${z:u("student/delete")}?id='+row.id,{
	            type: "POST"
	            });
				
			}
		}
	});
	$("#search_btn").on("click", function() {
	    var key = $("#search_text").val();
	    $("#grid").datagrid({
	        url: '${z:u("student/find" )}?key='+key
	    });
	});
</script>