<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>
 


	<form id="form" action="staff_info/add" method="post" >
	<table align="center" class="form-table">
				<tr>
					<td>员工姓名：</td>
					<td>
							<input type="text" name="staffName" id="staffName" value="" />
					</td>
				</tr>
				<tr>
					<td>员工性别：</td>
					<td>
							<input type="radio" name="staffSex" value="1" checked="checked"/> 男
							<input type="radio" name="staffSex" value="2" /> 女
					</td>
				</tr>
				<tr>
					<td>员工等级：</td>
					<td>
							<select name="staffLevel">
							  <option value="1" checked="checked">客服员工</option>
							  <option value="2">客服经理</option>
							  <option value="3">主管</option>
							</select>
					</td>
				</tr>
				<tr>
					<td>员工联系方式：</td>
					<td>
							<input type="text" name="staffPhone" id="staffPhone" value="" />
					</td>
				</tr>
				<tr>
					<td>员工居住地：</td>
					<td>
							<input type="text" name="staffArea" id="staffArea" value="" />
					</td>
				</tr>
				<tr>
					<td>入职时间：</td>
					<td>
						<input type="text" class="jq-datebox" name="intime1" >
					</td>
				</tr>
				<!-- <tr>
					<td>离职时间：</td>
					<td>
						<input type="text" class="jq-datebox" name="outtime1" >
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