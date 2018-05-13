<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="staffWorktime/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>员工id：</td>
				<td>
						<input type="text" name="staffId" id="staffId" value="${list.staffId}" />
				</td>
			</tr>
			<tr>
				<td>上岗时间：</td>
				<td>
						<input type="text" name="onworkTime" id="onworkTime" value="${list.onworkTime}" />
				</td>
			</tr>
			<tr>
				<td>下岗时间：</td>
				<td>
						<input type="text" name="outworkTime" id="outworkTime" value="${list.outworkTime}" />
				</td>
			</tr>
			<tr>
				<td>工作时长：</td>
				<td>
						<input type="text" name="workingTime" id="workingTime" value="${list.workingTime}" />
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