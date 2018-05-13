<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="${z:u('student/add')}" method="post" >
	<table align="center" class="form-table">
				<tr>
					<td>年级：</td>
					<td>
							<input type="text" name="grade" id="grade" value="" />
					</td>
				</tr>
				<tr>
					<td>行政班号：</td>
					<td>
							<input type="text" name="classNumber" id="classNumber" value="" />
					</td>
				</tr>
				<tr>
					<td>学号：</td>
					<td>
							<input type="text" name="studentId" id="studentId" value="" />
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
							<input type="text" name="studentName" id="studentName" value="" />
					</td>
				</tr>
				<tr>
					<td>专业：</td>
					<td>
							<input type="text" name="major" id="major" value="" />
					</td>
				</tr>
				<tr>
					<td>辅导员：</td>
					<td>
							<input type="text" name="counselor" id="counselor" value="" />
					</td>
				</tr>
				<tr>
					<td>报名的活动：</td>
					<td>
							<input type="text" name="activityName" id="activityName" value="" />
					</td>
				</tr>
				<tr>
					<td>报名活动的数量：</td>
					<td>
							<input type="text" name="activityNum" id="activityNum" value="" />
					</td>
				</tr>
				<tr>
					<td>报名的维修：</td>
					<td>
							<input type="text" name="laActivityName" id="laActivityName" value="" />
					</td>
				</tr>
				<tr>
					<td>报名维修的数量：</td>
					<td>
							<input type="text" name="laActivityNum" id="laActivityNum" value="" />
					</td>
				</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<button type="submit" class="btn btn-small btn-success">确定</button>
					<button class="btn btn-primary btn-small J_close" type="button">返回</button>
				</td>
			</tr>
	</table>
</form>

<script type="text/javascript">
</script>