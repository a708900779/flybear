<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="${z:u('user/reset_pass')}" method="post">
    <table align="center" class="form-table">
       <tr>
			<td>用户名：</td>
			<td>
			<input type="text" class="jq-validatebox" name="name" value="${entity.name}" readonly="readonly" />           			
			</td>
		</tr>
		<tr>
			<td>新密码：</td>
			<td>
				<input name="password"  class="jq-validatebox" type="password" data-options="required:true" >
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
			    <input type="hidden" name="id" value="${entity.id}"  />
				<button type="submit" class="btn btn-small btn-success">确定</button>
			    <button class="btn btn-primary btn-small J_close" type="button">返回</button>
			</td>
		</tr>
	</table>
</form>