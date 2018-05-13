<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="user/edit" method="post" name="form">
    <table align="center" class="form-table">
			<tr>
				<td>账号：</td>
				<td>
						<input type="text" name="name" id="name" value="${list.name}" />
				</td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td>
						<input type="text" name="realName" id="realName" value="${list.realName}" />
				</td>
			</tr>
			<tr>
				<td>手机号码：</td>
				<td>
						<input type="text" name="phone" id="phone" value="${list.phone}" />
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
	                      <option value="${list.roleName}" selected="selected"></option>
	                </select>
				</td>
			</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input type="hidden" name="password" id="password" value="${list.password}" />
			    <input type="hidden" name="id" id="id" value="${list.id}" />
				<button type="submit"  class="btn btn-small btn-success" onclick="up()">确定</button>
				<button class="btn btn-primary btn-small J_close" type="button">返回</button>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
(function(){
	setTimeout(function(){
	},100);
})();

var roleid = 0;
function setroleid(data){
	roleid = data.id;
}

function up(){
	document.form.action="user/edit?roleid="+roleid; 
}
</script>