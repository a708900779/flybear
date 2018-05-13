<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<form id="form" action="staff_info/edit" method="post"  >
    <table align="center" class="form-table">
			<tr>
				<td>员工姓名：</td>
				<td>
						<input type="text" name="staffName" id="staffName" value="${list.staffName}" />
				</td>
			</tr>
			<tr>
				<td>员工性别：</td>
				<td>
						<%-- <input type="text" name="staffSex" id="staffSex" value="${list.staffSex}" /> --%>
						<input type="radio" id="1" name="staffSex" value="1" ${list.staffSex == 1 ? "checked" : ""} > 男
						<input type="radio" id="2" name="staffSex" value="2" ${list.staffSex == 2 ? "checked" : ""} > 女
				</td>
			</tr>
			<tr>
				<td>员工等级：</td>
				<td>
						
						<select name="staffLevel">
							  <option value="1" ${list.staffLevel == 1 ? "selected " : ""}>客服员工</option>
							  <option value="2" ${list.staffLevel == 2 ? "selected " : ""}>客服经理</option>
							  <option value="3" ${list.staffLevel == 3 ? "selected " : ""}>主管</option>
						</select>
				</td>
			</tr>
			<tr>
				<td>员工联系方式：</td>
				<td>
						<input type="text" name="staffPhone" id="staffPhone" value="${list.staffPhone}" />
				</td>
			</tr>
			<tr>
				<td>员工居住地：</td>
				<td>
						<input type="text" name="staffArea" id="staffArea" value="${list.staffArea}" />
				</td>
			</tr>
			<tr>
				<td>入职时间：</td>
				<td>
						<input type="text" class="jq-datebox" name="intime2" id="intime1" value="">
				</td>
			</tr>
			<tr>
				<td>离职时间：</td>
				<td>
						<input type="text" class="jq-datebox" name="outtime2" id="outtime1">
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
		/* var time = ${list.intime};
		var time2 = ${list.outtime};
		var newDate = new Date();
		newDate.setTime(time * 1000);
		$('#intime1').val(newDate.toISOString());
		newDate.setTime(time2 * 1000);
		$('#outtime1').val(newDate.toISOString()); */
		/*  function formatDate(now) {
		 
			var year=now.getYear();
			alert(year);
			var month=now.getMonth()+1;
			var date=now.getDate();
			return "20"+year+"-"+month+"-"+date;
			}
			 var d=${list.intime}; 
			var d = 1200000000;
			alert(formatDate(d));  */
			 function formatDate(now) {
				var year=now.getYear();
				var month=now.getMonth()+1;
				var date=now.getDate();
				if(year<100){
					return "19"+year+"-"+month+"-"+date;
					}else{
					year=year-100;
					return "20"+year+"-"+month+"-"+date	
				}
				}
				var intime=new Date(${list.intime}*1000);
				var outtime=new Date(${list.outtime}*1000);
				$('#intime1').val(formatDate(intime));
				$('#outtime1').val(formatDate(outtime)); 
</script>