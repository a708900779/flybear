<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>活动报名</title>
	<link href="${__static__}/admin/css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body class="login-bd">
<div id="mainBody">
	<div id="cloud1" class="cloud" style="background-position: 450px 100px;"></div>
	<div id="cloud2" class="cloud" style="background-position: 0 460px;"></div>
</div>
<div class="logintop">
	<span>欢迎登录【杭电信工】活动报名系统</span>
</div>
<div class="loginbody">
	<span class="systemlogo"></span> 
	<form class="loginbox" id="form" action="${__url__}" method="post">
		<ul>
			<li>
				<input name="loginName" id="loginName" value="admin" type="text" class="loginuser"  onchange="loginNameChange()" placeholder="账号" />
			</li>
			<li>
				<input name="loginPass"  id="loginPass" value="123456" type="password" class="loginpwd" placeholder="密码" />
			</li>
			<li class="mb10">
				<input type="submit" class="loginbtn" value="登录" />
				<label>
						<input name="" id="rememberMe" type="checkbox" value="" />记住密码</label>
				<%--<label>--%>
				<%--<a href="#">忘记密码？</a>--%>
				<%--</label>--%>
			</li>
			<li>
				<span class="error" id="msg"></span>
			</li>
		</ul>
	</form>
</div>
<div class="loginbm">Copyright&nbsp;&nbsp;&copy;2017-<script>
		document.write(new Date().getFullYear());
	</script> &nbsp;&nbsp;竞赛小组研发
</div>
<script src="${__static__}/mod/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${__static__}/admin/js/cloud.js" type="text/javascript"></script>
<script src="${__static__}/mod/jquery/jquery.form.js" type="text/javascript"></script>
<script src="${__static__}/admin/js/jquery.cookie.js" type="text/javascript"></script>

<script type="text/javascript">
	// 提交
	 $("#form").ajaxForm({
		type: "post",
		dataType: "json",
		beforeSubmit: function() {
			var name = $(".loginuser").val();
			var pwd = $(".loginpwd").val();
			if (name == "") {
				$(".loginuser").focus();
				return false;
			}
			if (pwd == "") {
				$(".loginpwd").focus();
				return false;
			}
			$("#msg").removeClass("error").addClass("right").html("正在登录...");
		},
		success: function(data) {
			if (data.status == 1) {
				$("#msg").removeClass("error").addClass("right").html(data.info);
				window.location.href = "${z:u('/')}";
			} else {
				$("#msg").removeClass("right").addClass("error").html(data.info);
			}

		}
	}); 
	
	
	
	function loginNameChange() {
	   $('#loginPass').val('');
	   $("#rememberMe").attr("checked", false);
	   $.removeCookie('absms_crm2_userName');
	   $.removeCookie('absms_crm2_password');
	}

	//判断之前是否有设置cookie，如果有，则设置【记住我】选择框
	if ($.cookie('absms_crm2_userName') != undefined) {
		$("#rememberMe").attr("checked", true);
	} else {
		$("#rememberMe").attr("checked", false);
	}

	//读取cookie
	if ($('#rememberMe:checked').length > 0) {
		$('#loginName').val($.cookie('absms_crm2_userName'));
		$('#loginPass').val($.cookie('absms_crm2_password'));
	}

	//监听【记住我】事件
	$("#rememberMe").click(function() {
		if ($('#rememberMe:checked').length > 0) {//设置cookie
			$.cookie('absms_crm2_userName', $('#loginName').val());
			$.cookie('absms_crm2_password', $('#loginPass').val());
		} else {//清除cookie
			$.removeCookie('absms_crm2_userName');
			$.removeCookie('absms_crm2_password');
		}
	});
	
</script>
</body>
</html>