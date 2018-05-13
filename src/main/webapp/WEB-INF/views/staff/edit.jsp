<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="staff/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>员工id：</td>
				<td>
						<input type="text" name="staffId" id="staffId" value="${list.staffId}" />
				</td>
			</tr>
			<tr>
				<td>部门id：</td>
				<td>
						<input type="text" name="plateId" id="plateId" value="${list.plateId}" />
				</td>
			</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input type="hidden" name="id" id="id" value="${list.id}" />
				<button type="submit"  class="btn btn-small btn-success">确定</button>
				<button class="btn btn-primary btn-small J_close" type="button">返回</button>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
</script>