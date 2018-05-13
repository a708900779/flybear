<%@ page language="java" pageEncoding="UTF-8" import="flybear.hziee.app.util.FormatDate" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <title>活动列表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
    <script>
    
    
    </script>
</head>
<body>
    <div class="wrapper">
        <header class="app-header" data-sources="config.menu,config.user,config.login,config.logout,config.site" data-load="_public/include/header.html"></header>
        <div class="content-wrapper bg">
            <div class="box no-radius box-border bottomnoe no-boxshadow" id="j-1-1">
            <div class="">
                <div class="wrapper-inner">
                    <div class="">
                        <div class="">
                            <ol class="breadcrumb">
                              <li><a class="fontColor" href="http://i1.gench.edu.cn/_web/fusionportal/stu/activity/index.jsp?_p=YXM9MSZwPTEmbT1OJg__">活动</a></li>
                              <li>活动列表</li>
                              	<li>用户名：${nickname}  </li>
                              	<li>在线人数：${onnum} </li>
                            </ol>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
            <div class="wrapper-inner">
                <section class="content">
                    <div class="row">
                        <div class="g-bd2 f-cb">
                            <div class="g-mn2">
                                <div class="g-mn2c">
                                    <div class="row">
                                        <div class="col-md-12 u-nav">
                                            <table class="table">
                                                <tr class="center-filter-search">
                                                    <td colspan="2">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="input-group input-group-sm">
                                                                    <input type="text" class="form-control" placeholder="搜索你要寻找的">
                                                                    <span class="input-group-btn btn-sea">
                                                                        <button class="btn btn-primary btn-flat   filter-search-btn" type="button"><i class="glyphicon glyphicon-search"></i></button>
                                                                    </span>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100">
                                                        <div class="u-tit">
                                                           	 活动类型：
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <ul class="list-unstyled u-btn" id="j-lx">
                                                            <li class="active">全部</li>
                                                            <li data-jb="yxbm">院系部门</li>
                                                            <li data-jb="st">社团</li>
                                                            <li data-jb="bj">班级</li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100">
                                                        <div class="u-tit">
                                                           	 活动类别：
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <ul class="list-unstyled u-btn" id="j-fl">
                                                        	<li class="active">全部</li>
                                                            <li data-jb="yxbm">社会实践活动</li>
                                                            <li data-jb="st">班级活动</li>
                                                            <li data-jb="bj">社团活动</li>
                                                            <li data-jb="bj">科技竞赛</li>
                                                            <li data-jb="bj">讲座论坛</li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100">
                                                        <div class="u-tit">
                                                            活动主题：
                                                        </div>
                                                    </td>
                                                    <td>
                                                       <ul class="list-unstyled u-btn" id="j-zt">
                                                      
                                                            <li class ="active" data-jb="yxbm">全部</li>
                                                           
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="col-md-12 g-list2">
                                            <div class="row" id="j-nr">
                                                   <c:forEach var="list" items="${page.data}" varStatus="status">
                                                 <div class="col-md-4 u-img">
                                                    <div class="u-img-1"><a href="${z:u('activity/pp')}?ac_id=${list.id}"><img width="100%" height="173px" src="../imgupload/${list.poster}" alt=""></a></div>
                                                    <div class="u-img-2"><a href="###">${list.name}</a></div>
                                                    <div class="u-img-3">可报名人数：${list.maxNum}</div>
                                                    <div class="u-img-5">
                                                        <div class="u-img-5-1">时间：</div>
                                                        <div class="u-img-5-1 my_timer">${list.startDate}
                                                        </div>
                                                    </div>
                                                    <div class="u-img-6">地点：${list.location}</div>
                                                    <div class="u-img-6">主办部门：${list.department}</div>
                                                 </div>
                                                 </c:forEach>
                                                <!--
                                                <div class="col-md-4 u-img">
                                                    <div class="u-img-1"><a href="###"><img width="100%" height="173px" src="dist/img/xyx/x-1.png" alt=""></a></div>
                                                    <div class="u-img-2">2016创业夏令营</div>
                                                    <div class="u-img-3">2016</div>
                                                    <div class="u-img-4">2016</div>
                                                    <div class="u-img-5">2016</div>
                                                    <div class="u-img-6">2016</div>
                                                </div>
                                                <div class="col-md-4 u-img">
                                                    <div class="u-img-1"><a href="###"><img width="100%" height="173px" src="dist/img/xyx/x-1.png" alt=""></a></div>
                                                    <div class="u-img-2">2016创业夏令营</div>
                                                    <div class="u-img-3">2016</div>
                                                    <div class="u-img-4">2016</div>
                                                    <div class="u-img-5">2016</div>
                                                    <div class="u-img-6">2016</div>
                                                </div> -->
                                            </div>
                                        </div>
                                        
                                        
                                          <div class="col-md-12">
                                            <jsp:include page="../public/page.jsp">
                                            	<jsp:param value="${z:u('activity/index')}" name="url"/>
												<jsp:param value="${strParam}" name="paramlist"/>
												<jsp:param value="暂无数据共享" name="tip"/>
                                            </jsp:include>
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
                </section>
            </div>
        </div>
        <footer class="app-footer" data-load="${__static__}/activity/_public/include/footer.html"></footer>
    </div>
    <script src="${__static__}/activity/jquery/jquery.min-2.0.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${__static__}/activity/bootstrap/js/bootstrap.min.js"></script>
    <!-- sudyclandr  日历 -->
    <script src="${__static__}/activity/plugins/sudyclndr/sudyclndr.js"></script>
    <!-- FastClick -->
    <script src="${__static__}/activity/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
     <script src="${__static__}/activity/dist/js/app.js"></script>
     <script src="jquery.sortable.js"></script>
    <script src="${__static__}/activity/dist/js/demo.js"></script>
    <script src="${__static__}/activity/dist/js/activity/laypage.js"></script>
    <script src="${__static__}/activity/dist/js/activity/x-activity.js"></script>
    <script src="${__static__}/activity/dist/js/activity/activity.js"></script>
    <script src="${__static__}/activity/dist/js/app.js"></script>
</body>

</html>

