<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="plate/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>板块的名称：</td>
				<td>
						<input type="text" name="plateName" id="plateName" value="${list.plateName}" />
				</td>
			</tr>
			<tr>
				<td>板块负责人：</td>
				<td>
						<input class="jq-combobox" name="plateManager"  type="text" value="${list.plateManager}" data-options="{
								method:'post',
								editable:false,
								url: '${z:u('staff_info/name_list')}',
								
								}"/> 
				</td>
				<input name="projectNum" type="hidden" value=${list.projectNum} }/>
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