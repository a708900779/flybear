<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="${z:u('activity/edit')}" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>活动名称：：</td>
				<td>
						<input type="text" name="name" id="name" value="${list.name}" />
				</td>
			</tr>
			<tr>
				<td>活动内容：</td>
				<td>
						<input type="text" name="content" id="content" value="${list.content}" />
				</td>
			</tr>
			<tr>
				<td>活动地点：</td>
				<td>
						<input type="text" name="location" id="location" value="${list.location}" />
				</td>
			</tr>
			<tr>
				<td>海报：</td>
				<td>
						<input type="text" name="poster" id="poster" value="${list.poster}" />
				</td>
			</tr>
			<tr>
				<td>开始时间：</td>
				<td>
						<input type="text" name="stertDate" id="stertDate" value="${list.stertDate}" />
				</td>
			</tr>
			<tr>
				<td>截止时间：</td>
				<td>
						<input type="text" name="endDate" id="endDate" value="${list.endDate}" />
				</td>
			</tr>
			<tr>
				<td>申请人：</td>
				<td>
						<input type="text" name="applicant" id="applicant" value="${list.applicant}" />
				</td>
			</tr>
			<tr>
				<td>申请人手机号码：</td>
				<td>
						<input type="text" name="phoneNumber" id="phoneNumber" value="${list.phoneNumber}" />
				</td>
			</tr>
			<tr>
				<td>申请时间：</td>
				<td>
						<input type="text" name="applicationTime" id="applicationTime" value="${list.applicationTime}" />
				</td>
			</tr>
			<tr>
				<td>活动最大人数：</td>
				<td>
						<input type="text" name="maxNum" id="maxNum" value="${list.maxNum}" />
				</td>
			</tr>
			<tr>
				<td>所属部门：</td>
				<td>
						<input type="text" name="department" id="department" value="${list.department}" />
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