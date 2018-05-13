<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="${__url__}" method="post">
    <table align="center" class="form-table">
		<tr>
			<td>角色名称：</td>
			<td>
				<input name="name" class="jq-validatebox" value="${role.name }" type="text" data-options="required:true" validType="loginName">
			</td>
		</tr>
		<tr>
		<td>备注：</td>
			<td>
				<input name="remark" class="jq-validatebox" value="${role.remark }" type="text" data-options="required:true">
			</td>
		</tr>
		<tr>
			<td>是否启用：</td>
			<td>
				<label class="radio inline">
				  <input type="radio" name="status" value="1" checked>
				  启用
				</label>
				<label class="radio inline">
				  <input type="radio" name="status" value="0" >
				  禁用
				</label>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input type="hidden" name="id" value="${role.id}">
				<button type="submit" class="btn btn-small btn-success">确定</button>
			</td>
		</tr>
	</table>
</form>