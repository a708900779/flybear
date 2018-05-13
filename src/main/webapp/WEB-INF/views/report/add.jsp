<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="report/add" method="post" >
	<table align="center" class="form-table">
				<tr>
					<td>举报内容：</td>
					<td>
							<input type="text" name="reportContent" id="reportContent" value="" />
					</td>
				</tr>
				<tr>
					<td>举报者Id：</td>
					<td>
							<input type="text" name="reporter" id="reporter" value="" />
					</td>
				</tr>
				<tr>
					<td>举报对象：</td>
					<td>
							<input type="text" name="reportObject" id="reportObject" value="" />
					</td>
				</tr>
				<tr>
					<td>举报时间：</td>
					<td>
							<input type="text" name="reportTime" id="reportTime" value="" />
					</td>
				</tr>
				<tr>
					<td>举报状态：</td>
					<td>
							<input type="text" name="reportState" id="reportState" value="" />
					</td>
				</tr>
				<tr>
					<td>举报回复：</td>
					<td>
							<input type="text" name="reportAnswer" id="reportAnswer" value="" />
					</td>
				</tr>
				<tr>
					<td>处理时间：</td>
					<td>
							<input type="text" name="reportProcess" id="reportProcess" value="" />
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