<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="${__url__}" method="post">
    <table align="left" class="form-table" style="margin:40px 50px">
    	<tr>
			<td>账号：</td>
			<td colspan="4" >
				<input class="w200" name="name" class="jq-validatebox" readonly="readonly"  value='${sessionScope.loginName}' type="text" data-options="required:true">
			</td>
		</tr>
		<tr>
			<td>原密码：</td>
			<td colspan="4" >
				<input class="w200" name="OPass" class="jq-validatebox" value="" type="password" data-options="required:true">
			</td>
		</tr>
		<tr>
			<td>新密码：</td>
			<td colspan="4" >
				<input class="w200" name="NPass" class="jq-validatebox" value="" type="password" data-options="required:true">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<button type="submit" class="btn btn-small btn-success">确定</button>
				<a class="btn btn-primary btn-small" href="">返回</a>
			</td>
		</tr>
	</table>
</form>
<script>
	KindEditor.create("#editor",{
		uploadJson:'${z:u("public/upload")}'
	});
	App.ajaxForm("#form");
</script>