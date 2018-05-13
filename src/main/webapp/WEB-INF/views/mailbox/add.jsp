<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="${z:u('mailbox/add')}" method="post" >
	<table align="center" class="form-table">
				<tr>
					<td>title：</td>
					<td>
							<input type="text" name="title" id="title" value="" />
					</td>
				</tr>
				<tr>
					<td>content：</td>
					<td>
							<input type="text" name="content" id="content" value="" />
					</td>
				</tr>
				<tr>
					<td>time：</td>
					<td>
							<input type="text" name="time" id="time" value="" />
					</td>
				</tr>
				<tr>
					<td>username：</td>
					<td>
							<input type="text" name="username" id="username" value="" />
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