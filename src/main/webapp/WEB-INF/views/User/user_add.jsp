<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="${__url__}" method="post">
	<table align="center" class="form-table">
		<tr>
			<td>用户名：</td>
			<td><input type="text" class="jq-validatebox" name="name"
				data-options="required:true" /></td>
			<td class="tr">密码：</td>
			<td><input type="password" class="jq-validatebox"
				name="password" data-options="required:true" /></td>
		</tr>
		<tr>
			<td>角色：</td>
			<td><select class="jq-combobox" id="roleId" name="roleId"
				data-options="{
					required:true,
					method:'post',
					url: '${z:u('public/role_list')}'}">
			</select></td>
			<td>启用：</td>
			<td><input type="radio" name="isActive" value="1" checked>
				是 <input type="radio" name="isActive" value="0"> 否</td>
		</tr>
		<%-- <tr>
			<td>所属区域：</td>
			<td>
           <input class="jq-combotree" type="text" id="areaId"  name="areaId" url="${z:u('public/area_list?ui=combo')}" data-options="{
						required:true,
						method:'post',
						onLoadSuccess:function(){$('#areaId').combotree('tree').tree('collapseAll')},				
						valueField:'id'
					}" />
			</td>
			<td class="tr">所属部门：</td> 
			<td>
					<select class="jq-combobox"  id="departmentId" name="departmentId"  disabled="disabled" data-options="required:true"  >
					</select>
			</td>
		</tr> --%>
		<tr>
			<td>&nbsp;</td>
			<td>
				<button type="submit" class="btn btn-small btn-success">确定</button>
				<button class="btn btn-primary btn-small J_close" type="button">返回</button>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">

/* 	$(document).ready(function() {
		$("#areaId").combotree({
			onChange : function(n, o) {
				var areaId = $("#areaId").combotree("getValue");
				initDeparment(areaId);
				$('#departmentId').combobox('enable');
				$('#departmentId').combobox('clear');
			}
		});
	});
	

	function initDeparment(areaId) {
		$('#departmentId').combobox({
			method : 'post',
			url : '${z:u("public/department_list")}?areaId='+areaId,
			valueField : 'id',
			textField : 'text'
		});
	} */
	
/* 	$('#roleId').combobox({
		onSelect : function() {
			var roleId = $("#roleId").combobox("getValue");	
			if(roleId == 1){
			   $("#areaId").combotree('disable');
			}else{
	           $("#areaId").combotree('enable');
			}
		}
	}); */
	
</script>
