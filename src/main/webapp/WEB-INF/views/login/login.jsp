<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<html>
<head>
	<meta charset="utf-8">
	<title>杭电信工活动报名系统登陆</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
	<meta name="author" content="Muhammad Usman">

	<!-- The styles -->
	<link id="bs-css" href="${__static__}/login/css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="${__static__}/login/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="${__static__}/login/css/charisma-app.css" rel="stylesheet">
	<link rel="shortcut icon" href="${__static__}/login/img/favicon.ico">
		
</head>

<body >
		<div class="container-fluid">
		<div class="row-fluid">
		
			<div class="row-fluid">
				<div class="span12 center login-header">
					<h2>杭电信工活动报名系统</h2>
				</div><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid">
				<div class="well span5 center login-box">
					<div class="alert alert-info">
						请输入你的用户名和密码进行登陆
					</div>
					<form class="form-horizontal" id="form" action="${z:u('login/logining')}" method="post">
						<fieldset>
							<div class="input-prepend" title="Username" data-rel="tooltip">
								<span class="add-on"><i class="icon-user"></i></span><input autofocus class="input-large span10" name="student_id" id="student_id" type="text" placeholder="请输入用户名" value="admin" />
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend" title="Password" data-rel="tooltip">
								<span class="add-on"><i class="icon-lock"></i></span><input class="input-large span10" name="password" id="password" type="password" placeholder="请输入密码" value="" />
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend">
							<label class="remember" for="remember"><input type="checkbox" id="remember" />记住我</label>
							</div>
							<div class="clearfix"></div>

							<p class="center span5">
							<button type="submit" class="btn btn-primary"  >登陆</button>
							</p>
							<li>
								<span class="error" id="msg"></span>
							</li>
							
						</fieldset>
					</form>
				</div><!--/span-->
			</div><!--/row-->
				</div><!--/fluid-row-->
		
	</div>
<script src="${__static__}/login/js/jquery.min.js" type="text/javascript"></script>
<script src="${__static__}/login/js/jquery.form.js" type="text/javascript"></script>
 <script type="text/javascript">
	// 提交
	$("#form").ajaxForm({
		type: "post",
		dataType: "json",
		beforeSubmit: function() {
			var name = $(".student_id").val();
			var pwd = $(".password").val();
			if (name == "") {
				$(".student_id").focus();
				return false;
			}
			if (pwd == "") {
				$(".password").focus();
				return false;
			}
			
			$("#msg").removeClass("error").addClass("right").html("正在登录...");
		},
		success: function(data) {
			if (data.status == 1) {
				$("#msg").removeClass("error").addClass("right").html(data.info);
				window.location.href = "${z:u('activity/index')}";
			} else {
				$("#msg").removeClass("right").addClass("error").html(data.info);
			}

		}
	});
	
	
	
/* 	 function loginNameChange() {
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
	});  */
	
</script> 
</body>
</html>

