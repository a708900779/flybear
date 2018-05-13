<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="${z:u('student/edit')}" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="grade" id="grade" value="${list.grade}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="classNumber" id="classNumber" value="${list.classNumber}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="studentId" id="studentId" value="${list.studentId}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="password" id="password" value="${list.password}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="studentName" id="studentName" value="${list.studentName}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="major" id="major" value="${list.major}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="counselor" id="counselor" value="${list.counselor}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="activityName" id="activityName" value="${list.activityName}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="activityNum" id="activityNum" value="${list.activityNum}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="laActivityName" id="laActivityName" value="${list.laActivityName}" />
				</td>
			</tr>
			<tr>
				<td>：</td>
				<td>
						<input type="text" name="laActivityNum" id="laActivityNum" value="${list.laActivityNum}" />
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