<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<form id="form" action="plate/add" method="post" >
	<table align="center" class="form-table">
				<tr>
					<td>板块的名称：</td>
					<td>
							<input type="text" name="plateName" id="plateName" value="" />
					</td>
				</tr>
				<tr>
					<td>板块负责人：</td>
					<td>
							<select class="jq-combobox" name="plateManager"  data-options="{
								method:'post',
								editable:false,
								url: '${z:u('staff_info/name_list')}'}">
							</select>
					</td>
				</tr>
		<!-- 		<tr>
					<td>板块下项目数：</td>
					<td>
							<input type="text" name="projectNum" id="projectNum" value="" />
					</td>
				</tr> -->
				
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