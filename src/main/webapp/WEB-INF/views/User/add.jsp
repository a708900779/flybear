<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" name="form" action="user/add" method="post">
	<table align="center" class="form-table">
			<tr>
				<td>账号：</td>
				<td>
						<input type="text" name="name" id="name" value="" />
				</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td>
						<input type="text" name="password" id="password" value="" />
				</td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td>
						<input type="text" name="realName" id="realName" value="" />
				</td>
			</tr>
			<tr>
				<td>手机号码：</td>
				<td>
						<input type="text" name="phone" id="phone" value="" />
				</td>
			</tr>
			<tr>
				<td>角色：</td>
				<td>
						<%-- <input type="text" name="roleId" id="roleId" value="${list.roleName}" /> --%>
					<select class="jq-combobox" id="roleName"   data-options="{
	                      method:'post',
	                      url:'${z:u('public/role_list')}',
	                      onSelect:function(data){setroleid(data);}
	                      }">
	                      <option value="--请选择--" selected="selected"></option>
	                </select>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<button type="submit" class="btn btn-small btn-success" onclick="up()">确定</button>
					<button class="btn btn-primary btn-small J_close" type="button">返回</button>
				</td>
			</tr>
	</table>
</form>

<script type="text/javascript">

var roleid = 0;
function setroleid(data){
	roleid = data.id;
}

function up(){
	document.form.action="user/add?roleid="+roleid; 
}
</script>