<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="report/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>举报内容：</td>
				<td>
						<input type="text" name="reportContent" id="reportContent" value="${list.reportContent}" />
				</td>
			</tr>
			<tr>
				<td>举报者Id：</td>
				<td>
						<input type="text" name="reporter" id="reporter" value="${list.reporter}" />
				</td>
			</tr>
			<tr>
				<td>举报对象：</td>
				<td>
						<input type="text" name="reportObject" id="reportObject" value="${list.reportObject}" />
				</td>
			</tr>
			<tr>
				<td>举报时间：</td>
				<td>
						<input type="text" name="reportTime" id="reportTime" value="${list.reportTime}" />
				</td>
			</tr>
			<tr>
				<td>举报状态：</td>
				<td>
						<input type="text" name="reportState" id="reportState" value="${list.reportState}" />
				</td>
			</tr>
			<tr>
				<td>举报回复：</td>
				<td>
						<input type="text" name="reportAnswer" id="reportAnswer" value="${list.reportAnswer}" />
				</td>
			</tr>
			<tr>
				<td>处理时间：</td>
				<td>
						<input type="text" name="reportProcess" id="reportProcess" value="${list.reportProcess}" />
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