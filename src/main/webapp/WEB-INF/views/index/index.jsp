<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>后台管理系统</title>
	<link href="${__static__}/admin/ui/jqui.min.css" rel="stylesheet" type="text/css"/>
	<link href="${__static__}/admin/css/admin.css" rel="stylesheet" type="text/css"/>
	<link href="${__static__}/mod/fancybox/jquery.fancybox.css" rel="stylesheet" />
	<script>
		var ZLZ = window.ZLZ = {
			"ROOT"   : "${__root__}",
			"URL"    : "${__url__}",
			"STATIC" : "${__static__}"
		}
	</script>

</head>
<body class="jq-layout" style="position:static;">

<div id="header" data-options="region:'north',border:false">
	<div id="logo">
		<img src="${__static__}/admin/img/logo1.png" />  
	</div>
	
	<div id="nav-bar" class="fix">
		<div class="nav-content">
			<ul id="nav-menu" class="fl">
				<c:forEach var="node" items="${topMenuList}" varStatus="status">
					<li class='${status.first?"first":""}${status.last?"last":""} fl'>
						<a href='${z:u("/left_menu") }/${node.id }'>${node.name }</a>
					</li>
				</c:forEach>
			</ul>
			<div class="adminbox fr">
					<span class="mr10">欢迎您，${sessionScope.loginName}</span>
					<span class="mr10">您的角色：<font color="yellow">${sessionScope.roleName}</font></span>
					<a class="icon icon-door-out" href='${z:u("/public/logout")}'>安全退出</a>
			</div>
		</div>
	</div>
	<!-- <div id="about" class="fix">
        <div class="fl about-cr-l"></div>
        <div class="fl about-content plr10">
            <a class="icon icon-help mr10" href="#">帮助</a>
            <a class="icon icon-info" href="#">关于</a>
        </div>
        <div class="fl about-cr-r"></div>
    </div> -->
</div>

<div id="left" data-options="region:'west',headerCls:'left-header',title:'子功能菜单'">
</div>
<div id="center" data-options="region:'center'">
	<div class="jq-layout rel" data-options="fit:true">
		<div data-options="region:'north',border:false">
			<div id="crumb" class="fix">
				<div class="fl">
					<em style="padding-left:5px;">当前位置：</em>
					<em class="c1"></em>
					<em class="c2"></em>
					<em class="c3"></em>
					<em class="c4"></em>
				</div>
<%-- 				<div class="fr">
					<span class="mr10">欢迎您，${sessionScope.loginName}</span>
					<span class="mr10">您的角色：<font color="blue">${sessionScope.roleName}</font></span>
					<a class="icon icon-door-out" href='${z:u("/public/logout")}'>安全退出</a>
				</div> --%>
			</div>
		</div>
		<div id="content" data-options="region:'center',border:false" ></div>
	</div>
</div>
<div id="bottom"   style="overflow-y: auto;overflow-y: hidden;"  data-options="region:'south'">Copyright&nbsp;&nbsp;&copy;2017-<script>
		document.write(new Date().getFullYear());
	</script> &nbsp;&nbsp;杭州电子科技大学信息工程学院竞赛小组研发
	</div>

<!-- js section -->
<script src="${__static__}/mod/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${__static__}/admin/ui/jqui.min.js" type="text/javascript"></script>
<script src="${__static__}/mod/jquery/jquery.hashchange.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=exkoIxbkK7zPnfYFiXuvQ5DCGgSg3FpW"></script>
<script src="${__static__}/admin/js/admin.min.js" type="text/javascript"></script>
<script src="${__static__}/mod/kindEditor/kindeditor.min.js" type="text/javascript"></script>
<script src="${__static__}/mod/fancybox/jquery.fancybox.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${__static__}/mod/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	//首次进入加载第一个左侧菜单
	if(window.location.hash==""){
		$("#nav-menu li.first").click();
	}
	//if(${sessionScope.loginName} == null){
		
	//}
	
/* 	function timeout()
    {
    alert("界面超时，请重新登录");
    window.location.href="${z:u('public/login')}";
    }
    window.setTimeout("timeout()", 30*60*1000); */
    
/*     $.ajaxSetup({
            cache: false,
            complete:function(XMLHttpRequest,textStatus){
                //通过XMLHttpRequest取得响应头
                var accessStatus=XMLHttpRequest.getResponseHeader("Access-Status");
                if(accessStatus=="-1"){
                    //如果超时就处理 ，则刷新当前页面，会自动跳到登录页
                    $.messager.alert("提示","登录超时，请重新登录!","warning",function(){
                        window.location.reload();
                    });
                }
            }
        }); */
</script>
<!--end of js section -->
</body>
</html>