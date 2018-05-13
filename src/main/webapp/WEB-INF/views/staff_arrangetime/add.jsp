<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>
<script type="text/javascript">
  	$(function(){
  		$.ajax({
  			type:"POST",
  			url:"staff_arrangetime/staff_name",
  			data:{id:$("#id").val(), text:$("#text").val()},
  			success: function(data){
  				$.each(JSON.parse(data), function(key,value){
  					$("#tbody").append("<tr><td>"+value.id+"</td><td>"+value.text+"</td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"<td><input type='checkbox' name='a' value='0'></input></td>"
  					+"</tr>");
  				});
  			}
  		});
  	});
  	
  </script>
  <script language="javascript">
	function out(){
		var a = document.getElementsByName("a");
		var str = "";
		for(var i = 0; i < a.length;i++){
			if(a[i].checked){
				str += "0";
			}else{
				str += "1";
			}
		}
		$.post("staff_arrangetime/buildsche", {str:str});
	}
</script>

<form id="form" action="staff_arrangetime/add" method="post" >
	<table  align="center" class="form-table">
    		<tr>
    			<td>
    				排班时间：
    			</td>
    			<td>
    				<input type="text" class="jq-datebox" id="begintime" name="begintime">
    			</td>
    		</tr>
    		<tr>
    			<td>
    				备注信息：
    			</td>
    			<td>
    				<input type="text" name="othernews">
    			</td>
    		</tr>
    </table>
    <table id="tbody" align="center" class="form-table">
    			<tr>
    				<td>员工工号</td>
    				<td>员工姓名</td>
    				<td>星期一</td>
					<td>星期二</td>
					<td>星期三</td>
					<td>星期四</td>
					<td>星期五</td>
					<td>星期六</td>
					<td>星期天</td>
    			</tr>
    </table>
    <table align="center" class="form-table">
    			<tr>
    				<td colspan="7"></td>
    				<td>
    					<button type="submit" class="btn btn-small btn-success" onClick="out()">确定</button>
						<button class="btn btn-primary btn-small J_close" type="button">返回</button>
    				</td>
    			</tr>
    </table>
</form>

<script type="text/javascript">
</script>