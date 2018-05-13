<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="chat/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>用户：</td>
				<td>
						<input type="text" name="userId" id="userId" value="${list.userId}" />
				</td>
			</tr>
			<tr>
				<td>问询标题：</td>
				<td>
						<input type="text" name="title" id="title" value="${list.title}" />
				</td>
			</tr>
			<tr>
				<td>问询时间：</td>
				<td>
						<input type="text" name="chatTime" id="chatTime" value="${list.chatTime}" />
				</td>
			</tr>
			<tr>
				<td>客服：</td>
				<td>
						<input type="text" name="sponId" id="sponId" value="${list.sponId}" />
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