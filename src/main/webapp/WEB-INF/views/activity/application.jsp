<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>


<!DOCTYPE html>

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
  <head>
    
	<meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <!-- Bootstrap 3.3.5 -->
    <link href="${__static__}/activity/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${__static__}/activity/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="${__static__}/activity/css/sdm.css">
	<link rel="stylesheet" href="${__static__}/activity/css/style.css">
	<link rel="stylesheet" href="${__static__}/activity/css/layout-2.css">
	<link rel="stylesheet" href="${__static__}/activity/css/skin-blue/skin-blue.min.css">
    <style type="text/css">
    	.inputcls+.inputcls{
    		margin-top: 5px;
    	}
    	#cdxx .input-group-addon{
		    padding: 6px;
    	}
    	#cdxx .input-group-addon:HOVER {
			cursor: pointer;
		}
#mid{margin:0 auto;width:80%} 
    </style>
    <title>活动申请</title>
  </head>
  
  <body class="skin-blue">
   <header class="app-header app-mini-header" data-sources="config.menu,config.user,config.login,config.logout,config.site" data-load="/default/base/_public/include/mini_header.html"></header>
  <div class="wrapper-inner" id="mid">
			<div class="row">
				<div class="col-xs-12">
					<h3 class="title"><span id="tt"></span>活动申请<span class="wf-title"></span></h3>
					<div class="box">
						<div class="box-header">
		                  <div><h3 class="box-title">基本信息</h3></div>
		                  <div style="float:left;" id="lshzt"><span id="lsh">处理号：</span></div>
		                </div><!-- /.box-header -->
		                <div class="box-body no-padding">
		                	<div class="form-table">
		                	
		                	<form  enctype="multipart/form-data" id="form" action="${z:u('activity/applying')}" method="post" class="sui-form" >
						
							
								<div class="box-body no-padding">
									<div class="form-tr clearfix">
										<div class="form-td col-sm-6 col-xs-12">
											<div class="form-item">
												<div class="item-name"><span class="text-red">*</span>申请人：</div>
												<div class="item-value">
													<div class="sui-input" name="sqrmc" validate='{"require":true}' title="">
													
													<input name="applicant" maxlength="50" type="text" class="form-control" value="">
													
													</div>
												</div>
											</div>
										</div>
										<div class="form-td col-sm-6 col-xs-12">
											<div class="form-item">
												<div class="item-name"><span class="text-red">*</span>所属部门：</div>
												
													<input name="department" maxlength="50" type="text" class="form-control" value="">
											</div>
										</div>
									</div>
									<div class="form-tr clearfix">
										<div class="form-td  col-sm-6 col-xs-12">
											<div class="form-item">
												<div class="item-name"><span class="text-red">*</span>联系电话：</div>
												
													<input name="phoneNumber" maxlength="50" type="text" class="form-control" value="">
											</div>
										</div>
									</div>
									
									
										
									
									<div class="stDiv">
										<div class="form-tr clearfix">
											<div class="form-td  col-sm-6 col-xs-12">
												<div class="form-item">
													<div class="item-name"><span class="text-red">*</span>申请时间 ：</div>
													
														<div class="form-group">
	                		<div class="input-group date form_datetime col-md-5" data-date="2018-1-1" data-date-format="yyyy年-mm月-dd日" data-link-field="dtp_input1">
	                    	<input name="startdate" class="form-control" size="30" type="text" value="" readonly>
		                    <span class="input-group-addon">
		                    	<span class="glyphicon glyphicon-remove"></span>
		                   	 </span>
							<span class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
							</span>
						
	             	   </div>
										<input type="hidden" id="dtp_input1" value="" /><br/>
	               	      </div>
												</div>
											</div>
											
											<div class="form-td  col-sm-6 col-xs-12">
												<div class="form-item">
													<div class="item-name" style="line-height:17px" ><span class="text-red">*</span>截止日期<span id="sxqd"></span>：</div>
													
													<div class="form-group">

	<div class="input-group date form_datetime col-md-5" data-date="2018-1-1" data-date-format="yyyy年-mm月-dd日" data-link-field="dtp_input1">
	    <input name="enddate" class="form-control" size="30" type="text" value="" readonly>
            <span class="input-group-addon">
            	<span class="glyphicon glyphicon-remove"></span>
           	 </span>
			<span class="input-group-addon">
					<span class="glyphicon glyphicon-th"></span>
			</span>
	</div>
	<input type="hidden" id="dtp_input1" value="" />
	<br/>
	               	      </div>
												
												</div>
											</div>
										
										</div>
									</div>
									
									
									<div class="form-tr clearfix">
										<div class="form-td col-xs-12">
											<div class="form-item">
												<div class="item-name"><span class="text-red">*</span>活动名称：</div>
												
													<input name="name" maxlength="50" type="text" class="form-control" value="">
											</div>
										</div>
									</div>
									
									<div class="form-tr clearfix">
										<div class="form-td col-xs-12">
											<div class="form-item">
												<div class="item-name"><span class="text-red">*</span>活动内容：</div>
												
													<input name="content" maxlength="50" type="text" class="form-control" value="">
											</div>
										</div>
									</div>
									
									<div class="form-tr clearfix">
										<div class="form-td col-xs-12">
											<div class="form-item">
												<div class="item-name"><span class="text-red">*</span>活动地点：</div>
												
													<input name="location" maxlength="50" type="text" class="form-control" value="">
											</div>
										</div>
									</div>	
									
									
									
									
									<div class="form-tr clearfix">
										<div class="form-td  col-sm-6 col-xs-12">
											<div class="form-item">
												<div class="item-name"><span class="text-red">*</span>人数上限：</div>
												
													<input name="maxNum" maxlength="50" type="text" class="form-control" value="">
											</div>
										</div>
									

								
										
										
										
									</div>
									
									<div class="form-tr clearfix">
										<div class="form-td col-xs-12">
											<div class="form-item">
												<div class="item-name"><span class="text-red">*</span>活动海报：</div>
												<span class="btn btn-primary selectbtn" type="button" id="selectstbtn" >
												
												<input name="file" maxlength="50" type="file" class="form-control" value=""></span>
																								
												<div class="item-value">
													<div class="sui-fileupload" canEdit="false" previewStyle="width:auto; height:300px" canUpload="true" fileSizeLimit="500" canDelete="true" name="hb" buttonText="上传海报"  ext="*.png;*.jpeg;*.jpg" buttonWidth="80" validate='{"require":true}' title="上传海报"  multi="false" preview="true"></div>

												</div>
											</div>
										</div>
									</div>
									
									</div>
									
			<div class="row">
				<div id="selectParticipatesDiv" class="sui-participates"></div>
				<div class="col-xs-12">
					<div class="form-item text-center form-actions">
						<button class="btn btn-primary posts" id="post" type="submit">提交</button>
 						<button class="btn btn-default" id="cancel">关闭</button>
 						<button class="btn btn-primary" style="display: none;" id="terminate" onclick="terminal()">取消申请</button>
					</div>
				</div>
			</div>
	</form>
	<footer class="app-footer app-mini-footer" data-load="default/base/_public/include/mini_footer.html"></footer>
    	<!-- REQUIRED JS SCRIPTS -->

<script type="text/javascript" src="${__static__}/activity/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${__static__}/activity/bootstrap/js/bootstrap.min.js"></script>    
<script type="text/javascript" src="${__static__}/activity/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${__static__}/activity/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
		minView: 2,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
       language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
		minView: 2,
        showMeridian: 1
    });
	$('.form_time').datetimepicker({
       language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
		minView: 2,
        showMeridian: 1
    });
    
     $("#form").ajaxForm({
		type: "post",
		dataType: "json",
		success: function(data) {
			if (data.status == 0) {
				alert("申请成功");
				window.location.href = "${z:u('Activity/index')}";
			} else{
				alert("申请失败");
			}
		}
	}); 
    
</script>

  </body>
</html>