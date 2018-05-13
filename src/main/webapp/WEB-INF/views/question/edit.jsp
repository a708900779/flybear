<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="question/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>问题标题：</td>
				<td>
						<input type="text" name="questionTitle" id="questionTitle" value="${list.questionTitle}" />
				</td>
			</tr>
			<tr>
				<td>问题内容：</td>
				<td>
						<input type="text" name="questionContent" id="questionContent" value="${list.questionContent}" />
				</td>
			</tr>
			<tr>
				<td>问题的发起人：</td>
				<td>
						<input type="text" name="sponsorId" id="sponsorId" value="${list.sponsorId}" />
				</td>
			</tr>
			<tr>
				<td>问题发布时间：</td>
				<td>
						<input type="text" name="releaseTime" id="releaseTime" value="${list.releaseTime}" />
				</td>
			</tr>
			<tr>
				<td>问题的回复：</td>
				<td>
						<input type="text" name="answer" id="answer" value="${list.answer}" />
				</td>
			</tr>
			<tr>
				<td>客服id：</td>
				<td>
						<input type="text" name="answererId" id="answererId" value="${list.answererId}" />
				</td>
			</tr>
			<tr>
				<td>问题类型：</td>
				<td>
						<input type="text" name="questionType" id="questionType" value="${list.questionType}" />
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