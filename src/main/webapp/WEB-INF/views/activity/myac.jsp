<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的活动</title>
    <link rel="stylesheet" href="${__static__}/activity/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${__static__}/activity/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${__static__}/activity/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" type="text/css" href="${__static__}/activity/plugins/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${__static__}/activity/_public/css/app.css" />
    <link rel="stylesheet" href="${__static__}/activity/_public/css/style.css" />
    <link rel="stylesheet" href="${__static__}/activity/dist/css/ysf/noticeManager.css">

    <style>


        .nav-tabs > li > a:hover {
            border-color: #ffffff;
        }

        .nav > li > a:focus {
            text-decoration: none;
            background-color: #ffffff;
        }

        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            color: #555;
            cursor: default;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
        }

        .btn-width {
            width: 108px;
            margin-bottom: 10px;
        }

        .btn-bg {
            color: #ffffff;
            background-color: #999999;
            border-color: #999999;
        }

        .btn-zhihui:hover {
            color: #ffffff;
            background-color: #999999;
            border-color: #999999;
        }

        /*#tab_a li:hover {*/
        /*border-top: 0;*/
        /*border-left: 0;*/
        /*border-right: 0;*/
        /*border-bottom: 4px solid #cf2a34;*/
        /*}*/
        #tab_a .active {
            border-top: 0;
            border-left: 0;
            border-right: 0;
            border-bottom: 4px solid #cf2a34;
        }

        .nav-tabs {
            border-bottom: 4px solid #ededed;
        }

        #tab_a li a {
            color: #2c2c2c;
        }

        .form-control[readonly] {
            background-color: #fff;
            opacity: 1;
        }

        .input-group-addon {
            padding: 6px 12px;
            font-size: 14px;
            font-weight: normal;
            line-height: 1;
            color: #555;
            text-align: center;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .laypageskin_default a {
            border: 0;
            background-color: #fff;
        }
        .bg-navy {
            background-color: #b80000 !important;
            color: #fff !important;
        }
        .u-btn1 .btn:hover {
            background: #b80000!important;
            color: #fff !important;
        }
    .btn-danger {
    color: #fff;
    background-color: #b80000;
    border-color: #b80000;
    }
        .btn {
    display: inline-block;
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}
        .laypage_main * {
        display: inline-block;
        vertical-align: top;
        font-size: 16px;
        }
    </style>
</head>
<body class="bg01">
<header class="app-header" data-sources="config.menu,config.user,config.login,config.logout,config.site" data-load="_public/include/header.html"></header>
<div class="" id="j-1-1" style="background-color: #ffffff;margin-bottom: 20px;">
    <div class="">
        <div class="wrapper-inner">
            <div class="">
                <div class="">
                    <ol class="breadcrumb">
                        <li><a class="fontColor"
                               href="http://i1.gench.edu.cn/_web/fusionportal/stu/activity/index.jsp?_p=YXM9MSZwPTEmbT1OJg__">活动</a>
                        </li>
                        <li>我的活动</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrap">

    <div class="row ">
        <div class="col-md-12 bg02">
            <div class="pad05 box ba-c ">
                <div class="pad-r40 box ba-c" style="width: 30%;padding-left: 20px;">
                    <div class="fts14 pad-r10">活动名称</div>
                    <input type="text" class="inputSty box box-f1 activityName">
                </div>
                <!--<div class="pad-r44 box ba-c " style="width: 25%;">-->
                <!--<div class="fts14 pad-r10">活动场地</div>-->
                <!--<input type="text" class="inputsty  box box-f1 activityAddress">-->
                <!--</div>-->
                <div class="fts14 pad-r10">活动日期</div>
                <div class="item-value" style="width: 25%;">
                    <div id="carastart" class="sui-date  kstime" name="carastart" validate='{"require":true}'
                         format="YYYY-MM-DD" title="开始时间" value="" minStep="" mode="editable"></div>
                </div>
                <div class="" style="padding: 0 10px;">~</div>
                <div class="item-value" style="width: 25%;margin-right: 25px;">
                    <div id="carastart" class="sui-date jstime" name="carastart" validate='{"require":true}'
                         format="YYYY-MM-DD" title="结束时间" value="" minStep="" mode="editable"></div>
                </div>
                <div class="btn btn-danger query" style="width: 78px;">查询</div>
            </div>
        </div>
        <div class="col-md-12 bg02 mar-t">
            <div class="nav-tabs-custom pad05">
                <ul class="nav nav-tabs" id="tab_a">
                    <li class="fts16 ft-w apply active wcj">
                        <a href="#tab_a_2" data-toggle="tab" aria-expanded="true" style="border: 0;">我报名的活动
                        </a>
                    </li>
                    <li class="fts16 ft-w originate wfq">
                        <a href="#tab_a_3" data-toggle="tab" aria-expanded="true" style="border: 0;">我发起的活动
                        </a>
                    </li>
                    <button class="btn btn-danger fts14  btn-flat  btn-width" style="float:right;width: 100px;" id="x-btn">发起活动</button>
                </ul>
                <div class="tab-content" id="tab_a1">
                    <div class="tab-pane active" id="tab_a_2">
                        <div class="row" style="padding-top: 28px; min-height:528px;" id="applyActivityList">
                            <c:forEach var="list" items="${ac}" varStatus="status">
                                                 <div class="col-md-4 u-img">
                                                    <div class="u-img-1"><a href="${z:u('activity/pp')}?ac_id=${list.id}"><img width="100%" height="173px" src="../imgupload/${list.poster}" alt=""></a></div>
                                                    <div class="u-img-2"><a href="###">${list.name}</a></div>
                                                    <div class="u-img-3">可报名人数：${list.maxNum}</div>
                                                    <div class="u-img-5">
                                                        <div class="u-img-5-1">时间：</div>
                                                        <div class="u-img-5-1">${list.startDate}</div>
                                                    </div>
                                                    <div class="u-img-6">地点：${list.location}</div>
                                                    <div class="u-img-6">主办部门：${list.department}</div>
                                                 </div>
                                                 </c:forEach>
                            
                            
                        </div>
                        <div class="col-md-12" style="text-align: center;" id="baoming"></div>
                    </div>
                    <div class="tab-pane" id="tab_a_3">
                        <div class="row" style="padding-top: 28px; min-height:528px;" id="originateActivityList">
                            <c:forEach var="list" items="${ac2}" varStatus="status">
                                                 <div class="col-md-4 u-img">
                                                    <div class="u-img-1"><a href="${z:u('activity/pp')}?ac_id=${list.id}"><img width="100%" height="173px" src="../imgupload/${list.poster}" alt=""></a></div>
                                                    <div class="u-img-2"><a href="###">${list.name}</a></div>
                                                    <div class="u-img-3">可报名人数：${list.maxNum}</div>
                                                    <div class="u-img-5">
                                                        <div class="u-img-5-1">时间：</div>
                                                        <div class="u-img-5-1">${list.startDate}</div>
                                                    </div>
                                                    <div class="u-img-6">地点：${list.location}</div>
                                                    <div class="u-img-6">主办部门：${list.department}</div>
                                                 </div>
                                                 </c:forEach>
                        </div>
                        <div class="col-md-12" style="text-align: center;" id="faqi"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>



</body>
</html>
