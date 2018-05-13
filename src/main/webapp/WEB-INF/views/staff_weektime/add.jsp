<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="staff_weektime/add" method="post" >
	<table align="center" class="form-table">
				<tr>
					<td>工作开始时间：</td>
					<td>
							<input type="text" name="begintime" id="begintime" value="" />
					</td>
				</tr>
				<tr>
					<td>排班时间：</td>
					<td>
							<input type="text" name="setweektime" id="setweektime" value="" />
					</td>
				</tr>
				<tr>
					<td>备注：</td>
					<td>
							<input type="text" name="othernews" id="othernews" value="" />
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