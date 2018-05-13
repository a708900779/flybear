<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<div class="jq-layout rel" data-options="fit:true">
	<div data-options="region:'north',border:false">
        <div id="grid-toolbar" class="clearfix p5">
        <a id="add" class="btn btn-sm btn-success"><i class="icon icon-add"></i>查询</a>
        <a id="edit" class="btn btn-sm btn-info"><i class="icon icon-edit"></i>编辑</a>
        <a id="delete" class="btn btn-sm btn-danger"><i class="icon icon-delete"></i>删除</a>
        </div>
    </div>
    
	<div data-options="region:'center',border:false">
		<table id="jq" class="jq-datagrid" fit="true" data-options="{
			url: 'question/search_list',
			method:'post',
			columns: [[
				{field:'id',checkbox:true},
				{field:'questionTitle',title:'问题标题',width:100},
				{field:'questionContent',title:'问题内容',width:100},
				{field:'sponsorId',title:'问题的发起人',width:100},
				{field:'releaseTime',title:'问题发布时间',width:100},
				{field:'answer',title:'问题的回复',width:100},
				{field:'answererId',title:'客服',width:100},
				{field:'questionType',title:'问题类型',width:100}
			]]}">
		</table>
	</div>
</div>
<script type="text/javascript">
	$("#add").click(function() {
		App.popup('question/add', {
			title : "查询",
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
				App.popup('question/edit?id='+row.id, {
				title : "编辑",
				width : 610,
				height : 270
			});
			}else if(eleId=="delete"){
	            App.ajax('question/delete?id='+row.id,{
	            type: "POST"
	            });
				
			}
		}
	});
	
</script>