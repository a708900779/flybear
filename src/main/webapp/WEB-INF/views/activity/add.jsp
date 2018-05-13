<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="${z:u('activity/add')}" method="post" >
	<table align="center" class="form-table">
				<tr>
					<td>活动名称：</td>
					<td>
							<input type="text" name="name" id="name" value="" />
					</td>
				</tr>
				<tr>
					<td>活动内容：</td>
					<td>
							<input type="text" name="content" id="content" value="" />
					</td>
				</tr>
				<tr>
					<td>活动地点：</td>
					<td>
							<input type="text" name="location" id="location" value="" />
					</td>
				</tr>
				<tr>
					<td>海报：</td>
					<td>
							<input type="text" name="poster" id="poster" value="" />
					</td>
				</tr>
				<tr>
					<td>开始时间：</td>
					<td>
							<input type="text" name="stertDate" id="stertDate" value="" />
					</td>
				</tr>
				<tr>
					<td>截止时间：</td>
					<td>
							<input type="text" name="endDate" id="endDate" value="" />
					</td>
				</tr>
				<tr>
					<td>申请人：</td>
					<td>
							<input type="text" name="applicant" id="applicant" value="" />
					</td>
				</tr>
				<tr>
					<td>申请人手机号码：</td>
					<td>
							<input type="text" name="phoneNumber" id="phoneNumber" value="" />
					</td>
				</tr>
				<tr>
					<td>申请时间：</td>
					<td>
							<input type="text" name="applicationTime" id="applicationTime" value="" />
					</td>
				</tr>
				<tr>
					<td>活动最大人数：</td>
					<td>
							<input type="text" name="maxNum" id="maxNum" value="" />
					</td>
				</tr>
				<tr>
					<td>所属部门：</td>
					<td>
							<input type="text" name="department" id="department" value="" />
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