<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>活动详情</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${__static__}/activity/bootstrap/css/bootstrap.min.css">
    <!-- Bootstrap 3.3.5 -->
    <!-- Theme style -->
    <link rel="stylesheet" href="${__static__}/activity/dist/css/sdm.css">
    <!-- SDM Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="${__static__}/activity/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="${__static__}/activity/css/style.css">
    <link rel="stylesheet" href="${__static__}/activity/css/xyx/details.css">
     <link rel="stylesheet" href="${__static__}/activity/bootstrap/css/bootstrap.min.css">
    <!-- Bootstrap 3.3.5 -->
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="${__static__}/activity/plugins/fontawesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${__static__}/activity/plugins/ionicons/css/ionicons.min.css">
    <!-- fullCalendar 2.2.5-->
    <link rel="stylesheet" href="${__static__}/activity/plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="${__static__}/activity/plugins/fullcalendar/fullcalendar.print.css" media="print">
    <link rel="stylesheet" type="text/css" href="${__static__}/activity/plugins/sudyclndr/sudyclndr.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${__static__}/activity/dist/css/sdm.css">
    <!-- SDM Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="${__static__}/activity/dist/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="${__static__}/activity/dist/css/style.css">
    <link rel="stylesheet" href="${__static__}/activity/dist/css/xyx/index.css">
    <!-- <link rel="stylesheet" href="dist/css/xyx/z-style.css"> -->
    <link rel="stylesheet" href="${__static__}/activity/_public/css/app.css" />
    <link rel="stylesheet" href="${__static__}/activity/_public/css/style.css" />
    
    
    <style>
        .p-1{
            position: relative;
        }
        .u-news {
            padding: 10px;
            margin-bottom: 10px;
            padding-left: 0;
            height: 220px;
        }
        
#fullbg { 
background-color:gray; 
left:0; 
opacity:0.5; 
position:absolute; 
top:0; 
z-index:3; 
filter:alpha(opacity=50); 
-moz-opacity:0.5; 
-khtml-opacity:0.5; 
} 
#dialog { 
background-color:#fff; 
border:5px solid rgba(0,0,0, 0.4); 
height:150px; 
left:50%; 
margin:-200px 0 0 -200px; 
padding:1px; 
position:fixed !important; /* 浮动对话框 */ 
position:absolute; 
top:50%; 
width:400px; 
z-index:5; 
border-radius:5px; 
display:none; 
} 
#dialog p { 
margin:0; 
height:24px; 
line-height:24px; 
background:#CCCCCC; 
} 
#dialog p.close {
width: 100%;height: 45px;display: block;line-height: 45px;text-align: center;bottom:0px;
position:absolute;
padding:0px;

margin:0px

} 
#dialog p.close a {
text-color:red;
} 
        
        
    </style>
</head>

<body>
<div id="fullbg"></div> 
<div id="dialog"> 

