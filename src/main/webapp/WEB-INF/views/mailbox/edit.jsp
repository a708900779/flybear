<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="${z:u('mailbox/edit')}" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>title：</td>
				<td>
						<input type="text" name="title" id="title" value="${list.title}" />
				</td>
			</tr>
			<tr>
				<td>content：</td>
				<td>
						<input type="text" name="content" id="content" value="${list.content}" />
				</td>
			</tr>
			<tr>
				<td>time：</td>
				<td>
						<input type="text" name="time" id="time" value="${list.time}" />
				</td>
			</tr>
			<tr>
				<td>username：</td>
				<td>
						<input type="text" name="username" id="username" value="${list.username}" />
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