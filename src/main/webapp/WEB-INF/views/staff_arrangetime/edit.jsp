<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="staffArrangetime/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>员工id：</td>
				<td>
						<input type="text" name="staffId" id="staffId" value="${list.staffId}" />
				</td>
			</tr>
			<tr>
				<td>一周员工排班：</td>
				<td>
						<input type="text" name="weektime" id="weektime" value="${list.weektime}" />
				</td>
			</tr>
			<tr>
				<td>起始时间：</td>
				<td>
						<input type="text" name="begintime" id="begintime" value="${list.begintime}" />
				</td>
			</tr>
			<tr>
				<td>判断是否添加时间：</td>
				<td>
						<input type="text" name="isaddtime" id="isaddtime" value="${list.isaddtime}" />
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