<div>正在加载，请稍后....</div> 
<br><br>
<div><p class="close"><a onclick="login(2)">确认</a></p></div>
</div> 
</div> 

    <div class="wrapper" width="80%">
        <header class="app-header" data-sources="config.menu,config.user,config.login,config.logout,config.site" data-load="_public/include/header.html"></header>
		
        <div class="content-wrapper bg">
            <div class="box no-radius box-border bottomnoe no-boxshadow" id="j-1-1">
                <div class="">
                    <div class="wrapper-inner">
                        <div class="">
                            <div class="">
                                <ol class="breadcrumb">
                                  <li><a class="fontColor" href="http://i1.gench.edu.cn/_web/fusionportal/stu/activity/index.jsp?_p=YXM9MSZwPTEmbT1OJg__">活动</a></li>
                                  <li>活动详情</li>
                                   	<li>用户名：${nickname}  </li>
                              		<li>在线人数：${onnum} </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-8 column">
			
			<dl>
			<br>
			<br>
			<br>
				<img width="50%" height="173px" src="../imgupload/${ac.poster}" alt="">
				
				
				<dt>
					${ac.name}
				</dt>
				<br>
				<dd>
					报名时间：${ac.applicationTime}
				</dd>
				<dd>
					活动场地：${ac.location}
				</dd>
				<dd>
					联系人：${ac.applicant}
				</dd>
				<dd>
					联系电话：${ac.phoneNumber}
				</dd>
				<dd>
					当前参与人员/参与人员上限：0人/${ac.maxNum}人
				</dd>
				<br>
				<form id="form" action= "${z:u('baoming/bm')}" method="post">
					<input type="hidden" id="acid" name="acid" value="${ac.id}" />
					<input type="hidden" id="maxnum" name="maxnum" value="${ac.maxNum}" />
					<input type="hidden" id="stuname" name="stuname" value="${nickname}" />
					<div class="col-md-6" >
                  	<button id="main" class="btn bg-navy btn-flat width20" id="j-btn" type="submit"  ><a href="javascript:showBg();">报名</a></button>
                    </div>
				</form>
				</dl>
			<div class="tabbable" id="tabs-413991">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#1" data-toggle="tab"><b>活动介绍</b></a>
					</li>
					<li>
						 <a href="#2" data-toggle="tab"><b>活动行程</b></a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="1">
						<p>
							活动内容：
							${ac.content}
						</p>
					</div>
					<div class="tab-pane" id="2">
						<p>
							活动行程：
							${ac.startDate}至${ac.endDate}
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="g-sd2">
                                <div class="row">
                                    <div class="col-md-12 u-btn1">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <button class="btn bg-navy btn-flat width100" id="j-btn">发起活动</button>
                                            </div>
                                            <div class="col-md-6">
                                            <form method="post" action= "${z:u('baoming/myac')}">
                                                <button type="submit" class="btn bg-navy btn-flat width100" id="j-btn1">我的活动</button>
                                            </form>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="col-md-12">
                                        <div class="nav-tabs-custom u-list">
                                            <ul class="nav nav-tabs u-list-head">
                                                <li class="active"><a href="#tab_1_1" data-toggle="tab">热门活动</a></li>

                                            </ul>
                                            <div class="tab-content u-list-body">
                                                <div class="tab-pane active">
                                                    <ul class="list-unstyled xyx_ul" id="j-list1">
                                            
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="nav-tabs-custom u-list u-list-bt">
                                            <ul class="nav nav-tabs u-list-head">
                                                <li class="active"><a href="#tab_1_1" data-toggle="tab">我关注的活动</a></li>
                                                 <li class="u-list-ts"><a viod="" style="cursor: pointer;" id="j-modle">添加关注</a></li>
                                            </ul>
                                            <div class="tab-content u-list-body">
                                                <div class="tab-pane active">
                                                    <ul class="list-unstyled xyx_ul" id="j-list2">
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="nav-tabs-custom u-list">
                                            <ul class="nav nav-tabs u-list-head">
                                                <li class="active"><a href="#tab_1_1" data-toggle="tab" id="j-ahov">我参加的活动</a></li>
                                            </ul>
                                            <div class="tab-content u-list-body">
                                                <div class="tab-pane active">
                                                    <ul class="list-unstyled xyx_ul" id="j-list">
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
	</div>
	
</div>
	
	


	<script type="text/javascript" src="${__static__}/activity/jquery/jquery.min-2.0.js"></script>
	<script type="text/javascript" src="${__static__}/activity/jquery/jquery-ui.min-1.10.2.js"></script>
	<script src="${__static__}/login/js/jquery.min.js" type="text/javascript"></script>
	<script src="${__static__}/login/js/jquery.form.js" type="text/javascript"></script>

    <!-- Bootstrap 3.3.5 -->
    <script src="${__static__}/activity/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
	 $("#form").ajaxForm({
		type: "post",
		dataType: "json",
		success: function(data) {
			if (data.status == 0) {
				//写一个js弹窗报名成功
				alert("报名成功");
			} else if(data.status == 1){
				//写一个js弹窗报名失败
				alert("该活动报名人数已满");
				
			}else{
			alert("你已经报名了！");
			//你已经报名了！
			}
		}
	}); 
	</script>
</body>

</html>
