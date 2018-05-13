<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="${__url__}" method="post">
    <table align="center" class="form-table">
    	<tr>
			<td>用户名：</td>
			<td>
			<input type="text" class="jq-validatebox" name="name" value="${entity.name}" readonly="readonly" />           			
			</td>
		</tr>
		<tr>
		 <td>角色：</td>
			<td>
            <select class="jq-combobox" id="roleId" name="roleId"  data-options="{
					required:true,
					method:'post',
					url: '${z:u('public/role_list')}'}">
		    <c:if test="${entity.roleId!=null }"><option value="${ entity.roleId}" selected="selected"></option></c:if>
					</select>
			</td>
		<tr>
            <td class="tr">是否启用：</td>
			<td>
				<label class="radio inline">
				  <input type="radio" name="isActive" value="1" ${entity.isActive==1?"checked":""}>
				  是
				</label>
				<label class="radio inline">
				  <input type="radio" name="isActive" value="0" ${entity.isActive==0?"checked":""}>
				  否
				</label>
			</td>
		</tr>	
		<%-- <tr>
			<td>所属区域：</td>
			<td>
           <input class="jq-combotree" type="text" id="areaId" value="${entity.areaId}"  name="areaId" url="${z:u('public/area_list?ui=combo')}" data-options="{
						required:true,
						method:'post',
						onLoadSuccess:function(){$('#areaId').combotree('tree').tree('collapseAll')},				
						valueField:'id'
					}" />
			</td>
			<td class="tr">所属部门：</td> 
			<td>
			    <select class="jq-combobox"  id="departmentId"  name="departmentId"  data-options="{
					required:true,
					method:'post',
					url: '${z:u('public/department_list')}?areaId=${entity.areaId}'}">
				    <c:if test="${entity.departmentId!=null }"><option value="${entity.departmentId}" selected="selected"></option></c:if>
					</select>
			</td>
		</tr> --%>
		<tr>
			<td>&nbsp;</td>
			<td>
			    <input type="hidden" name="id" value="${entity.id}"  />
				<button type="submit"  class="btn btn-small btn-success">确定</button>
				<button class="btn btn-primary btn-small J_close" type="button">返回</button>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">

	/* $(document).ready(function() {
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
	
	
</script>
